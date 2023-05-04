<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Profile_old.aspx.cs" Inherits="User_Profile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Student | Profile</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="CSS/Dashboard.css" rel="stylesheet" type="text/css" />
    <link href="../Global/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

    <%
        string path = HttpContext.Current.Server.MapPath("Link.txt");
        string content = System.IO.File.ReadAllText(path);
        Response.Write(content);
    %>
</head>
<body>
    <form id="dashboard" runat="server">
        <asp:ScriptManager ID="scriptPage" runat="server">
        </asp:ScriptManager>
        <asp:UpdateProgress ID="progressUpdate" AssociatedUpdatePanelID="updatePage" runat="server">
            <ProgressTemplate>
                <div id="loadingPanel">
                    <div id="loader">
                        <svg class="circular" viewbox="25 25 50 50">
                            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3"></circle>
                        </svg>
                    </div>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <%
            string headerpath = HttpContext.Current.Server.MapPath("Html/Header.htm");
            string headercontent = System.IO.File.ReadAllText(headerpath);
            Response.Write(headercontent);
        %>

        <asp:UpdatePanel ID="updatePage" runat="server">
            <ContentTemplate>
                <div id="body">
                    <div class="status">
                        <i class="fas fa-angle-double-right"></i>
                        <asp:Label ID="status" runat="server" Text="Profile"></asp:Label>
                        <asp:Label ID="lblInfo" runat="server" Text="name (id)"></asp:Label>
                    </div>
                    <div id="content">
                       
                  <div >
    
<div class="container-fluid" style="margin-left:30% ; margin-top:2%">
<div class="row">

<div class="col-md-5">
<div class="card">
<div class="card-body">


<div class="row">
<div class="col">
<center>
    <img width="100px" src="../Images/generaluser.png" />
    
</center>
</div>
    
</div>


<div class="row">
<div class="col">
<center>
    <h4>Student Profile</h4>
    <span>Activation Status - </span>
    <asp:Label class="badge badge-pill badge-success" ID="lblStatus" runat="server" Text=" "></asp:Label>
</center>
</div>
</div>


<div class="row">
<div class="col">
<hr />
</div>
</div>

<div class="row">
<div class="col-md-6">
<asp:Label ID="Label1" runat="server" Text="Label" >Full Name</asp:Label>
   <asp:TextBox CssClass="form-control" ID="txtName" runat="server" placeholder="Full Name"></asp:TextBox>

</div>
<div class="col-md-6">
<asp:Label ID="Label2" runat="server" Text="Label" >Date of Birth</asp:Label>
   <asp:TextBox CssClass="form-control" ID="txtDob" runat="server" 
        placeholder="Date of birth" TextMode="Date">
</asp:TextBox>

</div>
</div>
<div class="row">
<div class="col-md-4">
<asp:Label ID="Label5" runat="server" Text="Label"  >Roll No</asp:Label>
   <asp:TextBox CssClass="form-control" ID="txtRoll" runat="server" placeholder="Full Name" ReadOnly="True"></asp:TextBox>

</div>
<div class="col-md-4">
<asp:Label ID="Label6" runat="server" Text="Label" >Semester</asp:Label>
   <asp:TextBox CssClass="form-control" ID="txtSem" runat="server" ReadOnly="True"
        placeholder="Password" >
</asp:TextBox>

</div>
<div class="col-md-4">
<asp:Label ID="Label7" runat="server" Text="Label" >Gender</asp:Label>
   <asp:TextBox CssClass="form-control" ID="txtGender" runat="server" placeholder="Contact Number" TextMode="Phone"></asp:TextBox>

</div>
</div>

<div class="row">
<div class="col-md-6">
<asp:Label ID="Label3" runat="server" Text="Label" >Contact Number</asp:Label>
   <asp:TextBox CssClass="form-control" ID="txtMobile" runat="server" placeholder="Contact Number" TextMode="Phone"></asp:TextBox>

</div>
<div class="col-md-6">
<asp:Label ID="Label4" runat="server" Text="Label" >Email</asp:Label>
   <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" 
        placeholder="Email" TextMode="Email">
</asp:TextBox>

</div>

</div>



<div class="row">
<div class="col">
<asp:Label ID="Label8" runat="server" Text="Label" >Full Address</asp:Label>
   <asp:TextBox CssClass="form-control" ID="txtAddress" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox>

</div>
</div>
<br />

<center>
<div class="row">
<div class="col">
<span class="badge badge-pill badge-info">Login Credentials</span>
</div>
</div>
</center>

<div class="row">
<div class="col-md-4">
<div class="form-group">
    

<asp:Label ID="Label9" runat="server" Text="Label" >Student ID</asp:Label>
   <asp:TextBox CssClass="form-control" ID="txtId" runat="server" placeholder="User ID" ReadOnly="True"></asp:TextBox>

</div>
</div>

<div class="col-md-4">
<asp:Label ID="Label10" runat="server" Text="Label" >Old Password</asp:Label>
   <asp:TextBox CssClass="form-control" ID="txtOldPass" runat="server" 
        placeholder="Old Password"  ReadOnly="True">
</asp:TextBox>

</div>

<div class="col-md-4">
<asp:Label ID="Label12" runat="server" Text="Label" >New Password</asp:Label>
   <asp:TextBox CssClass="form-control" ID="txtNewPass" runat="server" 
        placeholder="New Password" TextMode="Password" >
</asp:TextBox>

</div>
</div>




<div class="row">
<div class="col-6 mx-auto">
<center>
<div class="form-group">
     <asp:Button class="btn btn-primary btn-block " ID="btnEdit" runat="server" 
         Text="Edit" onclick="btnEdit_Click"  />
</div>
</center>
</div>
<div class="col-6 mx-auto">
<center>
<div class="form-group">
     <asp:Button class="btn btn-success btn-block " ID="btnUpdate" runat="server" 
         Text="Update" onclick="btnUpdate_Click1" />
</div>
</center>
</div>
</div>


<asp:Label ID="lblMessage" runat="server" Text=" "></asp:Label>






</div>
</div>

</div>





</div>
</div>
    
    </div>
    
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        <%
            string footerpath = HttpContext.Current.Server.MapPath("Html/Footer.htm");
            string footercontent = System.IO.File.ReadAllText(footerpath);
            Response.Write(footercontent);
        %>
    </form>
</body>
</html>
