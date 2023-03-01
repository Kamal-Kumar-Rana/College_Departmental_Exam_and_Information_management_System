<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Reg_Message.aspx.cs" Inherits="Teacher_Reg_Message" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register Successfully</title>
    <link href="CSS/Reg_Message.css" rel="stylesheet" type="text/css" />
    <link href="../Global/Fontawesome-free-6.0.0-beta2-web/css/all.css" rel="stylesheet" type="text/css" />
    <link href="../Global/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
 

	<div class="container">
		<div class="icon"><i class="fas fa-check-circle"></i></div>
		<h1>Registration Successful</h1>
		<p>Thank you for registering in our system.</p>
	</div>
    <center>
    <asp:Button ID="btn" Cssclass="btn btn-primary btn-lg" runat="server"  
            Text="Go to Dashboard" onclick="btn_Click" />
    </center>

    </form>
</body>
</html>
