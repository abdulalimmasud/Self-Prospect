using Hoxro.Data.Models;
using Hoxro.Entity.ViewModels;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Hoxro.Service.userDefinedService.provider
{
    public interface IMailGraphService
    {
        Task<string> PinUnpinMessage(Provider provider, string mailId, bool isPinned);
        Task<string> FlagUnflagMessage(Provider provider, string mailId, bool isFlag);
        Task<bool> ReadUnReadMessage(Provider provider, string mailId, bool isRead);
        Task<dynamic> GetMessageById(Provider provider, string folder, string mailId);
        Task<dynamic> GetFolderMessages(Provider provider, string foldername, string page, int pageSize);
        Task<dynamic> GetFoldersWithInbox(Provider provider);
        Task<dynamic> GetInbox(Provider provider, string skip, int top);
        Task<dynamic> GetInboxMessage(Provider provider, string mailId);
        Task<dynamic> GetAttachment(Provider provider, string folder, string mailId, string attachmentId);
        Task<TokenResolver> GetEmailAddress(string accessToken);
        Task<dynamic> SendMail(Provider provider, MailWrapper mail);
        Task<ProviderResponse> GetAuthorizationInfo(string code);
        Task<ProviderResponse> GetRefreshToken(string refreshToken);
        Task<dynamic> CreateReply(Provider provider, string mailId);
        Task<dynamic> CreateReplyAll(Provider provider, string mailId);
        Task<dynamic> CreateForward(Provider provider, string mailId);
        Task<bool> DeleteMails(Provider provider, string folder, List<string> mailIds);
        Task<byte[]> GetMailBytes(Provider provider, MailBoxWrapper email);
    }
}
