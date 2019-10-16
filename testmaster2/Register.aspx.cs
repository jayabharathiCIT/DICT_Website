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
                    MySqlCommand sqlCmd = new MySqlCommand("sp_Register", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    

                    sqlCmd.Parameters.AddWithValue("P_Register_ID", txtID.Text);
                    sqlCmd.Parameters.AddWithValue("P_First_Name", txtFirstname.Text);
                    sqlCmd.Parameters.AddWithValue("P_Last_Name", txtLastname.Text);

                    if (checkPassword() ==1)
                    {
                        sqlCmd.Parameters.AddWithValue("P_Password", checkPassword());
                    }

                    string txtDate = tbDate.Text;
                  DateTime DTdob = Convert.ToDateTime(txtDate);
                 string getDob = DTdob.ToString("dd-MM-yy");
                 sqlCmd.Parameters.AddWithValue("P_Date_of_Birth", getDob);
                    sqlCmd.Parameters.AddWithValue("P_Email", txtEmail.Text);
                   // string postCreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                    //sqlCmd.Parameters.AddWithValue("Date_Change_Password", postCreatedDate);
                    
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

        protected void submit_Click(object sender, EventArgs e)
        {

        }
    }
}