using Hoxro.Entity.ViewModels;
using Hoxro.Utiltiy.StaticData;
using Microsoft.AspNetCore.Hosting;
using MsgKit.Enums;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Threading.Tasks;

namespace Hoxro.Service.userDefinedService
{
    public interface IUtilService
    {
        Task<object> GetMsgHtml(byte[] msg);
        Task<byte[]> ConvertToMsg(MailBoxWrapper mail);
        Task<MailBoxWrapper> ConvertToMsg(string location);
        Task<MsgKit.Email> ReadMimeMessageAsMsg(MimeKit.MimeMessage message);
    }
    public class UtilService:IUtilService
    {
        private readonly IHostingEnvironment _environment;
        public UtilService(IHostingEnvironment environment)
        {
            _environment = environment;
        }
        
        public async Task<byte[]> ConvertToMsg(MailBoxWrapper mail)
        {
            try
            {
                string location;
                string fromMail = "";
                string fromName = "";
                if (mail.From.Contains("<"))
                {
                    fromName = mail.From.Substring(0, mail.From.IndexOf("<"));
                    fromMail = mail.From.Replace(fromName, string.Empty);
                    fromMail = fromMail.Replace("<", string.Empty);
                    fromMail = fromMail.Replace(">", string.Empty);
                }
                else
                {
                    fromMail = mail.From;
                }
                using(var email = new MsgKit.Email(new MsgKit.Sender(fromMail, fromName), mail.Subject))
                {
                    var bodyBytes = Convert.FromBase64String(mail.Body);
                    var bodyString = Encoding.UTF8.GetString(bodyBytes);
                    location = _environment.WebRootPath + FolderNames.App_Data;
                    string mailAddress = string.Empty;
                    foreach (var item in mail.Tos)
                    {
                        if (item.Contains("<"))
                        {
                            string name = item.Substring(0, item.IndexOf("<"));
                            mailAddress = item.Replace(name, string.Empty);
                            mailAddress = mailAddress.Replace("<", string.Empty);
                            mailAddress = mailAddress.Replace(">", string.Empty);
                            email.Recipients.AddTo(mailAddress, name);
                        }
                        else
                        {
                            email.Recipients.AddTo(item, string.Empty);
                        }
                    }
                    if(mail.CCs != null)
                    {
                        foreach (var item in mail.CCs)
                        {
                            if (item.Contains("<"))
                            {
                                string name = item.Substring(0, item.IndexOf("<"));
                                mailAddress = item.Replace(name, "");
                                mailAddress = mailAddress.Replace("<", "");
                                mailAddress = mailAddress.Replace(">", "");
                                email.Recipients.AddCc(mailAddress, name);
                            }
                            else
                            {
                                email.Recipients.AddCc(item, string.Empty);
                            }
                        }
                    }

                    email.BodyText = string.Empty;
                    email.BodyHtml = bodyString;
                    email.Importance = MessageImportance.IMPORTANCE_HIGH;
                    email.IconIndex = MessageIconIndex.ReadMail;

                    //if(mail.Attachments != null)
                    //{
                    //    foreach (var item in mail.Attachments)
                    //    {
                    //        if (!string.IsNullOrEmpty(item.Contents))
                    //        {
                    //            email.Attachments.Add(item.Name);
                    //        }
                    //    }
                    //}

                    location = Path.Combine(location, mail.Id + Utiltiy.StaticData.Extensions.Msg);
                    email.Save(location);
                    var bytes = File.ReadAllBytes(location);
                    File.Delete(location);
                    return await Task.FromResult(bytes);
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        public async Task<MailBoxWrapper> ConvertToMsg(string location)
        {
            throw new NotImplementedException();
        }

        public async Task<object> GetMsgHtml(byte[] msg)
        {
            throw new NotImplementedException();
        }

        public async Task<MsgKit.Email> ReadMimeMessageAsMsg(MimeKit.MimeMessage message)
        {
            try
            {
                return null;
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}
