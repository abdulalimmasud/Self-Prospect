using System;
using System.Collections.Generic;
using System.Text;
using Hoxro.Utiltiy.StaticData;
using Microsoft.Extensions.Configuration;
using System.Threading.Tasks;
using Hoxro.Service.userDefinedService.provider;
using Hoxro.Service.Enum;
using System.IO;
using System.Net.Http;
using Newtonsoft.Json;
using Hoxro.Data.Models;

namespace Hoxro.Service.userDefinedService
{
    public interface IWopiService
    {
        string StorageName { get; set; }
        string UserName { get; set; }
        Task<dynamic> CreateNewTemplateUrl(string templateName);
        Task<dynamic> MakeActionUrl(string blobUrl, string templateName, string newBlob, dynamic content);
        Task<dynamic> MakeOOSUrl(string blobUrl, string fileName, WopiAction action, bool isOverRide, string blobUrlNew, WopiOpertionType opertionType);
        Task<bool> UploadToServer(string blobUrl, string searchFileName);
    }
    public class WopiService: IWopiService
    {
        public static IConfiguration Configuration;
        private readonly string _hostUrl;
        private Dictionary<string, string> _headers;
        private string _makeUrlEndPoint;
        private string _uploadUrlEndPoint;
        private string _root_path = @".\";

        public string StorageName { get; set; }
        public string UserName { get; set; }
        public WopiService()
        {
            _hostUrl = Configuration["WopiHostUrl"];
            _makeUrlEndPoint = $"{_hostUrl}/Document/MakeURL";
            _uploadUrlEndPoint = $"{_hostUrl}/Document/UploadToServer";
            _headers = new Dictionary<string, string>();
        }

        public async Task<dynamic> MakeActionUrl(string blobUrl, string templateName, string newBlob, dynamic content)
        {
            try
            {
                string fileName = "";
                string extension = Extensions.Docx;
                string url = $"{_hostUrl}/wopi/files/";
                _headers.Add(WopiHeaders.StorageName, StorageName);
                _headers.Add(WopiHeaders.UserName, UserName);
                _headers.Add(WopiHeaders.Srouce, url);
                _headers.Add(WopiHeaders.Blob_Url, blobUrl);
                _headers.Add(WopiHeaders.Operation_Type, WopiOpertionType.Edit.ToString());
                _headers.Add(WopiHeaders.Blob_Url_New, newBlob);
                _headers.Add(WopiHeaders.Extension, extension);
                _headers.Add(WopiHeaders.FileName, fileName);
                _headers.Add(WopiHeaders.Over_Ride, "false");
                _headers.Add(WopiHeaders.New_Document_Name, templateName + Extensions.Docx);
                _headers.Add(WopiHeaders.Action, WopiAction.Edit.ToString());
                var response = await RequestDataAsync(_makeUrlEndPoint, HttpMethod.Post, _headers, content);
                return response;
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        public async Task<dynamic> MakeOOSUrl(string blobUrl, string fileName, WopiAction action, bool isOverRide, string anotherBlob, WopiOpertionType opertionType)
        {
            try
            {
                string newDocumentName = "";
                string url = $"{_hostUrl}/wopi/files/";
                string extension = Path.GetExtension(blobUrl);
                if(action != WopiAction.View)
                {
                    newDocumentName = fileName;
                    if (!Path.HasExtension(newDocumentName))
                    {
                        newDocumentName = newDocumentName + extension;
                    }
                }
                _headers.Add(WopiHeaders.StorageName, StorageName);
                _headers.Add(WopiHeaders.UserName, UserName);
                _headers.Add(WopiHeaders.Srouce, url);
                _headers.Add(WopiHeaders.Blob_Url, blobUrl);
                _headers.Add(WopiHeaders.Over_Ride, isOverRide.ToString());
                _headers.Add(WopiHeaders.Blob_Url_New, anotherBlob);
                _headers.Add(WopiHeaders.Action, action.ToString());
                _headers.Add(WopiHeaders.Extension, extension);
                _headers.Add(WopiHeaders.FileName, fileName);
                _headers.Add(WopiHeaders.New_Document_Name, newDocumentName);
                _headers.Add(WopiHeaders.Operation_Type, opertionType.ToString());

                var content = new List<GlobalData>();
                var response = await RequestDataAsync(_makeUrlEndPoint, HttpMethod.Post, _headers, content);
                return response;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<dynamic> CreateNewTemplateUrl(string templateName)
        {
            try
            {
                string blobUrl = "library/" + templateName + Extensions.Docx;
                //string fileName = Path.GetFileName(templateName);
                //fileName = EncodeIdentifier(_root_path + fileName + Extensions.Docx);
                string url = $"{_hostUrl}/wopi/files/";

                _headers.Add(WopiHeaders.StorageName, StorageName);
                _headers.Add(WopiHeaders.UserName, UserName);
                _headers.Add(WopiHeaders.Srouce, url);
                _headers.Add(WopiHeaders.Blob_Url, blobUrl);
                _headers.Add(WopiHeaders.Blob_Url_New, blobUrl);
                _headers.Add(WopiHeaders.Operation_Type, WopiOpertionType.BlankTemplate.ToString());
                _headers.Add(WopiHeaders.Template_Id, templateName);
                _headers.Add(WopiHeaders.New_Document_Name, templateName+Extensions.Docx);
                _headers.Add(WopiHeaders.Action, WopiAction.Edit.ToString());
                _headers.Add(WopiHeaders.Over_Ride, "false");
                _headers.Add(WopiHeaders.Extension, Extensions.Docx);
                var content = new List<GlobalData>();
                var response = await RequestDataAsync(_makeUrlEndPoint, HttpMethod.Post, _headers, content);
                return response;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<bool> UploadToServer(string blobUrl, string searchFileName)
        {
            try
            {
                if (!Path.HasExtension(searchFileName))
                {
                    string extension = Path.GetExtension(blobUrl);
                    searchFileName= searchFileName + extension;
                }
                _headers.Add(WopiHeaders.StorageName, StorageName);
                _headers.Add(WopiHeaders.UserName, UserName);
                _headers.Add(WopiHeaders.Blob_Url, blobUrl);
                _headers.Add(WopiHeaders.Search_FileName, searchFileName);

                var response = await RequestDataAsync(_uploadUrlEndPoint, HttpMethod.Post, _headers);
                return response;
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
        private string EncodeIdentifier(string path)
        {
            var bytes = Encoding.UTF8.GetBytes(path);
            return Convert.ToBase64String(bytes);
        }
        private async Task<dynamic> RequestDataAsync(string endPoint, HttpMethod method, Dictionary<string, string> headers, dynamic content = null)
        {
            try
            {
                using(var response = await SDKHelper.SendRequest(endPoint, method, headers, content))
                {
                    var reader = await response.Content.ReadAsStringAsync();
                    return JsonConvert.DeserializeObject(reader);
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}
