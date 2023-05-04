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

public partial class User_Exam : System.Web.UI.Page
{
    string cs = GlobalClass.cs;
   
    protected void Page_Load(object sender, EventArgs e)
    {
        ShowUpdate();
        if (Session["studentid"] != null)
        {
            string id = Session["studentid"].ToString();
            string name = Session["name"].ToString();
            string sem = Session["Semester"].ToString();
            lblInfo.Text = name + "-" + id;
        }
    }
    private void ShowUpdate()
    {
         string sem = Session["Semester"].ToString();
        DataTable dt = new DataTable();
        DataTable dt2 = new DataTable();
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from tblExam where Semester=@Semester";
            cmd.Parameters.AddWithValue("@Semester", sem);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(dt);

        }
        StringBuilder updatehtml = new StringBuilder();


        DataRow row = dt.Rows[0];
            
                updatehtml.Append("<iframe ");
                updatehtml.Append("src=");
                updatehtml.Append('"');

                updatehtml.Append(row["Link"].ToString().Trim());
                updatehtml.Append('"');
                
                updatehtml.Append(" width=");
                updatehtml.Append(" '1250'");
                
                updatehtml.Append(" height=");
                updatehtml.Append("'450'");
                updatehtml.Append(" marginheight=");
                updatehtml.Append("'0'");
                updatehtml.Append(" marginwidth=");
                 updatehtml.Append("'0'");
                
                updatehtml.Append(">");
                 updatehtml.Append(" </iframe>");
               
            
        content.InnerHtml += updatehtml.ToString();

        }
    }
     
       
       
        

    
