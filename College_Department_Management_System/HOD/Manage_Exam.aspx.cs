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
public partial class Admin_Exam_Paper : System.Web.UI.Page
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

    private string GenerateExamId()
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        const String alpha = "0123456789";
        string id = "Exam";
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
                cmd.CommandText = "select count(Exam_Id) from tblExam where Exam_Id = @Exam_Id";
                cmd.Parameters.AddWithValue("@Exam_Id", id);
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
            da.SelectCommand = new SqlCommand("select * from tblExam", con);
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
        if (Session["ywivreqi"] != null)
        {
            lblId.Text = Session["ywivreqi"].ToString();
            lblName.Text = Session["name"].ToString();

        }

        
    }

    protected void gvUpdates_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("New"))
        {

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            string today = GlobalClass.CurrentDateTime();
            string date = (gvUpdates.FooterRow.FindControl("txtExamDate") as TextBox).Text.Trim();
            string start = (gvUpdates.FooterRow.FindControl("txtStartTime") as TextBox).Text.Trim();
            string sem = (gvUpdates.FooterRow.FindControl("ddlSemester") as DropDownList).Text.Trim();
            string code = (gvUpdates.FooterRow.FindControl("ddlPaperCode") as DropDownList).Text.Trim();
            string duration = (gvUpdates.FooterRow.FindControl("txtDuration") as TextBox).Text.Trim();
            string fm = (gvUpdates.FooterRow.FindControl("txtFull_Marks") as TextBox).Text.Trim();
            string tq = (gvUpdates.FooterRow.FindControl("txtTotal_Questionl") as TextBox).Text.Trim();
            string link = (gvUpdates.FooterRow.FindControl("txtLink") as TextBox).Text.Trim();
         
                string id = GenerateExamId();
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    try
                    {
                        SqlCommand cmd = new SqlCommand();
                        cmd.Connection = con;
                        cmd.CommandText = "insert into tblExam values(@Exam_Id, @Exam_Date,@Start_Time, @Semester, @Paper_Code,@Duration,@Full_Marks,@Total_Question,@Link)";
                        cmd.Parameters.AddWithValue("@Exam_Id", id);
                        cmd.Parameters.AddWithValue("@Exam_Date", date);
                        cmd.Parameters.AddWithValue("@Start_Time", start);
                        cmd.Parameters.AddWithValue("@Semester", sem);
                        cmd.Parameters.AddWithValue("@Paper_Code", code);
                        cmd.Parameters.AddWithValue("@Duration", duration);
                        cmd.Parameters.AddWithValue("@Full_Marks", fm);
                        cmd.Parameters.AddWithValue("@Total_Question", tq);
                        cmd.Parameters.AddWithValue("@Link", link);
                        cmd.ExecuteNonQuery();

                        gvUpdatesLoad();
                        Alert("Exam  Created successfully.");
                    }
                    catch
                    {
                        Alert(GlobalClass.DatabaseError);
                    }
                }
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
         string date = (gvUpdates.FooterRow.FindControl("txtEditExamDate") as TextBox).Text.Trim();
            string start = (gvUpdates.FooterRow.FindControl("txtEditStartTime") as TextBox).Text.Trim();
            string sem = (gvUpdates.FooterRow.FindControl("ddlEditSemester") as DropDownList).Text.Trim();
            string code = (gvUpdates.FooterRow.FindControl("ddlEditPaperCode") as DropDownList).Text.Trim();
            string duration = (gvUpdates.FooterRow.FindControl("txtEditDuration") as TextBox).Text.Trim();
            string fm = (gvUpdates.FooterRow.FindControl("txtEditFull_Marks") as TextBox).Text.Trim();
            string tq = (gvUpdates.FooterRow.FindControl("txtEditTotal_Questionl") as TextBox).Text.Trim();
            string link = (gvUpdates.FooterRow.FindControl("txtEditLink") as TextBox).Text.Trim();
        string today = GlobalClass.CurrentDateTime();
       
            using (SqlConnection con = new SqlConnection(cs))
            {
                /*try
                {*/
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;

                cmd.CommandText = "update  tblExam set Exam_Date= @Exam_Date,Start_Time=@Start_Time,Semester= @Semester,Paper_Code= @Paper_Code,Duration=@Duration, Full_Marks=@Full_Marks,Total_Question=@Total_Question,Link=@Link where Exam_Id=@Exam_Id";
                        cmd.Parameters.AddWithValue("@Exam_Id", id);
                        cmd.Parameters.AddWithValue("@Exam_Date", date);
                        cmd.Parameters.AddWithValue("@Start_Time", start);
                        cmd.Parameters.AddWithValue("@Semester", sem);
                        cmd.Parameters.AddWithValue("@Paper_Code", code);
                        cmd.Parameters.AddWithValue("@Duration", duration);
                        cmd.Parameters.AddWithValue("@Full_Marks", fm);
                        cmd.Parameters.AddWithValue("@Total_Question", tq);
                        cmd.Parameters.AddWithValue("@Link", link);
                con.Open();
                cmd.ExecuteNonQuery();

                gvUpdates.EditIndex = -1;
                gvUpdatesLoad();
                Alert("Data updated successfully.");
                gvUpdates.Rows[e.RowIndex].BackColor = System.Drawing.Color.LightGreen;
                /*}
                catch
                {
                    Alert(GlobalClass.DatabaseError);
                }*/
            }
        
       
    }


    protected void gvUpdates_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        string id = gvUpdates.DataKeys[e.RowIndex].Value.ToString();
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            /*try
            {*/
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;

                cmd.CommandText = "delete from tblExam where Exam_Id = @Exam_Id";
                cmd.Parameters.AddWithValue("@Exam_Id", id);

                cmd.ExecuteNonQuery();

                gvUpdatesLoad();
                Alert("Exam deleted successfully.");
               
            /*}
            catch
            {
                Alert(GlobalClass.DatabaseError);
            }*/
        }
    }
}