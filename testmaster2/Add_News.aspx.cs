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

namespace DICT_Website
{
    // string connectionString = @"Server=localhost;Database=dict website;Uid=root;Pwd=pass;";
    // string strConnString = ConfigurationManager.ConnectionStrings["DICTMySqlConnectionString"].ConnectionString;
    public partial class Add_News : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BindDropDownListData();
        }
        public void BindDropDownListData()
        {
            // connection string
            string connectionString = ConfigurationManager.ConnectionStrings["DICTMySqlConnectionString"].ConnectionString;

            using (SqlConnection mySqlConnection = new SqlConnection(connectionString))
            {
                try
                {
                    // open the Sql connection
                    mySqlConnection.Open();

                    // Sql Command object initialized with SQL query to retrieve the categories
                    SqlCommand mySqlCommand = new SqlCommand("Select News_Ctgry_No, News_Catgry_Name from dt_news_ctgry", mySqlConnection);

                    // Sql Data Adapter object initialized by passing the Sql Command object
                    SqlDataAdapter mySqlDataAdapter = new SqlDataAdapter(mySqlCommand);

                    // DataSet object to store the retrieved SQL data items
                    DataSet myDataSet = new DataSet();

                    // fill the DataSet
                    mySqlDataAdapter.Fill(myDataSet);

                    // Set DataSet object as DataSource for the DropDownList
                    ctgry.DataSource = myDataSet;

                    // Specify the Field Name that you want to display as
                    // text for DropDownList item
                    ctgry.DataTextField = "News_Catgry_Name";

                    // Specify the Field Name that you want to use as
                    // value for each list item
                    ctgry.DataValueField = "News_Ctgry_No";

                    // Finalize the DataBinding
                    ctgry.DataBind();

                }
                catch (Exception ex)
                {
                    //Label1.Text = ex.Message;
                }
                finally
                {
                    // close the Sql Connection
                    mySqlConnection.Close();
                }
            }
        }
    }
}