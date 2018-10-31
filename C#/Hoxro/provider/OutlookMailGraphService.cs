using Hoxro.Data.Models;
using Hoxro.Entity.ViewModels;
using Hoxro.Utiltiy.StaticData;
using Microsoft.Graph;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Task = System.Threading.Tasks.Task;
using Attachment = Microsoft.Graph.Attachment;
using Hoxro.Utiltiy.Converter;
using System.Net.Mail;
using MimeKit;

namespace Hoxro.Service.userDefinedService.provider
{
    public class OutlookMailGraphService : IMailGraphService
    {
        readonly object _readMessage = new { IsRead = true, InferenceClassification = "other" };
        readonly object _unreadMessage = new { IsRead = false, InferenceClassification = "other" };
        readonly object _pinMessage = new { Importance = "high", InferenceClassification = "other" };
        readonly object _unpinMessage = new { Importance = "normal", InferenceClassification = "other" };
        readonly object _flagMessage = new { Flag = new { FlagStatus = "flagged" }, InferenceClassification = "other" };
        readonly object _unflagMessage = new { Flag = new { FlagStatus = "notflagged" }, InferenceClassification = "other" };
        readonly string _recieveDateTimeDesc = "receivedDateTime DESC";
        readonly string _createdDateTimeDesc = "createdDateTime DESC";
        readonly string _sendDateTimeDesc = "sentDateTime DESC";
        readonly IProviderHelper _providerHelper;
        public OutlookMailGraphService(IProviderHelper providerHelper)
        {
            _providerHelper = providerHelper;
        } 
        
