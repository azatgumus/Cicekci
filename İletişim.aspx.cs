﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace Cicekci
{
    public partial class İletişim : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBoxYourName_TextChanged(object sender, EventArgs e)
        {

        }

        

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                MailMessage mMailMessage = new MailMessage();

                mMailMessage.From = new MailAddress(HttpUtility.HtmlEncode(TextBoxEmail.Text));
                mMailMessage.To.Add(new MailAddress("somebody@gmail.com"));

                //mMailMessage.Bcc.Add(new MailAddress(bcc));
                // mMailMessage.CC.Add(new MailAddress(cc));

                mMailMessage.Subject = "From:" + HttpUtility.HtmlEncode(TextBoxAd.Text) + "-" +
                                                 HttpUtility.HtmlEncode(TextBoxKonu.Text);
                mMailMessage.Body = HttpUtility.HtmlEncode(Editor1.Content);
                mMailMessage.IsBodyHtml = true;
                mMailMessage.Priority = MailPriority.Normal;
                SmtpClient mSmtpClient = new SmtpClient();
                mSmtpClient.Send(mMailMessage);
                LabelMessage.Text = "Teşekkürler - Mesajınız Gönderildi.";
            }
            catch (Exception exp)
            {
                throw new Exception("ERROR: Gönderilemedi - " + exp.Message.ToString(), exp);
            }
        }
    }
}