using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Threading;
using System.Configuration;
public partial class Teacher_Modify_Student : System.Web.UI.Page
{
    public void gvLoad()
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("select Student_Id, Name from tblStudent", con);
            da.Fill(dt);
        }
        gvUser.DataSource = dt;
        gvUser.DataBind();
        if (dt.Rows.Count == 0)
        {
            Label lbl = gvUser.Controls[0].Controls[0].FindControl("lblError") as Label;
            lbl.Text = "No data found.";
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        gvLoad();
        Response.Write("ok");
    }
    protected void btnSearch_Click(object sender, EventArgs e)
        
    {
        Thread.Sleep(1000);
        string studentid = txtStudentId.Text.Trim();

        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from tblStudent where Status=@Status";
            cmd.Parameters.AddWithValue("@Status", studentid);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(dt);
        }

        if (dt.Rows.Count != 0)
        {
           
            
        }
        else
        {
            lblMass.Text = "Data Not Found For Student Id " + studentid.ToString();
         
        }
    }
    protected void gvUser_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Response.Write("edit");
    }
    protected void gvUser_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        Response.Write("Cancel");
    }
    protected void gvUser_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Response.Write("Update");
    }
    protected void gvUser_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Response.Write("Delete");
    }
}