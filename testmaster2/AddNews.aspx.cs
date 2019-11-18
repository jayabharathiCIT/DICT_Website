using System;
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
    public partial class AddNews : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["DICTMySqlConnectionString"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDropDownListData();
            }
            
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

                    using (MySqlCommand insert = new MySqlCommand("INSERT INTO dt_news (News_Title, News_Date, News_Ctgry_No, " +
                        "Source, News_Content, News_Image) VALUES(@Title, @Date, @CtgryNo, @Source, @Content, @Image)", conn))
                    {
                        insert.Parameters.AddWithValue("@Title", txtTitle.Text);
                        insert.Parameters.AddWithValue("@Date", txtDate.Text);
                        insert.Parameters.AddWithValue("@CtgryNo", ddlCategory.SelectedValue);
                        insert.Parameters.AddWithValue("@Source", txtSource.Text);
                        insert.Parameters.AddWithValue("@Content", txtContent.Text);
                        insert.Parameters.AddWithValue("@Image", bytes);

                        conn.Open();
                        insert.ExecuteNonQuery();
                        conn.Close();
                    }

                    txtTitle.Text = " ";
                    txtDate.Text = " ";
                    
                    txtSource.Text = " ";
                    txtContent.Text = " ";
                }
            }

            Response.Redirect("~/NewsPage.aspx");

        }
       

        public void BindDropDownListData()
        {

            MySqlConnection conn = new MySqlConnection(connStr);
            DataTable news_categories = new DataTable();
            try
            {
                Debug.WriteLine("Connecting to MySQL...");
                conn.Open();

                string sql = "SELECT * FROM dt_news_ctgry";
                MySqlDataAdapter adapter = new MySqlDataAdapter(sql, conn);
                adapter.Fill(news_categories);

                ddlCategory.DataSource = news_categories;
                ddlCategory.DataTextField = "News_Catgry_Name";
                ddlCategory.DataValueField = "News_Ctgry_No";
                ddlCategory.DataBind();

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

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/HomePage.aspx");
        }
    }
}