using Google.Apis.Gmail.v1;
using Google.Apis.Util;
using Hoxro.Data.Models;
using Hoxro.Entity.ViewModels;
using Microsoft.Graph;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Mail;
using System.Threading.Tasks;
using Task = System.Threading.Tasks.Task;
using Attachment = Microsoft.Graph.Attachment;
using Message = Microsoft.Graph.Message;
using Google.Apis.Gmail.v1.Data;
using MimeKit;
using Hoxro.Utiltiy.Converter;
using System.IO;
using System.Text;

namespace Hoxro.Service.userDefinedService.provider
{
    public class GmailGraphService:IMailGraphService
    {
        readonly string[] _readMessage = new string[] { "READ" };
        readonly string[] _unreadMessage = new string[] { "UNREAD" };
        readonly string[] _starred = new string[] { "STARRED" };
        readonly string[] _important = new string[] { "IMPORTANT" };
        readonly IProviderHelper _providerHelper;
        public GmailGraphService(IProviderHelper providerHelper)
        {
            _providerHelper = providerHelper;
        }

        public async Task<dynamic> CreateForward(Provider provider, string mailId)
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

        public async Task<dynamic> CreateReply(Provider provider, string mailId)
        {
            try
            {
                return null;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<dynamic> CreateReplyAll(Provider provider, string mailId)
        {
            try
            {
                return null;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<bool> DeleteMails(Provider provider, string folder, List<string> mailIds)
        {
            try
            {
                bool isDeleted = false;
                var service = SDKHelper.GetGmailService(provider.RefreshToken, _providerHelper.GoogleClientId, _providerHelper.GoogleClientSecretCode, _providerHelper.GoogleProjectName);
                foreach (string mailId in mailIds)
                {
                    var response = service.Users.Messages.Delete("me", mailId).Execute();
                }
                isDeleted = true;
                return await Task.FromResult(isDeleted);
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        public async Task<dynamic> GetAttachment(Provider provider, string folder, string mailId, string attachmentId)
        {
            try
            {
                var service = SDKHelper.GetGmailService(provider.RefreshToken, _providerHelper.GoogleClientId, _providerHelper.GoogleClientSecretCode, _providerHelper.GoogleProjectName);

                var response = service.Users.Messages.Attachments.Get("me", mailId, attachmentId).Execute();

                string attachData = response.Data.Replace('-', '+').Replace('_', '/');
                byte[] data = Convert.FromBase64String(attachData);
                return new { ContentBytes = data };
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        public async Task<ProviderResponse> GetAuthorizationInfo(string code)
        {
            try
            {
                var content = new Dictionary<string, string>
                {
                    { "code", code },
                    { "client_id", _providerHelper.GoogleClientId },
                    { "client_secret", _providerHelper.GoogleClientSecretCode },
                    { "redirect_uri", _providerHelper.RedirectUri },
                    { "grant_type", "authorization_code" }
                };
                using (var response = await SDKHelper.SendUrlEncodingRequest(HttpMethod.Post, _providerHelper.GoogleTokenUri, content))
                {
                    var reader = await response.Content.ReadAsStringAsync();
                    var result = JsonConvert.DeserializeObject<ProviderResponse>(reader);
                    return result;
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        public async Task<TokenResolver> GetEmailAddress(string accessToken)
        {
            try
            {
                using (var response = await SDKHelper.SendRequest(HttpMethod.Get, $"https://www.googleapis.com/oauth2/v1/tokeninfo?access_token={accessToken}", accessToken))
                {
                    var reader = await response.Content.ReadAsStringAsync();
                    var result = JsonConvert.DeserializeObject<TokenResolver>(reader);
                    if (string.IsNullOrEmpty(result.email))
                    {
                        using(var proRes = await SDKHelper.SendRequest($"https://www.googleapis.com/gmail/v1/users/me/profile?access_token={accessToken}", HttpMethod.Get))
                        {
                            var profReader = await proRes.Content.ReadAsStringAsync();
                            var profResult = JsonConvert.DeserializeObject<ProfileResolver>(profReader);
                            result.email = profResult.EmailAddress;
                        }
                    }
                    return result;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<dynamic> GetFolderMessages(Provider provider, string foldername, string page, int pageSize)
        {
            try
            {
                var service = SDKHelper.GetGmailService(provider.RefreshToken, _providerHelper.GoogleClientId, _providerHelper.GoogleClientSecretCode, _providerHelper.GoogleProjectName);
                var messages = new List<Google.Apis.Gmail.v1.Data.Message>();
                var listRequest = service.Users.Messages.List("me");
                listRequest.LabelIds = foldername.ToUpper();
                listRequest.MaxResults = pageSize;
                if (!string.IsNullOrEmpty(page) && page != "0")
                {
                    listRequest.PageToken = page;
                }
                var emailMessages = new DisplayMessage();
                var listMessagesResponse = listRequest.Execute();
                messages.AddRange(listMessagesResponse.Messages);
                for (int i = 0; i < messages.Count; i++)
                {
                    var message = messages[i];
                    var res = await GetMessage(service, message.Id);
                    emailMessages.Add(res);
                }
                var firstMail = await GetMessageById(service, emailMessages[0].Id);
                emailMessages.NextPageToken = listMessagesResponse.NextPageToken;
                return await Task.FromResult(new { messages = emailMessages, firstMail = firstMail });
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<dynamic> GetFoldersWithInbox(Provider provider)
        {
            try
            {
                var service = SDKHelper.GetGmailService(provider.RefreshToken, _providerHelper.GoogleClientId, _providerHelper.GoogleClientSecretCode, _providerHelper.GoogleProjectName);
                var messages = new List<Google.Apis.Gmail.v1.Data.Message>();
                var labelResponse = service.Users.Labels.List("me").Execute();
                List<MailFolder> folders = new List<MailFolder>();
                for (int i = 0; i < labelResponse.Labels.Count; i++)
                {
                    MailFolder mailFolder = new MailFolder();
                    var label = service.Users.Labels.Get("me", labelResponse.Labels[i].Id).Execute();
                    mailFolder.Id = label.Id;
                    mailFolder.DisplayName = label.Name;
                    mailFolder.UnreadItemCount = Convert.ToInt32(label.MessagesUnread);
                    mailFolder.TotalItemCount = Convert.ToInt32(label.MessagesTotal);
                    folders.Add(mailFolder);
                }
                var inbox = await GetInbox(service);
                var firstMail = await GetMessageById(service, inbox[0].Id);
                return await Task.FromResult(new { folders = folders, messages = inbox, firstMail = firstMail });
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        public async Task<dynamic> GetInbox(Provider provider, string skip, int top)
        {
            try
            {
                var service = SDKHelper.GetGmailService(provider.RefreshToken, _providerHelper.GoogleClientId, _providerHelper.GoogleClientSecretCode, _providerHelper.GoogleProjectName);
                var messages = new List<Google.Apis.Gmail.v1.Data.Message>();
                var listRequest = service.Users.Messages.List("me");
                listRequest.LabelIds = "INBOX";
                listRequest.MaxResults = top;
                if(!string.IsNullOrEmpty(skip) && skip != "0")
                {
                    listRequest.PageToken = skip;
                }                
                var emailMessages = new DisplayMessage();
                var listMessagesResponse = listRequest.Execute();
                messages.AddRange(listMessagesResponse.Messages);
                for (int i = 0; i < messages.Count; i++)
                {
                    var message = messages[i];
                    var res = await GetMessage(service, message.Id);
                    emailMessages.Add(res);
                }
                emailMessages.NextPageToken = listMessagesResponse.NextPageToken;
                var firstMail = await GetMessageById(service, emailMessages[0].Id);
                return await Task.FromResult(new { messages = emailMessages, firstMail = firstMail });
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        public async Task<dynamic> GetInboxMessage(Provider provider, string mailId)
        {
            try
            {
                var service = SDKHelper.GetGmailService(provider.RefreshToken, _providerHelper.GoogleClientId, _providerHelper.GoogleClientSecretCode, _providerHelper.GoogleProjectName);
                var response = await GetMessage(service, mailId);
                return await Task.FromResult(response);
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        public async Task<dynamic> GetMessageById(Provider provider, string folder, string mailId)
        {
            try
            {
                bool isUnread = false;
                var service = SDKHelper.GetGmailService(provider.RefreshToken, _providerHelper.GoogleClientId, _providerHelper.GoogleClientSecretCode, _providerHelper.GoogleProjectName);
                var request = service.Users.Messages.Get("me", mailId);
                request.Format = UsersResource.MessagesResource.GetRequest.FormatEnum.Raw;
                
                var message = new Message();
                var response = request.Execute();
                var content = StringConverter.FromBase64ForUrlString(response.Raw);

                using (var reader = new MemoryStream(content))
                {
                    MimeMessage mime = MimeMessage.Load(reader);
                    message.From = SDKHelper.GetRecipient(mime.From.ToString());
                    message.Subject = mime.Subject;
                    message.ReceivedDateTime = mime.Date;
                    message.SentDateTime = mime.Date;
                    message.Body = new ItemBody { Content = mime.HtmlBody };
                    message.ToRecipients = SDKHelper.GetRecipients(string.Join(",", mime.To));
                    message.CcRecipients = SDKHelper.GetRecipients(string.Join(",", mime.Cc));
                    message.BccRecipients = SDKHelper.GetRecipients(string.Join(",", mime.Bcc));
                    if (mime.Attachments != null)
                    {
                        var attachments = mime.Attachments.ToList();
                        for (int i = 0; i < attachments.Count; i++)
                        {
                            message.HasAttachments = true;
                            Attachment attachment = new MessageAttachment();
                            attachment.ContentType = attachments[i].ContentType.MimeType;
                            attachment.Name = attachments[i].ContentDisposition.FileName;
                            attachment.Id = attachments[i].ContentId;
                            message.Attachments.Add(attachment);
                        }
                    }
                }

                await ModifyLebel(service, mailId, null, _unreadMessage);
                
                return await Task.FromResult(new { message = message });

            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        public async Task<ProviderResponse> GetRefreshToken(string refreshToken)
        {
            try
            {
                var content = new Dictionary<string, string>
                {
                    { "client_id", _providerHelper.GoogleClientId },
                    { "refresh_token", refreshToken},
                    { "client_secret", _providerHelper.GoogleClientSecretCode },
                    { "grant_type", "refresh_token" }
                };
                using (var response = await SDKHelper.SendUrlEncodingRequest(HttpMethod.Post, "https://www.googleapis.com/oauth2/v4/token", content))
                {
                    var reader = await response.Content.ReadAsStringAsync();
                    var result = JsonConvert.DeserializeObject<ProviderResponse>(reader);
                    return result;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<dynamic> GetSentItemMessages(Provider provider, string skip, int top)
        {
            try
            {
                var service = SDKHelper.GetGmailService(provider.RefreshToken, _providerHelper.GoogleClientId, _providerHelper.GoogleClientSecretCode, _providerHelper.GoogleProjectName);
                var messages = new List<Google.Apis.Gmail.v1.Data.Message>();
                var listRequest = service.Users.Messages.List("me");
                listRequest.LabelIds = "SENT";
                listRequest.MaxResults = top;
                if (!string.IsNullOrEmpty(skip) && skip != "0")
                {
                    listRequest.PageToken = skip;
                }
                var emailMessages = new DisplayMessage();
                var listMessagesResponse = listRequest.Execute();
                messages.AddRange(listMessagesResponse.Messages);
                for (int i = 0; i < messages.Count; i++)
                {
                    var message = messages[i];
                    var res = await GetMessage(service, message.Id);
                    emailMessages.Add(res);
                }
                emailMessages.NextPageToken = listMessagesResponse.NextPageToken;
                return emailMessages;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<string> PinUnpinMessage(Provider provider, string mailId, bool isPinned)
        {
            string output = "normal";
            try
            {
                string[] adds = new string[] { };
                string[] removes = new string[] { };
                if (isPinned)
                {
                    adds = _important;
                }
                else
                {
                    removes = _important;
                }
                var service = SDKHelper.GetGmailService(provider.RefreshToken, _providerHelper.GoogleClientId, _providerHelper.GoogleClientSecretCode, _providerHelper.GoogleProjectName);
                await ModifyLebel(service, mailId, adds, removes);
                if (isPinned)
                {
                    output = "high";
                }
            }
            catch(Exception ex)
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
                string[] adds = new string[] { };
                string[] removes = new string[] { };
                if (isFlag)
                {
                    adds = _starred;
                }
                else
                {
                    removes = _starred;
                }
                var service = SDKHelper.GetGmailService(provider.RefreshToken, _providerHelper.GoogleClientId, _providerHelper.GoogleClientSecretCode, _providerHelper.GoogleProjectName);
                await ModifyLebel(service, mailId, adds, removes);
                if (isFlag)
                {
                    output = "flagged";
                }
            }
            catch (Exception ex)
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
                string[] adds = new string[] { };
                string[] removes = new string[] { };
                if (!isRead)
                {
                    adds = _unreadMessage;
                }
                else
                {
                    removes = _unreadMessage;
                }
                var service = SDKHelper.GetGmailService(provider.RefreshToken, _providerHelper.GoogleClientId, _providerHelper.GoogleClientSecretCode, _providerHelper.GoogleProjectName);
                await ModifyLebel(service, mailId, adds, removes);
                if (isRead)
                {
                    output = true;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return await Task.FromResult(output);
        }
        public async Task<dynamic> SendMail(Provider provider, MailWrapper mail)
        {
            try
            {
                var service = SDKHelper.GetGmailService(provider.RefreshToken, _providerHelper.GoogleClientId, _providerHelper.GoogleClientSecretCode, _providerHelper.GoogleProjectName);
                var message = new Google.Apis.Gmail.v1.Data.Message();
                if(mail.MailType == MailType.Sent)
                {
                    var mimeMessage = await BuildMimeMessage(provider.Email, mail);
                    message.Raw = StringConverter.Base64UrlEncode(mimeMessage.ToString());
                }
                else
                {
                    var mimeMessage = await BuildMimeMessage(service, mail);
                    message.Raw = StringConverter.Base64UrlEncode(mimeMessage.ToString());
                }                
                var response = service.Users.Messages.Send(message, "me").Execute();
                var readMessage = await GetMessageById(service, response.Id);
                return await Task.FromResult(readMessage);
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }


        public async Task<byte[]> GetMailBytes(Provider provider, MailBoxWrapper email)
        {
            try
            {
                var service = SDKHelper.GetGmailService(provider.RefreshToken, _providerHelper.GoogleClientId, _providerHelper.GoogleClientSecretCode, _providerHelper.GoogleProjectName);
                var request = service.Users.Messages.Get("me", email.Id);
                request.Format = UsersResource.MessagesResource.GetRequest.FormatEnum.Raw;
                var response = request.Execute();
                var contents = StringConverter.FromBase64ForUrlString(response.Raw);
                return await Task.FromResult(contents);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        
        #region Private
        private async Task ModifyLebel(GmailService service, string mailId, string[] toAdd, string [] toRemove)
        {
            try
            {
                ModifyMessageRequest body = new ModifyMessageRequest();

                if(toAdd != null)
                {
                    body.AddLabelIds = toAdd;
                }
                if(toRemove != null)
                {
                    body.RemoveLabelIds = toRemove;
                }
                var request = service.Users.Messages.Modify(body, "me", mailId);
                var response = request.Execute();
            }
            catch (Exception ex)
            {
                await Task.CompletedTask;
            }
        }
        private async Task<Message> GetMessage(GmailService service, string mailId)
        {
            try
            {
                var message = new Message();
                var request = service.Users.Messages.Get("me", mailId);
                request.Format = UsersResource.MessagesResource.GetRequest.FormatEnum.Metadata;
                request.MetadataHeaders = new Repeatable<string>(new[] { "Subject", "Date", "From" });
                var response = request.Execute();                
                if (response.LabelIds.Contains(_unreadMessage[0]))
                {
                    message.IsRead = false;
                }
                else
                {
                    message.IsRead = true;
                }
                if (response.LabelIds.Contains(_important[0]))
                {
                    message.Importance = Importance.High;
                }
                else 
                {
                    message.Importance = Importance.Normal;
                }
                if (response.LabelIds.Contains(_starred[0]))
                {
                    message.Flag = new FollowupFlag { FlagStatus = FollowupFlagStatus.Flagged };
                }
                else
                {
                    message.Flag = new FollowupFlag { FlagStatus = FollowupFlagStatus.NotFlagged };
                }
                message.Id = response.Id;
                message.Body = new ItemBody { Content = WebUtility.HtmlDecode(response.Snippet) };
                message.From = SDKHelper.GetRecipient(response.Payload.Headers.FirstOrDefault(x=> x.Name == "From")?.Value);
                message.Subject = response.Payload.Headers.FirstOrDefault(x => x.Name == "Subject")?.Value;
                message.ReceivedDateTime = DateTimeConverter.GetUnixDate(Convert.ToInt64(response.InternalDate));

                return await Task.FromResult(message);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        private async Task<Message> GetMessageById(GmailService service,  string mailId)
        {
            try
            {
                bool isUnread = false;
                var request = service.Users.Messages.Get("me", mailId);
                request.Format = UsersResource.MessagesResource.GetRequest.FormatEnum.Raw;
                var message = new Message();
                var response = request.Execute();
                
                //var parts = response.Payload.Parts;
                //string s = "";
                //foreach (var part in parts)
                //{
                //    byte[] data = StringConverter.FromBase64ForUrlString(part.Body.Data);
                //    s += Encoding.UTF8.GetString(data);
                //}
                //byte[] bytes;
                ////using (var memoryStream = new MemoryStream())
                ////{
                ////    response.CopyTo(memoryStream);
                ////    bytes = memoryStream.ToArray();
                ////}
                //string base64 = Convert.ToBase64String(new byte[0]);
                var content = StringConverter.FromBase64ForUrlString(response.Raw);
                using (var reader = new MemoryStream(content))
                {
                    //response.CopyTo(reader);
                    MimeMessage mime = MimeMessage.Load(reader);
                    message.From = SDKHelper.GetRecipient(mime.From.ToString());
                    message.Subject = mime.Subject;
                    message.ReceivedDateTime = mime.Date;
                    message.SentDateTime = mime.Date;
                    message.Body = new ItemBody { Content = mime.HtmlBody };
                    message.ToRecipients = SDKHelper.GetRecipients(string.Join(",", mime.To));
                    message.CcRecipients = SDKHelper.GetRecipients(string.Join(",", mime.Cc));
                    message.BccRecipients = SDKHelper.GetRecipients(string.Join(",", mime.Bcc));
                    if(mime.Attachments != null)
                    {
                        var attachments = mime.Attachments.ToList();
                        for (int i = 0; i < attachments.Count; i++)
                        {
                            message.HasAttachments = true;
                            Attachment attachment = new MessageAttachment();
                            attachment.ContentType = attachments[i].ContentType.MimeType;
                            attachment.Name = attachments[i].ContentDisposition.FileName;
                            attachment.Id = attachments[i].ContentId;
                            message.Attachments.Add(attachment);
                        }
                    }
                }
                await ModifyLebel(service, mailId, null, new[] { "UNREAD" });
                return await Task.FromResult(message);
            }
            catch (Exception ex)
            {
                return new Message();
            }
        }
        private async Task<dynamic> GetInbox(GmailService service)
        {
            try
            {               
                var messages = new List<Google.Apis.Gmail.v1.Data.Message>();
                var listRequest = service.Users.Messages.List("me");
                listRequest.LabelIds = "INBOX";
                listRequest.MaxResults = 20;
                var emailMessages = new DisplayMessage();
                var listMessagesResponse = listRequest.Execute();
                messages.AddRange(listMessagesResponse.Messages);
                for (int i = 0; i < messages.Count; i++)
                {
                    var message = messages[i];
                    var res = await GetMessage(service, message.Id);
                    emailMessages.Add(res);
                }
                //dynamic response = emailMessages;
                emailMessages.NextPageToken = listMessagesResponse.NextPageToken;
                return emailMessages;
            }
            catch (ServiceException ex)
            {
                throw ex;
            }
        }
        private async Task<MimeMessage> BuildMimeMessage(GmailService service, MailWrapper wrapper)
        {
            try
            {
                MimeMessage mimeMessage = null;
                if (wrapper.MailType != MailType.Sent && !string.IsNullOrEmpty(wrapper.MailId))
                {
                    var getRequest = service.Users.Messages.Get("me", wrapper.MailId);
                    getRequest.Format = UsersResource.MessagesResource.GetRequest.FormatEnum.Raw;
                    getRequest.MetadataHeaders = new Repeatable<string>(new[] { "Subject", "Message-ID", "From", "References", "To", "Cc", "Bcc", "Body" });
                    var response = getRequest.Execute();
                    byte[] readContent = StringConverter.FromBase64ForUrlString(response.Raw);
                    using(var stream = new MemoryStream(readContent))
                    {
                        MimeMessage existingMessage = MimeMessage.Load(stream);
                        if(wrapper.MailType != MailType.Forward)
                        {
                            MailMessage message = new MailMessage();
                            message.Body = wrapper.Body;
                            if (wrapper.Attachments.Count > 0)
                            {
                                foreach (var item in wrapper.Attachments)
                                {
                                    byte[] content = StringConverter.FromBase64ForUrlString(item.Base64Content);
                                    using (var atSteam = new MemoryStream(content))
                                    {
                                        message.Attachments.Add(new System.Net.Mail.Attachment(atSteam, item.Name));
                                    }
                                }
                            }
                            message.To.Add(existingMessage.From.ToString());
                            if (wrapper.MailType == MailType.ReplyAll && (existingMessage.Cc != null || existingMessage.Bcc != null))
                            {
                                if(existingMessage.Cc != null)
                                {
                                    message.CC.Add(existingMessage.Cc.ToString());
                                }
                                if(existingMessage.Bcc != null)
                                {
                                    message.Bcc.Add(existingMessage.Bcc.ToString());
                                }
                            }
                            mimeMessage = MimeMessage.CreateFromMailMessage(message);
                            mimeMessage.References.Add(existingMessage.MessageId);
                            if (existingMessage.References.Count > 0)
                            {
                                foreach (var item in mimeMessage.References)
                                {
                                    mimeMessage.References.Add(item);
                                }
                            }
                        }
                        else
                        {
                            foreach (string item in wrapper.Tos)
                            {
                                existingMessage.To.Add(InternetAddress.Parse(item));
                            }
                            mimeMessage = existingMessage;
                        }
                        
                    }
                }
                return await Task.FromResult(mimeMessage);
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
        private async Task<MimeMessage> BuildMimeMessage(string from, MailWrapper wrapper)
        {
            try
            {
                MailMessage mailMessage = new MailMessage();
                if (!string.IsNullOrEmpty(from))
                {
                    mailMessage.From = new MailAddress(from);
                }
                foreach (string item in wrapper.Tos)
                {
                    mailMessage.To.Add(new MailAddress(item));
                }
                if(wrapper.Ccs != null && wrapper.Ccs.Count > 0)
                {
                    foreach (string item in wrapper.Ccs)
                    {
                        mailMessage.CC.Add(new MailAddress(item));
                    }
                }
                if(wrapper.Bccs != null && wrapper.Bccs.Count > 0)
                {
                    foreach (string item in wrapper.Bccs)
                    {
                        mailMessage.Bcc.Add(new MailAddress(item));
                    }
                }
                mailMessage.Subject = wrapper.Subject ?? "";
                mailMessage.Body = wrapper.Body;
                mailMessage.IsBodyHtml = true;
                if(wrapper.Attachments.Count > 0)
                {
                    foreach (var item in wrapper.Attachments)
                    {
                        byte[] content = StringConverter.FromBase64ForUrlString(item.Base64Content);
                        using (var stream = new MemoryStream(content))
                        {
                            mailMessage.Attachments.Add(new System.Net.Mail.Attachment(stream, item.Name));
                        }
                    }
                }
                MimeMessage mimeMessage = MimeMessage.CreateFromMailMessage(mailMessage);
                return await Task.FromResult(mimeMessage);
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        #endregion
    }
    public class MailFolder
    {
        public string DisplayName { get; set; }
        public int UnreadItemCount { get; set; }
        public int TotalItemCount { get; set; }
        public string Id { get; set; }
    }
    public class MessageAttachment : Attachment
    {
        
    }
    public class DisplayMessage:List<Message>
    {
        public string NextPageToken { get; set; }
    }
}
