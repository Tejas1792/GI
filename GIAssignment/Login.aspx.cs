using System;
using System.Text;
using RestSharp;
using System.Collections.Generic;
using System.Net;
using System.Collections.Specialized;
using System.IO;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

namespace GIAssignment
{
    public partial class Login : System.Web.UI.Page
    {
        DataSet ds = new DataSet();
        SqlConnection con;
        public static string generatenumber;
              
        protected void Page_Load(object sender, EventArgs e)
        {
            //prevents from loading page on click
            if (!Page.IsPostBack == true)
            {
                trphone.Visible = false;
                trsendotp.Visible = false;
                trreceiveotp.Visible = false;
                trverifyotp.Visible = false;
                tremailid.Visible = false;
                trname.Visible = false;
                trregister.Visible = false;
            }

        }

        protected void lnklogin_Click(object sender, EventArgs e)
        {
            if (trphone.Visible == true)
            {
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
            else
            {
                trphone.Visible = true;
                trsendotp.Visible = true;
            }

        }

        public void lnksignup_Click(object sender, EventArgs e)
        {
            Session["checklink"] = lnksignup.Text;

            if (trphone.Visible == true)
            {
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
            else
            {
                trphone.Visible = true;
                trsendotp.Visible = true;
            }

            if (lblOTPmessage.Text == "Sucessfull")
            {
                tremailid.Visible = true;
                trname.Visible = true;
                trregister.Visible = true;
            }
        }

        protected void btngetOTP_Click(object sender, EventArgs e)
        {
            if (txtCellNo.Text == "")
            {
                lblOTPmessage1.Text = "Enter your Mobile No.";
            }
            else
            {
                trreceiveotp.Visible = true;
                trverifyotp.Visible = true;
                SendOTP();
            }
            
        }

        protected void btnOTPVerify_Click(object sender, EventArgs e)
        {
            VerifyOTP();

            if (Session["checklink"] != null)
            {
                tremailid.Visible = true;
                trname.Visible = true;
                trregister.Visible = true;
            }
            else
            {
                Session.Abandon();
                CheckNoinDB();
            }
            
        }

        protected void btnregister_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\64220\OneDrive\Desktop\GI Assignment\GIAssignment\GIAssignment\App_Data\GIAssignment.mdf;Integrated Security=True");
            SqlCommand cmd = new SqlCommand();
            
            try
            {
                cmd = new SqlCommand("SPInsert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter spName = cmd.Parameters.Add("@Name", SqlDbType.VarChar, 50);
                spName.Value = txtName.Text;

                SqlParameter spEmailID = cmd.Parameters.Add("@EmailID", SqlDbType.Char, 50);
                spEmailID.Value = txtEmail.Text;

                SqlParameter spPhoneNo = cmd.Parameters.Add("@MobileNo", SqlDbType.Char, 20);
                spPhoneNo.Value = txtCellNo.Text;

                con.Open();
                cmd.ExecuteNonQuery();

            }

            catch (Exception)
            {
                lblMessage.Text = "Try again";
            }
            finally
            {
                con.Close();
                lblMessage.Text = ""+ txtName.Text + " is now registered.";
            }

        }

        public void SendOTP()
        {
            String result;
            string apiKey = "4103ee04-c476-11eb-8089-0200cd936042";
            string numbers = txtCellNo.Text;
            
            Random rnd = new Random();
            generatenumber = (rnd.Next(1000, 9999)).ToString();
            
            String url = "https://2factor.in/API/V1/" + apiKey + "/SMS/" + numbers + "/" + generatenumber +"/OTP";
            
            //refered to third party for API code and url string

            StreamWriter myWriter = null;
            HttpWebRequest objRequest = (HttpWebRequest)WebRequest.Create(url);

            objRequest.Method = "POST";
            objRequest.ContentLength = Encoding.UTF8.GetByteCount(url);
            objRequest.ContentType = "application/x-www-form-urlencoded";
            try
            {
                myWriter = new StreamWriter(objRequest.GetRequestStream());
                myWriter.Write(url);
            }
            catch
            {
                lblOTPmessage1.Text = "Enter Valid Contact Number";
            }
            finally
            {
                myWriter.Close();
            }

            HttpWebResponse objResponse = (HttpWebResponse)objRequest.GetResponse();
            using (StreamReader sr = new StreamReader(objResponse.GetResponseStream()))
            {
                result = sr.ReadToEnd();
                sr.Close();
            }

            lblOTPmessage.Text = "OTP Sent";
        }

        public void VerifyOTP()
        {
            if(txtOTP.Text == generatenumber)
            {
                lblOTPmessage.Text = "OTP Verified, Thank you";
            }
            else
            {
                lblOTPmessage.Text = "Incorrect OTP";
            }
            
        }

        public void CheckNoinDB()
        {
            // Enter Your Connectionstring
            con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\64220\OneDrive\Desktop\GI Assignment\GIAssignment\GIAssignment\App_Data\GIAssignment.mdf;Integrated Security=True");
            SqlCommand cmd = new SqlCommand();
            
            try
            {
                cmd = new SqlCommand("CheckUser", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter spPhoneNo = cmd.Parameters.Add("@MobileNo", SqlDbType.Char, 20); 
                spPhoneNo.Value = txtCellNo.Text;
                con.Open();

                //cmd.Parameters["@MobileNo"].Direction = ParameterDirection.Output;
                var result = cmd.ExecuteScalar();
                cmd.ExecuteNonQuery();
                
                if (result == null)
                {
                    lblMessage.Text = "Please Sign-Up for GI Assesment, Thank you";
                }
                else
                {
                    lblMessage.Text = "You have already signed in, Thank you";
                }
            }

            catch (Exception)
            {
                lblMessage.Text = "Try again";
            }
            finally
            {
                con.Close();
            }

        }
    }
}