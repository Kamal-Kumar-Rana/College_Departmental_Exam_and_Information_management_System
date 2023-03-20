using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class Admin_Publish_assignment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_Click(object sender, EventArgs e)
    {
        string id = txtId.Text;
        string name = txtName.Text;
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            SqlCommand cmdinsert = new SqlCommand();
            cmdinsert.Connection = con;
            cmdinsert.CommandText = "insert into Table_1 values(@Id, @Name)";
            cmdinsert.Parameters.AddWithValue("@Id", id);
            cmdinsert.Parameters.AddWithValue("@Name", name);

            cmdinsert.ExecuteNonQuery();
            con.Close();

        }
    }
}