using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DICT_Website
{
    public partial class MoreNews : System.Web.UI.Page
    {
        string newsType;
        string connStr = ConfigurationManager.ConnectionStrings["DICTMySqlConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                newsType = Request.Params["type"];
                Debug.WriteLine("newstype: " + newsType);
                GetAllNews(newsType);
            }
            
        }

        public void GetAllNews(String newsType)
        {
            MySqlConnection conn = new MySqlConnection(connStr);
            DataSet dtnews = new DataSet();
            try
            {
                conn.Open();

                string sql = "SELECT * FROM dt_news WHERE News_Ctgry_No="+ newsType + " ORDER BY News_Date DESC";
                MySqlDataAdapter adapter = new MySqlDataAdapter(sql, conn);
                adapter.Fill(dtnews);

                ListView1.DataSource = dtnews;
                ListView1.DataBind();

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

        public string GetShortTitle(string title, int size)
        {
            string formatVal = title.Length > size ? title.Substring(0, size) + "..." : title;
            return formatVal;
        }

        protected void buttonBack_Click(object sender, EventArgs e)
        {
            
         Response.Redirect("~/NewsPage.aspx");
           
        }
    }
}