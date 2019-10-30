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

        }
        protected void btnChangePassword_Click(object sender, EventArgs e)
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
                                ClientScript.RegisterStartupScript(Page.GetType(), "Message", "alert('successfully change the password!!');window.location='ChangePassword.aspx';", true);
                                lblSuccessMessage.Text = "successfully change the password!";
                            }
                            else
                            {
                                lblErrorConfirmPassword.ForeColor = System.Drawing.Color.Red;
                                lblErrorConfirmPassword.Text = "Password miss match";
                            }
                        }
                        else
                        {
                            lblErrorConfirmPassword.ForeColor = System.Drawing.Color.Red;
                            lblErrorPassword.Text = "Current password is incorrect";
                        }
                    }

                }

                catch (Exception ex)
                {
                    lblSuccessMessage.Text = ex.Message;
                }
            }

        }


        public int CheckAllRegisterValidation()
        {
            if (txtID.Text.Length == 0)
            {
                lblErrorID.Text = "*** Your ID can not be blank ***";
                return 0;
            }

            else if (txtPassword1.Text.Length == 0)
            {
                lblErrorPassword.Text = "*** Password can not be blank ***";
                return 0;
            }

            else if (txtNewPassword.Text.Length == 0)
            {
                lblErrorNewPassword.Text = "*** New password can not be blank ***";
                return 0;
            }
            else if (txtConfirmPassword.Text.Length == 0)
            {
                lblErrorConfirmPassword.Text = "*** Confirm password can not be blank ***";
                return 0;
            }

            else
            {
                return 1;
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
