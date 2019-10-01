using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DICT_Website
{
    public partial class ForumHomePage : System.Web.UI.Page
    {
        DataTable dt;
        string strConnString = ConfigurationManager.ConnectionStrings["DICTMySqlConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            dt = new DataTable();
            using (MySqlConnection sqlCon = new MySqlConnection(strConnString))
            {                
                sqlCon.Open();
                MySqlDataAdapter sqlDa = new MySqlDataAdapter("sp_PostViewAll", sqlCon);
                sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;               
                sqlDa.Fill(dt);                               
                
            }

            //fill grid view
            gv_ForumDetails.DataSource = dt;
            gv_ForumDetails.DataBind();
            getRecentPost();
        }

        public void getRecentPost()
        {
            DataView dv = new DataView(dt);
            dv.Sort = "Date_Posted DESC";
            DataTable sortedbyDateDT = new DataTable();
            sortedbyDateDT = dv.ToTable();
            if(sortedbyDateDT.Rows.Count  >= 3)
            {
                if (sortedbyDateDT.Rows[0]["Topic_Title"].ToString().Length > 30)
                {
                    lnkTop1.Text = sortedbyDateDT.Rows[0]["Topic_Title"].ToString().Substring(0, 30);
                    lnkTop1.ToolTip = sortedbyDateDT.Rows[0]["Post_ID"].ToString();
                }
                else
                {
                    lnkTop1.Text = sortedbyDateDT.Rows[0]["Topic_Title"].ToString();
                    lnkTop1.ToolTip = sortedbyDateDT.Rows[0]["Post_ID"].ToString();
                }
                if (sortedbyDateDT.Rows[1]["Topic_Title"].ToString().Length > 30)
                {
                    lnkTop2.Text = sortedbyDateDT.Rows[1]["Topic_Title"].ToString().Substring(0, 30);
                    lnkTop2.ToolTip = sortedbyDateDT.Rows[1]["Post_ID"].ToString();
                }
                else
                {
                    lnkTop2.Text = sortedbyDateDT.Rows[1]["Topic_Title"].ToString();
                    lnkTop2.ToolTip = sortedbyDateDT.Rows[1]["Post_ID"].ToString();
                }
                if (sortedbyDateDT.Rows[2]["Topic_Title"].ToString().Length > 30)
                {
                    lnkTop3.Text = sortedbyDateDT.Rows[2]["Topic_Title"].ToString().Substring(0, 30);
                    lnkTop3.ToolTip = sortedbyDateDT.Rows[2]["Post_ID"].ToString();
                }
                else
                {
                    lnkTop3.Text = sortedbyDateDT.Rows[2]["Topic_Title"].ToString();
                    lnkTop3.ToolTip = sortedbyDateDT.Rows[2]["Post_ID"].ToString();
                }
            }
            else if(sortedbyDateDT.Rows.Count == 2)
            {
                if (sortedbyDateDT.Rows[0]["Topic_Title"].ToString().Length > 30)
                {
                    lnkTop1.Text = sortedbyDateDT.Rows[0]["Topic_Title"].ToString().Substring(0, 30);
                    lnkTop1.ToolTip = sortedbyDateDT.Rows[0]["Post_ID"].ToString();
                }
                else
                {
                    lnkTop1.Text = sortedbyDateDT.Rows[0]["Topic_Title"].ToString();
                    lnkTop1.ToolTip = sortedbyDateDT.Rows[0]["Post_ID"].ToString();
                }
                if (sortedbyDateDT.Rows[1]["Topic_Title"].ToString().Length > 30)
                {
                    lnkTop2.Text = sortedbyDateDT.Rows[1]["Topic_Title"].ToString().Substring(0, 30);
                    lnkTop2.ToolTip = sortedbyDateDT.Rows[1]["Post_ID"].ToString();

                }
                else
                {
                    lnkTop2.Text = sortedbyDateDT.Rows[1]["Topic_Title"].ToString();
                    lnkTop2.ToolTip = sortedbyDateDT.Rows[1]["Post_ID"].ToString();

                }
                lnkTop3.Visible = false;
            }
            else if (sortedbyDateDT.Rows.Count ==1)
            {
                if (sortedbyDateDT.Rows[0]["Topic_Title"].ToString().Length > 30)
                {
                    lnkTop1.Text = sortedbyDateDT.Rows[0]["Topic_Title"].ToString().Substring(0, 30);
                    lnkTop1.ToolTip = sortedbyDateDT.Rows[0]["Post_ID"].ToString();

                }
                else
                {
                    lnkTop1.Text = sortedbyDateDT.Rows[0]["Topic_Title"].ToString();
                    lnkTop1.ToolTip = sortedbyDateDT.Rows[0]["Post_ID"].ToString();

                }
                lnkTop2.Visible = false;
                lnkTop3.Visible = false;
            }
        }
       

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            DataTable dtbl = new DataTable();
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                GridViewRow grv = (GridViewRow)e.Row;

                Label lblgrvCategory = (Label)grv.FindControl("lblCategory");
                if (lblgrvCategory.Text == "1")
                {
                    lblgrvCategory.Text = "Programming";
                }
                else if(lblgrvCategory.Text== "2")
                {
                    lblgrvCategory.Text = "Designing";
                }
                else if (lblgrvCategory.Text == "3")
                {
                    lblgrvCategory.Text = "Networking";
                }
                else
                {
                    lblgrvCategory.Text = "Security";
                }

                //get from post gridview .
                //get Register ID of the person                
                    Label lblgrvCreatedby = (Label)grv.FindControl("lblCreatedBy");
                    int personRegisterID = Convert.ToInt32(lblgrvCreatedby.Text);
                using (MySqlConnection sqlCon = new MySqlConnection(strConnString))
                {
                    MySqlDataAdapter sqlPerson = new MySqlDataAdapter("sp_FristNameByID", sqlCon);
                    sqlPerson.SelectCommand.CommandType = CommandType.StoredProcedure;
                    sqlPerson.SelectCommand.Parameters.AddWithValue("registerID", personRegisterID);
                    sqlPerson.SelectCommand.CommandType = CommandType.StoredProcedure;
                    sqlPerson.Fill(dtbl);
                    lblgrvCreatedby.Text = dtbl.Rows[0][0].ToString();
                }
                
                
            }
        }


        private void btnReply_Click(object sender, EventArgs e)
        {
            throw new NotImplementedException();
        }

        protected void btnCreatePost_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AddForumPost.aspx");
        }

        protected void lnkProgramming_Click(object sender, EventArgs e)
        {
            DataView dataView = dt.DefaultView;
            dataView.RowFilter = "Category_ID = '" + 1 + "'";
            gv_ForumDetails.DataSource = dataView;
            gv_ForumDetails.DataBind();

        }

        protected void lnkDesign_Click(object sender, EventArgs e)
        {
            DataView dataView = dt.DefaultView;
            dataView.RowFilter = "Category_ID = '" + 2 + "'";
            gv_ForumDetails.DataSource = dataView;
            gv_ForumDetails.DataBind();
        }

        protected void lnkNetwork_Click(object sender, EventArgs e)
        {
            DataView dataView = dt.DefaultView;
            dataView.RowFilter = "Category_ID = '" + 3 + "'";
            gv_ForumDetails.DataSource = dataView;
            gv_ForumDetails.DataBind();
        }

        protected void lnkSecuity_Click(object sender, EventArgs e)
        {
            DataView dataView = dt.DefaultView;
            dataView.RowFilter = "Category_ID = '" + 4 + "'";
            gv_ForumDetails.DataSource = dataView;
            gv_ForumDetails.DataBind();
        }

        protected void lnkTop1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewandReplyPost.aspx" + "?PostID=" + lnkTop1.ToolTip);
        }

        protected void lnkTop2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewandReplyPost.aspx" + "?PostID=" + lnkTop2.ToolTip);
        }

        protected void lnkTop3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewandReplyPost.aspx" + "?PostID=" + lnkTop3.ToolTip);
        }
    }
}