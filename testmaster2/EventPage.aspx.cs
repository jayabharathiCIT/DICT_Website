using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace DICT_Website
{
    public partial class EventPage : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["DICTMySqlConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GetAllEvents();
        }

        public void GetAllEvents()
        {
            MySqlConnection conn = new MySqlConnection(connStr);
            //DataSet dtevent = new DataSet();
            DataSet lst_dtevents = new DataSet();
            try
            {
                conn.Open();
                //string today = DateTime.Today.ToString("yyyy-MM-dd");
                //string sql = "SELECT * FROM dt_event WHERE Evt_Date >= '" + today + "'";
                string sql = "SELECT * FROM dt_event";
                MySqlDataAdapter adapter = new MySqlDataAdapter(sql, conn);
                adapter.Fill(lst_dtevents);

                //lst_dtevents = dtevent.Tables[0].AsEnumerable().OrderBy(myRow => myRow.Field<int>("Evt_ID")).Take(4).CopyToDataTable();
                ListView1.DataSource = lst_dtevents;
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

        public string GetTime(string timeVal)
        {
            string formatVal = DateTime.Parse(timeVal).ToString("hh:mm tt");
            return formatVal;
        }

        public string GetShortTitle(string title, int size)
        {
            string formatVal = title.Length > size ? title.Substring(0, size) + "..." : title;
            return formatVal;
        }

    }
    
}