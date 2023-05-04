using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class Student_Profile_Student : System.Web.UI.Page
{
    
    string cs = GlobalClass.cs;

    public void Alert(string message)
    {
        var m = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(message);
        var script = string.Format("alert({0});", m);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", script, true);
    }
    public void Reload(string message)
    {
        var m = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(message);
        var script = string.Format("alert({0});window.location.replace(window.location.href);", m);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", script, true);
    }
    private void ShowAdminInfo(string adminId)
    {
        DataTable dt = GlobalClass.LoadAdmin(adminId);
        lblAdminId.Text = dt.Rows[0]["Student_Id"].ToString().Trim();
        lblAdminName.Text = dt.Rows[0]["Name"].ToString().Trim();
        lblId.Text = dt.Rows[0]["Student_Id"].ToString();
        lblName.InnerText = dt.Rows[0]["Name"].ToString();
        lblMobile.InnerText = dt.Rows[0]["Mobile"].ToString();
        lblEmail.InnerText = dt.Rows[0]["Email"].ToString();
        lblAdress.InnerText = dt.Rows[0]["Address"].ToString();
        lblDob.InnerText = dt.Rows[0]["DOB"].ToString();
        lblGender.InnerText = dt.Rows[0]["Gender"].ToString();
        lblSemester.InnerText = dt.Rows[0]["Semester"].ToString();
        lblRoll.InnerText = dt.Rows[0]["Roll_No"].ToString();
        lblStatus.InnerText = dt.Rows[0]["Status"].ToString();

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Session["studentId"].ToString();
        ShowAdminInfo(id);
        /*if (!IsPostBack)
        {
            ViewState["ViewStateId"] = System.Guid.NewGuid().ToString();
            Session["SessionId"] = ViewState["ViewStateId"].ToString();
            if (Session["ywivreqi"] != null && Session["rcuuyqtf"] != null)
            {
                string adminId = Session["ywivreqi"].ToString();
                ShowAdminInfo(adminId);
            }
        }
        else
        {
            if (ViewState["ViewStateId"].ToString() != Session["SessionId"].ToString())
                Response.Redirect(Request.Url.AbsoluteUri);
            Session["SessionId"] = System.Guid.NewGuid().ToString();
            ViewState["ViewStateId"] = Session["SessionId"].ToString();
        }

        if (Session["ywivreqi"] == null || Session["rcuuyqtf"] == null)
        {
            string prevPage = Request.Url.AbsoluteUri;
            Response.Redirect("Login.aspx?Mode=Redirect&Url=" + prevPage);
        }*/
    
    }

    protected void btnEditPassword_Click(object sender, EventArgs e)
    {
        passwordUpdatePanel.Visible = true;
    }

    protected void linkClose_Click(object sender, EventArgs e)
    {
        passwordUpdatePanel.Visible = false;
        InfoUpdatePanel.Visible = false;
        txtPassword.Text = txtCPassword.Text = txtOldPassword.Text = "";
    }

    protected void linkEdit_Click(object sender, EventArgs e)
    {
        InfoUpdatePanel.Visible = true;
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string Id = Session["studentId"].ToString();
        DataTable dt = GlobalClass.LoadAdmin(Id);
        string password = dt.Rows[0]["password"].ToString().Trim();
        string oldpassword = txtOldPassword.Text.Trim();
        string newpassword = txtPassword.Text.Trim();
        string confirmpassword = txtCPassword.Text.Trim();
        if (oldpassword != "" && newpassword != "" && confirmpassword != "")
        {
            if (newpassword == confirmpassword)
            {
                if (password == oldpassword)
                {
                    try
                    {
                        using (SqlConnection con = new SqlConnection(cs))
                        {
                            SqlCommand cmd = new SqlCommand();
                            cmd.Connection = con;
                            cmd.CommandText = "update tblStudent set Password = @Password where Student_Id = @Student_Id";
                            cmd.Parameters.AddWithValue("@Password", newpassword);
                            cmd.Parameters.AddWithValue("@Student_Id", Id);
                            con.Open();
                            cmd.ExecuteNonQuery();
                        }
                        Reload("Password changed successfully.");
                    }
                    catch
                    {
                        Alert(GlobalClass.DatabaseError);
                    }
                }
                else
                    Alert("Current password does not match!");
            }
            else
                Alert("New password and confirm password does not match!");
        }
        else
            Alert("Please fill all fields.");
    }
    protected void btnUpdateDetails_Click(object sender, EventArgs e)
    {
        string id = Session["Student_Id"].ToString();
        string name = txtName.Text.Trim();
        string gender = txtGender.Text.Trim();
        string dob = txtDob.Text.Trim();
        string mobile = txtMobile.Text.Trim();
        string email = txtEmail.Text.Trim();
        string address = txtAddress.Text.Trim();
        try
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmdUpdate = new SqlCommand();
                cmdUpdate.Connection = con;
                con.Open();
                cmdUpdate.CommandText = "update tblStudent set Name=@Name,Gender=@Gender,DOB=@DOB,Mobile=@Mobile,Email=@Email,Address=@Address where Student_Id=@Student_Id";
                cmdUpdate.Parameters.AddWithValue("@Student_Id", id);
                cmdUpdate.Parameters.AddWithValue("@Name", name);
                
                cmdUpdate.Parameters.AddWithValue("@Gender", gender);
                cmdUpdate.Parameters.AddWithValue("@DOB", dob);
                cmdUpdate.Parameters.AddWithValue("@Mobile", mobile);
                cmdUpdate.Parameters.AddWithValue("@Email", email);
                cmdUpdate.Parameters.AddWithValue("@Address", address);

                cmdUpdate.ExecuteNonQuery();
                Response.Redirect(Request.RawUrl);
            }
            Reload("Password changed successfully.");
        }
        catch
        {
            Alert(GlobalClass.DatabaseError);
        }
    }
    protected void btnUpdateDetails_Click1(object sender, EventArgs e)
    {
        string id = Session["studentId"].ToString();
        string name = txtName.Text.Trim();
        string gender = txtGender.Text.Trim();
        string dob = txtDob.Text.Trim();
        string mobile = txtMobile.Text.Trim();
        string email = txtEmail.Text.Trim();
        string address = txtAddress.Text.Trim();
        try
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmdUpdate = new SqlCommand();
                cmdUpdate.Connection = con;
                con.Open();
                cmdUpdate.CommandText = "update tblStudent set Name=@Name,Gender=@Gender,DOB=@DOB,Mobile=@Mobile,Email=@Email,Address=@Address where Student_Id=@Student_Id";
                cmdUpdate.Parameters.AddWithValue("@Student_Id", id);
                cmdUpdate.Parameters.AddWithValue("@Name", name);
                
                cmdUpdate.Parameters.AddWithValue("@Gender", gender);
                cmdUpdate.Parameters.AddWithValue("@DOB", dob);
                cmdUpdate.Parameters.AddWithValue("@Mobile", mobile);
                cmdUpdate.Parameters.AddWithValue("@Email", email);
                cmdUpdate.Parameters.AddWithValue("@Address", address);

                cmdUpdate.ExecuteNonQuery();
                Response.Redirect(Request.RawUrl);
            }
            Reload("Password changed successfully.");
        }
        catch
        {
            Alert(GlobalClass.DatabaseError);
        }

    }
}