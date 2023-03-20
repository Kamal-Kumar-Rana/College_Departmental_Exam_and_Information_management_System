using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["Student_Id"] != null)
        {
            Response.Cookies["Student_Id"].Expires = DateTime.Now.AddDays(-30);
        }
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx?Mode=Logout");
    }
}