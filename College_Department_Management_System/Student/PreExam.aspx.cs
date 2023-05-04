using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Configuration;


public partial class Student_PreExam : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from tblExam where Semester=@Semester ";
            cmd.Parameters.AddWithValue("@Semester", 6);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(dt);
        }
        gvUpdates.DataSource = dt;
        gvUpdates.DataBind();
    }
}