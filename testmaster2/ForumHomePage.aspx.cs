using System;
using System.Collections.Generic;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            dt = new DataTable();
            DataColumn col = new DataColumn(); ;
            col = new DataColumn("Topic_Title");
            dt.Columns.Add(col);
            col = new DataColumn("Topic_Description");
            dt.Columns.Add(col);
            col = new DataColumn("CreatedBy");
            dt.Columns.Add(col);
            col = new DataColumn("Category");
            dt.Columns.Add(col);
            col = new DataColumn("PostedOn");
            dt.Columns.Add(col);
            col = new DataColumn("Reply");
            dt.Columns.Add(col);
            DataRow dr = dt.NewRow();
            dr["Topic_Title"] = "how to create ASP.NET GridView custom CSS style";
            dr["Topic_Description"] = "please share links of gridview asp.net";
            dr["CreatedBy"] = "244332";
            dr["Category"] = "Designing";
            dr["PostedOn"] = "16 Sep 2019 4P.M";
            dr["Reply"] = "8";
            dt.Rows.Add(dr);

            gv_ForumDetails.DataSource = dt;
            gv_ForumDetails.DataBind();
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
               // e.Row.Cells[0].Text = string.Format("{0} {1}", DataBinder.Eval(e.Row.DataItem, "Topic_Title"),Environment.NewLine, DataBinder.Eval(e.Row.DataItem, "Topic_Description"));
               // e.Row.Cells[1].Text = string.Format("{0} {1} {2}", DataBinder.Eval(e.Row.DataItem, "CreatedBy"), DataBinder.Eval(e.Row.DataItem, "Category"), DataBinder.Eval(e.Row.DataItem, "PostedOn"));
                //Button btnreply = new Button();
                //btnreply.ID = "btnReply";
                //btnreply.Text = "Reply";
                //e.Row.Cells[2].Controls.Add(btnreply);

                //create a new button
              //  Button btnReply = new Button();
               // btnReply.Text = "Reply Now";

                //add a click handler to the button
               // btnReply.Click += btnReply_Click;

                //add the button to the footer row
               // e.Row.Cells[2].Controls.Add(btnReply);
               // e.Row.Cells[2].Text = string.Format("{0}", DataBinder.Eval(e.Row.DataItem, "Reply"));

            }            
        }

        private void btnReply_Click(object sender, EventArgs e)
        {
            throw new NotImplementedException();
        }
    }
}