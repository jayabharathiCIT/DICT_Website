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
    public partial class DeleteAccount : System.Web.UI.Page
    {
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

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ForumHomePage.aspx");
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
           int getRegID = Convert.ToInt32((int)Session["RegID"]);
           deleteAccount(getRegID);
            Response.Redirect("~/Login.aspx");
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

        protected void deleteAccount(int RegID)
        {
            try
            {
                using (MySqlConnection sqlCon = new MySqlConnection(strConnString))
                {
                    sqlCon.Open();
                    //Pass the post ID to query Replies of the specific Post.
                    DataTable dtReply = new DataTable();
                    string QueryReply = "SELECT * FROM `dict website`.dt_dict_persons where Register_ID =" + RegID + ";";
                    MySqlCommand MyCommandGetReply = new MySqlCommand(QueryReply, sqlCon);
                    MySqlDataAdapter sqlDaReply = new MySqlDataAdapter();
                    sqlDaReply.SelectCommand = MyCommandGetReply;
                    sqlDaReply.Fill(dtReply);
                    string QueryDeleteReply = "DELETE FROM `dict website`.dt_dict_persons where Register_ID =" + RegID + ";";
                    if (dtReply.Rows.Count < 0)
                    {

                        MySqlCommand MyCommand = new MySqlCommand(QueryDeleteReply, sqlCon);
                        MyCommand.ExecuteNonQuery();
                    }

                    string Query = "DELETE FROM `dict website`.dt_dict_persons where Register_ID =" + RegID + ";";
                    MySqlCommand MyCommandtoGetPostByID = new MySqlCommand(Query, sqlCon);
                    int result = MyCommandtoGetPostByID.ExecuteNonQuery();
                    //gv_ForumDetails.DataSource = dt;
                    //gv_ForumDetails.DataBind();
                    //result holds number of rows affected 
                    if (result > 0)
                    {
                        string message = "Delete successful!";
                        string url = "DeleteAccount.aspx";
                        string script = "window.onload = function(){ alert('";
                        script += message;
                        script += "');";
                        script += "window.location = '";
                        script += url;
                        script += "'; }";
                        ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
                        Response.Redirect("~/Login.aspx");
                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('No record in that Register ID!')", true);
                    }

                }


            }
            catch (Exception EX)
            {
                lblSuccessMessage.Text = EX.Message;
            }
        }

    }
}