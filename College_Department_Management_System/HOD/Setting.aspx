<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Setting.aspx.cs" Inherits="Teacher_Setting" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:FileUpload ID="fileUpload" runat="server" />
         </div>
        <div>
 <asp:Button ID="btnUpload" runat="server" Text="upload" onclick="btnUpload_Click"  />
    </div>
   
    <div>
     <asp:Label ID="lblMessage" runat="server" ></asp:Label>
    </div>
    <div>
        <asp:HyperLink ID="HyperLink" runat="server" Enabled="False">View Uploaded Image</asp:HyperLink>
    </div>
    </form>
</body>
</html>
