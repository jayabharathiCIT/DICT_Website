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
        DataTable dt;
        string connStr = ConfigurationManager.ConnectionStrings["DICTMySqlConnectionString"].ConnectionString;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                string constr = ConfigurationManager.ConnectionStrings["DICTMySqlConnectionString"].ConnectionString;
                using (MySqlConnection con = new MySqlConnection(constr))
                {
                    using (MySqlCommand cmd = new MySqlCommand("SELECT * FROM dt_announcement"))
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



        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            //fill grid view
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }



        protected void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AnnCreate.aspx");
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
              Button btn = (Button)sender;
            if (btn.CommandName == "Edit")
            {
                string getAnnIDArg = btn.CommandArgument.ToString();
                Response.Redirect("~/AnnEdit.aspx" + "?Announcement_ID=" + getAnnIDArg);
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                //Determine the RowIndex of the Row whose Button was clicked.
                // string rowIndex = e.CommandArgument.ToString();
                Response.Redirect("~/AnnEdit.aspx" + "?Announcement_ID=" + rowIndex.ToString());
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

        }

     

    }

 }

