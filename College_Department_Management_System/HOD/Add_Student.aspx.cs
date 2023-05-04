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
public partial class Teacher_Add_Student : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ywivreqi"] != null)
        {
            lblId.Text = Session["ywivreqi"].ToString();
            lblName.Text = Session["name"].ToString();

        }
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {

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

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                SqlCommand cmdinsert = new SqlCommand();
                cmdinsert.Connection = con;
                cmdinsert.CommandText = "insert into tblStudent values(@Student_Id, @Name, @Password,@Semester,@Roll_No,@Gender, @DOB, @Mobile, @Email,@Address)";
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
                cmdinsert.ExecuteNonQuery();
                lblMass.Text = "Sucessfull!";
                Response.Redirect("Reg_Mess.aspx");
                con.Close();




            }
        }
    }
    protected void linkCancel_Click(object sender, EventArgs e)
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
}