
/*Programmer :Jayabharathi
 * 
 */
 using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;


namespace testmaster2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string connectionString = @"Server=localhost;Database=dict website;Uid=root;Pwd=pass;";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreatePost_Click(object sender, EventArgs e)
        {
            try
            {
                using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
                {
                    sqlCon.Open();
                    MySqlCommand sqlCmd = new MySqlCommand("sp_AddPost", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("P_Post_ID", "001");
                    sqlCmd.Parameters.AddWithValue("P_Topic_Title", "Displaying multiple live clocks on a page.");
                    sqlCmd.Parameters.AddWithValue("P_Description_Post", " hi all ,  i have the below java-script to display the current date in the given format at runtime using element id='liveclock'.but scrollable affects but it is not working for my HTML page. Let me know how to rectify this issue.....");
                    sqlCmd.Parameters.AddWithValue("P_Category_ID", 2);
                    sqlCmd.Parameters.AddWithValue("P_Date_Posted", "2019-09-25 02:55:05");
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

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }
    }
}