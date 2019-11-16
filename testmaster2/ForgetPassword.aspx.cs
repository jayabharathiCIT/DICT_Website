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

            }   
        }


        public int CheckAllRegisterValidation()
        {
            if (txtID.Text.Length == 0)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "Message", "alert('Your ID can not be blank !!')", true);
                //lblErrorID.Text = "*** Your ID can not be blank ***";
                return 0;
            }

            else if (txtEmail.Text.Length == 0)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "Message", "alert('Email can not be blank!!')", true);
                //lblErrorEmail.Text = "*** Email can not be blank ***";
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