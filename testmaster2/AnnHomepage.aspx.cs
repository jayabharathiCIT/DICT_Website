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
    public partial class AnnHomepage : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["DICTMySqlConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                string constr = ConfigurationManager.ConnectionStrings["DICTMySqlConnectionString"].ConnectionString;
                using (MySqlConnection con = new MySqlConnection(constr))
                {
                    using (MySqlCommand cmd = new MySqlCommand("SELECT * FROM dt_announcement_id"))
                    {
                        using (MySqlDataAdapter da = new MySqlDataAdapter())
                        {
                            cmd.Connection = con;
                            da.SelectCommand = cmd;
                            using (DataTable dt = new DataTable())
                            {
                                da.Fill(dt);
                                GridView1.DataSource = dt;
                                GridView1.DataBind();
                            }
                        }
                    }
                }
            }
        }

    }
}