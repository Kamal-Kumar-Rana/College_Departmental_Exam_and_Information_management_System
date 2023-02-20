using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System.Collections.Specialized;
public class GlobalClass
{
    public readonly static string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
    public readonly static string DatabaseError = "Unable to process your request. Please try again.";
    public readonly static string CustomError = "Something went wrong!";

    public static DataTable LoadStudent(string studentId)
    {
        DataTable dtStudent = new DataTable();
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from tblStudent where Student_ID = @Student_ID COLLATE SQL_Latin1_General_CP1_CS_AS";
            cmd.Parameters.AddWithValue("@Student_ID", studentId);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(dtStudent);
        }
        return dtStudent;
    }
        

    public static bool IsUserValid(string userId, string password)
    {
        bool valid;
        DataTable dtUser = new DataTable();
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "Select * from tblUser where UserId = @UserId COLLATE SQL_Latin1_General_CP1_CS_AS and Password = @Password COLLATE SQL_Latin1_General_CP1_CS_AS";
            cmd.Parameters.AddWithValue("@UserId", userId);
            cmd.Parameters.AddWithValue("@Password", password);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(dtUser);
        }
        if (dtUser.Rows.Count != 0)
            valid = true;
        else
            valid = false;
        return valid;
    }
}