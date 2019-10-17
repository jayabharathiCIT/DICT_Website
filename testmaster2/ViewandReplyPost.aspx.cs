//*******************************************************************
// Programmer :Jayabharathi
// Date: 04-10-2019
// Purpose: See description  all posts and reply to the posts.
// Software:   Microsoft Visual Studio 2019 Community Edition
// Platform:   Microsoft Windows 
//******************************************************************* 
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DICT_Website
{
    public partial class ViewandReplyPost : System.Web.UI.Page
    {
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
                //String userrole = Session["Role"].ToString();
                lbluserInfo.Text = "Welcome , " + username + " ";
            }
            // End Check authorised user 

            string postID = Request.QueryString["PostID"];
            DataTable dt = new DataTable();
            DataTable dtReply = new DataTable();
            if (postID != null)
            {
                using (MySqlConnection sqlCon = new MySqlConnection(strConnString))
                {
                    sqlCon.Open();

                    string Query = "SELECT * FROM `dict website`.dt_posts where Post_ID ="+ postID + ";";
                    MySqlCommand MyCommandtoGetPostByID = new MySqlCommand(Query, sqlCon);
                    //  MyConn2.Open();  
                    //For offline connection we weill use  MySqlDataAdapter class.  
                    MySqlDataAdapter sqlDa = new MySqlDataAdapter();
                    sqlDa.SelectCommand = MyCommandtoGetPostByID;               
                    sqlDa.Fill(dt);
                    lblPostTitleValue.Text = dt.Rows[0]["Topic_Title"].ToString();
                    // Get Created by person name
                    int personRegisterID = Convert.ToInt32(dt.Rows[0]["Register_ID"].ToString());
                    DataTable dtbl = new DataTable();
                    MySqlDataAdapter sqlPerson = new MySqlDataAdapter("sp_FristNameByID", sqlCon);
                        sqlPerson.SelectCommand.CommandType = CommandType.StoredProcedure;
                        sqlPerson.SelectCommand.Parameters.AddWithValue("registerID", personRegisterID);
                        sqlPerson.SelectCommand.CommandType = CommandType.StoredProcedure;
                        sqlPerson.Fill(dtbl);
                        string createdPerson = dtbl.Rows[0][0].ToString();
                    //Get Correct Date format
                    DateTime datePosted = Convert.ToDateTime(dt.Rows[0]["Date_Posted"].ToString());
                    string getDatePosted = string.Format("{0:f}", datePosted);
                    //Convert Category ID int Category Value
                    string categoryName = "";

                    if (dt.Rows[0]["Category_ID"].ToString() == "1")
                    {
                        categoryName = "Programming";
                    }
                    else if (dt.Rows[0]["Category_ID"].ToString() == "2")
                    {
                        categoryName = "Designing";
                    }
                    else if (dt.Rows[0]["Category_ID"].ToString() == "3")
                    {
                        categoryName = "Networking";
                    }
                    else
                    {
                        categoryName = "Security";
                    }


                    lblCreatedByValue.Text = "This Post is created by " + createdPerson + " on " + getDatePosted + " under " + categoryName + " category";
                    string str = dt.Rows[0]["Description_Post"].ToString();
                    if (str.Length > 80)
                    {
                        str = str.Substring(0, 80);
                    }
                    lblDescValue.Text = str;

                    //fill previous replies in the form.
                    //lblReplies.Text;
                    //Pass the post ID to query Replies of the specific Post.
                    string QueryReply = "SELECT * FROM `dict website`.` dt_reply` where Post_ID =" + postID + ";";
                    MySqlCommand MyCommandGetReply = new MySqlCommand(QueryReply, sqlCon);                                        
                    MySqlDataAdapter sqlDaReply = new MySqlDataAdapter();
                    sqlDaReply.SelectCommand = MyCommandGetReply;
                    sqlDaReply.Fill(dtReply);
                    StringBuilder replyinfo = new StringBuilder();
                    if(dtReply.Rows.Count == 0)
                    {
                        lblReplies.Text = "No Replies Yet";
                    }
                    foreach (DataRow dr in dtReply.Rows)
                    {
                        // Get Created by person name
                        int studentRegisterID = Convert.ToInt32(dr["Register_ID"].ToString());
                        DataTable dtReplyPerson = new DataTable();
                        MySqlDataAdapter sqlReplyPerson = new MySqlDataAdapter("sp_FristNameByID", sqlCon);
                        sqlReplyPerson.SelectCommand.CommandType = CommandType.StoredProcedure;
                        sqlReplyPerson.SelectCommand.Parameters.AddWithValue("registerID", studentRegisterID);
                        sqlReplyPerson.SelectCommand.CommandType = CommandType.StoredProcedure;
                        sqlReplyPerson.Fill(dtReplyPerson);
                        string replyPerson = dtReplyPerson.Rows[0][0].ToString();
                        replyinfo.Append("Reply" + dr["Reply_ID"].ToString() + " : This reply is created by " + replyPerson + " on " + dr["Reply_Date"].ToString() + ". ");
                        replyinfo.Append(dr["Rpy_Comment"].ToString());
                        lblReplies.Text = replyinfo.ToString();                    
                    }                   
                }
            }
        }

        protected void btnReply_Click(object sender, EventArgs e)
        {
            try
            {
                string postID = Request.QueryString["PostID"];
                if (postID != null)
                {
                    using (MySqlConnection sqlCon = new MySqlConnection(strConnString))
                    {
                        sqlCon.Open();
                        // update the reply in reply table
                        MySqlCommand sqlCmd = new MySqlCommand("sp_AddReply", sqlCon);
                        sqlCmd.CommandType = CommandType.StoredProcedure;
                        // not need applyed as auto increment sqlCmd.Parameters.AddWithValue("Reply_ID", "001");
                        sqlCmd.Parameters.AddWithValue("R_Post_ID", Convert.ToInt32(postID));
                        sqlCmd.Parameters.AddWithValue("R_Rply_Comment", txtComment.Text);
                        string replyCreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                        sqlCmd.Parameters.AddWithValue("R_Reply_Date", replyCreatedDate);
                        int Register_ID = (int)Session["RegID"];
                        sqlCmd.Parameters.AddWithValue("R_Register_ID", Register_ID);
                        sqlCmd.ExecuteNonQuery();
                        lblSuccessMessage.Text = "This Reply is submitted Successfully";

                        // add code to update post table no of replies .
                        //calculate number of replies based on the reply table using post ID and fill the post ID each time you create a reply.
                        MySqlCommand sqlCmd2 = new MySqlCommand("sp_CountReplies", sqlCon);
                        sqlCmd2.CommandType = CommandType.StoredProcedure;
                        sqlCmd2.Parameters.AddWithValue("R_Post_ID", Convert.ToInt32(postID));
                        sqlCmd2.ExecuteNonQuery();

                        string message = "Thank you for the Reply.Now Redirecting to Forum Home Page";
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



        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ForumHomePage.aspx");
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