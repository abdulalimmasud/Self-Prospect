using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Net;
using System.Net.Mail;

public class MailMaster
{
    private string mailTo;
    private string mailFrom;
    private string mailSubject;
    private string mailBody;
    private bool blnFlag;
    private int portNumber;

    private MailMessage mailMessage;
    private SmtpClient smtpClient;
    //private NetworkCredential authenticationInfo; 

    public string MailTo
    {
        get { return this.mailTo; }
        set { this.mailTo = value; }
    }

    public string MailFrom
    {
        get { return this.mailFrom; }
        set { this.mailFrom = value; }
    }

    public string MailSubject
    {
        get { return this.mailSubject; }
        set { this.mailSubject = value; }
    }

    public string MailBody
    {
        get { return this.mailBody; }
        set { this.mailBody = value; }
    }

    public bool IsHTMLBody
    {
        get { return this.blnFlag; }
        set { this.blnFlag = value; }
    }

    public int PortNumber
    {
        get { return this.portNumber; }
        set { this.portNumber = value; }
    }

    public MailMaster()        
	{
        this.mailTo = string.Empty;
        this.mailFrom = string.Empty;
        this.mailSubject = string.Empty;
        this.mailBody = string.Empty;
        this.blnFlag = false;
        this.portNumber = 25;

        this.mailMessage = new MailMessage();
        this.smtpClient = new SmtpClient();
	}

    public void SendMail()
    {
        this.mailMessage.To.Add(MailTo);
        this.mailMessage.From = new MailAddress(MailFrom);
        this.mailMessage.Subject = MailSubject;
        this.mailMessage.Body = MailBody;
        this.mailMessage.IsBodyHtml = IsHTMLBody;

        //this.authenticationInfo = new NetworkCredential("ajkerdeal", "AjkerDeal123#");
        
        
        //this.smtpClient.Host = "smtp.ajkerdeal.com";
        this.smtpClient.Host = "mail-fwd";
        

        this.smtpClient.UseDefaultCredentials = false;
        //this.smtpClient.Credentials = this.authenticationInfo;
        this.smtpClient.Send(mailMessage);
    }

    public static void SendMail(string MailTo, string MailFrom, string MailSubject, string MailBody)
    {
        MailMessage mailMessage = new MailMessage();
        SmtpClient smtpClient = new SmtpClient();

        mailMessage.To.Add(MailTo);
        mailMessage.From = new MailAddress(MailFrom);
        mailMessage.Subject = MailSubject;
        mailMessage.Body = MailBody;
        mailMessage.IsBodyHtml = true;

        //NetworkCredential authenticationInfo = new NetworkCredential("borome", "bd2345!123");

        NetworkCredential authenticationInfo = new NetworkCredential("info@ajkerdeal.com", "Debashis123#");

        //smtpClient.Host = "smtp.boromela.com";
        //smtpClient.Host = "mail-fwd";
        smtpClient.Host = "localhost";
        //smtpClient.UseDefaultCredentials = false;
        smtpClient.Credentials = authenticationInfo;
        smtpClient.Send(mailMessage);
    }
}
