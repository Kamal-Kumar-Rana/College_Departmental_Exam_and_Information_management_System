using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net;
using System.Data.SqlClient;
using System.Collections.Specialized;
using System.Net.Mail;
using System.Data.Sql;
using System.IO;
using System.Text;
using System.Linq;
public partial class Student_popup : System.Web.UI.Page
{
    String randomCode;
    public static String to;
    static String activationCode;


    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnget_Click(object sender, EventArgs e)
    {
        passwordUpdatePanel.Visible = true;
    }

    protected void btnClose_Click(object sender, EventArgs e)
    {
        passwordUpdatePanel.Visible = false;
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {

    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        

        string apikey = "NzA2NDMwNGI1NjMwNTk3ODQ2NTQ1MjU4NmY0ZDU1NmU";
        Random ran = new Random();
        int value = ran.Next(1000, 9999);
        string sendername = "TXTLCL";
        string number = "+91" + txtMobile;
        string message = "Your Otp Number is " + value + " (Send By KamalWorld!)";

            String Message = HttpUtility.UrlEncode(message);
            using (var wb = new WebClient())
            {
                byte[] response = wb.UploadValues("https://api.textlocal.in/send/?apikey", new NameValueCollection()
                {
                {"apikey" , "Njg1MjQ0Nzk0YjQ3NTc0NzQ2Njk0NzMzMzc3MjY5NzI"},
                {"numbers" , number},
                {"message" , message},
                {"sender" , sendername}
                });
                string result = System.Text.Encoding.UTF8.GetString(response);
                Session["otpM"]=value;
            }
        }
        
        /*
        String url = "https://api.textlocal.in/send/?apikey" + apikey + "&number" + number + "&message" + message + "&sendername" + sendername;


        StreamWriter mywriter = null;
        HttpWebRequest objrequest = (HttpWebRequest)WebRequest.Create(url);
        objrequest.Method = "POST";
        objrequest.ContentLength = Encoding.UTF8.GetByteCount(url);
        objrequest.ContentType = "application/x-www-form-urlencoded";
         mywriter = new StreamWriter(objrequest.GetRequestStream());
            mywriter.Write(url);
            lbl.Visible = true;
            lbl.Text = "Phone Otp Send Suceessfully";


        /*}
        catch (Exception)
        {
            lbl.Visible = true;
            lbl.Text = "not send";
        }
        
    }*/





    


    protected void btnEmailSend_Click(object sender, EventArgs e)
    {
        Random ran = new Random();
         activationCode = ran.Next(1000,9999).ToString();

        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.Credentials = new System.Net.NetworkCredential("kamalworld.official@gmail.com", "thpvebvvvusqupsn");
        MailMessage msg = new MailMessage();
        smtp.EnableSsl = true;
        msg.Subject = "Activation Code to verify Email Address!";
        msg.Body = "Dear Customer Your Activation Code is: " + activationCode + "\n\n\n Thanks & Regard\n Team KamalWorld!";
        string toaddress = txtEmail.Text;
        msg.To.Add(toaddress);
        string fromaddress = "KamalWorld <kamalworld.official@gmail.com>";
        msg.From = new MailAddress(fromaddress);

        smtp.Send(msg);
        Session["otp"]=activationCode;










    }
    protected void btnVerify_Click(object sender, EventArgs e)
    {
        string x=Session["otp"].ToString();

        if (txtOtpEmail.Text == x)
        {
            lbl.Visible = true;
            lbl.Text = "Otp Verify Sucessfully!";


        }
        else{
            lbl.Visible = true;
        lbl.Text = "Otp is incorrect!!";
        }



    }
    
}