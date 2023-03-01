<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> Depertmental Exam And Information Management System | Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Public/CSS/Header.css" rel="stylesheet" type="text/css" />
    
    <link href="Public/CSS/Footer.css" rel="stylesheet" type="text/css" />
    <link href="Public/CSS/Loader.css" rel="stylesheet" type="text/css" />
    <link href="Public/CSS/Responsive.css" rel="stylesheet" type="text/css" />
    <link href="Public/CSS/Default.css" rel="stylesheet" type="text/css" />
    <link href="Global/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="Global/Fontawesome-free-6.0.0-beta2-web/css/all.css" rel="stylesheet" type="text/css" />
    <script src="Global/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="Global/bootstrap/js/jquery-3.3.1.slim.min.js" type="text/javascript"></script>
    <script src="Global/bootstrap/js/popper.min.js" type="text/javascript"></script>
</head>
<body class="body">
    <form id="default" runat="server">
        <div id="logo" runat="server"> Depertmental Exam And Information Management System</div>
     <div id="header" runat="server">
            <div id="menu">
                <ul>
                    <li><a class="a" href="#"><i class="fas fa-home"  ></i>Home</a></li>
                    <li><a class="a" href="#"><i class="fas fa-info-circle"></i>Dashboard</a></li>
                    <li><a class="btnLogin" href="Teacher/Login.aspx" target="_blank"><i class="fas fa-user-plus"  ></i>HOD Login</a></li>
                    <li><a class="btnLogin" href="Student/Login.aspx" target="_blank"><i class="fas fa-sign-in-alt" ></i>Student Login</a></li>
                    <li><a class="btnLogin" href="Teacher/Login.aspx" target="_blank"><i class="fas fa-user-plus" ></i>Teachers Login</a></li>

                </ul>
            </div>
        </div>
  

        <div class="maincontent">
        <div class="bg">
        </div>
            <img src="Images/olms.png" width="100%" />
           </div>

<footer class="full-footer">
    <div class="container top-footer p-md-3 p-1">
      <div class="row">
        <div class="col-md-3 pl-4 pr-4">
          <img class="img-fluid" src="imgs/logo_text_white_small.png" alt="">
          <p>
            Departmental Exam Management system ...<a href="#">Read
              more...</a>
          </p>
          <!--<a style="color:silver;" class="p-1" href="#"><i class="fab fa-2x fa-facebook-square"></i></a>
          <a style="color: silver;" class="p-1" href="#"><i class="fab fa-2x fa-google-plus-square"></i></a>
          <a style="color: silver;" class="p-1" href="#"><i class="fab fa-2x fa-twitter-square"></i></a>
          <a style="color: silver;" class="p-1" href="#"><i class="fab fa-2x fa-instagram"></i></a>-->
        </div>

        <div class="col-md-3  pl-4 pr-4">
          <div class="a"><a href="Admin/Login.aspx" target="_blank"><i class="fas fa-sign-in-alt"></i>Admin Login</a></div>
                <div class="a"><a href="Public/About.aspx" ><i class="fas fa-info-circle"></i>About</a></div>
                <div class="a"><a href="Public/Contact.aspx"><i class="fas fa-link"></i>Contact</a></div>
                <div class="a"><a href="#"><i class="far fa-question-circle"></i>FAQ</a></div>
                <div class="a"><a href="#"><i class="fas fa-tasks"></i>Privacy Policy</a></div>
                <div class="a"><a href="#"><i class="fas fa-tasks"></i>Terms and conditions</a></div>
        </div>

        <div class="col-md-3  pl-4 pr-4">
          <h4>Our Services</h4>
          <a href="#">Web Designing </a><br>
          <a href="#">Web Development  </a><br>
          <a href="#">SEO services  </a><br>
          <a href="#">Software Development </a>
          <a href="#">Mobile App Development  </a>
          <a href="#">Graphic Designing</a>
        </div>
     
      <div class="col-md-3  pl-4 pr-4">
          <h3>Contact Us</h3>
          <a href="#"><i class="fas fa-phone"></i> +(91) 9090909090  </a><br>
          <a href="#"><i class="fas fa-envelope"></i> helpdesk@gmail.com  </a><br>
               Raja Bazar Main Rd.
            <br />
                    Midnapore, Paschim Midnapore,
            <br />
                    721212, West Bengal
               
          <div class="embed-responsive embed-responsive-16by9">
             
               
      </div>
    </div>
    </div>
    <div class="container-fluid bottom-footer pt-2">
      <div class="row">
        <div class="col-12 text-center">
          <p>Copyrights © 2023 - All rights reserved</p>
        </div>
      </div>
    </div>

  </footer>
  <!--
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
            <center>
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
             
            <div class="copyright">
                © Copyright <span id="year" runat="server">2022</span> <span id="cName" runat="server">Exam Management &amp; Application</span> 
                All Rights Reserved.
            </div>
            </center>
        </div>
        -->
    </form>
</body>
</html>