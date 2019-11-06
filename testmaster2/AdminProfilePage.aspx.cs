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
    public partial class AdminProfilePage : System.Web.UI.Page
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
                String userrole = Session["Role"].ToString();
                lbluserInfo.Text = "Welcome , " + username + " ";
                bool isAdminUser = verifyAdminUser(userid);
                if (!isAdminUser)
                {
                    ddlLogin.Items[1].Enabled = false;
                    Response.Redirect("~/ForumHomePage.aspx");
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
       
        protected void btnRemovePost_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AdminForumPage.aspx");
        }

        protected void btnRemoveStudent_Click(object sender, EventArgs e)
        {
             Response.Redirect("~/RemoveStudent.aspx");
        }

        protected void btnAddAnnu_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AnnCreate.aspx");
        }

        protected void btnAddNews_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AddNews.aspx");
        }

        protected void btnEvent_Click(object sender, EventArgs e)
        {
           // Response.Redirect("");
        }
    }
}