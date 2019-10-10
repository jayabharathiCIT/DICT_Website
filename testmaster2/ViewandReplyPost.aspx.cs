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
    public partial class ViewandReplyPost : System.Web.UI.Page
    {
        string strConnString = ConfigurationManager.ConnectionStrings["DICTMySqlConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            string postID = Request.QueryString["PostID"];
            DataTable dt = new DataTable();
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


                    lblCreatedByValue.Text = "This Post is created by " + createdPerson + " on " + getDatePosted + " under" + categoryName + " category";

                    lblDescValue.Text = dt.Rows[0]["Description_Post"].ToString();

                }
            }


        }

        protected void btnReply_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }
    }
}