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

public partial class Admin_Dashboard : System.Web.UI.Page
{
    public void count()
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            con.Open();
            cmd.CommandText = "select count (Student_Id) from tblStudent where Status = 'Active'";
            int bankCount = Convert.ToInt32(cmd.ExecuteScalar().ToString().Trim());
            lblStudent.Text = bankCount.ToString();
        }
      
    }
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["ywivreqi"] != null)
        {
            lblId.Text = Session["ywivreqi"].ToString();
            lblName.Text = Session["name"].ToString();
           
        }
        count();
        
    }

}