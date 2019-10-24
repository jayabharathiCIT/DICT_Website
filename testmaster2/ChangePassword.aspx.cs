using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;

namespace DICT_Website
{
    public partial class ChangePassword : System.Web.UI.Page
    {

        // string connectionString = @"Server=localhost;Database=dict website;Uid=root;Pwd=pass;";
        string strConnString = ConfigurationManager.ConnectionStrings["DICTMySqlConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
            protected void btnChangePassword_Click(object sender, EventArgs e)
            {
                try
                {
                    int ID = checkID();
                    int password = checkPassword();
                    if (ID == 1)
                    {
                        if (password == 1)
                        {
                            using (MySqlConnection sqlCon = new MySqlConnection(strConnString))
                            {
                                sqlCon.Open();
                                MySqlCommand sqlCmd = new MySqlCommand("sp_Register", sqlCon);
                                sqlCmd.CommandType = CommandType.StoredProcedure;

                                sqlCmd.Parameters.AddWithValue("P_Register_ID", txtID.Text);

                                string postCreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                                sqlCmd.Parameters.AddWithValue("P_Date_Change_Password", postCreatedDate);
                                sqlCmd.Parameters.AddWithValue("P_Password", checkPassword());
                                sqlCmd.ExecuteNonQuery();
                                lblSuccessMessage.Text = "Submitted Successfully";
                            }
                        }
                        else
                        {
                            //error to user.
                            lblErrorConfirm.Text = "The password and confirmation password do not match.";
                        }
                        // }
                    }
                    else
                    {
                        //error to user.
                        lblErrorID.Text = "Your ID Can not be blank.";
                    }
                    // }
                }
                catch (Exception ex)
                {
                    lblSuccessMessage.Text = ex.Message;
                }
            }

            public int checkID()
            {
                try
                {
                    // int id = Convert.ToInt32(this.txtID.Text);
                    if (txtID.Text != null && txtPassword1.Text != null && txtConfirmPassword.Text != null && txtNewPassword.Text != null)
                    {
                        return 1;
                    }
                    else
                    {
                        return 0;
                    }
                }
                catch (Exception es)
                {
                    lblSuccessMessage.Text = es.Message;
                    return 0;
                }
            }

            public int checkPassword()
            {
                try
                {
                    int pass = Convert.ToInt32(this.txtPassword1.Text);
                    int newpass = Convert.ToInt32(this.txtNewPassword.Text);
                    int confirmpass = Convert.ToInt32(this.txtConfirmPassword.Text);
                    if (newpass == confirmpass)
                    {
                        return 1;
                    }
                    else
                    {
                        return 0;
                    }
                }
                catch (Exception es)
                {
                    lblSuccessMessage.Text = es.Message;
                    return 0;
                }
            }


            protected void btnCancel_Click(object sender, EventArgs e)
            {
                Response.Redirect("~/HomePage.aspx");
            }

            protected void submit_Click(object sender, EventArgs e)
            {

            }
        }
    }