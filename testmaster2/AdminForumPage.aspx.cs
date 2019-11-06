//*******************************************************************
// Programmer :Jayabharathi
// Date: 28-10-2019
// Purpose: Admin user login and view all the forums, delete the forum.
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
    public partial class AdminForumPage : System.Web.UI.Page
    {
        DataTable dt;
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
                if(!isAdminUser)
                {
                    ddlLogin.Items[1].Enabled = false;
                    Response.Redirect("~/ForumHomePage.aspx");
                }
                }
            // End Check authorised user 

            //Show gridview details
            
                dt = new DataTable();
                using (MySqlConnection sqlCon = new MySqlConnection(strConnString))
                {
                    sqlCon.Open();
                    MySqlDataAdapter sqlDa = new MySqlDataAdapter("sp_PostViewAll", sqlCon);
                    sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                    sqlDa.Fill(dt);
                }
                //fill grid view
                gv_ForumDetails.DataSource = dt;
                gv_ForumDetails.DataBind();
            
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
        protected void gv_ForumDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv_ForumDetails.PageIndex = e.NewPageIndex;
            //fill grid view
            gv_ForumDetails.DataSource = dt;
            gv_ForumDetails.DataBind();
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {


            DataTable dtbl = new DataTable();
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                GridViewRow grv = (GridViewRow)e.Row;


                Label lblgrvCategory = (Label)grv.FindControl("lblCategory");
                if (lblgrvCategory.Text == "1")
                {
                    lblgrvCategory.Text = "Programming";
                }
                else if (lblgrvCategory.Text == "2")
                {
                    lblgrvCategory.Text = "Designing";
                }
                else if (lblgrvCategory.Text == "3")
                {
                    lblgrvCategory.Text = "Networking";
                }
                else
                {
                    lblgrvCategory.Text = "Security";
                }
            }
        }

        protected void gv_ForumDetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "Delete")
            {

                int rowIndex = Convert.ToInt32(e.CommandArgument);
                //Determine the RowIndex of the Row whose Button was clicked.
                // string rowIndex = e.CommandArgument.ToString();
                Response.Redirect("~/ViewandReplyPost.aspx" + "?PostID=" + rowIndex.ToString());
            }

        }

        protected void imgbtnDelete_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            if (btn.CommandName == "Delete")
            {
                int getpostID = Convert.ToInt32(btn.CommandArgument);
                // Response.Redirect("~/EditForumPost.aspx" + "?PostID=" + getPostIDArg);
                deletePost(getpostID);
            }           
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AdminProfilePage.aspx");
        }

        protected void deletePost(int postID)
        {
            using (MySqlConnection sqlCon = new MySqlConnection(strConnString))
            {
                sqlCon.Open();
                string Query = "DELETE FROM `dict website`.dt_posts where Post_ID =" + postID + ";";
                MySqlCommand MyCommandtoGetPostByID = new MySqlCommand(Query, sqlCon);
                MyCommandtoGetPostByID.ExecuteNonQuery();
                int result = MyCommandtoGetPostByID.ExecuteNonQuery();
                //result holds number of rows affected 
                if (result > 0)
                {
                    string message = "Delete successful!";
                    string url = "AdminForumPage.aspx";
                    string script = "window.onload = function(){ alert('";
                    script += message;
                    script += "');";
                    script += "window.location = '";
                    script += url;
                    script += "'; }";
                    ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('No record in that post ID!')", true);
                }

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
    }
}