using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
public partial class Teacher_Setting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblMessage.Visible = false;
            HyperLink.Visible = false;

        }
    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        HttpPostedFile postedFile= fileUpload.PostedFile;
       string fileName = Path.GetFileName(postedFile.FileName);
       string fileExtension = Path.GetExtension(fileName);
       int fileSize = postedFile.ContentLength;

       if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".bmp" || fileExtension.ToLower() == ".gif" || fileExtension.ToLower() == ".png")
       {
           Stream stream = postedFile.InputStream;
           BinaryReader binaryReader = new BinaryReader(stream);
           byte[] bytes = binaryReader.ReadBytes((int)stream.Length);
             string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
             using (SqlConnection con = new SqlConnection(cs))
             {
                

                 SqlCommand cmd = new SqlCommand("spUploadImage",con);
                 
                 cmd.CommandType = CommandType.StoredProcedure;
                 SqlParameter paramId = new SqlParameter()
                 {
                     ParameterName = "@Id",
                     Value = 1
                 };
                 cmd.Parameters.Add(paramId);
                 SqlParameter paramName = new SqlParameter()
                 {
                     ParameterName = "@Name",
                     Value=fileName
                 };
                 cmd.Parameters.Add(paramName);
                 SqlParameter paramSize = new SqlParameter()
                 {
                     ParameterName = "@Size",
                     Value = fileSize
                 };
                 cmd.Parameters.Add(paramSize);
                 SqlParameter paramImageData = new SqlParameter()
                 {
                     ParameterName = "@ImageData",
                     Value = bytes
                 };
                 cmd.Parameters.Add(paramImageData);
                 SqlParameter paramNewId = new SqlParameter()
                 {
                     ParameterName = "@NewId",
                     Value = -1
                 };
                 cmd.Parameters.Add(paramNewId);

                 con.Open();
                 cmd.ExecuteNonQuery();
                 con.Close();
                 lblMessage.Visible = true;
                 lblMessage.Text = "upload Successfull";
                 lblMessage.ForeColor = System.Drawing.Color.Green;
                 HyperLink.Visible = true;
                 HyperLink.NavigateUrl = "~/";
             }
       }
       else
       {
           lblMessage.Visible = true;
           lblMessage.Text = "only jpg,bmp,gif,png is uploded";
           lblMessage.ForeColor = System.Drawing.Color.Red;
           HyperLink.Visible = false;
       }

    
    }
}
