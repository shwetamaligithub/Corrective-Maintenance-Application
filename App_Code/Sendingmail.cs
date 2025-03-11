using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;
using System.Net.Configuration;
using System.Configuration;

/// <summary>
/// Summary description for Sendingmail
/// </summary>
//public class Sendingmail
//{
//    public Sendingmail()
//    {
//        //
//        // TODO: Add constructor logic here
//        //
//    }
public class SendingMail
{

    public string SendEmail(string toEmail, string subject, string body)
    {
        SmtpSection smtpSection = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");
        using (MailMessage mail = new MailMessage())
        {
            mail.Subject = subject;
            mail.Body = body;
            mail.IsBodyHtml = false;
            mail.To.Add(toEmail);
            SmtpClient smtp = new SmtpClient();
            smtp.Host = smtpSection.Network.Host;
            smtp.EnableSsl = smtpSection.Network.EnableSsl;
            NetworkCredential networkCred = new NetworkCredential(smtpSection.Network.UserName, smtpSection.Network.Password);
            smtp.UseDefaultCredentials = smtpSection.Network.DefaultCredentials;
            smtp.Credentials = networkCred;
            smtp.Port = smtpSection.Network.Port;
            smtp.Send(mail);
        }
        return "Email sent.";
    }
    
}