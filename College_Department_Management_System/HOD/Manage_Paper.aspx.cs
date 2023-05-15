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
public partial class Admin_Manage_Subject : System.Web.UI.Page
{
    public void Alert(string message)
    {
        var m = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(message);
        var script = string.Format("alert({0});", m);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", script, true);
    }
    public void gvLoad()
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("select * from tblExam", con);
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
        if (Session["ywivreqi"] != null)
        {
            lblId.Text = Session["ywivreqi"].ToString();
            lblName.Text = Session["name"].ToString();

        }
    }

    protected void gvUser_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvUser.EditIndex = e.NewEditIndex;
        //btnSearch_Click(sender, e);
        gvUser.EditRowStyle.BackColor = System.Drawing.Color.LightPink;
    }
    protected void gvUser_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvUser.EditIndex = -1;
       // btnSearch_Click(sender, e);
       
    }
    protected void gvUser_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Alert("Updated");
        
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        //string status = (gvUser.Rows[e.RowIndex].FindControl("txtEditStatus") as TextBox).Text.Trim();
        string studentId = gvUser.DataKeys[e.RowIndex].Value.ToString();
        /* using (SqlConnection con = new SqlConnection(cs))
         {
             con.Open();
             SqlTransaction transaction = con.BeginTransaction();
             try
             {
                 SqlCommand cmdUpdateUser = new SqlCommand();
                 cmdUpdateUser.Connection = con;
                 cmdUpdateUser.Transaction = transaction;
                 cmdUpdateUser.CommandText = "update tblStudent set Status = @Status where Student_Id = @Student_Id";
                 cmdUpdateUser.Parameters.AddWithValue("@Status", "Active");
                 cmdUpdateUser.Parameters.AddWithValue("@Student_Id", studentId);
               
                 cmdUpdateUser.ExecuteNonQuery();
                 Alert("Sucessfull");
                 transaction.Commit();
                 gvUser.EditIndex = -1;
                 btnSearch_Click(sender, e);
                 string message = "User updated successfully.";
                 Alert(message);
                 gvUser.Rows[e.RowIndex].BackColor = System.Drawing.Color.LightGreen;
             }
             catch
             {
                 transaction.Rollback();
                 Alert("Databse is not currently response");
             }

        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            SqlCommand cmdinsert = new SqlCommand();
            cmdinsert.Connection = con;
            cmdinsert.CommandText = "update tblStudent set Status = @Status where Student_Id = @Student_Id";
            cmdinsert.Parameters.AddWithValue("@Student_Id", studentId);
            cmdinsert.Parameters.AddWithValue("@Status", "Active");
            cmdinsert.ExecuteNonQuery();
            Alert("updated");
            gvLoad();

        }*/

    }
    protected void gvUser_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Alert("Delete");
    }
    protected void gvUser_SelectedIndexChanged(object sender, EventArgs e)
    {


    }
}