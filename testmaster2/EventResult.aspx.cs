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
        string id;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                id = Request.Params["EventID"];
                GetEvent(id);
            }

            lblCount.Enabled = false;
            if (Session["RegID"] != null)
            {
                String userid = Convert.ToString((int)Session["RegID"]);
                bool isAdminUser = verifyAdminUser(userid);
                if (isAdminUser)
                {
                    lblCount.Enabled = true;
                }
            }
           
            GetEventRegisterCount(id);

        }

        private void GetEventRegisterCount(string eventId)
        {
            MySqlConnection conn = new MySqlConnection(connStr);
            try
            {
                conn.Open();
                string sql = "SELECT COUNT(*) FROM dt_book_event WHERE Evt_ID = " + eventId;
                using (var cmd = new MySqlCommand(sql, conn))
                {
                    int count = Convert.ToInt32(cmd.ExecuteScalar());
                    lblCount.Text = "No. of Participants: " + count;
                }
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

                    MySqlCommand com = new MySqlCommand("DELETE FROM dt_event WHERE Evt_ID =" + eventid, conn);
                    com.ExecuteNonQuery();
                }

                Response.Redirect("~/EventResult.aspx");
            }
            if (e.CommandName.Equals("EditEvent"))
            {
                Response.Redirect("~/EditEvent?EvtID=" + eventid);
            }
            if(e.CommandName.Equals("RegisterEvent"))
            {
                Response.Redirect("~/EventRegister?EvtID=" + eventid);
            }

        }

        public string GetTime(string timeVal)
        {
            string formatVal = DateTime.Parse(timeVal).ToString("hh:mm tt");
            return formatVal;
        }

        protected Boolean verifyAdminUser(string AdminRegID)
        {
            bool isAdmin = false;
            DataTable dtAdmin = new DataTable();
            using (MySqlConnection sqlCon = new MySqlConnection(connStr))
            {
                sqlCon.Open();
                int adminRegID = Convert.ToInt32(AdminRegID);
                string Query = "SELECT* FROM `dict website`.dt_dict_admin where Register_ID =" + adminRegID + ";";
                MySqlCommand MyCommand = new MySqlCommand(Query, sqlCon);
                MySqlDataAdapter sqlDa = new MySqlDataAdapter();
                sqlDa.SelectCommand = MyCommand;
                sqlDa.Fill(dtAdmin);
                if (dtAdmin.Rows.Count > 0)
                {
                    isAdmin = true;
                }
                else
                {
                    isAdmin = false;
                }
            }
            return isAdmin;
        }
    }
}