using Hoxro.Entity.ViewModels;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Auth;
using Microsoft.WindowsAzure.Storage.Blob;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Hoxro.Utiltiy.StaticData;

namespace Hoxro.Service.userDefinedService
{

    public interface IAzureBlobStorage
    {
        Task<string> CopyFile(string sourceContainer, string sourceBlob, string targetContainer,  string targetBlob);
        Task UploadAsync(string storageName, string blobUrl, string filePath);
        Task UploadAsync(string storageName, string blobUrl, Stream stream);
        Task UploadAsync(string storageName, string blobUrl, byte[] buffer);
        Task<MemoryStream> DownloadStreamAsync(string storageName, string blobUrl);
        Task<byte[]> DownloadAsync(string storageName, string blobUrl);
        Task DownloadAsync(string storageName, string blobUrl, string path);
        Task Delete(string storageName, string blobUrl);
        Task<bool>  DeleteAsync(string storageName, string blobUrl);
        Task<bool> ExistsAsync(string storageName, string blobUrl);
        Task<List<AzureBlobItem>> ListAsync();
        Task<List<AzureBlobItem>> ListAsync(string rootFolder);
        Task<List<string>> ListFoldersAsync();
        Task<List<string>> ListFoldersAsync(string rootFolder);
        Task<bool> CreateBlobStorage(string storageName);
        Task<bool> DeleteBlobStorage(string storageName);
        Task<string> GetViewUrl(string storageName, string blobUrl, string extension);
        Task<string> DownloadUrl(string storageName, string blobUrl, string fileName);
    }

    public class AzureBlobStorage : IAzureBlobStorage
    {
        #region " Public "
        private string _accountName;
        private string _storageKey;
        private string _accountUrl;
        private readonly CloudStorageAccount _cloudStorageAccount;
        private readonly IConfiguration _configuration;

        public AzureBlobStorage(IHostingEnvironment enviroment)
        {
            var builder = new ConfigurationBuilder().SetBasePath(enviroment.ContentRootPath).AddJsonFile("applicationsettings.json", true, true);
            _configuration = builder.Build();
            _accountName = _configuration["Blob_StorageAccount"];
            _storageKey = _configuration["Blob_StorageKey"];
            _accountUrl = _configuration["Blob_Account_Url"];
            _cloudStorageAccount = CloudStorageAccount.Parse(_configuration["Storage_ConnectionString"]);
        }


        public async Task<string> CopyFile(string sourceContainer, string sourceBlob, string targetContainer, string targetBlob)
        {
            try
            {
                CloudBlobContainer containerSrc = GetContainer(sourceContainer);
                CloudBlockBlob source = containerSrc.GetBlockBlobReference(sourceBlob);

                CloudBlobContainer containerTrgt = GetContainer(targetContainer);
                CloudBlockBlob target = containerTrgt.GetBlockBlobReference(targetBlob);
                return await target.StartCopyAsync(source);
            }
            catch(Exception ex)
            {
                return null;
            }
        }

        public async Task UploadAsync(string storageName, string blobUrl, string filePath)
        {
            CloudBlobContainer container = GetContainer(storageName);
            //Blob
            CloudBlockBlob blockBlob = container.GetBlockBlobReference(blobUrl);//await GetBlockBlobAsync(blobUrl);

            //Upload
            using (var fileStream = System.IO.File.Open(filePath, FileMode.Open))
            {
                fileStream.Position = 0;
                await blockBlob.UploadFromStreamAsync(fileStream);
            }
        }

