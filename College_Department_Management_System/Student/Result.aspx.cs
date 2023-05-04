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
public partial class User_Result : System.Web.UI.Page
{
    public void Alert(string message)
    {
        var m = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(message);
        var script = string.Format("alert({0});", m);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", script, true);
    }
    protected void Page_Load(object sender, EventArgs e)
    {

       string id = Session["studentId"].ToString();
       string sem = Session["semester"].ToString();
        
        if (Session["studentid"] != null)
        {
            
            string name = Session["name"].ToString();
            lblInfo.Text = name + "-" + id;
        }
        
        

/*string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from tblMarks where Student_Id=@Student_Id and Semester=@Semester order by Paper_Code asc ";
            cmd.Parameters.AddWithValue("@Student_Id", id);
            cmd.Parameters.AddWithValue("@Semester", sem);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(dt);
        }
        gvMarks.DataSource = dt;
        gvMarks.DataBind();
        if (dt.Rows.Count == 0)
        {
            Label lbl = gvMarks.Controls[0].Controls[0].FindControl("lblError") as Label;
            lbl.Text = "No data found.";
        }*/
    }
    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCategory.Items.Remove("Select a option");
        lblKey.InnerText = "Enter " + ddlCategory.SelectedItem.ToString();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {

        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
         string ddl = ddlCategory.SelectedValue.ToString();
        if (ddl != "Select a option")
        {
            string key = txtKey.Text.Trim();
            if (key != "")
            {
                DataTable dt = new DataTable();
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlDataAdapter da = new SqlDataAdapter();
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = "select * from tblMarks where " + ddl + " like @Key";
                    cmd.Parameters.AddWithValue("@Key", "%" + key+"%");
                    da.SelectCommand = cmd;
                    con.Open();
                    da.Fill(dt);
                }
                gvMarks.DataSource = dt;
                gvMarks.DataBind();
                if (dt.Rows.Count == 0)
                {
                    Label lbl = gvMarks.Controls[0].Controls[0].FindControl("lblError") as Label;
                    lbl.Text = "No data found.";
                }
            }
            else
                Alert("Please enter search keyword.");
        }
        else
            Alert("Please select a category.");
    
    }
}