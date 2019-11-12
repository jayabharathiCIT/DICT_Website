//*******************************************************************
//Programmer :Jayabharathi
//Date: 06-11-2019
//Purpose: Admin user can Reset student password. 
// Software:   Microsoft Visual Studio 2019 Community Edition
// Platform:   Microsoft Windows 
//******************************************************************* 
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DICT_Website
{
    public partial class ResetPwdAdmin : System.Web.UI.Page
    {
        DataTable dtAdmin = new DataTable();
        string strConnString = ConfigurationManager.ConnectionStrings["DICTMySqlConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            // Start Check authorised user            
            if (Session["RegID"] == null)
                Response.Redirect("~/Login.aspx");
            else
            {
                String userid = Convert.ToString((int)Session["RegID"]);
                String username = Session["Username"].ToString();
                String userrole = Session["Role"].ToString();
                lbluserInfo.Text = "Welcome , " + username + " ";
                bool isAdminUser = verifyAdminUser(userid);
                if (!isAdminUser)
                {
                    ddlLogin.Items[1].Enabled = false;
                    Response.Redirect("~/ForumHomePage.aspx");
                }
            }
            //Connect to Mysql datatable
            loadAllStudents();
            //fill grid view
            gv_StudentDetails.DataSource = dtAdmin;
            gv_StudentDetails.DataBind();

        }


        protected void ddlLogin_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlLogin = (DropDownList)sender;
            if (ddlLogin.SelectedItem.Value == "4")
            {
                //ChangePassword
                Response.Redirect("~/AdminProfilePage.aspx");
            }
            if (ddlLogin.SelectedItem.Value == "1")
            {
                //ChangePassword
                Response.Redirect("~/ChangePassword.aspx");
            }
            if (ddlLogin.SelectedItem.Value == "2")
            {
                //DeleteAccount
                Response.Redirect("~/DeleteAccount.aspx");
            }
            if (ddlLogin.SelectedItem.Value == "3")
            {
                //Logout
                //clear session variables
                Session.Clear();
                Session.Remove("RegID");
                Session.Remove("Username");
                //redirect to login page
                Response.Redirect("~/Login.aspx");
            }
        }

        protected Boolean verifyAdminUser(string AdminRegID)
        {
            bool isAdmin = false;
            DataTable dtAdmin = new DataTable();
            using (MySqlConnection sqlCon = new MySqlConnection(strConnString))
            {
                sqlCon.Open();
                int adminRegID = Convert.ToInt32(AdminRegID);
                string Query = "SELECT* FROM `dict website`.dt_dict_admin where Register_ID =" + adminRegID + ";";
                MySqlCommand MyCommand = new MySqlCommand(Query, sqlCon);
                MySqlDataAdapter sqlDa = new MySqlDataAdapter();
                sqlDa.SelectCommand = MyCommand;
                sqlDa.Fill(dtAdmin);
                if (dtAdmin.Rows.Count > 0)
                {
                    isAdmin = true;
                }
                else
                {
                    isAdmin = false;
                }
            }
            return isAdmin;
        }
        static Random _random = new Random();
        protected void btnReset_Click(object sender, EventArgs e)
        {
            string Name = null;
            string Email = null;
            int password = 0;
            Button btn = (Button)sender;
            if (btn.CommandName == "Reset")
            {
                //Radom number gereation.
                 password = _random.Next();
                
                string getRegIDArg = btn.CommandArgument.ToString();
               string gotStudent = getStudentDetails(getRegIDArg);
                string[] words = gotStudent.Split(',');
                     Name = words[0].ToString();
                Email = words[1].ToString();
                SendEmailToStudent(Name, Email, password.ToString());
                UpdatePasswordSql(getRegIDArg, password.ToString());
                ClientScript.RegisterStartupScript(Page.GetType(), "Message", "alert('Success.Your Passsword is sent in your email.Please check your email.!!')", true);
                Response.Redirect("~/AdminProfilePage.aspx");
            }        
           
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AdminProfilePage.aspx");
        }

        protected void SendEmailToStudent(string Name, string EmailID, string password)
        {
            var fromAddress = new MailAddress("dcitcanberra@gmail.com");
            var fromPassword = "dcitcanberra01";
            var toAddress = new MailAddress(EmailID); // Give student Email ID

            string subject = "DICT Administrator Message -ResetPassword";
            string htmlBody = @"
                <html lang=""en"">
                    <head>    
                        <meta content=""text/html; charset=utf-8"" http-equiv=""Content-Type"">
                        <title>
                            This email was sent from DICT Administrator
                        </title>
                        <style type=""text/css"">
                            HTML{background-color: #e8e8e8;}                           
                        </style>
                    </head>
                    <body>
                        <div><b>This email was sent from DICT Administrator</b></div>

                        <div>Hi {c_name} ,</div>
                        <div>Your Email : {c_email}</div>
                        <div>You request to reset the password of your DICT Account .</div>
                        <div>Here is your  temporary password : {c_Password} </div>
                        <div>Regrads,</div>
                        <div>DICT Administrator</div>
                    </body>
                </html>
                ";

            htmlBody = htmlBody.Replace("{c_name}", Name)
                                .Replace("{c_email}", EmailID)
                                .Replace("{c_Password}", password);
          

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

        protected void loadAllStudents()
        {
            using (MySqlConnection sqlCon = new MySqlConnection(strConnString))
            {
                sqlCon.Open();
                string Query = "SELECT * FROM `dict website`.dt_dict_persons  where ForgetPassword ='Yes';";
                MySqlCommand MyCommand = new MySqlCommand(Query, sqlCon);
                MySqlDataAdapter sqlDa = new MySqlDataAdapter();
                sqlDa.SelectCommand = MyCommand;
                sqlDa.Fill(dtAdmin);
            }
        }

        protected string getStudentDetails(string RegID)
        {
            string getStudentName = null;
            using (MySqlConnection sqlCon = new MySqlConnection(strConnString))
            {
                sqlCon.Open();
                int StudentRegID = Convert.ToInt32(RegID);
                string Query = "SELECT Email,First_Name FROM `dict website`.dt_dict_persons  where Register_ID = " + StudentRegID + ";";
                MySqlCommand MyCommand = new MySqlCommand(Query, sqlCon);
                MySqlDataAdapter sqlDa = new MySqlDataAdapter();
                sqlDa.SelectCommand = MyCommand;
                sqlDa.Fill(dtAdmin);

                getStudentName = dtAdmin.Rows[0]["First_Name"].ToString()+ "," + dtAdmin.Rows[0]["Email"].ToString();
            }
            return getStudentName;
        }

        protected void UpdatePasswordSql(string RegID ,string Newpwd)
        {
            using (MySqlConnection sqlCon = new MySqlConnection(strConnString))
            {
                sqlCon.Open();
                int StudentRegID = Convert.ToInt32(RegID);
                string Query = "UPDATE `dict website`.dt_dict_persons SET Password= "+ Newpwd + ", ForgetPassword ='No'  where Register_ID = " + StudentRegID + ";";
                MySqlCommand MyCommand = new MySqlCommand(Query, sqlCon);
                MyCommand.ExecuteNonQuery();            
            }
           
        }

        protected void gv_StudentDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv_StudentDetails.PageIndex = e.NewPageIndex;
            //fill grid view
            gv_StudentDetails.DataSource = dtAdmin;
            gv_StudentDetails.DataBind();
        }
    }
}