using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace DICT_Website
{
    public partial class EditEvent : System.Web.UI.Page
    {
        string strConnString = ConfigurationManager.ConnectionStrings["DICTMySqlConnectionString"].ConnectionString;
        string EvtID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string eventID = Request.Params["EvtID"];
                GetEvent(eventID);
            }
        }

        public void GetEvent(String evntid)
        {
            MySqlConnection conn = new MySqlConnection(strConnString);
            DataTable dtevent = new DataTable();
            try
            {
                conn.Open();

                string sql = "SELECT * FROM dt_event WHERE Evt_ID = " + evntid;
                MySqlDataAdapter adapter = new MySqlDataAdapter(sql, conn);
                adapter.Fill(dtevent);

                DataRow pRow = dtevent.Rows[0];

                evtHiddenId.Value = pRow["Evt_ID"].ToString();
                txtTitle.Text = pRow["Evt_Title"].ToString();
                DateTime dt = Convert.ToDateTime(pRow["Evt_Date"].ToString());
               
                txtDate.Text = dt.ToString("yyyy-MM-dd");
                txtContent.Text = pRow["Evt_Content"].ToString();
                byte[] binImage = (byte[])pRow["Evt_Image"];
                string base64String = Convert.ToBase64String(binImage, 0, binImage.Length);
                Image1.ImageUrl = "data:image/jpeg;base64," + base64String;
                txtStartTime.Text = pRow["Evt_Strt_tm"].ToString();
                txtEndTime.Text = pRow["Evt_End_tm"].ToString();
                txtLocation.Text = pRow["Evt_Location"].ToString();

            }
            catch (Exception ex)
            {
                
            }
            finally
            {
                // close the Sql Connection
                conn.Close();
            }
        }

        
       
        protected void btnSubmit_Click1(object sender, EventArgs e)
        {
            string filename = Path.GetFileName(EventFileUpload.PostedFile.FileName);
            string contentType = EventFileUpload.PostedFile.ContentType;
            using (Stream fs = EventFileUpload.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);

                    //---------------Database connection------------

                    MySqlConnection conn = new MySqlConnection(strConnString);
                    if (bytes.Length > 0)
                    {

                        using (MySqlCommand insert = new MySqlCommand("UPDATE dt_event SET Evt_Title = @Title, Evt_Date = @Date, " +
                        "Evt_Location = @Location,Evt_Strt_tm = @Evtstrttm,Evt_End_tm = @Evtendtm,   " +
                        "Evt_Content=@Content, Evt_Image=@Image WHERE Evt_ID=@eventId", conn))
                        {
                            insert.Parameters.AddWithValue("@Title", txtTitle.Text);
                            insert.Parameters.AddWithValue("@Date", txtDate.Text);
                            insert.Parameters.AddWithValue("@Evtstrttm", txtStartTime);
                            insert.Parameters.AddWithValue("@Evtendtm", txtEndTime);
                            insert.Parameters.AddWithValue("@Content", txtContent);
                            insert.Parameters.AddWithValue("@Location",txtLocation);
                            insert.Parameters.AddWithValue("@Image", bytes);
                            insert.Parameters.AddWithValue("@eventId", evtHiddenId.Value);

                            conn.Open();
                            insert.ExecuteNonQuery();
                            conn.Close();

                        }
                    }
                    else
                    {
                        using (MySqlCommand insert = new MySqlCommand("UPDATE dt_event SET Evt_Title = @Title, Evt_Date = @Date, " +
                              "Evt_Location = @Location, Evt_Strt_tm = @Evtstrttm, Evt_End_tm = @Evtendtm," +
                        "Evt_Content=@Content WHERE Evt_ID=@eventId",conn))
                        {
                            insert.Parameters.AddWithValue("@Title", txtTitle.Text);
                            insert.Parameters.AddWithValue("@Date", txtDate.Text);
                            insert.Parameters.AddWithValue("@Evtstrttm", txtStartTime.Text);
                            insert.Parameters.AddWithValue("@Evtendtm", txtEndTime.Text);
                            insert.Parameters.AddWithValue("@Location", txtLocation.Text);
                            insert.Parameters.AddWithValue("@Content", txtContent.Text);
                            insert.Parameters.AddWithValue("@eventId", evtHiddenId.Value);
                            
                            conn.Open();
                            insert.ExecuteNonQuery();
                            conn.Close();
                        }
                    }

                    DisplayAlert("Successfully updated the event", "EventPage.aspx");
                   
                    //Response.Redirect("~/EventPage.aspx");
                }
            }
        }

        protected void btnCancel_Click1(object sender, EventArgs e)
        {
            Response.Redirect("~/EventPage.aspx");
        }

        protected virtual void DisplayAlert(string message, string redirectFile)
        {
            ClientScript.RegisterStartupScript(
              this.GetType(),
              Guid.NewGuid().ToString(),
              string.Format("alert('{0}');window.location.href = '" + redirectFile + "'",
                message.Replace("'", @"\'").Replace("\n", "\\n").Replace("\r", "\\r")),
                true);
        }
    }
}

        