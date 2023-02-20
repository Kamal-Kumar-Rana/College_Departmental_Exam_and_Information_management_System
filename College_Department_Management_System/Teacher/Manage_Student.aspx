<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manage_Student.aspx.cs" Inherits="Admin_Manage_Student" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Admin Panel | Manage Student</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="CSS/Dashboard.css" rel="stylesheet" type="text/css" />
    <link href="CSS/Candidates.css" rel="stylesheet" type="text/css" />
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
            string headerpath = HttpContext.Current.Server.MapPath("Html/Manage_Student.htm");
           
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
                            <asp:Label ID="lblId" class="lbl" runat="server" Text="Id"></asp:Label> - <asp:Label ID="lblName" class="lbl" runat="server" Text="Name"></asp:Label>
                        </span>
                    </div>
                    <div class="status bottom">
                        <i class="fas fa-angle-double-right"></i>
                        <asp:Label ID="status" runat="server" Text="Admin Panel / Manage Student"></asp:Label>
                    </div>
                    <div id="content">
                        <asp:Panel ID="panelForm" runat="server" Visible="true">
                            <div class="intro">
                                <ul>
                                    <li>Add new candidate here.</li>
                                </ul>
                            </div>
                             <div class="input-box">
                                <asp:TextBox ID="txtStudentId" class="input" type="text" autocomplete="off" runat="server" required MaxLength="10"></asp:TextBox>

                                <label for="txtStudentId" class="label-name">
                                    <span class="content-name">Student ID</span>
                                </label>
                            </div>
                            <div class="input-box">
                                <asp:TextBox ID="txtName" class="input" type="text" autocomplete="off" 
                                    runat="server" required MaxLength="30" ></asp:TextBox>
                                <label for="txtName" class="label-name">
                                    <span class="content-name">Name</span>
                                </label>
                            </div>
                              <div class="input-box">
                                <asp:TextBox ID="txtPassword" class="input" type="text" autocomplete="off" runat="server" required MaxLength="20" TextMode="Password"></asp:TextBox>
                                <label for="txtPassword" class="label-name">
                                    <span class="content-name">Password</span>
                                </label>
                            </div>
                              <div class="input-box">
                                <asp:TextBox ID="txtSemester" class="input" type="text" autocomplete="off" runat="server" required MaxLength="15"></asp:TextBox>
                                <label for="txtSemester" class="label-name">
                                    <span class="content-name">Semester</span>
                                </label>
                            </div>
                              <div class="input-box">
                                <asp:TextBox ID="txtRoll" class="input" type="text" autocomplete="off" runat="server" required MaxLength="10"></asp:TextBox>
                                <label for="txtRoll" class="label-name">
                                    <span class="content-name">Roll No.</span>
                                </label>
                            </div>
                      
                           
                             <div class="input-box">
                                <asp:DropDownList ID="ddlGender" class="input" runat="server" required>
                                    <asp:ListItem Value="Gender" disabled Selected hidden>Gender</asp:ListItem>
                                    <asp:ListItem Value="Male">Male</asp:ListItem>
                                    <asp:ListItem Value="Female">Female</asp:ListItem>
                                </asp:DropDownList>
                                <label for="ddlGender" class="label-name">
                                    <span class="content-name">Gender</span>
                                </label>
                            </div>
                                <div class="input-box">
                                <asp:TextBox ID="txtDOB" class="input" TextMode="Date" autocomplete="off" runat="server"
                                    MaxLength="10"></asp:TextBox>
                                <label for="txtDOB" class="label-name">
                                    <span class="content-name">Date of Birth</span>
                                </label>
                            </div>

                               <div class="input-box">
                                <asp:TextBox ID="txtType" class="input"  autocomplete="off" runat="server"
                                    MaxLength="10"></asp:TextBox>
                                <label for="txtType" class="label-name">
                                    <span class="content-name">Type of Student</span>
                                </label>
                            </div>


                             <div class="input-box">
                                <asp:TextBox ID="txtMobile" class="input" type="text" autocomplete="off" runat="server" required
                                    onkeypress='validate(event)' MaxLength="10"></asp:TextBox>
                                <label for="txtMobile" class="label-name">
                                    <span class="content-name">Mobile number</span>
                                </label>
                            </div>
                            

                            <div class="input-box">
                                <asp:TextBox ID="txtEmail" class="input" type="text" autocomplete="off" runat="server" required MaxLength="50"></asp:TextBox>
                                <label for="txtEmail" class="label-name">
                                    <span class="content-name">Email</span>
                                </label>
                            </div>

                        <div class="input-box">
                                <asp:TextBox ID="txtAddress" class="input" type="text" autocomplete="off" runat="server" required MaxLength="50"></asp:TextBox>
                                <label for="txtAddress" class="label-name">
                                    <span class="content-name">Address</span>
                                </label>
                            </div>

                           


                          

                            <div class="btnContainer">
                               

                                <asp:Button ID="btnRegister" Text="Register" class="fas fa-user-plus" 
                                    CssClass="btn" runat="server" onclick="btnRegister_Click1" />

                                <asp:LinkButton ID="linkCancel" CssClass="btn" runat="server" OnClientClick="return confirm('All unsaved data will be lost.')" 
                                    ><i class="fas fa-times-circle"></i>Cancel</asp:LinkButton>
                            </div>
                        </asp:Panel>

                        
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