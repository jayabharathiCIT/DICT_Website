using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace DICT_Website
{
    public partial class Edit_News : System.Web.UI.Page
    {
        string strConnString = ConfigurationManager.ConnectionStrings["DICTMySqlConnectionString"].ConnectionString;
        string newsID;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            //newsID = Request.QueryString["News_ID"];
            if (!IsPostBack)
            {
                BindDropDownListData();
                string newsID = Request.Params["NewsId"];
                GetNews(newsID);
            }
        }

        public void GetNews(String newsid)
        {
            MySqlConnection conn = new MySqlConnection(strConnString);
            DataTable dtnews = new DataTable();
            try
            {
                conn.Open();

                string sql = "SELECT * FROM dt_news WHERE News_Id = " + newsid;
                MySqlDataAdapter adapter = new MySqlDataAdapter(sql, conn);
                adapter.Fill(dtnews);

                DataRow pRow = dtnews.Rows[0];

                newsHiddenId.Value = pRow["News_Id"].ToString();
                newsTitle.Text = pRow["News_Title"].ToString();
                //DateTime dt = DateTime.ParseExact(pRow["News_Date"].ToString(), "yyyy-MM-dd", CultureInfo.InvariantCulture);
                //newsDate.Text = dt.ToString("MM/dd/yyyy");
                newsContent.Text = pRow["News_Content"].ToString();
                newsSource.Text = pRow["Source"].ToString();
                ddlnewsCategory.SelectedValue = pRow["News_Ctgry_No"].ToString();

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

        public void BindDropDownListData()
        {

            MySqlConnection conn = new MySqlConnection(strConnString);
            DataTable news_categories = new DataTable();
            try
            {
                Debug.WriteLine("Connecting to MySQL...");
                conn.Open();

                string sql = "SELECT * FROM dt_news_ctgry";
                MySqlDataAdapter adapter = new MySqlDataAdapter(sql, conn);
                adapter.Fill(news_categories);

                ddlnewsCategory.DataSource = news_categories;
                ddlnewsCategory.DataTextField = "News_Catgry_Name";
                ddlnewsCategory.DataValueField = "News_Ctgry_No";
                ddlnewsCategory.DataBind();

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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string filename = Path.GetFileName(newsImageFile.PostedFile.FileName);
            string contentType = newsImageFile.PostedFile.ContentType;
            using (Stream fs = newsImageFile.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);

                    //---------------Database connection------------

                    MySqlConnection conn = new MySqlConnection(strConnString);

                    using (MySqlCommand insert = new MySqlCommand("UPDATE dt_news SET News_Title = @Title, News_Date = @Date, " +
                        "News_Ctgry_No = @CtgryNo, Source=@Source, " +
                        "News_Content=@Content, News_Image=@Image WHERE News_Id=@newsId", conn))
                    {
                        insert.Parameters.AddWithValue("@Title", newsTitle.Text);
                        insert.Parameters.AddWithValue("@Date", newsDate.Text);
                        insert.Parameters.AddWithValue("@CtgryNo", ddlnewsCategory.SelectedValue);
                        insert.Parameters.AddWithValue("@Source", newsSource.Text);
                        insert.Parameters.AddWithValue("@Content", newsContent.Text);
                        insert.Parameters.AddWithValue("@Image", bytes);
                        insert.Parameters.AddWithValue("@newsId", newsHiddenId.Value);

                        conn.Open();
                        insert.ExecuteNonQuery();
                        conn.Close();
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