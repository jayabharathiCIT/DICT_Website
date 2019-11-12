//*******************************************************************
// Programmer :Jayabharathi
//Date:25-09-2019
//Purpose: Create new post ,Get all values from user and save to Mysql Datatable in correct format
// Software:   Microsoft Visual Studio 2019 Community Edition
// Platform:   Microsoft Windows 
//*******************************************************************
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;

namespace testmaster2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
       // string connectionString = @"Server=localhost;Database=dict website;Uid=root;Pwd=pass;";
        string strConnString = ConfigurationManager.ConnectionStrings["DICTMySqlConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            // check user is authenticated .
            // Start Check authorised user            
            if (Session["RegID"] == null)
                Response.Redirect("~/Login.aspx");
            else
            {
                String userid = Convert.ToString((int)Session["RegID"]);
                
                String username = Session["Username"].ToString();
                //String userrole = Session["Role"].ToString();
                lbluserInfo.Text = "Welcome , " + username + " ";
            }
            // End Check authorised user 

        }

        protected void btnCreatePost_Click(object sender, EventArgs e)
        {
            

            try
            {
                using (MySqlConnection sqlCon = new MySqlConnection(strConnString))
                {
                    sqlCon.Open();
                    MySqlCommand sqlCmd = new MySqlCommand("sp_AddPost", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    // not need applyed as auto increment sqlCmd.Parameters.AddWithValue("P_Post_ID", "001");
                    sqlCmd.Parameters.AddWithValue("P_Topic_Title", txtTitle.Text);
                    // sqlCmd.Parameters.AddWithValue("P_Topic_Title", "Displaying multiple live clocks on a page.");
                    sqlCmd.Parameters.AddWithValue("P_Description_Post", textDescription.Text);
                    // sqlCmd.Parameters.AddWithValue("P_Description_Post", " hi all , i have the below java-script to display the current date in the given format at runtime using element id='liveclock'.but scrollable affects but it is not working for my HTML page. Let me know how to rectify this issue.....");
                    if (getCategoryValue() > 0)
                    {
                        sqlCmd.Parameters.AddWithValue("P_Category_ID", getCategoryValue());
                    }
                    string postCreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                    sqlCmd.Parameters.AddWithValue("P_Date_Posted", postCreatedDate);
                    //sqlCmd.Parameters.AddWithValue("P_Date_Posted", "2019-09-25 02:55:05");
                    int getUserID = (int)Session["RegID"];
                    sqlCmd.Parameters.AddWithValue("P_Register_ID", getUserID);
                    sqlCmd.ExecuteNonQuery();
                    refreshReplyCounts();
                    lblSuccessMessage.Text = "Submitted Successfully";
                    string message = "Post is Created Successfully.Now Redirecting to Forum Home Page";
                    string url = "ForumHomePage.aspx";
                    string script = "window.onload = function(){ alert('";
                    script += message;
                    script += "');";
                    script += "window.location = '";
                    script += url;
                    script += "'; }";
                    ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = ex.Message;
            }
        }

        public void refreshReplyCounts()
        {
            DataTable dt = new DataTable();
            using (MySqlConnection sqlCon = new MySqlConnection(strConnString))
            {
                sqlCon.Open();
                MySqlDataAdapter sqlDa = new MySqlDataAdapter("sp_PostViewAll", sqlCon);
                sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                sqlDa.Fill(dt);
                foreach (DataRow dtRow in dt.Rows)
                {
                    int postID = Convert.ToInt32(dtRow["Post_ID"].ToString());
                    // add code to update post table no of replies .
                    //calculate number of replies based on the reply table using post ID and fill the post ID each time you create a reply.
                    MySqlCommand sqlCmd2 = new MySqlCommand("sp_CountReplies", sqlCon);
                    sqlCmd2.CommandType = CommandType.StoredProcedure;
                    sqlCmd2.Parameters.AddWithValue("R_Post_ID", postID);
                    sqlCmd2.ExecuteNonQuery();
                }
            }
        }

        public int getCategoryValue()
        {            
            try
            {
               
                if (ddlCategory.SelectedItem.Text == "Programming")
                {
                    return 1;
                }
                else if(ddlCategory.SelectedItem.Text == "Designing")
                {
                    return  2;
                }
                else if(ddlCategory.SelectedItem.Text == "Networking")
                {
                    return  3;
                }
                else if (ddlCategory.SelectedItem.Text == "Security")
                {
                    return  4;
                }
                else
                {
                    return  5;
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
            Response.Redirect("~/ForumHomePage.aspx");
        }


        protected void ddlLogin_SelectedIndexChanged(object sender, EventArgs e)
        {
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
    }
}