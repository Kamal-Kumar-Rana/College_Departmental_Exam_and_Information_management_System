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
    }
    private void ShowUpdate()
    {
        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from tblTestExam";
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(dt);
        }
        StringBuilder updatehtml = new StringBuilder();
        
       
            foreach (DataRow row in dt.Rows)
            {
                updatehtml.Append("<iframe ");
                updatehtml.Append("src=");
                updatehtml.Append('"');

                updatehtml.Append(row["Link6"].ToString().Trim());
                updatehtml.Append('"');
                
                updatehtml.Append(" width=");
                updatehtml.Append(" '640'");
                
                updatehtml.Append(" height=");
                updatehtml.Append("'400'");
                updatehtml.Append(" marginheight=");
                updatehtml.Append("'0'");
                updatehtml.Append(" marginwidth=");
                 updatehtml.Append("'0'");
                
                updatehtml.Append(">");
                 updatehtml.Append(" </iframe>");
               
            }
        content.InnerHtml += updatehtml.ToString();

        }
     
       
       
        

    }
