using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;

namespace DICT_Website
{
    public partial class Register : System.Web.UI.Page
    {
        // string connectionString = @"Server=localhost;Database=dict website;Uid=root;Pwd=pass;";
        string strConnString = ConfigurationManager.ConnectionStrings["DICTMySqlConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreatePost_Click(object sender, EventArgs e)
        {
            try
            {
                using (MySqlConnection sqlCon = new MySqlConnection(strConnString))
                {
                    sqlCon.Open();
                    MySqlCommand sqlCmd = new MySqlCommand("dt_dict_persons", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;

                    
                    sqlCmd.Parameters.AddWithValue("Register_ID", txtID.Text);
                    sqlCmd.Parameters.AddWithValue("First_Name", txtFirstname.Text);
                    sqlCmd.Parameters.AddWithValue("Last_Name", txtLastname.Text);

                    if (checkPassword() ==1)
                    {
                        sqlCmd.Parameters.AddWithValue("Password", checkPassword());
                    }

                    sqlCmd.Parameters.AddWithValue("Date_of_Birth", txtDOB.Text);
                    sqlCmd.Parameters.AddWithValue("Email", txtEmail.Text);
                    string postCreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                    sqlCmd.Parameters.AddWithValue("Date_Change_Password", postCreatedDate);
                    
                    sqlCmd.ExecuteNonQuery();
                    lblSuccessMessage.Text = "Submitted Successfully";
                }
                // }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = ex.Message;
            }
        }

        public int checkPassword()
        {
            try
            {

                if (txtPassword.Text == txtConfirmPassword.Text)
                {
                    return 1;
                }
                else if (txtPassword.Text != txtConfirmPassword.Text)
                {
                    return 2;
                }
                else
                {
                    return 3;
                }


            }
            catch (Exception es)
            {
                lblSuccessMessage.Text = es.Message;
                return 0;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/HomePage.aspx");
        }
    }
}