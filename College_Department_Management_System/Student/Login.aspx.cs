using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Threading;

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
        if (studentId != "" && password != "")
        {
            try
            {
                if (GlobalClass.IsUserValid(studentId, password))
                {
                    DataTable dtUser = GlobalClass.LoadStudent(studentId);
                    HttpCookie userInfo = new HttpCookie("TVUSCK");
                    userInfo.Expires = DateTime.Now.AddDays(3);
                    userInfo["xvhuqdph"] = dtUser.Rows[0]["UserId"].ToString().Trim();
                    userInfo["qbttxpse"] = dtUser.Rows[0]["Password"].ToString().Trim();
                    Response.Cookies.Add(userInfo);

                    if (string.IsNullOrEmpty(Request.QueryString["Mode"]) || string.IsNullOrEmpty(Request.QueryString["Url"]))
                        Response.Redirect("Dashboard.aspx");
                    else
                        Response.Redirect(Request.QueryString["Url"]);
                }
                else
                    Alert("Invalid User Id or Password! Try again.");
            }
            catch
            {
                Alert(GlobalClass.DatabaseError);
            }
        }
        else
            Alert("Please enter User Id and Password.");
    }
}