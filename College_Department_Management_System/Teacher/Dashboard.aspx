<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Admin_Dashboard" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Admin Panel | Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="CSS/Dashboard.css" rel="stylesheet" type="text/css" />
    <link href="CSS/Dashboard_image.css" rel="stylesheet" type="text/css" />
    <link href="../Global/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <%
        string path = HttpContext.Current.Server.MapPath("Link.txt");
        string content = System.IO.File.ReadAllText(path);
        Response.Write(content);
    %>
    <script src="JS/Dashboard.js" type="text/javascript"></script>
</head>
<body>
    <form id="dashboard" runat="server">
        <asp:ScriptManager ID="scriptPage" runat="server">
        </asp:ScriptManager>
        <asp:UpdateProgress ID="updateProgress" AssociatedUpdatePanelID="pageUpdate" runat="server">
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

        <asp:UpdatePanel ID="pageUpdate" runat="server">
            <ContentTemplate>
                <div id="body">
                    <div class="status top">
                        <i class="fas fa-user-shield"></i>
                        <asp:Label ID="Label1" class="lbl" runat="server" Text="Admin"></asp:Label>
                        <span class="info">
                            <asp:Label ID="lblId" class="lbl" runat="server" ></asp:Label>- 
                            <asp:Label ID="lblName" class="lbl" runat="server" ></asp:Label>
                            
                        </span>
                    </div>
                    <div class="status bottom">
                        <i class="fas fa-angle-double-right"></i>
                        <asp:Label ID="status" runat="server" Text="Admin Panel / Dashboard"></asp:Label>
                    </div>
                    <div id="content">
                   
                        
                         <div id="info" class="window">
                           
                             <div class="tab">
                                <p>Total Student</p>
                                <asp:Label ID="lblStudent" runat="server" Text="0"></asp:Label>
                                
                            </div>
                            
                             <div class="tab">
                                <p>Upcoming Exam</p>
                                
                                <div class="content">
                                    
                                </div>
                            </div>

                           <div class="tab">
                                <p>Previous Exam</p>
                                
                                <div class="content">
                                    
                                </div>
                            </div>

                             <div class="tab">
                                <p>Logout</p>
                                <a href="Logout.aspx">Click Here</a>
                                <div class="content">
                                    
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
