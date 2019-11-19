using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace DICT_Website
{
    public partial class AddEvent : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["DICTMySqlConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/EventPage.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string filename = Path.GetFileName(NewsFileUpload.PostedFile.FileName);
            string contentType = NewsFileUpload.PostedFile.ContentType;
            using (Stream fs = NewsFileUpload.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);

                    //---------------Database connection------------

                    MySqlConnection conn = new MySqlConnection(connStr);

                    using (MySqlCommand insert = new MySqlCommand("INSERT INTO dt_event (Evt_Title, Evt_Location, Evt_Date, " +
                        "Evt_Strt_tm, Evt_End_tm, Evt_Content, Evt_Image) " +
                        "VALUES(@Title, @Loc, @Date, @st, @et, @Content, @Image)", conn))
                    {
                        insert.Parameters.AddWithValue("@Title", txtTitle.Text);
                        insert.Parameters.AddWithValue("@Date", txtDate.Text);
                        insert.Parameters.AddWithValue("@Loc", txtLocation.Text);
                        insert.Parameters.AddWithValue("@st", txtStartTime.Text);
                        insert.Parameters.AddWithValue("@et", txtEndTime.Text);
                        insert.Parameters.AddWithValue("@Content", txtContent.Text);
                        insert.Parameters.AddWithValue("@Image", bytes);

                        conn.Open();
                        insert.ExecuteNonQuery();
                        conn.Close();
                    }

                    txtTitle.Text = " ";
                    txtDate.Text = " ";
                    txtLocation.Text = " ";
                    txtContent.Text = " ";
                }
            }
            Response.Redirect("~/EventPage.aspx");

        }
    }
}