using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Threading;

public partial class Admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string UserName=txtUsername.Text.Trim();
        string Password=txtPassword.Text.Trim();
        Thread.Sleep(1500);
        
        if ( != "" && Password != "")
        {
            try
            {
                if (GlobalClass.IsUserValid(userId, password))
                {
                    DataTable dtUser = GlobalClass.LoadUser(userId);
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
}