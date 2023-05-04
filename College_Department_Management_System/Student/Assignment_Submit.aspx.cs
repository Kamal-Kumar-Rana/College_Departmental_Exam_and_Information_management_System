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
using System.IO;
public partial class Student_Assignment : System.Web.UI.Page
{
    static string Answer;
   
    public void Alert(string message)
    {
        var m = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(message);
        var script = string.Format("alert({0});", m);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", script, true);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        string Student_Id = Session["studentid"].ToString();
        if (!IsPostBack)
        {
            lblMessage.Visible = false;
            HyperLink.Visible = false;
            

        }

    }
   private Boolean uploadresume()
        {
            string Student_Id = Session["studentid"].ToString();
            Boolean resumesaved = false;
            if (fileUpload.HasFile == true)
            {

                String contenttype = fileUpload.PostedFile.ContentType;

                if (contenttype == "application/pdf")
                {
                    int filesize;
                    filesize = fileUpload.PostedFile.ContentLength;

                    //getapplicationid();
                    fileUpload.SaveAs(Server.MapPath("~/Global/UploadAssignment/") + txtId.Text + "_" + Student_Id + "_" + txtCode.Text + ".pdf");

                    Answer = "~/Global/UploadAssignment/" +txtId.Text+"_"+Student_Id+"_"+txtCode.Text+ ".pdf";
                    resumesaved = true;
                    lblMessage.Text = "";
                }
                else
                {
                    lblMessage.Text = "Upload Resume in PDF Format Only";
                }

            }
            else
            {
                lblMessage.Text = "Kindly Upload Resume Before Apply in PDF Format";
            }


            return resumesaved;
        }
      /*  public void getapplicationid()
        {string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            //String mycon = "Data Source=HP-PC\\SQLEXPRESS;Initial Catalog=ResumeDatabase;Integrated Security=True";
            SqlConnection con = new SqlConnection(cs);
            String myquery = "select Student_Id from tblAnswer";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count < 1)
            {
                Student_Id = "10001";

            }
            else
            {



              
                SqlConnection scon1 = new SqlConnection(cs);
                String myquery1 = "select max(Student_Id) from tblStudent";
                SqlCommand cmd1 = new SqlCommand();
                cmd1.CommandText = myquery1;
                cmd1.Connection = scon1;
                SqlDataAdapter da1 = new SqlDataAdapter();
                da1.SelectCommand = cmd1;
                DataSet ds1 = new DataSet();
                da1.Fill(ds1);
                //Student_Id = Convert.ToInt32(ds1.Tables[0].Rows[0][0].ToString());
                Student_Id = Student_Id + 1;
                scon1.Close();
            }

        }*/
    

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        string Student_Id = Session["studentid"].ToString();
        string sem = Session["semester"].ToString();
        if (uploadresume() == true)
        {
            String query = "insert into tblAnswer(Ass_Id,Paper_Code,Student_Id,Semester,Answer) values(" + txtId.Text + ",'" + txtCode.Text + "','"+Student_Id+"','"+sem+"','"+ Answer + "')";
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            lblMessage.Visible = true;
            lblMessage.Text = "Your Student ID is " + Student_Id.ToString() + " for Further Reference .Thanks For Submit the assignment. We will Reach at You Soon.";
            
        }
    }
}
