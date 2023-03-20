﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Help.aspx.cs" Inherits="Student_Help" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Student | Help</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="CSS/Help.css" rel="stylesheet" type="text/css" />
    <%
        string path = HttpContext.Current.Server.MapPath("Link.txt");
        string content = System.IO.File.ReadAllText(path);
        Response.Write(content);
    %>
</head>
<body>
    <form id="hep" runat="server">
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
                        <asp:Label ID="status" runat="server" Text="Help"></asp:Label>
                        <asp:Label ID="lblInfo" runat="server" Text="name (id)"></asp:Label>
                    </div>
                    <div id="content">
                        <div id="intro">
                            <h>We are happy to help you</h>
                            <ul>
                                <li>Please keep patience while we are solving your issues.</li>
                                <li>Generally we response within 72 hours after contacting.</li>
                                <li>For instant help and solution please contact your referrer.</li>
                                <li>You may also check the <a href="#">Privacy Policy</a> or <a href="#">Terms & Condition</a>
                                    or <a href="#">FAQ</a> page for more information.</li>
                            </ul>
                        </div>
                     
                        <div class="dataPanel">
                            <h>Your contact details</h>
                            <div class="row">
                                <div>Name</div>
                                <div>:</div>
                                <span id="lblName" runat="server">N/A</span>
                            </div>
                            <div class="row">
                                <div>Student Id</div>
                                <div>:</div>
                                <span id="lblId" runat="server">N/A</span>
                            </div>
                            <div class="row">
                                <div>Mobile</div>
                                <div>:</div>
                                <span id="lblMobile" runat="server">N/A</span>
                            </div>
                            <div class="row">
                                <div>Email</div>
                                <div>:</div>
                                <span id="lblEmail" runat="server">N/A</span>
                            </div>
                            <div class="row">
                                <div>Address</div>
                                <div>:</div>
                                <span id="lblAddress" runat="server">N/A</span>
                            </div>
                        </div>
                        <div id="form">
                            <div class="input-box">
                                <asp:DropDownList ID="ddlSubject" class="input" runat="server" required AutoPostBack="True">
                                    <asp:ListItem Value="Select Subject" disabled Selected hidden>Select Subject</asp:ListItem>
                                    <asp:ListItem>Account related</asp:ListItem>
                                    <asp:ListItem>Activation related</asp:ListItem>
                                    <asp:ListItem>Exam related</asp:ListItem>
                                    <asp:ListItem>Assignment related</asp:ListItem>
                                    <asp:ListItem>Result related</asp:ListItem>
                                    <asp:ListItem>Others</asp:ListItem>
                                </asp:DropDownList>
                                <label for="ddlSubject" class="label-name">
                                    <span class="content-name">Subject</span>
                                </label>
                            </div>

                            <div class="input-box">
                                <asp:TextBox ID="txtMessage" CssClass="input" type="text" autocomplete="off" runat="server" placeholder="Briefly describe your issue."
                                    TextMode="MultiLine" Rows="10" MaxLength="500"></asp:TextBox>
                                <label for="txtMessage" class="label">
                                    <span class="content">Message</span>
                                </label>
                            </div>

                            <div class="btnContainer">
                                <asp:Button ID="btnRegister" CssClass="btn" runat="server" Text="Send" OnClientClick="return confirm('Do you want to send message?')"  />
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
