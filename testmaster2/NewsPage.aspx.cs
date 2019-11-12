using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
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
            //GetLatestNews();
            GetAllNews();
        }


        
        public void GetAllNews()
        {
            MySqlConnection conn = new MySqlConnection(connStr);
            DataSet dtnews = new DataSet();
            DataTable lst_dtnews;
            DataTable nw_dtnews;
            DataTable cs_dtnews;
            DataTable sw_dtnews;
            DataTable sap_dtnews;
            DataTable game_dtnews;
            try
            {
                conn.Open();

                string sql = "SELECT * FROM dt_news";
                MySqlDataAdapter adapter = new MySqlDataAdapter(sql, conn);
                adapter.Fill(dtnews);

                lst_dtnews = dtnews.Tables[0].AsEnumerable().OrderBy(myRow => myRow.Field<int>("News_Id")).Take(4).CopyToDataTable();
                nw_dtnews = dtnews.Tables[0].AsEnumerable().Where(myRow => myRow.Field<int>("News_Ctgry_No") == 1 && myRow != null).OrderByDescending(myRow => myRow.Field<int>("News_Id")).Take(4).CopyToDataTable();
                cs_dtnews = dtnews.Tables[0].AsEnumerable().Where(myRow => myRow.Field<int>("News_Ctgry_No") == 2 && myRow != null).OrderByDescending(myRow => myRow.Field<int>("News_Id")).Take(4).CopyToDataTable();
              //  sw_dtnews = dtnews.Tables[0].AsEnumerable().Where(myRow => myRow.Field<int>("News_Ctgry_No") == 3 && myRow != null).OrderByDescending(myRow => myRow.Field<int>("News_Id")).Take(4).CopyToDataTable();
              //  sap_dtnews = dtnews.Tables[0].AsEnumerable().Where(myRow => myRow.Field<int>("News_Ctgry_No") == 4 && myRow != null).OrderByDescending(myRow => myRow.Field<int>("News_Id")).Take(4).CopyToDataTable();
              //  game_dtnews = dtnews.Tables[0].AsEnumerable().Where(myRow => myRow.Field<int>("News_Ctgry_No") == 5 && myRow != null).OrderByDescending(myRow => myRow.Field<int>("News_Id")).Take(4).CopyToDataTable();
                
                dlLatestNews.DataSource = lst_dtnews;
                dlLatestNews.DataBind();
                dlNetworkNews.DataSource = nw_dtnews;
                dlNetworkNews.DataBind();

                dlCyberNews.DataSource = cs_dtnews;
               dlCyberNews.DataBind();
              // dlSoftwareNews.DataSource = sw_dtnews;
              // dlSoftwareNews.DataBind();
              // dlSystemsNews.DataSource = sap_dtnews;
              //   dlSystemsNews.DataBind();
              //   dlGamesNews.DataSource = game_dtnews;
              //   dlGamesNews.DataBind();


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
            DataTable dtnews = new DataTable();
            try
            {
                conn.Open();

                string sql = "SELECT * FROM dt_news ORDER BY News_Id DESC limit 4";
                MySqlDataAdapter adapter = new MySqlDataAdapter(sql, conn);
                adapter.Fill(dtnews);


                dlLatestNews.DataSource = dtnews;
                dlLatestNews.DataBind();
                //Debug.WriteLine("Row length : " + dtnews.Rows.Count);

                /*DataRow pRow = dtnews.Rows[0];
                 DateTime dt = pRow.Field<DateTime>("News_Date");
                 lblDate.Text = dt.ToString("dd MMM yy");
                 lblLatestTitle.Text = pRow["News_Title"].ToString();
                 imgLatest.ImageUrl = "data:image/jpeg;base64," + Convert.ToBase64String((byte[])pRow["News_Image"]);*/

                //lstLatest.DataSource = dtnews;
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
            Response.Redirect("~/MoreNews.aspx");
        }

        protected void btnCyberNews_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MoreNews.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MoreNews.aspx");
        }

        protected void btnMoreSoftware_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MoreNews.aspx");
        }

        protected void btnSystemAnalysis_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MoreNews.aspx");
        }

        protected void btnMoreGame_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MoreNews.aspx");
        }
    }

}