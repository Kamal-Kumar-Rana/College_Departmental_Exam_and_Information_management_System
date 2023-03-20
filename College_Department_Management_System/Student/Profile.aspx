<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="User_Profile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../Global/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <title></title>
   

    <!--Bootstrap js-->
    </head>

    
<body>
    <center>
    <form id="form1" runat="server">
  
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
    <h4>User Profile</h4>
    <span>Activation Status - </span>
    <asp:Label class="badge badge-pill badge-success" ID="Label11" runat="server" Text="Active"></asp:Label>
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
   <asp:TextBox CssClass="form-control" ID="txtmemid" runat="server" placeholder="Full Name"></asp:TextBox>

</div>
<div class="col-md-6">
<asp:Label ID="Label2" runat="server" Text="Label" >Date of Birth</asp:Label>
   <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" 
        placeholder="Password" TextMode="Date">
</asp:TextBox>

</div>
</div>

<div class="row">
<div class="col-md-6">
<asp:Label ID="Label3" runat="server" Text="Label" >Contact Number</asp:Label>
   <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Contact Number" TextMode="Phone"></asp:TextBox>

</div>
<div class="col-md-6">
<asp:Label ID="Label4" runat="server" Text="Label" >Email</asp:Label>
   <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" 
        placeholder="Email" TextMode="Email">
</asp:TextBox>

</div>
</div>

<div class="row">
<div class="col-md-4">
<asp:Label ID="Label5" runat="server" Text="Label" >State</asp:Label>
   <div class="form-group">
       <asp:DropDownList  CssClass="form-control" ID="DropDownList1" runat="server">
       <asp:ListItem Text="Select" Value="select">  </asp:ListItem>
       </asp:DropDownList>
</div>
</div>

<div class="col-md-4">
<div class="form-group">
    <asp:Label ID="Label6" runat="server" Text="Label">City</asp:Label>
    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="City"></asp:TextBox>

</div>
</div>

<div class="col-md-4">
<asp:Label ID="Label7" runat="server" Text="Label" >Pin Code</asp:Label>
   <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" 
        placeholder="" TextMode="Number">
</asp:TextBox>

</div>
</div>

<div class="row">
<div class="col">
<asp:Label ID="Label8" runat="server" Text="Label" >Full Address</asp:Label>
   <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox>

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
    

<asp:Label ID="Label9" runat="server" Text="Label" >User ID</asp:Label>
   <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="User ID" ReadOnly="True"></asp:TextBox>

</div>
</div>

<div class="col-md-4">
<asp:Label ID="Label10" runat="server" Text="Label" >Old Password</asp:Label>
   <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" 
        placeholder="Old Password" TextMode="Password" ReadOnly="True">
</asp:TextBox>

</div>

<div class="col-md-4">
<asp:Label ID="Label12" runat="server" Text="Label" >New Password</asp:Label>
   <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" 
        placeholder="New Password" TextMode="Password" >
</asp:TextBox>

</div>
</div>




<div class="row">
<div class="col-8 mx-auto">
<center>
<div class="form-group">
     <asp:Button class="btn btn-success btn-block " ID="Button1" runat="server" Text="Update" />
</div>
</center>
</div>
</div>









</div>
</div>
<a href="Home.aspx" target="_blank"><< Back to Home</a>
</div>

<div class="col-md-7">


</div>



</div>
</div>
    
    </div>
  
    </form>
    </center>
</body>
</html>
