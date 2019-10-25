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

            if(string.IsNullOrEmpty(txtemail.Text))
            {
               // MessageBox.Show("Enter email address");
                return;
            }
            try
            {

                var fromAddress = new MailAddress("dcitcanberra@gmail.com");
                var fromPassword = "dcitcanberra01";
                var toAddress = new MailAddress("dcitcanberra@gmail.com");

                string subject = "Client Service - Contact DCIT";
                string body = "Contacted By:" + txtName.Text + ", " + txtemail.Text + ", " + txtMessage.Text;

                System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
                };

                using (var message = new MailMessage(fromAddress, toAddress)
                {
                    Subject = subject,
                    Body = body
                })
                    smtp.Send(message);
            }
            catch (Exception ex)
            {
               // MessageBox.Show(ex.ToString());
            }
        }
    }
}