        public async Task<dynamic> GetFoldersWithInbox(Provider provider)
        {
            try
            {
                GraphServiceClient graphClient = SDKHelper.GetMicrosoftAuthenticatedClient(provider.AccessToken);
                var folders = await graphClient.Me.MailFolders.Request()
                                                    .Select(x => new { x.Id, x.ChildFolders, x.DisplayName, x.ChildFolderCount, x.TotalItemCount, x.ParentFolderId, x.UnreadItemCount })
                                                    .GetAsync();
                var inbox = await GetInbox(graphClient);
                Message firstMail = null;
                if(inbox != null)
                {
                    string mailId = inbox.ToList()[0].Id;
                    if(inbox.ToList()[0].IsRead == false)
                    {
                        firstMail = await UpdateMessage(mailId, _readMessage, provider.AccessToken);
                        inbox.ToList()[0].IsRead = true;
                    }
                    else
                    {
                        firstMail = await GetInboxMessage(graphClient, mailId);
                    }
                }                
                return await Task.FromResult(new { folders = folders, messages = inbox, firstMail = firstMail });
            }
            catch (ServiceException ex)
            {
                throw ex;
            }
        }
        public async Task<dynamic> GetAttachment(Provider provider, string folder, string mailId, string attachmentId)
        {
            try
            {
                GraphServiceClient graphClient = SDKHelper.GetMicrosoftAuthenticatedClient(provider.AccessToken);

                dynamic attachment = null;
                switch (folder.ToLower())
                {
                    case ProviderFolder.deleted_items:
                        attachment = "";
                        break;
                    case ProviderFolder.drafts:
                        attachment = "";
                        break;
                    case ProviderFolder.inbox:
                        attachment = await GetInboxAttachment(graphClient, mailId, attachmentId);
                        break;
                    case ProviderFolder.sent_items:
                        attachment = await GetSentItemAttachment(graphClient, mailId, attachmentId);
                        break;
                    default:
                        break;
                }
                return await Task.FromResult(attachment);
            }
            catch (ServiceException ex)
            {
                throw ex;
            }
        }
        public async Task<ProviderResponse> GetAuthorizationInfo(string code)
        {
            try
            {
                ProviderResponse provider = null;
                using (HttpClient client = new HttpClient())
                {
                    var parameters = new Dictionary<string, string>
                    {
                        { "client_id", _providerHelper.MicrosoftClientId },
                        { "scope", _providerHelper.MicrosoftScopes },
                        { "code", code},
                        { "redirect_uri", _providerHelper.RedirectUri },
                        { "grant_type", "authorization_code" },
                        { "client_secret", _providerHelper.MicrosoftClientSecretCode }
                    };
                    var encodedContent = new FormUrlEncodedContent(parameters);

                    client.DefaultRequestHeaders.Add("ContentType", "application/json");

                    var response = client.PostAsync(_providerHelper.MicrosoftTokenUri, encodedContent).Result;
                    string content = response.Content.ReadAsStringAsync().Result;

                    provider = JsonConvert.DeserializeObject<ProviderResponse>(content);
                }
                return await Task.FromResult(provider);
            }
            catch(ServiceException ex)
            {
                throw ex;
            }
        }
        public async Task<Stream> GetCurrentUserPhotoStreamAsync(GraphServiceClient graphClient)
        {
            try
            {
                Stream currentUserPhotoStream = await graphClient.Me.Photo.Content.Request().GetAsync();
                return await Task.FromResult(currentUserPhotoStream);
            }
            catch (ServiceException ex)
            {
                throw ex;
            }
        }
        public async Task<TokenResolver> GetEmailAddress(string accessToken)
        {
            try
            {
                GraphServiceClient graphClient = SDKHelper.GetMicrosoftAuthenticatedClient(accessToken);
                Microsoft.Graph.User user = await graphClient.Me.Request().Select("mail,userPrincipalName").GetAsync();

                TokenResolver resolver = new TokenResolver();
                resolver.email = user.Mail ?? user.UserPrincipalName;
                resolver.user_id = user.Id ?? "";
                return resolver;
            }
            catch (ServiceException ex)
            {
                throw ex;
            }
        }
        public async Task<dynamic> GetInbox(Provider provider, string skip, int top)
        {
            try
            {
                GraphServiceClient graphClient = SDKHelper.GetMicrosoftAuthenticatedClient(provider.AccessToken);
                var response = await graphClient.Me.MailFolders.Inbox.Messages.Request()
                                        .OrderBy(_recieveDateTimeDesc)
                                        .Select(x => new 
                                        {
                                            x.Id
                                            , x.Subject
                                            , x.From
                                            , x.ReceivedDateTime
                                            , x.HasAttachments
                                            , x.Importance
                                            , x.Flag
                                            , x.IsRead
                                        })
                                        .Skip(Convert.ToInt32(skip))
                                        .Top(top)
                                        .GetAsync();
                Message firstMail = null;
                if(response != null)
                {
                    string mailId = response[0].Id;
                    if (response.ToList()[0].IsRead == false)
                    {
                        firstMail = await UpdateMessage(mailId, _readMessage, provider.AccessToken);
                        response.ToList()[0].IsRead = true;
                    }
                    else
                    {
                        firstMail = await GetInboxMessage(graphClient, mailId);
                    }
                }
                return await Task.FromResult(new { messages = response, firstMail = firstMail });
            }
            catch (ServiceException ex)
            {
                throw ex;
            }
        }
        public async Task<dynamic> GetInboxMessage(Provider provider, string mailId)
        {
            try
            {
                GraphServiceClient graphClient = SDKHelper.GetMicrosoftAuthenticatedClient(provider.AccessToken);
                var response = await graphClient.Me.MailFolders.Inbox.Messages[mailId].Request().GetAsync();
                if (response.HasAttachments == true)
                {
                    response.Attachments = await GetAttachments(graphClient, mailId);
                }
                if (response.IsRead == false)
                {
                    response = await UpdateMessage(mailId, _readMessage, provider.AccessToken);
                }
                return await Task.FromResult(response);                                        
            }
            catch(ServiceException ex)
            {
                throw ex;
            }
        }
        public async Task<ProviderResponse> GetRefreshToken(string refreshToken)
        {
            try
            {
                ProviderResponse provider = null;
                using (HttpClient client = new HttpClient())
                {
                    var parameters = new Dictionary<string, string>
                    {
                        { "grant_type", "refresh_token"},
                        { "client_id", _providerHelper.MicrosoftClientId },
                        { "client_secret", _providerHelper.MicrosoftClientSecretCode },
                        { "refresh_token", refreshToken }
                    };

                    var encodedContent = new FormUrlEncodedContent(parameters);

                    var response = await client.PostAsync(_providerHelper.MicrosoftTokenUri, encodedContent);
                    string content = await response.Content.ReadAsStringAsync();
                    provider = JsonConvert.DeserializeObject<ProviderResponse>(content);
                }
                return provider;
            }
            catch(ServiceException ex)
            {
                throw ex;
            }
        }
        public async Task<dynamic> SendMail(Provider provider, MailWrapper mail)
        {
            try
            {
                GraphServiceClient graphClient = SDKHelper.GetMicrosoftAuthenticatedClient(provider.AccessToken);
                Message message = await BuildEmailMessage(graphClient, mail);
                await graphClient.Me.SendMail(message, true).Request().PostAsync(CancellationToken.None);
                var response = await graphClient.Me.MailFolders.SentItems.Messages.Request()
                                        .OrderBy(_sendDateTimeDesc)
                                        .Top(1)
                                        .GetAsync();
                return await Task.FromResult(response);
            }
            catch (ServiceException ex)
            {
                throw ex;
            }
        }
        public async Task<IEnumerable<Message>> GetInbox(GraphServiceClient graphClient)
        {
            try
            {
                var inbox = await graphClient.Me.MailFolders.Inbox.Messages.Request()
                                                .OrderBy(_recieveDateTimeDesc)
                                                .Select(x => new { x.Id, x.Importance, x.HasAttachments, x.Subject, x.From, x.ReceivedDateTime, x.IsRead, x.Flag })
                                                .Top(20)
                                                .GetAsync();
                return await Task.FromResult(inbox);
            }
            catch(ServiceException ex)
            {
                throw ex;
            }
        }
        public async Task<Message> GetInboxMessage(GraphServiceClient graphClient, string mailId)
        {
            try
            {
                var message = await graphClient.Me.MailFolders.Inbox.Messages[mailId].Request()
                                                //.Select(x => new { x.Id, x.Importance, x.HasAttachments, x.Subject, x.From, x.ReceivedDateTime, x.IsRead, x.Body, x.Flag, x.BodyPreview})                                                
                                                .GetAsync();
                if (message.HasAttachments == true)
                {
                   message.Attachments = await GetAttachments(graphClient, mailId);
                }
                if (message.IsRead == false)
                {
                    //message.IsRead = true;
                    //await ReadUnreadMessage(message);
                    //var request = graphClient.Me.MailFolders.Inbox.Messages[mailId].Request();                    
                    //request.Headers.Add(new HeaderOption("Content-Type", "application/json"));
                    //var response = await request.UpdateAsync(message);
                }
                return await Task.FromResult(message);
            }
            catch (ServiceException ex)
            {
                throw ex;
            }
        }
        public async Task<IMessageAttachmentsCollectionPage> GetAttachments(GraphServiceClient graphClient, string mailId)
        {
            try
            {
                var attacements = await graphClient.Me.MailFolders.Inbox.Messages[mailId].Attachments.Request()
                                                    //.Select(x => new { x.Id, x.Name, x.ContentType, x.IsInline, x.ContentBytes })
                                                    .GetAsync();
                return await Task.FromResult(attacements);
            }
            catch(ServiceException ex)
            {
                throw ex;
            }
        }
        public async Task<List<ODataAttachment>> GetAttachments(Provider provider, string mailId)
        {
            try
            {
                string url = $"https://graph.microsoft.com/v1.0/me/messages/{mailId}/attachments";
                using(var response = await SDKHelper.SendRequest(HttpMethod.Get, url, provider.AccessToken))
                {
                    var result = await response.Content.ReadAsStringAsync();
                    var oData = JsonConvert.DeserializeObject<ODataContext>(result);
                    return await Task.FromResult(oData.Value);
                }

            }
            catch (ServiceException ex)
            {
                throw ex;
            }
        }
        public async Task<dynamic> GetFolderMessages(Provider provider, string foldername, string page, int pageSize)
        {
            try
            {
                int skip = pageSize * Convert.ToInt32(page) - pageSize;
                if(skip < 0)
                {
                    skip = 0;
                }
                string skips = skip.ToString();
                dynamic messages = null;
                switch (foldername.ToLower())
                {
                    case ProviderFolder.deleted_items:
                        messages = await GetDeletedMessages(provider, skip, pageSize);
                        break;
                    case ProviderFolder.drafts:
                        messages = await GetDraftMessages(provider, skip, pageSize);
                        break;
                    case ProviderFolder.inbox:
                        messages = await GetInbox(provider, skips, pageSize);
                        break;
                    case ProviderFolder.sent_items:
                        messages = await GetSentItemMessages(provider, skips, pageSize);
                        break;
                    default:
                        break;
                }
                return messages;
            }
            catch(ServiceException ex)
            {
                throw ex;
            }
        }
        public async Task<dynamic> GetArchiveMessages(Provider provider, int skip, int top)
        {
            try
            {
                
                return await Task.FromResult(new { messages = "", firstMail = "" });
            }
            catch (ServiceException ex)
            {
                throw ex;
            }
        }
        public async Task<dynamic> GetDeletedMessages(Provider provider, int skip, int top)
        {
            try
            {
                GraphServiceClient graphClient = SDKHelper.GetMicrosoftAuthenticatedClient(provider.AccessToken);
                IEnumerable<Message> messages = await graphClient.Me.MailFolders.DeletedItems.Messages.Request()
                                                        .OrderBy(_recieveDateTimeDesc)
                                                        .Select(x => new { x.Id, x.Importance, x.HasAttachments, x.From, x.ReceivedDateTime, x.Subject, x.Flag, x.IsRead })
                                                        .Skip(skip)
                                                        .Top(top)
                                                        .GetAsync();
                Message firstMail = null;
                if(messages != null)
                {
                    string mailId = messages.ToList()[0].Id;
                    firstMail = await GetDeletedMessage(graphClient, mailId);
                }
                return await Task.FromResult(new { messages = messages, firstMail = firstMail });
            }
            catch (ServiceException ex)
            {
                throw ex;
            }
        }
        public async Task<Message> GetDeletedMessage(GraphServiceClient graphClient, string mailId)
        {
            try
            {
                var response = await graphClient.Me.MailFolders.DeletedItems.Messages[mailId].Request()
                                                .Select(x => new { x.Id, x.Importance, x.HasAttachments, x.From, x.ReceivedDateTime, x.Subject, x.Body, x.ToRecipients, x.Flag, x.IsRead })
                                                .GetAsync();
                return response;
            }
            catch (ServiceException ex)
            {
                throw ex;
            }
        }
        public async Task<dynamic> GetDraftMessages(Provider provider, int skip, int top)
        {
            try
            {
                GraphServiceClient graphClient = SDKHelper.GetMicrosoftAuthenticatedClient(provider.AccessToken);
                IEnumerable<Message> messages = await graphClient.Me.MailFolders.Drafts.Messages.Request()
                                                        .OrderBy(_createdDateTimeDesc)
                                                        .Select(x => new { x.Id, x.Importance, x.HasAttachments, x.From, x.CreatedDateTime, x.Subject, x.Flag, x.IsRead })
                                                        .Skip(skip)
                                                        .Top(top)
                                                        .GetAsync();
                Message firstMail = null;
                if (messages != null)
                {
                    string mailId = messages.ToList()[0].Id;
                    firstMail = await GetDeletedMessage(graphClient, mailId);
                }
                return await Task.FromResult(new { messages = messages, firstMail = firstMail });
            }
            catch (ServiceException ex)
            {
                throw ex;
            }
        }
        public async Task<Message> GetDraftMessage(GraphServiceClient graphClient, string mailId)
        {
            try
            {
                var response = await graphClient.Me.MailFolders.Drafts.Messages[mailId].Request()
                                                .Select(x => new { x.Id, x.Importance, x.HasAttachments, x.From, x.CreatedDateTime, x.Subject, x.Body, x.ToRecipients, x.Flag, x.IsRead })
                                                .GetAsync();
                return response;
            }
            catch (ServiceException ex)
            {
                throw ex;
            }
        }
        public async Task<dynamic> GetSentItemMessages(Provider provider, string skip, int top)
        {
            try
            {
                GraphServiceClient graphClient = SDKHelper.GetMicrosoftAuthenticatedClient(provider.AccessToken);
                IEnumerable<Message> messages = await graphClient.Me.MailFolders.SentItems.Messages.Request()
                                                        .OrderBy(_sendDateTimeDesc)
                                                        .Select(x => new { x.Id, x.Importance, x.HasAttachments, x.From, x.SentDateTime, x.Subject, x.Flag, x.IsRead })
                                                        .Skip(Convert.ToInt32(skip))
                                                        .Top(top)
                                                        .GetAsync();
                Message firstMail = null;
                if (messages != null)
                {
                    string mailId = messages.ToList()[0].Id;
                    firstMail = await GetSentItemMessage(graphClient, mailId);
                }
                return await Task.FromResult(new { messages = messages, firstMail = firstMail });
            }
            catch (ServiceException ex)
            {
                throw ex;
            }
        }
        public async Task<Message> GetSentItemMessage(GraphServiceClient graphClient, string mailId)
        {
            try
            {
                var response = await graphClient.Me.MailFolders.SentItems.Messages[mailId].Request()
                                                .Select(x => new { x.Id, x.Importance, x.HasAttachments, x.From, x.SentDateTime, x.Subject, x.Body, x.ToRecipients, x.Flag, x.IsRead })
                                                .GetAsync();
                return response;
            }
            catch (ServiceException ex)
            {
                throw ex;
            }
        }
        public async Task<dynamic> GetMessageById(Provider provider, string folder, string mailId)
        {
            try
            {
                Message message = null;
                GraphServiceClient graphClient = SDKHelper.GetMicrosoftAuthenticatedClient(provider.AccessToken);
                switch (folder.ToLower())
                {
                    case ProviderFolder.deleted_items:
                        message = await GetDeletedMessage(graphClient, mailId);
                        break;
                    case ProviderFolder.drafts:
                        message = await GetDraftMessage(graphClient, mailId);
                        break;
                    case ProviderFolder.inbox:
                        message = await GetInboxMessage(graphClient, mailId);
                        break;
                    case ProviderFolder.sent_items:
                        message = await GetSentItemMessage(graphClient, mailId);
                        break;
                    default:
                        break;
                }
                return await Task.FromResult(new { message = message});
            }
            catch (ServiceException ex)
            {
                throw ex;
            }
        }
        public async Task<string> PinUnpinMessage(Provider provider, string mailId, bool isPinned)
        {
            string output = "normal";
            try
            {
                object message = null;
                if (isPinned)
                {
                    message = _pinMessage;
                }
                else
                {
                    message = _unpinMessage;
                }
                var response = await UpdateMessage(mailId, message, provider.AccessToken);
                if(response != null)
                {
                    if (isPinned)
                    {
                        output = "high";
                    }
                }
            }
            catch (ServiceException ex)
            {
                throw ex;
            }
            return await Task.FromResult(output);
        }
        public async Task<string> FlagUnflagMessage(Provider provider, string mailId, bool isFlag)
        {
            string output = "notflagged";
            try
            {
                object message = null;
                if (isFlag)
                {
                    message = _flagMessage;
                }
                else
                {
                    message = _unflagMessage;
                }
                var response = await UpdateMessage(mailId, message, provider.AccessToken);
                if (response != null)
                {
                    if (isFlag)
                    {
                        output = "flagged";
                    }
                }
            }
            catch (ServiceException ex)
            {
                throw ex;
            }
            return await Task.FromResult(output);
        }
        public async Task<bool> ReadUnReadMessage(Provider provider, string mailId, bool isRead)
        {
            bool output = false;
            try
            {
                object message = null;
                if (isRead)
                {
                    message = _readMessage;
                }
                else
                {
                    message = _unreadMessage;
                }
                var response = await UpdateMessage(mailId, message, provider.AccessToken);
                if (response != null)
                {
                    if (isRead)
                    {
                        output = true;
                    }
                }
            }
            catch (ServiceException ex)
            {
                throw ex;
            }
            return await Task.FromResult(output);
        }
        public async Task<dynamic> CreateReply(Provider provider, string mailId)
        {
            try
            {
                GraphServiceClient graphClient = SDKHelper.GetMicrosoftAuthenticatedClient(provider.AccessToken);
                var response = await graphClient.Me.MailFolders.Inbox.Messages[mailId].CreateReply().Request().PostAsync(CancellationToken.None);
                return await Task.FromResult(response);
            }
            catch(ServiceException ex)
            {
                throw ex;
            }
        }
        public async Task<dynamic> CreateReplyAll(Provider provider, string mailId)
        {
            try
            {
                GraphServiceClient graphClient = SDKHelper.GetMicrosoftAuthenticatedClient(provider.AccessToken);
                var response = await graphClient.Me.MailFolders.Inbox.Messages[mailId].CreateReplyAll().Request().PostAsync();
                return await Task.FromResult(response);
            }
            catch (ServiceException ex)
            {
                throw ex;
            }
        }
        public async Task<dynamic> CreateForward(Provider provider, string mailId)
        {
            try
            {
                GraphServiceClient graphClient = SDKHelper.GetMicrosoftAuthenticatedClient(provider.AccessToken);
                var response = await graphClient.Me.MailFolders.Inbox.Messages[mailId].CreateForward().Request().PostAsync();
                return await Task.FromResult(response);
            }
            catch (ServiceException ex)
            {
                throw ex;
            }
        }
        public async Task<bool> DeleteMails(Provider provider, string folder, List<string> mailIds)
        {
            try
            {
                GraphServiceClient graphClient = SDKHelper.GetMicrosoftAuthenticatedClient(provider.AccessToken);
                bool response = false;

                switch (folder.ToLower())
                {
                    case ProviderFolder.deleted_items:
                        response = await CleanDeletedItems(graphClient, mailIds);
                        break;
                    case ProviderFolder.drafts:
                        response = await DeleteDraftMessages(graphClient, mailIds);
                        break;
                    case ProviderFolder.inbox:
                        response = await DeleteInboxMessages(graphClient, mailIds);
                        break;
                    case ProviderFolder.sent_items:
                        response = await DeleteSentItems(graphClient, mailIds);
                        break;
                    default:
                        break;
                }
                return await Task.FromResult(response);
            }
            catch (ServiceException ex)
            {
                throw ex;
            }
        }
        public async Task<byte[]> GetMailBytes(Provider provider, MailBoxWrapper email)
        {
            try
            {
                //GraphServiceClient graphClient = SDKHelper.GetMicrosoftAuthenticatedClient(provider.AccessToken);
                //var msg = await graphClient.Me.Messages[email.Id].Copy(@"H:\test\test.msg").Request().PostAsync();

                string url = $"https://graph.microsoft.com/beta/me/messages/{email.Id}/$value";

                using (var response = await SDKHelper.SendRequest(HttpMethod.Get, url, provider.AccessToken))
                {
                    var result = await response.Content.ReadAsStreamAsync();
                    var message = MimeMessage.Load(result);
                    string ra = StringConverter.Base64UrlEncode(message.ToString());
                    var bytes = StringConverter.FromBase64ForUrlString(ra);
                    //System.IO.File.WriteAllBytes(@"H:\test\test.eml", bytes);
                    return bytes;
                }

                //MailMessage mailMessage = new MailMessage();
                //if (!string.IsNullOrEmpty(email.From))
                //{
                //    mailMessage.From = new MailAddress(email.From);
                //}
                //foreach (string item in email.Tos)
                //{
                //    mailMessage.To.Add(new MailAddress(item));
                //}
                //if (email.CCs != null && email.CCs.Count > 0)
                //{
                //    foreach (string item in email.CCs)
                //    {
                //        mailMessage.CC.Add(new MailAddress(item));
                //    }
                //}
                //if (email.BCCs != null && email.BCCs.Count > 0)
                //{
                //    foreach (string item in email.BCCs)
                //    {
                //        mailMessage.Bcc.Add(new MailAddress(item));
                //    }
                //}
                //mailMessage.Subject = email.Subject ?? "";
                //mailMessage.Body = email.Body;
                //mailMessage.IsBodyHtml = true;
                //if (email.Attachments.Count > 0)
                //{                    
                //    //var attachments = await GetAttachments(provider, email.Id);
                //    //for (int i = 0; i < attachments.Count; i++)
                //    //{
                //    //    var stream = new MemoryStream(attachments[i].ContentBytes);
                //    //    //using (var stream = new MemoryStream(attachments[i].ContentBytes))
                //    //    //{
                //    //        mailMessage.Attachments.Add(new System.Net.Mail.Attachment(stream, attachments[i].Name));
                //    //    //}
                //    //}
                //    //foreach (var item in attachments)
                //    //{
                //    //    byte[] content = StringConverter.FromBase64ForUrlString(item);
                //    //    using (var stream = new MemoryStream(content))
                //    //    {
                //    //        mailMessage.Attachments.Add(new System.Net.Mail.Attachment(stream, item.Name));
                //    //    }
                //    //}
                //}
                //MimeMessage mimeMessage = MimeMessage.CreateFromMailMessage(mailMessage);
                //string raw = StringConverter.Base64UrlEncode(mimeMessage.ToString());
                //
                //var buffer = StringConverter.FromBase64ForUrlString(raw);
                //return buffer;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        

        #region private method
        private async Task<Message> BuildEmailMessage(GraphServiceClient graphClient, MailWrapper mail)
        {
            try
            {
                List<Recipient> toRecipientList = new List<Recipient>();
                await MakeRecipients(mail.Tos, toRecipientList);
                Message email = new Message
                {
                    Body = new ItemBody
                    {
                        Content = mail.Body,
                        ContentType = BodyType.Html
                    },
                    Subject = mail.Subject,
                    ToRecipients = toRecipientList,
                };
                if (mail.Ccs != null)
                {
                    List<Recipient> ccRecipientList = new List<Recipient>();
                    await MakeRecipients(mail.Ccs, ccRecipientList);
                    email.CcRecipients = ccRecipientList;
                }
                if (mail.Bccs != null)
                {
                    List<Recipient> bccRecipientList = new List<Recipient>();
                    await MakeRecipients(mail.Bccs, bccRecipientList);
                    email.BccRecipients = bccRecipientList;
                }
                if (mail.Attachments.Count > 0)
                {
                    await UploadAttachments(graphClient, email, mail.Attachments);
                    Thread.Sleep(100);
                }
                return await Task.FromResult(email);
            }
            catch (ServiceException ex)
            {
                throw ex;
            }
        }
        private async Task<DriveItem> UploadFileToOneDrive(GraphServiceClient graphClient, string fileName, byte[] file)
        {
            try
            {
                DriveItem uploadItem = null;
                using (MemoryStream fileStream = new MemoryStream(file))
                {
                    uploadItem = await graphClient.Me.Drive.Root.ItemWithPath(fileName).Content.Request().PutAsync<DriveItem>(fileStream);
                }
                return uploadItem;
            }
            catch(ServiceException ex)
            {
                throw ex;
            }
        }
        private async Task UploadAttachments(GraphServiceClient graphClient, Message message, List<MailAttachment> attachments)
        {
            try
            {
                byte[] buffer = null;
                string contentType = "";
                string extension = "";
                //DriveItem uploadItem = null;
                MessageAttachmentsCollectionPage uplodAttachments = new MessageAttachmentsCollectionPage();
                foreach (var attachment in attachments)
                {
                    extension = Path.GetExtension(attachment.Name);
                    contentType = Extensions.ContentType(extension);
                    buffer = Convert.FromBase64String(attachment.Base64Content);
                    //uploadItem = await UploadFileToOneDrive(graphClient, attachment.Name, buffer);
                    uplodAttachments.Add(new FileAttachment
                    {
                        ODataType = "#microsoft.graph.fileAttachment",
                        ContentBytes = buffer,
                        ContentType = contentType,
                        Name = attachment.Name
                    });
                }
                message.Attachments = uplodAttachments;
            }
            catch (ServiceException ex)
            {
                throw ex;
            }
        }
        private async Task<Permission> GetSharingLinkAsync(GraphServiceClient graphClient, string Id)
        {
            Permission permission = null;

            try
            {
                permission = await graphClient.Me.Drive.Items[Id].CreateLink("view").Request().PostAsync();
            }

            catch (ServiceException)
            {
                return null;
            }

            return permission;
        }
        private async Task MakeRecipients(List<string> mailList, List<Recipient> recipientList)
        {
            foreach (string recipient in mailList)
            {
                recipientList.Add(new Recipient
                {
                    EmailAddress = new EmailAddress
                    {
                        Address = recipient.Trim()
                    }
                });
            }
        }
        private async Task<bool> DeleteSentItems(GraphServiceClient graphClient, List<string> mailIds)
        {
            try
            {
                foreach (string mailId in mailIds)
                {
                    await graphClient.Me.MailFolders.SentItems.Messages[mailId].Request().DeleteAsync();
                }
                return true;
            }
            catch (ServiceException ex)
            {
                throw ex;
            }
        }
        private async Task<bool> DeleteInboxMessages(GraphServiceClient graphClient, List<string> mailIds)
        {
            try
            {
                foreach (string mailId in mailIds)
                {
                    await graphClient.Me.MailFolders.Inbox.Messages[mailId].Request().DeleteAsync();
                }
                return true;
            }
            catch (ServiceException ex)
            {
                throw ex;
            }
        }
        private async Task<bool> DeleteDraftMessages(GraphServiceClient graphClient, List<string> mailIds)
        {
            try
            {
                foreach (string mailId in mailIds)
                {
                    await graphClient.Me.MailFolders.Drafts.Messages[mailId].Request().DeleteAsync();
                }
                return true;
            }
            catch (ServiceException ex)
            {
                throw ex;
            }
        }
        private async Task<bool> CleanDeletedItems(GraphServiceClient graphClient, List<string> mailIds)
        {
            try
            {
                foreach (string mailId in mailIds)
                {
                    await graphClient.Me.MailFolders.DeletedItems.Messages[mailId].Request().DeleteAsync();
                }
                return true;
            }
            catch (ServiceException ex)
            {
                throw ex;
            }
        }
        private async Task<dynamic> GetInboxAttachment(GraphServiceClient graphClient, string mailId, string attachmentId)
        {
            try
            {
                var response = await graphClient.Me.MailFolders.Inbox.Messages[mailId].Attachments[attachmentId].Request()
                                                    .GetAsync();
                
                return await Task.FromResult(response);
            }
            catch (ServiceException ex)
            {
                throw ex;
            }
        }
        private async Task<dynamic> GetSentItemAttachment(GraphServiceClient graphClient, string mailId, string attachmentId)
        {
            try
            {
                var response = await graphClient.Me.MailFolders.SentItems.Messages[mailId].Attachments[attachmentId].Request()
                                                    .GetAsync();
                return await Task.FromResult(response);
            }
            catch (ServiceException ex)
            {
                throw ex;
            }
        }
        
        private async Task<Message> UpdateMessage(string mailId, object message, string token)
        {
            try
            {
                string url = $"https://graph.microsoft.com/beta/me/messages/{mailId}";
                var method = new HttpMethod("PATCH");

                using (var response = await SDKHelper.SendRequest(method, url, token, message))
                {
                    var result = await response.Content.ReadAsStringAsync();
                    var obj = JsonConvert.DeserializeObject<Message>(result);
                    return await Task.FromResult(obj);
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        #endregion
    }
}
