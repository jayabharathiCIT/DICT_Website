using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;  
using System.Web.UI.WebControls;
using System.Text;
using System.Drawing;

namespace DICT_Website
{
    public partial class ForgetPassword : System.Web.UI.Page
    {

        // string connectionString = @"Server=localhost;Database=dict website;Uid=root;Pwd=1234;";
       string strConnString = ConfigurationManager.ConnectionStrings["DICTMySqlConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int validResult = CheckAllRegisterValidation();
            if (validResult == 1)
            {
                using (MySqlConnection sqlCon = new MySqlConnection(strConnString))
                {

                    sqlCon.Open();

                    string Query = "Select Register_ID,Email FROM `dict website`.dt_dict_persons where Register_ID='" + txtID.Text + "' and email='" + txtEmail.Text + "'";
                    MySqlCommand MyCommandtoGetPostByID = new MySqlCommand(Query, sqlCon);
                    DataTable dtAdmin = new DataTable();
                    MySqlDataAdapter sqlDa = new MySqlDataAdapter();
                    sqlDa.SelectCommand = MyCommandtoGetPostByID;
                    sqlDa.Fill(dtAdmin);
                    if (dtAdmin.Rows.Count > 0)
                    {
                        int getCount = dtAdmin.Rows.Count;
                     
                        MySqlCommand sqlCmd = new MySqlCommand("sp_StatusForgetPassword", sqlCon);
                        sqlCmd.CommandType = CommandType.StoredProcedure;
                        sqlCmd.Parameters.AddWithValue("P_Register_ID", txtID.Text);
                        sqlCmd.Parameters.AddWithValue("P_Email", txtEmail.Text);
                        string StatusForgetPassword = "Yes";
                        sqlCmd.Parameters.AddWithValue("P_Forgetpassword", StatusForgetPassword);
                        sqlCmd.ExecuteNonQuery();
                        ClientScript.RegisterStartupScript(Page.GetType(), "Message", "alert('Your Password has been sent request to Admin. The Admin will sent the password to your Email Address by 24 hours. Please check in your mail box');window.location='Login.aspx';", true);
                        //lblSuccessMessage.Text = "Your Password has been sent request to Admin. The Admin will sent the password to your Email Address by 24 hours. Please check in your mail inbox";
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Your Username is Not Valid or Email Not Registered');</script>");
                        //lblSuccessMessage.Text = "Your Username is Not Valid or Email Not Registered";

                    }
                }

                //  String password;
                // // String mycon = "Data Source=HP-PC\\SQLEXPRESS; Initial Catalog=RegisteredUser; Integrated Security=True";
                //  String myquery = "Select Register_ID,Email,password from dt_dict_persons where Register_ID='" + txtID.Text + "' and email='" + txtEmail.Text + "'";
                ////  SqlConnection con = new SqlConnection(strConnString);
                //  SqlCommand cmd = new SqlCommand();
                //  cmd.CommandText = myquery;
                //  cmd.Connection = con;
                //  SqlDataAdapter da = new SqlDataAdapter();
                //  da.SelectCommand = cmd;
                //  DataSet ds = new DataSet();
                //  da.Fill(ds);
                //  if (ds.Tables[0].Rows.Count > 0)
                //  {
                //      //Label3.Text = "Data Found";

                //      password = ds.Tables[0].Rows[0]["password"].ToString();
                //      sendpassword(password, txtEmail.Text);
                //      lblSuccessMessage.Text = "Your Password Has Been Sent to Registered Email Address. Check Your Mail Inbox";

                //  }
                //  else
                //  {
                //      lblSuccessMessage.Text = "Your Username is Not Valid or Email Not Registered";

                //  }
                //  con.Close();
            }   
        }

        //private void sendpassword(String password, String email)
        //{
        //    SmtpClient smtp = new SmtpClient();
        //    smtp.Host = "smtp.gmail.com";
        //    smtp.Port = 587;
        //    smtp.Credentials = new System.Net.NetworkCredential("s.preeyanuch20@gmail.com", "Soda0253273");
        //    smtp.EnableSsl = true;
        //    MailMessage msg = new MailMessage();
        //    msg.Subject = "Forgot Password ( DICT Website )";
        //    msg.Body = "Dear " + txtID.Text + ", Your Password is  " + password + "\n\n\nThanks & Regards\nDICT Website Team";
        //    string toaddress = txtEmail.Text;
        //    msg.To.Add(toaddress);
        //    string fromaddress = "DICT Website Admin <s.preeyanuch20@gmail.com>";
        //    msg.From = new MailAddress(fromaddress);
        //    try
        //    {
        //        smtp.Send(msg);


        //    }
        //    catch
        //    {
        //        throw;
        //    }
        //}

        public int CheckAllRegisterValidation()
        {
            if (txtID.Text.Length == 0)
            {
                lblErrorID.Text = "*** Your ID can not be blank ***";
                return 0;
            }

            else if (txtEmail.Text.Length == 0)
            {
                lblErrorEmail.Text = "*** Email can not be blank ***";
                return 0;
            }

            else
            {
                return 1;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/HomePage.aspx");
        }
    }
}