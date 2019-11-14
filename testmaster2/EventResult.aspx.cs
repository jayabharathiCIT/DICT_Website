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
    public partial class EventResult : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["DICTMySqlConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                string id = Request.Params["EventID"];
                GetEvent(id);
            }



        }
        public void GetEvent(String evtid)
        {
            MySqlConnection conn = new MySqlConnection(connStr);
            DataTable dtevent = new DataTable();
            try
            {
                conn.Open();
                string sql = "SELECT * FROM dt_event WHERE Evt_ID = " + evtid;
                MySqlDataAdapter adapter = new MySqlDataAdapter(sql, conn);
                adapter.Fill(dtevent);

                Repeater1.DataSource = dtevent;
                Repeater1.DataBind();
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
        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            Button Edit = e.Item.FindControl("btnEdit") as Button;
            Button Delete = e.Item.FindControl("btnDelete") as Button;
            // Start Check authorised user            
            if (Session["RegID"] == null)
            {
                Edit.Visible = false;
                Delete.Visible = false;
            }
            else
            {
                String userid = Convert.ToString((int)Session["RegID"]);
                String username = Session["Username"].ToString();
                String userrole = Session["Role"].ToString();
                if (userrole == "Admin")
                {
                    Edit.Visible = true;
                    Delete.Visible = true;
                }

            }

        }
        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            var eventid = int.Parse(e.CommandArgument.ToString());
            if (e.CommandName.Equals("DeleteEvent"))
            {
                using (MySqlConnection conn = new MySqlConnection(connStr))
                {
                    conn.Open();

                    MySqlCommand com = new MySqlCommand("DELETE FROM dict_website.dt_event WHERE Evt_ID =" + eventid, conn);
                    com.ExecuteNonQuery();
                }

                Response.Redirect("~/NewsPage.aspx");
            }
            if (e.CommandName.Equals("EditEvent"))
            {
                Response.Redirect("~/EditEvent?EvtID=" + eventid);
            }

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {

        }
    }
}