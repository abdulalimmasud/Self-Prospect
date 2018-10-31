using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Text;

namespace Hoxro.Service.userDefinedService.provider
{
    public interface IProviderHelper
    {
        string RedirectUri { get; }
        string GoogleProjectName { get; }
        string GoogleLoginUri { get; }
        string GoogleGraphUri { get; }
        string GoogleScopes { get; }
        string GoogleTokenUri { get; }
        string GoogleRefreshUri { get; }
        string GoogleClientId { get; }
        string GoogleClientSecretCode { get; }
        string MicrosoftLoginUri { get; }
        string MicrosoftGraphUri { get; }
        string MicrosoftScopes { get; }
        string MicrosoftTokenUri { get; }
        string MicrosoftRefreshUri { get; }
        string MicrosoftClientId { get; }
        string MicrosoftClientSecretCode { get; }
    }
    public class ProviderHelper : IProviderHelper
    {
        public static IConfiguration configuration;
        public ProviderHelper()
        {
            
           
        }
        public string MicrosoftScopes
        {
            get
            {
                return configuration["microsoftScopes"];
            }
        }

        public string RedirectUri
        {
            get
            {
                return configuration["providerRedirectUri"];
            }
        }

        public string MicrosoftTokenUri
        {
            get
            {
                return "https://login.microsoftonline.com/common/oauth2/v2.0/token";
            }
        }

        public string MicrosoftClientId
        {
            get
            {
                return configuration["microsoftAppId"];
            }
        }
        public string MicrosoftClientSecretCode
        {
            get
            {
                return configuration["microsoftAppSecret"];
            }
        }
        

        public string MicrosoftRefreshUri
        {
            get
            {
                return "https://login.microsoftonline.com/common/oauth2/token";
            }
        }

        public string MicrosoftLoginUri
        {
            get
            {
                return string.Format("https://login.microsoftonline.com/common/oauth2/v2.0/authorize?response_type=code&client_id={0}&scope={1}&prompt=consent&redirect_uri={2}&state={3}", MicrosoftClientId,MicrosoftScopes.Replace(" ", "%20"), RedirectUri, DateTime.UtcNow);
            }
        }

        public string MicrosoftGraphUri
        {
            get
            {
                return "https://graph.microsoft.com/";
            }
        }

        public string GoogleLoginUri
        {
            get
            {
                return string.Format("https://accounts.google.com/o/oauth2/v2/auth?scope={0}&prompt=consent&access_type=offline&include_granted_scopes=true&state=google&redirect_uri={1}&response_type=code&client_id={2}", GoogleScopes.Replace(" ", "%20"), RedirectUri, GoogleClientId);
            }
        }

        public string GoogleGraphUri
        {
            get
            {
                return "https://apps-apis.google.com/";
            }
        }

        public string GoogleScopes
        {
            get
            {
                return configuration["googleScopes"];
            }
        }

        public string GoogleTokenUri
        {
            get
            {
                return "https://accounts.google.com/o/oauth2/token";
            }
        }

        public string GoogleRefreshUri
        {
            get
            {
                return "https://www.googleapis.com/oauth2/v4/token";
            }
        }

        public string GoogleClientId
        {
            get
            {
                return configuration["googleAppId"];
            }
        }

        public string GoogleClientSecretCode
        {
            get
            {
                return configuration["googleAppSecret"];
            }
        }

        public string GoogleProjectName
        {
            get
            {
                return configuration["googleProjectName"];
            }
        }
    }
}
