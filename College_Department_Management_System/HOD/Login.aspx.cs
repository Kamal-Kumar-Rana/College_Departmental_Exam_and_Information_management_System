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

public partial class Admin_Login : System.Web.UI.Page
{
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
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        string username = txtUsername.Text;
        string password = txtPassword.Text;

        if (username != null && password != null)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "select * from tblEmployee where Emp_Id = @x and Password = @p and Type='HOD'";
                cmd.Parameters.AddWithValue("@x", username);
                cmd.Parameters.AddWithValue("@p", password);
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                da.Fill(dt);
            }

            if (dt.Rows.Count != 0)
            {
                Session.Add("ywivreqi", dt.Rows[0]["Emp_Id"].ToString().Trim());
                Session.Add("rcuuyqtf", dt.Rows[0]["Password"].ToString().Trim());
                Session.Add("name",dt.Rows[0]["Name"].ToString().Trim());
                Response.Redirect("Dashboard.aspx");
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
    

}