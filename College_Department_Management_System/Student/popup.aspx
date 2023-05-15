<%@ Page Language="C#" AutoEventWireup="true" CodeFile="popup.aspx.cs" Inherits="Student_popup" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="CSS/Notice.css" rel="stylesheet" type="text/css" />
   <link href="CSS/Dashboard.css" rel="stylesheet" type="text/css" />
    <link href="CSS/Profile.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <style type="text/css">
    
    
    
    
    </style>
    <form id="form1" runat="server">
    <div style="text-align:center">
        <asp:Button ID="btnget" Text="GET" runat="server" Height="78px" Width="170px" 
            Font-Size=X-Large onclick="btnget_Click" />
         </div>
   
        <asp:Panel ID="passwordUpdatePanel" class="overlay" runat="server" Visible="false">
                    <div class="content">
                        <div class="header">Account Verification</div>
                        <div class="input-box">
                            <asp:TextBox ID="txtMobile" class="input" type="text" autocomplete="off" runat="server" required MaxLength="10"></asp:TextBox>
                            <label for="txtMobile" class="label-name">
                                <span class="content-name">Enter Your Mobile Number</span>
                            </label>
                        </div>
                           <div class="input-box">
                              <asp:Button ID="btnSend" CssClass="btn" runat="server" Text="Send OTP" 
                                   BorderColor="#0066FF" ForeColor="#0099FF" onclick="btnSend_Click" />
                                                           </div>
                        <div class="input-box">
                            <asp:TextBox ID="txtOtp" class="input" type="text"  runat="server"></asp:TextBox>
                            <label for="txtOtp" class="label-name">
                                <span class="content-name">Enter OTP</span>
                            </label>
                        </div>
                        <div class="input-box">
                            <asp:TextBox ID="txtEmail" class="input" type="text" autocomplete="off" runat="server" required MaxLength="30"></asp:TextBox>
                            <label for="txtPassword" class="label-name">
                                <span class="content-name"> Email</span>
                            </label>
                        </div>
                        <div class="input-box">
                              <asp:Button ID="btnEmailSend" CssClass="btn" runat="server" Text="Send OTP" 
                                   BorderColor="#0066FF" ForeColor="#0099FF" onclick="btnEmailSend_Click"  />
                                                           </div>
                        <div class="input-box">
                            <asp:TextBox ID="txtOtpEmail" class="input" type="text"  runat="server" ></asp:TextBox>
                            <label for="txtOtp" class="label-name">
                                <span class="content-name">Enter OTP</span>
                            </label>
                        </div>

                        <div class="btnContainer">
                            <asp:Button ID="btnUpdate" CssClass="btn" runat="server" Text="Update" 
                                onclick="btnUpdate_Click" />
                            &nbsp;
                             <asp:Button ID="btnVerify" CssClass="btn" runat="server" Text="Verify" onclick="btnVerify_Click" 
                                />
                            &nbsp;
                            
                            <asp:LinkButton ID="btnClose" CssClass="btn" onclick="btnClose_Click" runat="server" >Close</asp:LinkButton>
                        </div>
                        <asp:Label ID="lbl" runat="server" Text="Label" Visible=false></asp:Label>
                    </div>
                </asp:Panel>
                


   
    </form>
</body>
</html>
