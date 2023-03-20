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
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        Thread.Sleep(1500);
        string link2 = txtLink2.Text.Trim();
        string link4 = txtLink4.Text.Trim();
        string link6 = txtLink6.Text.Trim();
         string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
         using (SqlConnection con = new SqlConnection(cs))
         {
             con.Open();

             SqlCommand cmdinsert = new SqlCommand();
             cmdinsert.Connection = con;
             cmdinsert.CommandText = "insert into tblTestExam values(@Link2,@Link4,@Link6)";
             cmdinsert.Parameters.AddWithValue("@Link2", link2);
             cmdinsert.Parameters.AddWithValue("@Link4", link4);
             cmdinsert.Parameters.AddWithValue("@Link6", link6);
             cmdinsert.ExecuteNonQuery();
             lbl.Text = "Successfully Sended";
         }

    }
}