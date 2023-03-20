using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Publish_Notice : System.Web.UI.Page
{
   

    public void Alert(string message)
    {
        var m = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(message);
        var script = string.Format("alert({0});", m);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", script, true);
    }
    public void Reload(string message)
    {
        var m = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(message);
        var script = string.Format("alert({0});window.location.replace(window.location.href);", m);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", script, true);
    }
    public string Confirm(string message)
    {
        System.Text.StringBuilder str = new System.Text.StringBuilder();
        str.Append("return confirm('");
        str.Append(message);
        str.Append("')");
        return (str.ToString());
    }
  
    private string GenerateNoticeNo()
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        const String alpha = "0123456789";
        string id = "N";
        int exist = 1;
        do
        {
            Random ran = new Random();
            for (int i = 0; i < 4; i++)
            {
                int a = ran.Next(10);
                id = id + alpha.ElementAt(a);
            }
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "select count(Notice_ID) from tblNotice where Notice_ID = @Notice_ID";
                cmd.Parameters.AddWithValue("@Notice_ID", id);
                con.Open();
                exist = Convert.ToInt32(cmd.ExecuteScalar());
            }
        }
        while (exist != 0);
        return id;
    }
    public void gvUpdatesLoad()
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("select * from tblNotice", con);
            da.Fill(dt);
        }
        gvUpdates.DataSource = dt;
        gvUpdates.DataBind();
        
        if (dt.Rows.Count == 0)
        {
            dt.Rows.Add(dt.NewRow());
            gvUpdates.DataSource = dt;
            gvUpdates.DataBind();
            gvUpdates.Rows[0].Visible = false;
        }
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            gvUpdatesLoad(); 
        }
    }

    protected void gvUpdates_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("New"))
        {

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            string today = GlobalClass.CurrentDateTime();
            string msg = (gvUpdates.FooterRow.FindControl("txtMessage") as TextBox).Text.Trim();
            if (msg != " ")
            {
               
                string id = GenerateNoticeNo();
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    try
                    {
                        SqlCommand cmd = new SqlCommand();
                        cmd.Connection = con;
                        cmd.CommandText = "insert into tblNotice values(@Notice_ID, @Publish_Date,@By, @Message, @LastUpdate)";
                        cmd.Parameters.AddWithValue("@Notice_ID", id);
                        cmd.Parameters.AddWithValue("@Publish_Date", today);
                        cmd.Parameters.AddWithValue("@By","HOD");
                        cmd.Parameters.AddWithValue("@Message", msg);
                        cmd.Parameters.AddWithValue("@LastUpdate", today);
                        
                        cmd.ExecuteNonQuery();

                        gvUpdatesLoad();
                        Alert("New notice published successfully.");
                    }
                    catch
                    {
                        Alert(GlobalClass.DatabaseError);
                    }
                }
            }
            else
                Alert("Please fill all fields.");
        }
    }
                

        
    

    protected void gvUpdates_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvUpdates.EditIndex = e.NewEditIndex;
        gvUpdatesLoad();
        gvUpdates.EditRowStyle.BackColor = System.Drawing.Color.LightPink;
    }

    protected void gvUpdates_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvUpdates.EditIndex = -1;
        gvUpdatesLoad();
    }

    protected void gvUpdates_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        string id = gvUpdates.DataKeys[e.RowIndex].Value.ToString();
        string today = GlobalClass.CurrentDateTime();
        string msg = (gvUpdates.Rows[e.RowIndex].FindControl("txtMessage") as TextBox).Text.Trim();
        if (msg != " ")
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                /*try
                {*/
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = "update tblNotice set Message= @Message, LastUpdate=@LastUpdate where Notice_ID=@Notice_ID";
                    cmd.Parameters.AddWithValue("@Notice_ID", id);
                    cmd.Parameters.AddWithValue("@Message", msg);
                    cmd.Parameters.AddWithValue("@LastUpdate", today);

                    con.Open();
                    cmd.ExecuteNonQuery();

                    gvUpdates.EditIndex = -1;
                    gvUpdatesLoad();
                    Alert("Notice updated successfully.");
                    gvUpdates.Rows[e.RowIndex].BackColor = System.Drawing.Color.LightGreen;
                /*}
                catch
                {
                    Alert(GlobalClass.DatabaseError);
                }*/
            }
        }
        else
            Alert("Please fill all fields.");
    }


    protected void gvUpdates_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        string id = gvUpdates.DataKeys[e.RowIndex].Value.ToString();
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
      
                cmd.CommandText = "delete from tblNotice where Notice_ID = @Notice_ID";
                cmd.Parameters.AddWithValue("@Notice_ID", id);
           
                cmd.ExecuteNonQuery();

                gvUpdatesLoad();
                Alert("Notice deleted successfully.");
            }
            catch
            {
                Alert(GlobalClass.DatabaseError);
            }
        }
    }

}