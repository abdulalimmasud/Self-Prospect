using Google.Apis.Auth.OAuth2;
using Google.Apis.Auth.OAuth2.Flows;
using Google.Apis.Auth.OAuth2.Responses;
using Google.Apis.Gmail.v1;
using Google.Apis.Services;
using Google.Apis.Calendar.v3;
using Hoxro.Utiltiy.StaticData;
using Microsoft.Graph;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.IO;
using MimeKit;

namespace Hoxro.Service.userDefinedService.provider
{
    public class SDKHelper
    {
        static string[] _calendarScopes = { CalendarService.Scope.CalendarReadonly, CalendarService.Scope.Calendar };
        static string[] _gmailScopes = { GmailService.Scope.GmailReadonly, GmailService.Scope.GmailLabels, GmailService.Scope.GmailModify, GmailService.Scope.GmailSend, GmailService.Scope.GmailCompose, GmailService.Scope.GmailInsert };
        public static Recipient GetRecipient(string value)
        {
            var recipient = new Recipient();
            if (!string.IsNullOrEmpty(value))
            {
                MailAddress address = new MailAddress(value);
                recipient.EmailAddress = new EmailAddress
                {
                    Name = address.User,
                    Address = address.Address
                };
            }
            return recipient;
        }
        public static List<Recipient> GetRecipients(string value)
        {
            List<Recipient> recipients = new List<Recipient>();
            if (!string.IsNullOrEmpty(value))
            {
                List<string> values = value.Split(',').ToList();
                foreach (var item in values)
                {
                    var recipient = new Recipient();
                    MailAddress address = new MailAddress(item);
                    recipient.EmailAddress = new EmailAddress
                    {
                        Name = address.User ?? "",
                        Address = address.Address
                    };
                    recipients.Add(recipient);
                }
                
            }
            return recipients;
        }
        public static CalendarService GoogleCalendarService(string refreshToken, string clientId, string clientSecret, string applicationName)
        {
            ClientSecrets secrets = new ClientSecrets();
            secrets.ClientId = clientId;
            secrets.ClientSecret = clientSecret;
            var flow = new GoogleAuthorizationCodeFlow(new GoogleAuthorizationCodeFlow.Initializer
            {
                ClientSecrets = secrets,
                Scopes = _calendarScopes
            });
            TokenResponse token = new TokenResponse();
            token.TokenType = "Bearer";
            token.ExpiresInSeconds = 3600;
            token.RefreshToken = refreshToken;
            UserCredential credential = new UserCredential(flow, "me", token);
            var service = new CalendarService(new BaseClientService.Initializer()
            {
                HttpClientInitializer = credential,
                ApplicationName = applicationName
            });
            return service;
        }
        public static GmailService GetGmailService(string refreshToken, string clientId, string clientSecret, string applicationName)
        {
            
            ClientSecrets secrets = new ClientSecrets();
            secrets.ClientId = clientId;
            secrets.ClientSecret = clientSecret;

            var flow = new GoogleAuthorizationCodeFlow(new GoogleAuthorizationCodeFlow.Initializer
            {
                ClientSecrets = secrets,
                Scopes = _gmailScopes
            });

            TokenResponse token = new TokenResponse();
            token.TokenType = "Bearer";
            token.ExpiresInSeconds = 3600;
            token.RefreshToken = refreshToken;

            UserCredential credential = new UserCredential(flow, "me", token);
            var service = new GmailService(new BaseClientService.Initializer()
            {
                HttpClientInitializer = credential,
                ApplicationName = applicationName
            });
            return service;
        }
        public static string EmlBytesToHtml(byte[] content)
        {
            using(var reader = new MemoryStream(content))
            {
                MimeMessage message = MimeMessage.Load(reader);
                return message.HtmlBody;
                //return message;
            }
        }
        public static GraphServiceClient GetMicrosoftAuthenticatedClient(string accessToken)
        {
            GraphServiceClient graphClient = new GraphServiceClient(new DelegateAuthenticationProvider(async (requestMessage) =>
            {
                requestMessage.Headers.Authorization = new AuthenticationHeaderValue("bearer", accessToken);
            }));
            return graphClient;
        }
        public static async Task<HttpResponseMessage> SendRequest(string endPoint, HttpMethod method = null, Dictionary<string, string> headers = null, dynamic content = null)
        {
            HttpResponseMessage response = null;
            using (var client = new HttpClient())
            {
                method = method ?? HttpMethod.Get;
                using (var request = new HttpRequestMessage(method, endPoint))
                {
                    request.Headers.Accept.Add(new MediaTypeWithQualityHeaderValue(MimeType.Application_Json));

                    if(headers != null)
                    {
                        foreach (var header in headers)
                        {
                            request.Headers.Add(header.Key, header.Value);
                        }
                    }
                    if (content != null)
                    {
                        string c;
                        if (content is string)
                            c = content;
                        else
                            c = JsonConvert.SerializeObject(content);
                        request.Content = new StringContent(c, Encoding.UTF8, MimeType.Application_Json);
                    }

                    response = await client.SendAsync(request);
                }
            }
            return response;

        }
        public static async Task<HttpResponseMessage> SendRequest(HttpMethod method, string endPoint, string accessToken, dynamic content = null)
        {
            HttpResponseMessage response = null;
            using (var client = new HttpClient())
            {
                using (var request = new HttpRequestMessage(method, endPoint))
                {
                    request.Headers.Accept.Add(new MediaTypeWithQualityHeaderValue(MimeType.Application_Json));
                    request.Headers.Authorization = new AuthenticationHeaderValue("Bearer", accessToken);
                    if (content != null)
                    {
                        string c;
                        if (content is string)
                            c = content;
                        else
                            c = JsonConvert.SerializeObject(content);
                        request.Content = new StringContent(c, Encoding.UTF8, MimeType.Application_Json);
                    }

                    response = await client.SendAsync(request).ConfigureAwait(false);
                }
            }
            return response;
        }
        public static async Task<HttpResponseMessage> SendUrlEncodingRequest(HttpMethod method, string endPoint, Dictionary<string, string> content = null)
        {
            HttpResponseMessage response = null;
            using(var client = new HttpClient())
            {
                using(var request = new HttpRequestMessage(method, endPoint))
                {
                    request.Headers.Accept.Add(new MediaTypeWithQualityHeaderValue(MimeType.Application_Json));
                    if(content != null)
                    {
                        request.Content = new FormUrlEncodedContent(content);
                    }
                    response = await client.SendAsync(request);
                }
            }
            return response;
        }
        public static async Task<HttpResponseMessage> SendUrlEncodingRequest(HttpMethod method, string endPoint, string accessToken, Dictionary<string, string> content = null)
        {
            HttpResponseMessage response = null;
            using (var client = new HttpClient())
            {
                using (var request = new HttpRequestMessage(method, endPoint))
                {
                    request.Headers.Accept.Add(new MediaTypeWithQualityHeaderValue(MimeType.Application_Json));
                    request.Headers.Authorization = new AuthenticationHeaderValue("bearer", accessToken);
                    if (content != null)
                    {
                        request.Content = new FormUrlEncodedContent(content);
                    }
                    response = await client.SendAsync(request);
                }
            }
            return response;
        }
        public static HttpWebRequest SendWebRequest(string endPoint, string method = "", string token = "", string content = null)
        {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(endPoint);
            request.Method = method == "" ? "GET" : method;
            if (!string.IsNullOrEmpty(token))
            {
                request.Headers.Add("Authorization", token);
            }
            if(request.Method != "GET")
            {
                request.ContentType = MimeType.Application_X_Www_Form_UrlEncoded;
            }
            else
            {
                request.ContentType = MimeType.Application_Json;
                request.ContentLength = 0;
            }
            if (!string.IsNullOrEmpty(content))
            {
                using (var stream = request.GetRequestStream())
                {
                    byte[] bytes = Encoding.Default.GetBytes(content);
                    stream.Write(bytes, 0, bytes.Length);
                }
            } 
            return request;
        }
    }
}
