﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;

namespace DICT_Website
{

    public partial class AnnCreate : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["DICTMySqlConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            MySqlConnection conn = new MySqlConnection(connStr);

            using (MySqlCommand insert = new MySqlCommand("INSERT INTO dt_announcement (Register_ID, Ann_Title, Ann_Body, Posted_On) VALUES(@Register, @Title, @Body, @Posted)", conn))
            {
                insert.Parameters.AddWithValue("@Register", "232957");
                insert.Parameters.AddWithValue("@Title", txtTitle.Text);
                insert.Parameters.AddWithValue("@Body", txtDesc.Text);
                string postCreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                insert.Parameters.AddWithValue("@Posted", postCreatedDate);

                lblSuccessMessage.Text = "Submitted Successfully";
                string message = "Post is Created Successfully.Now Redirecting to Announcement Home Page";
                string url = "AnnHomepage.aspx";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "');";
                script += "window.location = '";
                script += url;
                script += "'; }";
                ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);

                conn.Open();
                insert.ExecuteNonQuery();
                conn.Close();

            }

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AnnHomepage.aspx");
        }

    }

}