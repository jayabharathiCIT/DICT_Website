using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace DICT_Website
{
    public partial class NewsResult : System.Web.UI.Page
    {
        static string newsType;

        string connStr = ConfigurationManager.ConnectionStrings["DICTMySqlConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {            
           


            if (!IsPostBack)
            {
                string id = Request.Params["NewsId"];
                GetNews(id);
            }



        }
        public void GetNews(String newsid)
        {
            MySqlConnection conn = new MySqlConnection(connStr);
            DataTable dtnews = new DataTable();
            try
            {
                conn.Open();
                string sql = "SELECT * FROM dt_news WHERE News_Id = " + newsid;
                MySqlDataAdapter adapter = new MySqlDataAdapter(sql, conn);
                adapter.Fill(dtnews);
                newsType = dtnews.Rows[0]["News_Ctgry_No"].ToString();
                Repeater1.DataSource = dtnews;
                Repeater1.DataBind();
                /*
                Panel1.DataBind();
                DataRow pRow = dtnews.Rows[0];
                DateTime dt = pRow.Field<DateTime>("News_Date");
                newsdate.Text = dt.ToString("dd MMM yy");
                title.Text = pRow["News_Title"].ToString();
                newsimage.ImageUrl = "data:image/jpeg;base64," + Convert.ToBase64String((byte[])pRow["News_Image"]);
                Content.Text = pRow["News_Content"].ToString();
                Source.Text = pRow["Source"].ToString();
                */

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




        protected void btnEdit_Click(object sender, EventArgs e)
        {

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
            var newsid = int.Parse(e.CommandArgument.ToString());
            if (e.CommandName.Equals("DeleteNews"))
            {
                using (MySqlConnection conn = new MySqlConnection(connStr))
                {
                    conn.Open();

                    MySqlCommand com = new MySqlCommand("DELETE FROM dt_news WHERE News_Id =" + newsid, conn);
                    com.ExecuteNonQuery();
                }

                DisplayAlert("Successfully deleted the News", "MoreNews.aspx?type=" +newsType);
            }
            if (e.CommandName.Equals("EditNews"))
            {
                Response.Redirect("~/EditNews?NewsId=" + newsid);
            }

        }
        protected virtual void DisplayAlert(string message, string redirectFile)
        {
            ClientScript.RegisterStartupScript(
              this.GetType(),
              Guid.NewGuid().ToString(),
              string.Format("alert('{0}');window.location.href = '" + redirectFile + "'",
                message.Replace("'", @"\'").Replace("\n", "\\n").Replace("\r", "\\r")),
                true);
        }
    }
}
