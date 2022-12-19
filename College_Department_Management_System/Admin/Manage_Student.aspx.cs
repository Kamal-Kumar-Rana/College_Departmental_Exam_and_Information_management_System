using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class Admin_Manage_Student : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        string student_id= txtStudentId.Text.Trim();
        string name = txtName.Text.Trim();
        string password = txtPassword.Text.Trim();
        string semester = txtSemester.Text.Trim();
        string roll = txtRoll.Text.Trim();
        string gender = ddlGender.Text.Trim();
        string dob = txtDOB.Text.Trim();
        string type = txtType.Text.Trim();
        string mobile = txtMobile.Text.Trim();
        string email = txtEmail.Text.Trim();
        string address = txtAddress.Text.Trim();

        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            SqlCommand cmdinsert = new SqlCommand();
            cmdinsert.Connection = con;
            cmdinsert.CommandText = "insert into tblStudent values(@Student_ID, @Name, @Password,@Semester,@Roll_No,@Gender, @DOB,@Type, @Mobile, @Email,@Address)";
            cmdinsert.Parameters.AddWithValue("@Student_ID", student_id);
            cmdinsert.Parameters.AddWithValue("@Name", name);
            cmdinsert.Parameters.AddWithValue("@Password", password);
            cmdinsert.Parameters.AddWithValue("@Semester", semester);
            cmdinsert.Parameters.AddWithValue("@Roll_Note", roll);
            cmdinsert.Parameters.AddWithValue("@Gender", gender);
            cmdinsert.Parameters.AddWithValue("@DOB", dob);
            cmdinsert.Parameters.AddWithValue("@Type", type);

            cmdinsert.Parameters.AddWithValue("@Mobile", mobile);
            cmdinsert.Parameters.AddWithValue("@Email", email);

            cmdinsert.Parameters.AddWithValue("@Address", address);
            cmdinsert.ExecuteNonQuery();
            Response.Write("Successfully Registered!");
       

        }

    }
}