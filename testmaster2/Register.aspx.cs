using System;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;
using System.Web.UI.WebControls;

namespace DICT_Website
{
    public partial class Register : System.Web.UI.Page
    {
        // string connectionString = @"Server=localhost;Database=dict website;Uid=root;Pwd=1234;";
        string strConnString = ConfigurationManager.ConnectionStrings["DICTMySqlConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreatePost_Click(object sender, EventArgs e)
        {
            try
            {
                int password = checkPassword();

                if (password == 1)
                {
                    int validResult = CheckAllRegisterValidation();
                    if (validResult == 1 && password == 1)

                        using (MySqlConnection sqlCon = new MySqlConnection(strConnString))
                        {
                            sqlCon.Open();
                            MySqlCommand sqlCmd = new MySqlCommand("sp_Register", sqlCon);
                            sqlCmd.CommandType = CommandType.StoredProcedure;

                            sqlCmd.Parameters.AddWithValue("P_Register_ID", txtID.Text);
                            sqlCmd.Parameters.AddWithValue("P_First_Name", txtFirstname.Text);
                            sqlCmd.Parameters.AddWithValue("P_Last_Name", txtLastname.Text);
                            sqlCmd.Parameters.AddWithValue("P_Password", txtPassword1.Text);

                            //string txtDate = tbDate.Text;
                            //DateTime DTdob = Convert.ToDateTime(txtDate);
                            //string getDob = DTdob.ToString("dd-MM-yy");
                            sqlCmd.Parameters.AddWithValue("P_Date_of_Birth", tbDate.Text);
                            sqlCmd.Parameters.AddWithValue("P_Email", txtEmail.Text);

                            string postCreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                            sqlCmd.Parameters.AddWithValue("P_Date_Change_Password", postCreatedDate);

                            string StatusForgetPassword = "No";
                            sqlCmd.Parameters.AddWithValue("P_Forgetpassword", StatusForgetPassword);
                            sqlCmd.ExecuteNonQuery();
                            ClientScript.RegisterStartupScript(Page.GetType(), "Message", "alert('Registered Successfully!');window.location='Login.aspx';", true);
                            //lblSuccessMessage.Text = "Submitted Successfully";
                        }
                }
                else
                {
                    //error to user.
                    ClientScript.RegisterStartupScript(Page.GetType(), "Message", "alert('The password and confirmation password do not match!!')", true);
                    //lblErrorConfirmPassword.Text = "The password and confirmation password do not match.";
                }
            }

            catch (Exception ex)
            {
                lblSuccessMessage.Text = ex.Message;
            }
        }

        public int checkPassword()
        {
            try
            {
                int pass = Convert.ToInt32(this.txtPassword1.Text);
                int confirmpass = Convert.ToInt32(this.txtConfirmPassword.Text);
                if (pass == confirmpass)
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

        public int CheckAllRegisterValidation()
        {
            if (txtID.Text.Length == 0)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "Message", "alert('Your ID can not be blank!!')", true);
               // lblErrorID.Text = "*** Your ID can not be blank ***";
                return 0;
            }
            else if (txtFirstname.Text.Length == 0)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "Message", "alert('First name can not be blank!!')", true);
               // lblErrorFirstname.Text = "*** First name can not be blank ***";
                return 0;
            }
            else if (txtLastname.Text.Length == 0)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "Message", "alert('Last name can not be blank!!')", true);
                //lblErrorLastname.Text = "*** Last name can not be blank ***";
                return 0;
            }
            if (txtPassword1.Text.Length == 0)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "Message", "alert('Password can not be blank!!')", true);
                //lblErrorPassword.Text = "*** Password can not be blank ***";
                return 0;
            }
            else if (txtConfirmPassword.Text.Length == 0)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "Message", "alert('Confirm password can not be blank!!')", true);
                //lblErrorConfirmPassword.Text = "*** Confirm password can not be blank ***";
                return 0;
            }
            else if (tbDate.Text.Length == 0)
            {
               // ClientScript.RegisterStartupScript(Page.GetType(), "Message", "alert('You must select your date of birth!!')", true);
                lblErrorDOB.Text = "*** You must select your date of birth ***";
                return 0;
            }
            if (txtEmail.Text.Length == 0)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "Message", "alert('Email can not be blank!!')", true);
                //lblErrorEmail.Text = "*** Email can not be blank ***";
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