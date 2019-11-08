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
        string connStr = ConfigurationManager.ConnectionStrings["DICTMySqlConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
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

                
                gv_Networking.DataSource = nw_dtnews;
                gv_Networking.DataBind();
                gv_CyberSec.DataSource = cs_dtnews;
                gv_CyberSec.DataBind();

                //  dlCyberNews.DataSource = cs_dtnews;
                // dlCyberNews.DataBind();
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
    }
}