using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;


namespace DICT_Website
{
    public partial class ChangePassword : System.Web.UI.Page
    {

        // string connectionString = @"Server=localhost;Database=dict website;Uid=root;Pwd=1234;";
        string strConnString = ConfigurationManager.ConnectionStrings["DICTMySqlConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // check user is authenticated .
            // Start Check authorised user            
            if (Session["RegID"] == null)
                Response.Redirect("~/Login.aspx");
            else
            {
                String userid = Convert.ToString((int)Session["RegID"]);

                String username = Session["Username"].ToString();
                //String userrole = Session["Role"].ToString();
                lbluserInfo.Text = "Welcome , " + username + " ";
            }
            // End Check authorised user

        }
        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            if ((txtPassword1.Text.Length < 5) || (txtConfirmPassword.Text.Length < 5))
                ClientScript.RegisterStartupScript(Page.GetType(), "Message", "alert('Password should be numeric between 6 to 10!!')", true);
            else if ((txtPassword1.Text.Length > 10) || (txtConfirmPassword.Text.Length > 10))
                ClientScript.RegisterStartupScript(Page.GetType(), "Message", "alert('Password should be numeric between 6 to 10!!')", true);
            else
            {
                int validResult = CheckAllRegisterValidation();
                if (validResult == 1)
                {
                    try
                    {
                        lblErrorConfirmPassword.Text = "";
                        using (MySqlConnection sqlCon = new MySqlConnection(strConnString))
                        {
                            sqlCon.Open();

                            MySqlDataAdapter sqlCmd = new MySqlDataAdapter("sp_CheckPassword", sqlCon);
                            sqlCmd.SelectCommand.CommandType = CommandType.StoredProcedure;
                            sqlCmd.SelectCommand.Parameters.AddWithValue("P_Register_ID", txtID.Text);
                            sqlCmd.SelectCommand.Parameters.AddWithValue("P_Password", txtPassword1.Text);
                            //string postCreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                            //sqlCmd.SelectCommand.Parameters.AddWithValue("P_Date_Change_Password", postCreatedDate);
                            //sqlCmd.SelectCommand.ExecuteNonQuery();
                            DataTable dtbl = new DataTable();
                            sqlCmd.Fill(dtbl);

                            string username = dtbl.Rows[0][0].ToString();
                            string OLdpassword = dtbl.Rows[0][1].ToString();

                            if (OLdpassword == txtPassword1.Text)
                            {
                                if (txtNewPassword.Text == txtConfirmPassword.Text)
                                {
                                    DataTable dtblCon = new DataTable();
                                    MySqlDataAdapter sqlPass = new MySqlDataAdapter("sp_PasswordChange", sqlCon);
                                    sqlPass.SelectCommand.CommandType = CommandType.StoredProcedure;
                                    sqlPass.SelectCommand.Parameters.AddWithValue("P_Register_ID", txtID.Text);
                                    sqlPass.SelectCommand.CommandType = CommandType.StoredProcedure;
                                    sqlPass.SelectCommand.Parameters.AddWithValue("P_Password", txtNewPassword.Text);
                                    sqlPass.SelectCommand.CommandType = CommandType.StoredProcedure;
                                    string postCreatedDate1 = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                                    sqlPass.SelectCommand.Parameters.AddWithValue("P_Date_Change_Password", postCreatedDate1);

                                    sqlPass.SelectCommand.ExecuteNonQuery();

                                    Response.Write("<script>alert('successfully change the password!!'); ");
                                    Response.Write("window.location='ForumHomePage.aspx'</script>");
                                    //ClientScript.RegisterStartupScript(Page.GetType(), "Message", "alert('successfully change the password!!');window.location='DICT_Website.ForumHomePage.aspx';", true);
                                    //lblSuccessMessage.Text = "successfully change the password!";
                                }
                                else
                                {
                                    ClientScript.RegisterStartupScript(Page.GetType(), "Message", "alert('Password miss match!!')", true);
                                    //lblErrorConfirmPassword.ForeColor = System.Drawing.Color.Red;
                                    //lblErrorConfirmPassword.Text = "Password miss match";
                                }
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(Page.GetType(), "Message", "alert('Current password is incorrect!!')", true);
                                //lblErrorConfirmPassword.ForeColor = System.Drawing.Color.Red;
                                //lblErrorPassword.Text = "Current password is incorrect";
                            }
                        }

                    }

                    catch (Exception ex)
                    {
                        lblSuccessMessage.Text = ex.Message;
                    }
                }
            }

        }


        public int CheckAllRegisterValidation()
        {
            if (txtID.Text.Length == 0)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "Message", "alert('Your ID can not be blank !!')", true);
                //lblErrorID.Text = "*** Your ID can not be blank ***";
                return 0;
            }

            else if (txtPassword1.Text.Length == 0)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "Message", "alert('Password can not be blank !!')", true);
                // lblErrorPassword.Text = "*** Password can not be blank ***";
                return 0;
            }

            else if (txtNewPassword.Text.Length == 0)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "Message", "alert('New password can not be blank !!')", true);
                //lblErrorNewPassword.Text = "*** New password can not be blank ***";
                return 0;
            }
            else if (txtConfirmPassword.Text.Length == 0)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "Message", "alert('Confirm password can not be blank!!')", true);
                //lblErrorConfirmPassword.Text = "*** Confirm password can not be blank ***";
                return 0;
            }

            else
            {
                return 1;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ForumHomePage.aspx");
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ForumHomePage.aspx");
        }

        protected void ddlLogin_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlLogin.SelectedItem.Value == "4")
            {
                //ChangePassword
                Response.Redirect("~/AdminProfilePage.aspx");
            }
            if (ddlLogin.SelectedItem.Value == "1")
            {
                //ChangePassword
                Response.Redirect("~/ChangePassword.aspx");
            }
            if (ddlLogin.SelectedItem.Value == "2")
            {
                //DeleteAccount
                Response.Redirect("~/DeleteAccount.aspx");
            }
            if (ddlLogin.SelectedItem.Value == "3")
            {
                //Logout
                //clear session variables
                Session.Clear();
                Session.Remove("RegID");
                Session.Remove("Username");
                //redirect to login page
                Response.Redirect("~/Login.aspx");
            }
        }
    }
}
