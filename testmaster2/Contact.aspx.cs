using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace testmaster2
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {

            if (string.IsNullOrEmpty(txtemail.Text))
            {
                //MessageBox.Show("Enter email address");
                return;
            }
            try
            {

                var fromAddress = new MailAddress("dcitcanberra@gmail.com");
                var fromPassword = "dcitcanberra01";
                var toAddress = new MailAddress("bharathi.kutti@gmail.com");

                string subject = "Client Service - Contact DCIT";
                string htmlBody = @"
                <html lang=""en"">
                    <head>    
                        <meta content=""text/html; charset=utf-8"" http-equiv=""Content-Type"">
                        <title>
                            This email was sent from DICT Contact Service
                        </title>
                        <style type=""text/css"">
                            HTML{background-color: #e8e8e8;}                           
                        </style>
                    </head>
                    <body>
                        <div><b>This email was sent from DICT Contact Service</b></div>
                       <div>Name : {c_name}</div>
                       <div>Email : {c_email}</div>
                       <div>Phone No. : {c_phoneNo}</div>
                       <div>Subject: {c_subject}</div>
                       <div>Mesage: {c_message}</div>
                    </body>
                </html>
                ";

                htmlBody = htmlBody.Replace("{c_name}", txtName.Text)
                                    .Replace("{c_email}", txtemail.Text)
                                    .Replace("{c_phoneNo}", txtPhone.Text)
                                    .Replace("{c_subject}", TextBox1.Text)
                                    .Replace("{c_message}", txtMessage.Text);
                string body = "Contacted By:" + txtName.Text + ", " + txtemail.Text + ", " + txtMessage.Text;

                System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = true,
                    Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
                };

                using (var message = new MailMessage(fromAddress.Address, toAddress.Address, subject, htmlBody)
                {
                    IsBodyHtml = true,
                })
                    smtp.Send(message);
            }
            catch (Exception ep)
            {
                Console.WriteLine("failed to send email with the following error:");
                Console.WriteLine(ep.Message);
            }
        }
    }
}