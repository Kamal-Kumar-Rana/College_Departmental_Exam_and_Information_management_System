using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
public partial class Admin_Manage_Student : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ywivreqi"] != null)
        {
            lblId.Text = Session["ywivreqi"].ToString();
            lblName.Text = Session["name"].ToString();

        }
    }
  
  
}