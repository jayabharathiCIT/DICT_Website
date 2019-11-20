//*******************************************************************
//Programmer :Jayabharathi
//Date: 06-11-2019
//Purpose: Admin user can remove Students record. 
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
    public partial class RemoveStudent : System.Web.UI.Page
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

        protected void loadAllStudents()
        {
            using (MySqlConnection sqlCon = new MySqlConnection(strConnString))
            {
                sqlCon.Open();
                string Query = "SELECT * FROM `dict website`.dt_dict_persons";
                MySqlCommand MyCommand = new MySqlCommand(Query, sqlCon);
                MySqlDataAdapter sqlDa = new MySqlDataAdapter();
                sqlDa.SelectCommand = MyCommand;
                sqlDa.Fill(dtAdmin);
            }
        }

        protected void gv_StudentDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv_StudentDetails.PageIndex = e.NewPageIndex;
            //fill grid view
            gv_StudentDetails.DataSource = dtAdmin;
            gv_StudentDetails.DataBind();
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AdminProfilePage.aspx");
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

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            if (btn.CommandName == "Remove")
            {
                int getRegID = Convert.ToInt32(btn.CommandArgument);                
                deleteStudent(getRegID);
            }

        }
        protected void deleteStudent(int RegID)
        {             

           
            using (MySqlConnection sqlCon = new MySqlConnection(strConnString))
            {
                sqlCon.Open();

                bool AllRecordDeleted = false;
                //Delete All the posts created by user.
                string QueryPost = "DELETE FROM `dict website`.dt_posts where Register_ID =" + RegID + ";";
                MySqlCommand MyCommandPost = new MySqlCommand(QueryPost, sqlCon);

                int deletePost = MyCommandPost.ExecuteNonQuery();
                if (deletePost > 0)
                {
                    AllRecordDeleted = true;
                }

                //Delete the replies created by the user.

                string QueryReply = "DELETE FROM `dict website`.dt_reply where Register_ID =" + RegID + ";";
                MySqlCommand MyCommandReply = new MySqlCommand(QueryReply, sqlCon);
                
                int deleteDeply = MyCommandReply.ExecuteNonQuery();
                if(deleteDeply > 0)
                {
                    AllRecordDeleted = true;
                }

                string sql = "DELETE FROM dt_book_event WHERE Register_ID = " + RegID;
                using (var cmd = new MySqlCommand(sql, sqlCon))
                {
                    int count = cmd.ExecuteNonQuery();
                    
                    if(count > 0 )
                    {
                        AllRecordDeleted = true;
                    }
                }
                //delete account is recorded in dt_deleted_account table
                MySqlCommand insert = new MySqlCommand("INSERT INTO dt_deleted_account (Register_ID, Date_Delete) VALUES(@Registerid, @DeletedDate)", sqlCon);

                insert.Parameters.AddWithValue("@Registerid", RegID);
                insert.Parameters.AddWithValue("@DeletedDate", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
                insert.ExecuteNonQuery();

                //Delete From Person Table
                string Query = "DELETE FROM `dict website`.dt_dict_persons where Register_ID =" + RegID + ";";
                MySqlCommand MyCommandtoGetPostByID = new MySqlCommand(Query, sqlCon);
              //  MyCommandtoGetPostByID.ExecuteNonQuery();
                int result = MyCommandtoGetPostByID.ExecuteNonQuery();
                //result holds number of rows affected 
                if (result > 0)
                {
                    AllRecordDeleted = true;                   
                }

           
                if (AllRecordDeleted)
                {
                    string message = "Delete Student Account successful!";
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
        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            if (btn.CommandName == "Password")
            {
                string getPostIDArg = btn.CommandArgument.ToString();
                Response.Redirect("~/EditForumPost.aspx" + "?PostID=" + getPostIDArg);
            }
        }
    }
}