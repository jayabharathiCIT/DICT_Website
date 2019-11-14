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
            DataTable dtnews = new DataTable();
            try
            {
                conn.Open();

                string sql = "SELECT * FROM dt_event WHERE Evt_ID = " + evntid;
                MySqlDataAdapter adapter = new MySqlDataAdapter(sql, conn);
                adapter.Fill(dtnews);

                DataRow pRow = dtnews.Rows[0];

                evtHiddenId.Value = pRow["Evt_ID"].ToString();
                txtTitle.Text = pRow["Evt_Title"].ToString();
                DateTime dt = Convert.ToDateTime(pRow["Evt_Date"].ToString());
                // DateTime dt = DateTime.ParseExact(pRow["News_Date"].ToString(), "yyyy-MM-dd", CultureInfo.InvariantCulture);
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
                Debug.WriteLine("----> Error : " + ex.StackTrace);
            }
            finally
            {
                // close the Sql Connection
                conn.Close();
            }
        }

       /* protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string filename = Path.GetFileName(newsImageFile.PostedFile.FileName);
            string contentType = EventImageFile.PostedFile.ContentType;
            using (Stream fs = newsImageFile.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);

                    //---------------Database connection------------

                    MySqlConnection conn = new MySqlConnection(strConnString);
                    if (bytes.Length > 0)
                    {

                        using (MySqlCommand insert = new MySqlCommand("UPDATE dt_event SET Evt_Title = @Title, Evt_Date = @Date, " +
                        "Evt_Location = @Location, Evt_Strt_tm = @Evtstartm,  " +
                        "News_Content=@Content, News_Image=@Image WHERE News_Id=@newsId", conn))
                        {
                            insert.Parameters.AddWithValue("@Title", txtTitle.Text);
                            insert.Parameters.AddWithValue("@Date", txtDate.Text);
                            insert.Parameters.AddWithValue("@CtgryNo", txtLocation;
                           insert.Parameters.AddWithValue()
                            insert.Parameters.AddWithValue("@Source", newsSource.Text);
                            insert.Parameters.AddWithValue("@Content", newsContent.Text);
                            if (bytes.Length > 0)
                            {
                                insert.Parameters.AddWithValue("@Image", bytes);
                            }
                            insert.Parameters.AddWithValue("@newsId", evtHiddenId.Value);

                            conn.Open();
                            insert.ExecuteNonQuery();
                            conn.Close();

                        }
                    }
                    else
                    {
                        using (MySqlCommand insert = new MySqlCommand("UPDATE dt_news SET News_Title = @Title, News_Date = @Date, " +
                               "News_Ctgry_No = @CtgryNo, Source=@Source, " +
                               "News_Content=@Content WHERE News_Id=@newsId", conn))
                        {
                            insert.Parameters.AddWithValue("@Title", txtTitle.Text);
                            insert.Parameters.AddWithValue("@Date", txtDate.Text);
                           
                            insert.Parameters.AddWithValue("@Source", txtLocation.Text);
                            insert.Parameters.AddWithValue("@Content", txtContent.Text);
                            insert.Parameters.AddWithValue("@newsId", newsHiddenId.Value);

                            conn.Open();
                            insert.ExecuteNonQuery();
                            conn.Close();
                        }
                    }



                    Response.Redirect("~/NewsPage.aspx");
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/NewsPage.aspx");
        }
    }
}

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }*/
    }
}