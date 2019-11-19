using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;


namespace DICT_Website
{

    public partial class NewsPage : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["DICTMySqlConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GetLatestNews();
            GetAllNews();
            //GetAllNews_Old();
        }


        public void GetAllNews()
        {
            MySqlConnection conn = new MySqlConnection(connStr);
            DataSet dtnews = new DataSet();
             
            try
            {
                conn.Open();

                string sql = "SELECT News_Ctgry_No, MAX(`dt_news`.`News_Id`) News_Id, News_Title, News_Content, " +
                    "News_Ctgry_No, News_Date, News_Image FROM dt_news GROUP BY  News_Ctgry_No;";
                MySqlDataAdapter adapter = new MySqlDataAdapter(sql, conn);
                adapter.Fill(dtnews);

                dlCategoryNews.DataSource = dtnews;
                dlCategoryNews.DataBind();

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
       
        public void GetLatestNews()
        {
            MySqlConnection conn = new MySqlConnection(connStr);
            DataSet dtnews = new DataSet();
            try
            {
                conn.Open();

                string sql = "SELECT * FROM dt_news ORDER BY News_Id DESC limit 3";

                MySqlDataAdapter adapter = new MySqlDataAdapter(sql, conn);
                adapter.Fill(dtnews);

                DataRow pRow = dtnews.Tables[0].Rows[0];
                newsimage0.ImageUrl = "data:image/jpeg;base64," + Convert.ToBase64String((byte[])pRow["News_Image"]);
                newslink0.Text = pRow["News_Title"].ToString();
                newslink0.NavigateUrl = "NewsResult.aspx?NewsId=" + pRow["News_Id"];
                newsTextLabel0.Text = pRow["News_Content"].ToString().Substring(0, 250) + "...";
                //newsDateLabel0.Text = ((DateTime)pRow["News_Date"]).ToString("MMM dd");

                DataRow pRow1 = dtnews.Tables[0].Rows[1];
                newsimage1.ImageUrl = "data:image/jpeg;base64," + Convert.ToBase64String((byte[])pRow1["News_Image"]);
                newsLink1.Text = pRow1["News_Content"].ToString().Length > 200 ? pRow1["News_Content"].ToString().Substring(0, 200) + "..." : pRow1["News_Content"].ToString();
                newsLink1.NavigateUrl = "NewsResult.aspx?NewsId=" + pRow1["News_Id"];
                //newsDateLabel1.Text = ((DateTime)pRow1["News_Date"]).ToString("MMM dd");


                DataRow pRow2 = dtnews.Tables[0].Rows[2];
                newsimage2.ImageUrl = "data:image/jpeg;base64," + Convert.ToBase64String((byte[])pRow2["News_Image"]);
                newsLink2.Text = pRow2["News_Title"].ToString();
                newsLink2.NavigateUrl = "NewsResult.aspx?NewsId=" + pRow2["News_Id"];
                //newsDateLabel2.Text = ((DateTime)pRow2["News_Date"]).ToString("MMM dd");

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

        protected void btnMoreNetwork_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MoreNews.aspx?type=1");
        }

        protected void btnCyberNews_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MoreNews.aspx?type=2");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MoreNews.aspx");
        }

        protected void btnMoreSoftware_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MoreNews.aspx?type=3");
        }

        protected void btnSystemAnalysis_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MoreNews.aspx?type=4");
        }

        protected void btnMoreGame_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MoreNews.aspx?type=5");
        }

        public string GetCatDescription(string CategoryNo)
        {
            CategoryEnum catValue = (CategoryEnum)Enum.Parse(typeof(CategoryEnum), CategoryNo);
            
            
            Type genericEnumType = catValue.GetType();
            MemberInfo[] memberInfo = genericEnumType.GetMember(catValue.ToString());
            if ((memberInfo != null && memberInfo.Length > 0))
            {
                var _Attribs = memberInfo[0].GetCustomAttributes(typeof(System.ComponentModel.DescriptionAttribute), false);
                if ((_Attribs != null && _Attribs.Count() > 0))
                {
                    return ((System.ComponentModel.DescriptionAttribute)_Attribs.ElementAt(0)).Description;
                }
            }
            return "All";
        }

        public enum CategoryEnum
        {
            [Description("Networking")]
            Networking = 1,
            [Description("Cyber Security")]
            CyberSec = 2,
            [Description("Software Development")]
            SoftDev = 3,
            [Description("Design System")]
            SystemAP = 4,
            [Description("Games and Virtual World")]
            GamesAndVW = 5
        }
    }

}