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



        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            //get from post gridview .
            //get Register ID of the person                

            Label lblgrvCreatedBy = (Label)GridView1.FindControl("lblCreatedBy");
            int personRegisterID = Convert.ToInt32(lblgrvCreatedBy.Text);
            string constr = ConfigurationManager.ConnectionStrings["DICTMySqlConnectionString"].ConnectionString;
            using (MySqlConnection con = new MySqlConnection(constr))
            {
                using (MySqlCommand cmd = new MySqlCommand ("SELECT First_Name FROM dt_dict_persons where Register_ID=Register_ID"))
                using (MySqlDataAdapter sqlPerson = new MySqlDataAdapter())
                {
                    cmd.Connection = con;
                    sqlPerson.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sqlPerson.SelectCommand.Parameters.AddWithValue("Register_ID", personRegisterID);
                        sqlPerson.Fill(dt);
                        lblgrvCreatedBy.Text = dt.Rows[0][0].ToString();
                            
                    }
                }

            }
                  
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

        }

        protected Boolean HasEditPermission(int RegisterID)
        {
            bool showEDIT = false;
            if (Session["RegID"] == null)
            {
                showEDIT = false;
            }
            else
            {
                int loginUserID = (int)Session["RegID"];
                if (RegisterID == loginUserID)
                {
                    showEDIT = true;
                }
            }
            return showEDIT;
        }


    }

 }