        public async Task UploadAsync(string storageName, string blobUrl, Stream stream)
        {
            try
            {
                CloudBlobContainer container = GetContainer(storageName);
                CloudBlockBlob blockBlob = container.GetBlockBlobReference(blobUrl);

                //Upload
                stream.Position = 0;
                await blockBlob.UploadFromStreamAsync(stream);
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
        public async Task UploadAsync(string storageName, string blobUrl, byte[] buffer)
        {
            try
            {
                CloudBlobContainer container = GetContainer(storageName);
                CloudBlockBlob blockBlob = container.GetBlockBlobReference(blobUrl);
                await blockBlob.UploadFromByteArrayAsync(buffer, 0, buffer.Length);
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
        public async Task<MemoryStream> DownloadStreamAsync(string storageName, string blobUrl)
        {
            CloudBlobContainer container = GetContainer(storageName);
            //Blob
            CloudBlockBlob blockBlob = container.GetBlockBlobReference(blobUrl);

            //Download
            using(MemoryStream stream = new MemoryStream())
            {
                await blockBlob.DownloadToStreamAsync(stream);
                return stream;
            }
        }
        public async Task<byte[]> DownloadAsync(string storageName, string blobUrl)
        {
            try
            {
                CloudBlobContainer container = GetContainer(storageName);
                //Blob
                CloudBlockBlob blockBlob = container.GetBlockBlobReference(blobUrl);
                await blockBlob.FetchAttributesAsync();

                long fileByteLength = blockBlob.Properties.Length;
                //Download
                byte[] buffer = new byte[fileByteLength];
                await blockBlob.DownloadToByteArrayAsync(buffer, 0);
                return await Task.FromResult(buffer);
            }
            catch(Exception ex)
            {
                return new byte[0];
            }
        }
        public async Task DownloadAsync(string storageName, string blobUrl, string path)
        {
            CloudBlobContainer container = GetContainer(storageName);
            //Blob
            CloudBlockBlob blockBlob = container.GetBlockBlobReference(blobUrl);//await GetBlockBlobAsync(blobUrl);

            //Download
            await blockBlob.DownloadToFileAsync(path, FileMode.Create);
        }

        public async Task Delete(string storageName, string blobUrl)
        {
            try
            {
                CloudBlobContainer container = GetContainer(storageName);
                //CloudBlockBlob blob = container.GetBlockBlobReference(blobUrl);
                CloudBlob cloudBlob = container.GetBlobReference(blobUrl);
                //await blob.DeleteAsync();
                await cloudBlob.DeleteIfExistsAsync();
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        public async Task<bool> DeleteAsync(string storageName, string blobUrl)
        {
            try
            {
                CloudBlobContainer container = GetContainer(storageName);

                //Blob
                CloudBlockBlob blockBlob = container.GetBlockBlobReference(blobUrl);

                //Delete
                return await blockBlob.DeleteIfExistsAsync();

                //CloudBlobClient client = _cloudStorageAccount.CreateCloudBlobClient();
                //CloudBlobContainer container = client.GetContainerReference(storageName);
                //CloudBlockBlob blockBlob = 
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        public async Task<bool> ExistsAsync(string storageName, string blobUrl)
        {
            CloudBlobContainer container = GetContainer(storageName);
            //Blob
            CloudBlockBlob blockBlob = container.GetBlockBlobReference(blobUrl);//await GetBlockBlobAsync(blobUrl);

            //Exists
            return await blockBlob.ExistsAsync();
        }

        public async Task<List<AzureBlobItem>> ListAsync()
        {
            return await GetBlobListAsync();
        }

        public async Task<List<AzureBlobItem>> ListAsync(string rootFolder)
        {
            if (rootFolder == "*") return await ListAsync(); //All Blobs
            if (rootFolder == "/") rootFolder = "";          //Root Blobs

            var list = await GetBlobListAsync();
            return list.Where(i => i.Folder == rootFolder).ToList();
        }

        public async Task<List<string>> ListFoldersAsync()
        {
            var list = await GetBlobListAsync();
            return list.Where(i => !string.IsNullOrEmpty(i.Folder))
                       .Select(i => i.Folder)
                       .Distinct()
                       .OrderBy(i => i)
                       .ToList();
        }

        public async Task<List<string>> ListFoldersAsync(string rootFolder)
        {
            if (rootFolder == "*" || rootFolder == "") return await ListFoldersAsync(); //All Folders

            var list = await GetBlobListAsync();
            return list.Where(i => i.Folder.StartsWith(rootFolder))
                       .Select(i => i.Folder)
                       .Distinct()
                       .OrderBy(i => i)
                       .ToList();
        }

        public async Task<bool> CreateBlobStorage(string storageName)
        {
            try
            {
                //var storageAccount = CloudStorageAccount.Parse("DefaultEndpointsProtocol=https;AccountName=hoxro;AccountKey=4Bb4ZPTpY0eIt9QkK8MMTH3utW9/wjfmW+JRgJkG2oCz5tB/iYu3yqz98W05/LHR19RMde9IO0hJuY7aaF22tg==");
                var storageAccount = new CloudStorageAccount(
                new StorageCredentials(_accountName, _storageKey), false);
                CloudBlobClient blobClient = storageAccount.CreateCloudBlobClient();
                //the container for this is companystyles
                CloudBlobContainer container = blobClient.GetContainerReference(storageName);
                //Create a new container, if it does not exist
                return await container.CreateIfNotExistsAsync();
            }
            catch (Exception)
            {
                return await Task.FromResult(false);
            }
        }

        public async Task<bool> DeleteBlobStorage(string storageName)
        {
            try
            {
                CloudBlobContainer container = GetContainer(storageName);
                return await container.DeleteIfExistsAsync();
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
        public async Task<string> DownloadUrl(string storageName, string blobUrl, string fileName)
        {
            try
            {
                var container = GetContainer(storageName);
                container.SetPermissionsAsync(new BlobContainerPermissions
                {
                    PublicAccess = BlobContainerPublicAccessType.Blob
                }).Wait();
                SharedAccessBlobPolicy sasConstraints = new SharedAccessBlobPolicy();
                sasConstraints.SharedAccessStartTime = DateTimeOffset.UtcNow.AddMinutes(-5);
                sasConstraints.SharedAccessExpiryTime = DateTimeOffset.UtcNow.AddMinutes(15);
                sasConstraints.Permissions = SharedAccessBlobPermissions.List | SharedAccessBlobPermissions.Read | SharedAccessBlobPermissions.Write;

                SharedAccessBlobHeaders headers = new SharedAccessBlobHeaders()
                {
                    ContentType = Extensions.ContentType(""),
                    ContentDisposition = "filename="+fileName
                };

                //string sasContainerToken = container.GetSharedAccessSignature(sasConstraints);
                CloudBlockBlob blob = container.GetBlockBlobReference(blobUrl);
                string sasBlobToken = blob.GetSharedAccessSignature(sasConstraints, headers);
                return await Task.FromResult(blob.Uri + sasBlobToken);
            }
            catch (Exception ex)
            {
                return "";
            }
        }

        public async Task<string> GetViewUrl(string storageName, string blobUrl, string extension)
        {
            try
            {
                var container = GetContainer(storageName);
                container.SetPermissionsAsync(new BlobContainerPermissions
                {
                    PublicAccess = BlobContainerPublicAccessType.Blob
                }).Wait();
                SharedAccessBlobPolicy sasConstraints = new SharedAccessBlobPolicy();
                sasConstraints.SharedAccessStartTime = DateTimeOffset.UtcNow.AddMinutes(-5);
                sasConstraints.SharedAccessExpiryTime = DateTimeOffset.UtcNow.AddMinutes(15);
                sasConstraints.Permissions = SharedAccessBlobPermissions.List | SharedAccessBlobPermissions.Read | SharedAccessBlobPermissions.Write;

                SharedAccessBlobHeaders headers = new SharedAccessBlobHeaders()
                {
                    ContentType = Extensions.ContentType(extension)
                };

                //string sasContainerToken = container.GetSharedAccessSignature(sasConstraints);
                CloudBlockBlob blob = container.GetBlockBlobReference(blobUrl);
                string sasBlobToken = blob.GetSharedAccessSignature(sasConstraints, headers);
                return await Task.FromResult(blob.Uri + sasBlobToken);
            }
            catch(Exception ex)
            {
                return "";
            }
        }


        #endregion

        #region " Private "

        private readonly AzureBlobSetings settings;
        private async Task<CloudBlobContainer> GetContainerAsync()
        {
            //Account
            CloudStorageAccount storageAccount = new CloudStorageAccount(
                new StorageCredentials(_accountName, _storageKey), false);

            //Client
            CloudBlobClient blobClient = storageAccount.CreateCloudBlobClient();

            //Container
            CloudBlobContainer blobContainer = blobClient.GetContainerReference(settings.ContainerName);
            await blobContainer.CreateIfNotExistsAsync();
            //await blobContainer.SetPermissionsAsync(new BlobContainerPermissions() { PublicAccess = BlobContainerPublicAccessType.Blob });

            return blobContainer;
        }

        private async Task<CloudBlockBlob> GetBlockBlobAsync(string blobUrl)
        {
            //Container
            CloudBlobContainer blobContainer = await GetContainerAsync();

            //Blob
            CloudBlockBlob blockBlob = blobContainer.GetBlockBlobReference(blobUrl);

            return blockBlob;
        }

        private async Task<List<AzureBlobItem>> GetBlobListAsync(bool useFlatListing = true)
        {
            //Container
            CloudBlobContainer blobContainer = await GetContainerAsync();

            //List
            var list = new List<AzureBlobItem>();
            BlobContinuationToken token = null;
            do
            {
                BlobResultSegment resultSegment =
                    await blobContainer.ListBlobsSegmentedAsync("", useFlatListing, new BlobListingDetails(), null, token, null, null);
                token = resultSegment.ContinuationToken;

                foreach (IListBlobItem item in resultSegment.Results)
                {
                    list.Add(new AzureBlobItem(item));
                }
            } while (token != null);

            return list.OrderBy(i => i.Folder).ThenBy(i => i.Name).ToList();
        }

        private CloudBlobContainer GetContainer(string storageName)
        {
            return new CloudBlobContainer(new Uri(_accountUrl + storageName), new StorageCredentials(_accountName, _storageKey));
        }
        private string GetSASUrl(string containerName)
        {
            CloudBlobContainer container = GetContainer(containerName);
            BlobContainerPermissions containerPermissions = new BlobContainerPermissions();
            containerPermissions.SharedAccessPolicies.Add(
              "twominutepolicy", new SharedAccessBlobPolicy()
              {
                  SharedAccessStartTime = DateTime.UtcNow.AddMinutes(-1),
                  SharedAccessExpiryTime = DateTime.UtcNow.AddMinutes(15),
                  Permissions = SharedAccessBlobPermissions.Read | SharedAccessBlobPermissions.Write
              });
            containerPermissions.PublicAccess = BlobContainerPublicAccessType.Off;
            container.SetPermissionsAsync(containerPermissions);
            string sas = container.GetSharedAccessSignature(new SharedAccessBlobPolicy(),
              "twominutepolicy ");
            return sas;
        }
        #endregion
    }
}
