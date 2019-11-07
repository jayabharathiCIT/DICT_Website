﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace DICT_Website
{
    public partial class NewsResult : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["DICTMySqlConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id = Request.Params["NewsId"];
                GetNews(id);
            }

        }
        public void GetNews(String newsid)
        {
            MySqlConnection conn = new MySqlConnection(connStr);
            DataTable dtnews = new DataTable();
            try
            {
                conn.Open();

                string sql = "SELECT * FROM dt_news WHERE News_Id = " + newsid;
                MySqlDataAdapter adapter = new MySqlDataAdapter(sql, conn);
                adapter.Fill(dtnews);

                Repeater1.DataSource = dtnews;
                Repeater1.DataBind();
                /*
                Panel1.DataBind();
                DataRow pRow = dtnews.Rows[0];
                DateTime dt = pRow.Field<DateTime>("News_Date");
                newsdate.Text = dt.ToString("dd MMM yy");
                title.Text = pRow["News_Title"].ToString();
                newsimage.ImageUrl = "data:image/jpeg;base64," + Convert.ToBase64String((byte[])pRow["News_Image"]);
                Content.Text = pRow["News_Content"].ToString();
                Source.Text = pRow["Source"].ToString();
                */

            }
            catch (Exception ex)
            {
                Debug.WriteLine("----> Error : " + ex.StackTrace);
            }
            finally
            {
                // close the Sql Connection
                conn.Close();
            }
        }




        protected void btnEdit_Click(object sender, EventArgs e)
        {

        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            var newsid = int.Parse(e.CommandArgument.ToString());
            if (e.CommandName.Equals("DeleteNews"))
            {
                using (MySqlConnection conn = new MySqlConnection(connStr))
                {
                    conn.Open();

                    MySqlCommand com = new MySqlCommand("DELETE FROM dict_website.dt_news WHERE News_Id =" + newsid, conn);
                    com.ExecuteNonQuery();
                }

                Response.Redirect("~/NewsPage.aspx");
            }
            if (e.CommandName.Equals("EditNews"))
            {
                Response.Redirect("~/EditNews?NewsId=" + newsid);
            }

        }
    }
}