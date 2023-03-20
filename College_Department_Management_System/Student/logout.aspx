<%@ Page Language="C#" AutoEventWireup="true" CodeFile="logout.aspx.cs" Inherits="Student_logout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Redirecting...</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <style type="text/css">
        *
        {
            margin: 0;
            padding: 0;
        }
        body
        {
            width: 100%;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
    </style>
</head>
<body>
    <form id="logout" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:Timer ID="Timer1" runat="server" Interval="3000" ontick="Timer1_Tick" >
        </asp:Timer>
        <div>Please wait... You are logging out.</div>
    </form>
</body>
</html>
