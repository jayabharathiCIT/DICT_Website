
/*Programmer :Jayabharathi
 *Date:25-09-2019
 *Purpose: Create new post ,Get all values from user and save to Mysql Datatable in correct format
 */
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
                        sqlCmd.Parameters.AddWithValue("P_Register_ID", "244332");
                        sqlCmd.ExecuteNonQuery();
                        lblSuccessMessage.Text = "Submitted Successfully";
                    }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = ex.Message;
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
    }
}