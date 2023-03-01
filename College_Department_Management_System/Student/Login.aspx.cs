using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Threading;
using System.Configuration;
public partial class User_Login : System.Web.UI.Page
{
string cs = GlobalClass.cs;

    public void Alert(string message)
    {
        var m = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(message);
        var script = string.Format("alert({0});", m);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", script, true);
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Thread.Sleep(1500);
        string studentId = txtStudentId.Text.Trim();
        string password = txtPassword.Text.Trim();
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        if (studentId != null && password != null)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "select * from tblStudent where Student_Id = @x and Password = @p";
                cmd.Parameters.AddWithValue("@x", studentId);
                cmd.Parameters.AddWithValue("@p", password);
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                da.Fill(dt);
            }

            if (dt.Rows.Count != 0)
            {
                if (dt.Rows[0]["Status"].ToString().Trim() == "Active")
                {
                    Session.Add("studentId", dt.Rows[0]["Student_Id"].ToString().Trim());
                    Session.Add("password", dt.Rows[0]["Password"].ToString().Trim());
                    Session.Add("name", dt.Rows[0]["Name"].ToString().Trim());
                    Response.Redirect("Dashboard.aspx");
                }
                else if (dt.Rows[0]["Status"].ToString().Trim() == "Block")
                    Alert("User is blocked for security reasons");
                else if (dt.Rows[0]["Status"].ToString().Trim() == "Deactive")
                {
                    Alert("User is Deactive, Contact to HOD");
                }
            }
            else
            {
                Alert("User id or password invalid!");
            }
        }
        else
        {
            Alert("Please enter user id and password");
        }
        
       
        }
    protected void linkRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("Registration.aspx");
    }
}
