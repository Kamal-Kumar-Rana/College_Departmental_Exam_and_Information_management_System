﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>College Depertment Exam And Information Management System | Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Public/CSS/Header.css" rel="stylesheet" type="text/css" />
    
    <link href="Public/CSS/Footer.css" rel="stylesheet" type="text/css" />
    <link href="Public/CSS/Loader.css" rel="stylesheet" type="text/css" />
    <link href="Public/CSS/Responsive.css" rel="stylesheet" type="text/css" />
    <link href="Public/CSS/Default.css" rel="stylesheet" type="text/css" />
    <link href="User/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="Global/Fontawesome-free-6.0.0-beta2-web/css/all.css" rel="stylesheet" type="text/css" />
</head>
<body class="body">
    <form id="default" runat="server">
        <div id="logo" runat="server">College Depertment Exam And Information Management System</div>
        <div id="header" runat="server">
            <div id="menu">
                <ul>
                    <li><a class="a" href="#"><i class="fas fa-home"></i>Home</a></li>
                    <li><a class="a" href="#"><i class="fas fa-info-circle"></i>Dashboard</a></li>
                    <li><a class="btnLogin" href="#"><i class="fas fa-user-plus"></i>HOD Login</a></li>
                    <li><a class="btnLogin" href="#"><i class="fas fa-sign-in-alt"></i>Student Login</a></li>
                    <li><a class="btnLogin" href="#"><i class="fas fa-user-plus"></i>Teachers Login</a></li>

                   
                </ul>
            </div>
        </div>

        <div class="maincontent">
        <div class="bg">
        </div>
            <img src="Images/olms.png" width="100%" />
           </div>

  
        <div id="footer">
            <div class="info">
                <div id="companyname" class="banner" runat="server">Online Exam Management system</div>
                <p id="companydesc" runat="server">
                    Raja Bazar Main Rd.
            <br />
                    Midnapore, Paschim Midnapore,
            <br />
                    721212, West Bengal
                </p>
                <div class="contact">
                    <div class="mobile">
                        <i class="fas fa-phone"></i>
                        <asp:Label ID="mobile" runat="server">7047891894</asp:Label>
                    </div>
                    <div class="email">
                        <i class="far fa-envelope"></i>
                        <asp:Label ID="email" runat="server">helpdesk@gmail.com</asp:Label>
                    </div>
                </div>
            </div>

            <div class="links">
                <div>
                    <p>Important links</p>
                </div>
                <div class="a"><a href="Admin/Login.aspx"><i class="fas fa-sign-in-alt"></i>Admin Login</a></div>
                <div class="a"><a href="Public/About.aspx"><i class="fas fa-info-circle"></i>About</a></div>
                <div class="a"><a href="Public/Contact.aspx"><i class="fas fa-link"></i>Contact</a></div>
                <div class="a"><a href="#"><i class="far fa-question-circle"></i>FAQ</a></div>
                <div class="a"><a href="#"><i class="fas fa-tasks"></i>Privacy Policy</a></div>
                <div class="a"><a href="#"><i class="fas fa-tasks"></i>Terms and conditions</a></div>
            </div>
             <center>
            <div class="copyright">
                © Copyright <span id="year" runat="server">2022</span> <span id="cName" runat="server">Exam Management &amp; Application</span> 
                All Rights Reserved.
            </div>
            </center>
        </div>
    </form>
</body>
</html>