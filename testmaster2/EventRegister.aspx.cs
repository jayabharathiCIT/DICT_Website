using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace DICT_Website
{
    public partial class EventRegister : System.Web.UI.Page
    {
        string strConnString = ConfigurationManager.ConnectionStrings["DICTMySqlConnectionString"].ConnectionString;
        string eventID;
        protected void Page_Load(object sender, EventArgs e)
        {
            eventID = Request.Params["EvtID"];
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            MySqlConnection conn = new MySqlConnection(strConnString);
            using (MySqlCommand insert = new MySqlCommand("INSERT INTO dt_book_event (Register_ID, Book_Phone_No, Evt_ID) " +
                "VALUES(@CitId, @Mobile, @EvtId)", conn))
            {
                insert.Parameters.AddWithValue("@CitId", txtCitId.Text);
                insert.Parameters.AddWithValue("@Mobile", txtMobile.Text);
                insert.Parameters.AddWithValue("@EvtId", eventID);
             
                conn.Open();
                insert.ExecuteNonQuery();
                conn.Close();

            }

            txtMobile.Text = "";
            txtCitId.Text = "";

            Response.Redirect("~/EventResult?EventID=" + eventID);
        }
        

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/EventResult?EventID=" + eventID);
        }
    }
}