using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Threading;
using System.Configuration;
using System.Collections.Specialized;
using System.Net.Mail;
using System.Data.Sql;
using System.IO;
using System.Text;
using System.Linq;
using System.Net;

public partial class Student_Registration : System.Web.UI.Page
{
    String randomCode;
    public static String to;
    static String activationCode;
    public void Alert(string message)
    {
        var m = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(message);
        var script = string.Format("alert({0});", m);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", script, true);
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
   
    protected void  linkCancel_Click(object sender, EventArgs e)
{
 txtStudentId.Text = "";
        txtPassword.Text = "";
        txtName.Text = "";
        txtRoll.Text = "";
        txtSemester.Text = "";
        txtMobile.Text = "";
        txtEmail.Text = "";
        txtDOB.Text = "";
        txtAddress.Text = "";
        ddlGender.Text = "";
}

    protected void btnOtpSend_Click(object sender, EventArgs e)
    {
        
        Random ran = new Random();
        activationCode = ran.Next(1000, 9999).ToString();

        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.Credentials = new System.Net.NetworkCredential("kamalworld.official@gmail.com", "thpvebvvvusqupsn");
        MailMessage msg = new MailMessage();
        smtp.EnableSsl = true;
        msg.Subject = "Activation Code to verify Email Address!";
        msg.Body = "Dear "+ txtName.Text.Trim() +" Your Activation Code is: " + activationCode + "\n\n\n Thanks & Regard\n Admin \n DEIMS!";
        string toaddress = txtEmail.Text.Trim();
        msg.To.Add(toaddress);
        string fromaddress = "ADMIN@DEIMS<kamalworld.official@gmail.com> ";
        msg.From = new MailAddress(fromaddress);

        smtp.Send(msg);
        Session["otp"] = activationCode;
        Alert("Otp is Successfully Send to "+toaddress);
    }
    protected void btnOtpVerify_Click(object sender, EventArgs e)
    {
        string x = Session["otp"].ToString();

        if (txtOtp.Text == x)
        {
            
            Alert("Otp Verify Sucessfully!");


        }
        else
        {
           
           Alert("Otp is incorrect!!");
        }
    }
     protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (txtOtp.Text == "")
        {
            Alert("Please Enter The otp!");
        }
        else if(txtOtp.Text!=Session["otp"].ToString()){
            Alert("Enter The Correct Otp!");
        }
        else if (txtPassword.Text == "")
        {
            Alert("Enter Password with Minimum Length 4!");
        }
        else
        {
            Thread.Sleep(1500);
            string student_id = txtStudentId.Text.Trim();
            string name = txtName.Text.Trim();
            string password = txtPassword.Text.Trim();
            string semester = txtSemester.Text.Trim();
            string roll = txtRoll.Text.Trim();
            string gender = ddlGender.Text.Trim();
            string dob = txtDOB.Text.Trim();

            string mobile = txtMobile.Text.Trim();
            string email = txtEmail.Text.Trim();
            string address = txtAddress.Text.Trim();
            string status = "Deactive";
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                SqlCommand cmdinsert = new SqlCommand();
                cmdinsert.Connection = con;
                cmdinsert.CommandText = "insert into tblStudent values(@Student_Id, @Name, @Password,@Semester,@Roll_No,@Gender, @DOB, @Mobile, @Email,@Address,@Status)";
                cmdinsert.Parameters.AddWithValue("@Student_Id", student_id);
                cmdinsert.Parameters.AddWithValue("@Name", name);
                cmdinsert.Parameters.AddWithValue("@Password", password);
                cmdinsert.Parameters.AddWithValue("@Semester", semester);
                cmdinsert.Parameters.AddWithValue("@Roll_No", roll);
                cmdinsert.Parameters.AddWithValue("@Gender", gender);
                cmdinsert.Parameters.AddWithValue("@DOB", dob);


                cmdinsert.Parameters.AddWithValue("@Mobile", mobile);
                cmdinsert.Parameters.AddWithValue("@Email", email);

                cmdinsert.Parameters.AddWithValue("@Address", address);
                cmdinsert.Parameters.AddWithValue("@Status", status);
                cmdinsert.ExecuteNonQuery();

               

                con.Close();
                Random ran = new Random();
                activationCode = ran.Next(1000, 9999).ToString();

                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.Credentials = new System.Net.NetworkCredential("kamalworld.official@gmail.com", "thpvebvvvusqupsn");
                MailMessage msg = new MailMessage();
                smtp.EnableSsl = true;
                msg.Subject = "Account Credential@DEIMS";
                msg.Body = "Dear " + txtName.Text.Trim() + " Your are Successfully register our system. \n Your Student ID is: "+txtStudentId.Text.Trim()+" and Password is: "+ txtPassword.Text.Trim()+ ".Don't shere with enyone! \n\n N.B:-  You Eligible to login our system when Head Of Department Activate Your Account!"+"\n\n\n Thanks & Regard\n Admin \n DEIMS!";
                string toaddress = txtEmail.Text.Trim();
                msg.To.Add(toaddress);
                string fromaddress = "ADMIN@DEIMS<kamalworld.official@gmail.com> ";
                msg.From = new MailAddress(fromaddress);

                smtp.Send(msg);
                Session["otp"] = activationCode;
                Alert(" Successfully Register!");
                Response.Redirect("/College_Department_Management_System/Student/Reg_Message.aspx");

            }

        }
        }
    
}
