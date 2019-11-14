//*******************************************************************
// Programmer :Jayabharathi
// Date: 14-10-2019
// Purpose: login into the forum .Provide correct username and password to login .then redirects to forum home page.
// Software:   Microsoft Visual Studio 2019 Community Edition
// Platform:   Microsoft Windows 
//******************************************************************* 
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DICT_Website
{
	public partial class Login : System.Web.UI.Page
	{
        string strConnString = ConfigurationManager.ConnectionStrings["DICTMySqlConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
		{

		}
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/HomePage.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                using (MySqlConnection sqlCon = new MySqlConnection(strConnString))
                {
                    sqlCon.Open();
                    MySqlCommand sqlCmd = new MySqlCommand("sp_CheckAuthUser", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("F_Register_ID", txtUserName.Text);
                    sqlCmd.Parameters.AddWithValue("F_Password", txtPassword.Text);
                    // sqlCmd.ExecuteNonQuery();
                    string output = sqlCmd.ExecuteScalar().ToString();
                    if (output == "1")// if the user is autheticate user , redirect to forum page.
                    {
                        lblSuccessMessage.Text = "Login Successed";

                        DataTable dtbl = new DataTable();
                        MySqlDataAdapter sqlPerson = new MySqlDataAdapter("sp_FristNameByID", sqlCon);
                        sqlPerson.SelectCommand.CommandType = CommandType.StoredProcedure;
                        sqlPerson.SelectCommand.Parameters.AddWithValue("registerID", txtUserName.Text);
                        sqlPerson.SelectCommand.CommandType = CommandType.StoredProcedure;
                        sqlPerson.Fill(dtbl);
                        string firstName = dtbl.Rows[0][0].ToString();
                        string personRole = dtbl.Rows[0][1].ToString();
                        Session["RegID"] = Convert.ToInt32(txtUserName.Text);
                        Session["Username"] = firstName;
                        Session["Role"] = personRole;// role can be student or admin.
                        if(personRole== "Student") // if the user is student and redirect to student forum page
                        {
                            Response.Redirect("~/ForumHomePage.aspx");
                        }
                        else if (personRole == "Admin")// if the user is admin and redirect to admin forum page
                        {
                            Response.Redirect("~/AdminProfilePage.aspx");
                        }                        
                    }
                    else
                    {
                        lblSuccessMessage.Text = "Sorry,Not authorised users.Check your username and password.";
                    }
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = ex.Message;
            }
        }
    }
}