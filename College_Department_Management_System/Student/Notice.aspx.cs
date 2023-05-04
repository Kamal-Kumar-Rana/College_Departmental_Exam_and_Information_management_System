using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class Student_Notice : System.Web.UI.Page
{


    private void ShowUpdate()
    {

        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from tblNotice";
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(dt);
        }
        
        StringBuilder updatehtml = new StringBuilder();
        updatehtml.Append("<ul>");
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                updatehtml.Append("<li>");
                updatehtml.Append(row["Message"].ToString().Trim());
                updatehtml.Append("<br>Updated on : ");
                updatehtml.Append(row["Publish_Date"].ToString().Trim());
                updatehtml.Append(", ");
                updatehtml.Append("By- ");
                updatehtml.Append(row["By"].ToString().Trim());
                updatehtml.Append("</li>");
                
            }
        }
        else
        {
            updatehtml.Append("<li style='color: green;'>There is no new update.</li>");
        }
        updatehtml.Append("</ul>");
       
      update.InnerHtml += updatehtml.ToString();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        ShowUpdate();
    }
}