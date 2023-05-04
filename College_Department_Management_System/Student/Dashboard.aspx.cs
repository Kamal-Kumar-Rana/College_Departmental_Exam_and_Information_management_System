using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["studentid"] != null)
        {
            string id= Session["studentid"].ToString();
            string name = Session["name"].ToString();
            lblInfo.Text = name + "-" + id;
        }
    }
}