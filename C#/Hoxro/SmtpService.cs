using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;
using Microsoft.Exchange.WebServices.Data;

namespace Hoxro.Service.userDefinedService
{
    public interface ISmtpService
    {
        void SendMail(string username, string firstName, string lastName, string companyName, string token);

        void SendMailWhenLicenseConfirm(string firstName, string lastName, string email);

        void SendOtp(string otp);

        void SendMailToUser(string userName, string password, string createdUser, string firstName, string lastName,
            string compnayName, string token);
        void SendMail(string username, string password, string firstName, string lastName, string companyName, string token);
    }
    public class SmtpService : ISmtpService
    {
        private string _from;
        private string _to;
        private string _password;
        private string _serviceBase;
        private readonly IHostingEnvironment _environment;
        private readonly IConfiguration _configuration;
        public SmtpService(string to, IHostingEnvironment environment)
        {
            var builder = new ConfigurationBuilder()
                .SetBasePath(environment.ContentRootPath)
                .AddJsonFile(Utiltiy.MessageProvider.Email.SMTP_FORMAT, true, true);
            this._configuration = builder.Build();
            this._environment = environment;
            this._to = to;
            this._from = _configuration[Utiltiy.MessageProvider.Email.SMTP_EMAIL];
            this._password = _configuration[Utiltiy.MessageProvider.Email.SMTP_PASSWORD];
            this._serviceBase = _configuration[Utiltiy.MessageProvider.Email.SMTP_SERVICE_BASE];
        }

        private ExchangeService Connect(string url, string userName, string password)
        {
            ExchangeService service = new ExchangeService(ExchangeVersion.Exchange2007_SP1);
            service.Credentials = new WebCredentials(userName, password);
            service.Url = new Uri(url);
            return service;
        }

        public SmtpService()
        {

        }
        public void SendMail(string username, string firstName, string lastName, string companyName, string token)
        {
            var mailMessage = new MailMessage();
            mailMessage.To.Add(_to);
            mailMessage.From = new MailAddress(_from);
            mailMessage.Subject = Utiltiy.MessageProvider.Email.MAIL_SUBJECT + $@"{username}";

            var body = this.GetMailBody(mailMessage, username, firstName, lastName, companyName, token);
            if (string.IsNullOrEmpty(body)) return;
            var client = new SmtpClient(Utiltiy.MessageProvider.Email.SMTP_CLINT, Utiltiy.MessageProvider.Email.SMTP_PORT)
            {
                Credentials = new NetworkCredential(this._from, this._password),
                EnableSsl = true
            };
            mailMessage.BodyEncoding = System.Text.Encoding.UTF8;
            mailMessage.SubjectEncoding = System.Text.Encoding.UTF8;
            mailMessage.IsBodyHtml = true;
            client.Send(mailMessage);
        }
        public void SendMail(string username, string password, string firstName, string lastName, string companyName, string token)
        {
            var mailMessage = new MailMessage();
            mailMessage.To.Add(_to);
            mailMessage.From = new MailAddress(_from);
            mailMessage.Subject = Utiltiy.MessageProvider.Email.MAIL_SUBJECT + username;


            var body = this.GetMailBody(mailMessage, username, firstName, lastName, password, companyName, token);
            if (string.IsNullOrEmpty(body)) return;
            var client = new SmtpClient(Utiltiy.MessageProvider.Email.SMTP_CLINT, Utiltiy.MessageProvider.Email.SMTP_PORT)
            {
                Credentials = new NetworkCredential(this._from, this._password),
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network
            };
            mailMessage.IsBodyHtml = true;
            client.Send(mailMessage);
        }
        public void SendMailWhenLicenseConfirm(string firstName, string lastName, string email)
        {
            var mailMessage = new MailMessage();
            mailMessage.To.Add(email);
            mailMessage.From = new MailAddress(_from);
            mailMessage.Subject = Utiltiy.MessageProvider.Email.ACCEPTING_LICENSE;

            var body = this.GetMailBodyForLicense(mailMessage, firstName, lastName);
            if (string.IsNullOrEmpty(body)) return;
            var client = new SmtpClient(Utiltiy.MessageProvider.Email.SMTP_CLINT, Utiltiy.MessageProvider.Email.SMTP_PORT)
            {
                Credentials = new NetworkCredential(this._from, this._password),
                EnableSsl = true
            };
            mailMessage.IsBodyHtml = true;
            client.Send(mailMessage);
        }

