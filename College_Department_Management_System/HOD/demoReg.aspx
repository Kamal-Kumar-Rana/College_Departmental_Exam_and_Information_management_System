<%@ Page Language="C#" AutoEventWireup="true" CodeFile="demoReg.aspx.cs" Inherits="Teacher_demoReg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="txtId" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtPass" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtSem" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtRoll" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtGen" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtDob" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtMob" runat="server"></asp:TextBox>
         <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtAdd" runat="server"></asp:TextBox>
        <asp:Button ID="btnRegister" runat="server" Text="Button" 
            onclick="btnRegister_Click" />
    </div>
    </form>
</body>
</html>
