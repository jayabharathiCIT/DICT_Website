//*******************************************************************
// Programmer :Jayabharathi
// Date: 24-10-2019
// Purpose: Edit the post .Show edit page only to user who created it. Show and Hide edit button on forum page.
// Software:   Microsoft Visual Studio 2019 Community Edition
// Platform:   Microsoft Windows 
//******************************************************************* 
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DICT_Website
{
    public partial class EditForumPost : System.Web.UI.Page
    {
        string strConnString = ConfigurationManager.ConnectionStrings["DICTMySqlConnectionString"].ConnectionString;
        string postID;
        protected void Page_Load(object sender, EventArgs e)
        {

            // check user is authenticated .
            // Start Check authorised user            
            if (Session["RegID"] == null)
                Response.Redirect("~/Login.aspx");
            else
            {
                String userid = Convert.ToString((int)Session["RegID"]);
                int regID = (int)Session["RegID"];
                String username = Session["Username"].ToString();
                //String userrole = Session["Role"].ToString();
                lbluserInfo.Text = "Welcome , " + username + " ";
               bool resultEdit = CheckUserCanEditOrNot(regID);
                if(resultEdit == false)
                {
                    Response.Redirect("~/ForumHomePage.aspx");
                }
            }
            // End Check authorised user 

            //get Post ID from page querystring
            postID = Request.QueryString["PostID"];

            if (!Page.IsPostBack)
            {               
                // Show selected value of category dropdwon.
                showSelectedPost();
            }
        }

        public bool CheckUserCanEditOrNot(int RegisterID)
        {
            bool sameUserCreated = false;
            postID = Request.QueryString["PostID"];

            if (postID != null)
            {
                using (MySqlConnection sqlCon = new MySqlConnection(strConnString))
                {
                    sqlCon.Open();
                    MySqlCommand sqlCmd = new MySqlCommand("sp_WhoCreatedPost", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("P_Register_ID", RegisterID);
                    sqlCmd.Parameters.AddWithValue("P_Post_ID", postID);
                    // sqlCmd.ExecuteNonQuery();
                    string output = sqlCmd.ExecuteScalar().ToString();
                    if (output == "1")
                    {
                        sameUserCreated = true;
                    }
                }             
            }
           
            return sameUserCreated;
        }

            public void showSelectedPost()
        {

            postID = Request.QueryString["PostID"];
            DataTable dt = new DataTable();
            DataTable dtReply = new DataTable();
            if (postID != null)
            {
                using (MySqlConnection sqlCon = new MySqlConnection(strConnString))
                {
                    sqlCon.Open();

                    string Query = "SELECT * FROM `dict website`.dt_posts where Post_ID =" + postID + ";";
                    MySqlCommand MyCommandtoGetPostByID = new MySqlCommand(Query, sqlCon);
                    //  MyConn2.Open();  
                    //For offline connection we weill use  MySqlDataAdapter class.  
                    MySqlDataAdapter sqlDa = new MySqlDataAdapter();
                    sqlDa.SelectCommand = MyCommandtoGetPostByID;
                    sqlDa.Fill(dt);
                    //Show  post Topic title
                    txtTitle.Text = dt.Rows[0]["Topic_Title"].ToString();
                    //Show post Description 
                    textDescription.Text = dt.Rows[0]["Description_Post"].ToString();
                    //Get Correct Post Category
                    ddlCategory.ClearSelection();
                    ddlCategory.Items.FindByValue(dt.Rows[0]["Category_ID"].ToString()).Selected = true;
                    //ddlCategory.SelectedValue = dt.Rows[0]["Category_ID"].ToString();
                }            
        }

    }

        protected void btnUpdatePost_Click(object sender, EventArgs e)
        {

            try
            {
                if (postID != null)
                {
                    using (MySqlConnection sqlCon = new MySqlConnection(strConnString))
                    {
                        sqlCon.Open();
                        MySqlCommand sqlCmd = new MySqlCommand("sp_EditPost", sqlCon);
                        sqlCmd.CommandType = CommandType.StoredProcedure;
                        // not need applyed as auto increment sqlCmd.Parameters.AddWithValue("P_Post_ID", "1");
                        sqlCmd.Parameters.AddWithValue("P_Topic_Title", txtTitle.Text);
                        sqlCmd.Parameters.AddWithValue("P_Description_Post", textDescription.Text);
                        if (getCategoryValue() > 0)
                        {
                            sqlCmd.Parameters.AddWithValue("P_Category_ID", getCategoryValue());
                        }
                        string postCreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                        sqlCmd.Parameters.AddWithValue("P_Date_Posted", postCreatedDate);
                        //sqlCmd.Parameters.AddWithValue("P_Date_Posted", "2019-09-25 02:55:05");                        
                        sqlCmd.Parameters.AddWithValue("P_Post_ID", postID);
                        sqlCmd.ExecuteNonQuery();
                        lblSuccessMessage.Text = "Submitted Successfully";
                        string message = "Post is Update Successfully.Now Redirecting to Forum Home Page";
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
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = ex.Message;
            }

        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {

        }


        public int getCategoryValue()
        {
            try
            {

                if (ddlCategory.SelectedItem.Text == "Programming")
                {
                    return 1;
                }
                else if (ddlCategory.SelectedItem.Text == "Designing")
                {
                    return 2;
                }
                else if (ddlCategory.SelectedItem.Text == "Networking")
                {
                    return 3;
                }
                else if (ddlCategory.SelectedItem.Text == "Security")
                {
                    return 4;
                }
                else
                {
                    return 5;
                }


            }
            catch (Exception es)
            {
                lblSuccessMessage.Text = es.Message;
                return 0;
            }
        }
        protected void ddlLogin_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlLogin.SelectedItem.Value == "1")
            {
                //ChangePassword
            }
            if (ddlLogin.SelectedItem.Value == "2")
            {
                //DeleteAccount
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