        public void SendMail(string to, string subject, string body)
        {
            try
            {
                var client = new SmtpClient(Utiltiy.MessageProvider.Email.SMTP_CLINT, Utiltiy.MessageProvider.Email.SMTP_PORT)
                {
                    Credentials = new NetworkCredential(this._from, this._password),
                    EnableSsl = true
                };
                var mailMsg = new MailMessage(_from, to, subject, body);
                mailMsg.IsBodyHtml = true;
                client.Send(mailMsg);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        public void SendOtp(string otp)
        {
            var body = this.GetMailBody(otp);
            var client = new SmtpClient(Utiltiy.MessageProvider.Email.SMTP_CLINT, Utiltiy.MessageProvider.Email.SMTP_PORT)
            {
                Credentials = new NetworkCredential(this._from, this._password),
                EnableSsl = true
            };
            var mailMsg = new MailMessage(_from, _to, Utiltiy.MessageProvider.Email.UR_OTP, body);
            mailMsg.IsBodyHtml = true;
            client.Send(mailMsg);
        }

        public void SendMailToUser(string userName, string password, string createdUser, string firstName, string lastName, string compnayName, string token)
        {
            var mailMessage = new MailMessage();
            mailMessage.To.Add(_to);
            mailMessage.From = new MailAddress(_from);
            mailMessage.Subject = Utiltiy.MessageProvider.Email.MAIL_SUBJECT + userName;

            var body = this.GetMailBodyForUserRole(mailMessage, userName, password, createdUser, firstName, lastName, compnayName, token);
            if (string.IsNullOrEmpty(body)) return;
            var client = new SmtpClient(Hoxro.Utiltiy.MessageProvider.Email.SMTP_CLINT, Utiltiy.MessageProvider.Email.SMTP_PORT)
            {
                Credentials = new NetworkCredential(this._from, this._password),
                EnableSsl = true
            };
            mailMessage.IsBodyHtml = true;
            client.Send(mailMessage);
        }

        private string GetMailBody(MailMessage mailMessage, string username, string fistName, string lastName, string companyName, string token)
        {
            var serviceUrl = this._serviceBase + Utiltiy.MessageProvider.Email.ACTIVATE_URL + token + Hoxro.Utiltiy.MessageProvider.Email.URL_USERNAME + username;
            //var serviceBase = 'http://213.136.82.93:91/';

            var htmlBodyPath = _environment.ContentRootPath + Utiltiy.MessageProvider.Email.HTML_BODY_PART;
            var imgAttachment = _environment.ContentRootPath + Utiltiy.MessageProvider.Email.IMG_ATTACHMENT;

            if (htmlBodyPath == null || imgAttachment == null) return string.Empty;
            var htmlBody = File.ReadAllText(htmlBodyPath);
            var imgAttachmentLogo = new LinkedResource(imgAttachment);

            var body = htmlBody.Replace("{0}", imgAttachmentLogo.ContentId);
            body = body.Replace("{1}", serviceUrl);
            body = body.Replace(Utiltiy.MessageProvider.Email.BODY_FIRSTNAME, fistName);
            body = body.Replace(Utiltiy.MessageProvider.Email.BODY_LASTNAME, lastName);
            body = body.Replace(Utiltiy.MessageProvider.Email.BODY_USERNAME, username).Replace(Utiltiy.MessageProvider.Email.BODY_COMPANYNAME, companyName);
            var view = AlternateView.CreateAlternateViewFromString(body, System.Text.Encoding.UTF8, Utiltiy.MessageProvider.Email.ALT_VIEW_FORMAT);
            view.LinkedResources.Add(imgAttachmentLogo);
            mailMessage.AlternateViews.Add(view);
            return body;
        }
        private string GetMailBody(MailMessage mailMessage, string username, string fistName, string lastName, string password, string companyName, string token)
        {
            var serviceUrl = this._serviceBase + Hoxro.Utiltiy.MessageProvider.Email.ACTIVATE_URL + token + Hoxro.Utiltiy.MessageProvider.Email.URL_USERNAME + username;

            var htmlBodyPath = _environment.ContentRootPath + Hoxro.Utiltiy.MessageProvider.Email.HTML_BODY_PART_USER;
            var imgAttachment = _environment.ContentRootPath + Hoxro.Utiltiy.MessageProvider.Email.IMG_ATTACHMENT;

            if (htmlBodyPath == null || imgAttachment == null) return string.Empty;
            var htmlBody = File.ReadAllText(htmlBodyPath);
            var imgAttachmentLogo = new LinkedResource(imgAttachment);

            var body = htmlBody.Replace("{0}", imgAttachmentLogo.ContentId);
            body = body.Replace("{1}", serviceUrl);
            body = body.Replace(Hoxro.Utiltiy.MessageProvider.Email.BODY_FIRSTNAME, fistName);
            body = body.Replace(Hoxro.Utiltiy.MessageProvider.Email.BODY_LASTNAME, lastName);
            body = body.Replace(Hoxro.Utiltiy.MessageProvider.Email.BODY_PASSWORD, password);
            body = body.Replace(Hoxro.Utiltiy.MessageProvider.Email.BODY_USERNAME, username).Replace(Hoxro.Utiltiy.MessageProvider.Email.BODY_COMPANYNAME, companyName);
            var view = AlternateView.CreateAlternateViewFromString(body, null, Hoxro.Utiltiy.MessageProvider.Email.ALT_VIEW_FORMAT);
            view.LinkedResources.Add(imgAttachmentLogo);
            mailMessage.AlternateViews.Add(view);
            return body;
        }
        private string GetMailBodyForLicense(MailMessage mailMessage, string firstName, string lastName)
        {
            var htmlBodyPath = _environment.ContentRootPath + Hoxro.Utiltiy.MessageProvider.Email.HTML_BODY_PART;
            var imgAttachment = _environment.ContentRootPath + Hoxro.Utiltiy.MessageProvider.Email.IMG_ATTACHMENT;

            if (htmlBodyPath == null || imgAttachment == null) return string.Empty;
            var htmlBody = File.ReadAllText(htmlBodyPath);
            var imgAttachmentLogo = new LinkedResource(imgAttachment);

            var body = htmlBody.Replace("{0}", imgAttachmentLogo.ContentId);
            body = body.Replace(Hoxro.Utiltiy.MessageProvider.Email.BODY_FIRSTNAME, firstName);
            body = body.Replace(Hoxro.Utiltiy.MessageProvider.Email.BODY_LASTNAME, lastName);
            var view = AlternateView.CreateAlternateViewFromString(body, null, Hoxro.Utiltiy.MessageProvider.Email.ALT_VIEW_FORMAT);
            view.LinkedResources.Add(imgAttachmentLogo);
            mailMessage.AlternateViews.Add(view);
            return body;
        }

        private string GetMailBodyForUserRole(MailMessage mailMessage, string username, string password, string createdUser, string fistName, string lastName, string companyName, string token)
        {
            var serviceUrl = this._serviceBase + Hoxro.Utiltiy.MessageProvider.Email.ACTIVATE_URL + token + Hoxro.Utiltiy.MessageProvider.Email.URL_USERNAME + username;
            //var serviceBase = 'http://213.136.82.93:91/';

            var htmlBodyPath = _environment.ContentRootPath + Hoxro.Utiltiy.MessageProvider.Email.HTML_BODY_PART;
            var imgAttachment = _environment.ContentRootPath + Hoxro.Utiltiy.MessageProvider.Email.IMG_ATTACHMENT;

            if (htmlBodyPath == null || imgAttachment == null) return string.Empty;
            var htmlBody = File.ReadAllText(htmlBodyPath);
            var imgAttachmentLogo = new LinkedResource(imgAttachment);

            var body = htmlBody.Replace("{0}", imgAttachmentLogo.ContentId);
            body = body.Replace("{1}", serviceUrl);
            body = body.Replace(Hoxro.Utiltiy.MessageProvider.Email.BODY_FIRSTNAME, fistName);
            body = body.Replace(Hoxro.Utiltiy.MessageProvider.Email.BODY_LASTNAME, lastName);
            body = body.Replace(Hoxro.Utiltiy.MessageProvider.Email.BODY_USERNAME, username).Replace(Hoxro.Utiltiy.MessageProvider.Email.BODY_PASSWORD, password).Replace(Hoxro.Utiltiy.MessageProvider.Email.BODY_ADMINUSER, createdUser).Replace(Hoxro.Utiltiy.MessageProvider.Email.BODY_REQ_DATA, DateTime.UtcNow.ToString(CultureInfo.InvariantCulture));
            var view = AlternateView.CreateAlternateViewFromString(body, null, Hoxro.Utiltiy.MessageProvider.Email.ALT_VIEW_FORMAT);
            view.LinkedResources.Add(imgAttachmentLogo);
            mailMessage.AlternateViews.Add(view);
            return body;
        }

        private string GetMailBody(string otp)
        {
            var body = "Hi        <br />";
            body += "Please find the below otp to login your account. <br />";
            body += "" + otp;
            return body;
        }
    }
}
