using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class User_Profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["studentid"] != null)
        {
            string id = Session["studentid"].ToString();
            string name = Session["name"].ToString();
            txtName.Text = Session["name"].ToString();
            txtId.Text = Session["studentid"].ToString();
            txtDob.Text = Session["dob"].ToString();
            txtAddress.Text = Session["address"].ToString();
            txtEmail.Text = Session["email"].ToString();
            txtMobile.Text = Session["mobile"].ToString();
            lblStatus.Text = Session["status"].ToString();
            txtOldPass.Text = Session["password"].ToString();
            txtRoll.Text = Session["roll"].ToString();
            txtSem.Text = Session["semester"].ToString();
            txtGender.Text = Session["gender"].ToString();
            lblInfo.Text = name + "-" + id;
        }
        /*txtName.Enabled = false;
        txtDob.Enabled = false;
        txtGender.Enabled = false;
        txtMobile.Enabled = false;
        txtEmail.Enabled = false;
        txtAddress.Enabled = false;
       */
        
    }
  
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        txtName.Enabled = true;
        txtDob.Enabled = true;
        txtGender.Enabled = true;
        txtMobile.Enabled = true;
        txtEmail.Enabled = true;
        txtAddress.Enabled = true;
    }
    protected void btnUpdate_Click1(object sender, EventArgs e)
    {
        txtName.Enabled = true;
        txtDob.Enabled = true;
        txtGender.Enabled = true;
        txtMobile.Enabled = true;
        txtEmail.Enabled = true;
        txtAddress.Enabled = true;
        string id = Session["studentid"].ToString();
        string name = txtName.Text.Trim();

        string dob = txtDob.Text.Trim();
        string address = txtAddress.Text.Trim();
        string email = txtEmail.Text.Trim();
        string mobile = txtMobile.Text.Trim();
        string newPass = txtNewPass.Text.Trim();

        string gender = txtGender.Text.Trim();
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            SqlCommand cmdUpdate = new SqlCommand();
            cmdUpdate.Connection = con;
            cmdUpdate.CommandText = "update tblStudent set Name=@Name,Password=@Password,Gender=@Gender,DOB=@DOB,Mobile=@Mobile,Email=@Email,Address=@Address where Student_Id=@Student_Id";
            cmdUpdate.Parameters.AddWithValue("@Student_Id", id);
            cmdUpdate.Parameters.AddWithValue("@Name", name);
            cmdUpdate.Parameters.AddWithValue("@Password", newPass);
            cmdUpdate.Parameters.AddWithValue("@Gender", gender);
            cmdUpdate.Parameters.AddWithValue("@DOB", dob);
            cmdUpdate.Parameters.AddWithValue("@Mobile", mobile);
            cmdUpdate.Parameters.AddWithValue("@Email", email);
            cmdUpdate.Parameters.AddWithValue("@Address", address);
            cmdUpdate.ExecuteNonQuery();
            lblMessage.Text = "Data updated successfully";
        }
    }
}