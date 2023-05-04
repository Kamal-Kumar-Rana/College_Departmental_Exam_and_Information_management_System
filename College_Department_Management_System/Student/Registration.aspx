<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Student_Registration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Student | Registration</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="CSS/Dashboard.css" rel="stylesheet" type="text/css" />
    <link href="../Teacher/CSS/Candidates.css" rel="stylesheet" type="text/css" />
    <link href="../Global/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <%
        string path = HttpContext.Current.Server.MapPath("Link.txt");
        string content = System.IO.File.ReadAllText(path);
        Response.Write(content);
    %>
</head>
<body>
    <form id="dashboard" runat="server">

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
 

        <<asp:UpdatePanel ID="updatePage" runat="server">
            <ContentTemplate>
            <div id="header">
                    <div id="logo"><span>Student Registration</span></div>
                </div>
                <div id="body">
                 <div class="status">
                        <i class="fas fa-angle-double-right"></i>
                        <asp:Label ID="status" runat="server" Text="New Registration"></asp:Label>
                    </div>
                    <div id="content">
                       <asp:Panel ID="panelForm" runat="server" Visible="true">
                         
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
                                <asp:TextBox ID="txtAddress" class="input" type="text" autocomplete="off" runat="server" required MaxLength="50"></asp:TextBox>
                                <label for="txtAddress" class="label-name">
                                    <span class="content-name">Address</span>
                                </label>
                            </div>

                              

                             <div class="input-box">
                                <asp:TextBox ID="txtMobile" class="input" type="phone" autocomplete="off" runat="server" required
                                    onkeypress='validate(event)' MaxLength="10"></asp:TextBox>
                                <label for="txtMobile" class="label-name">
                                    <span class="content-name">Mobile number</span>
                                </label>
                            </div>
                            

                            <div class="input-box">
                                <asp:TextBox ID="txtEmail" class="input" type="Email" autocomplete="off" runat="server" required MaxLength="50"></asp:TextBox>
                               
                                <label for="txtEmail" class="label-name">
                                    <span class="content-name">Email</span>
                                </label>
                                

                            </div >
                          

                              <div class="input-box">
                               <div class="input-group">
                                   <asp:TextBox ID="txtOtp" placeholder="OTP" class="form-control" runat="server"></asp:TextBox>
                                   <asp:Button ID="btnOtpSend" class="btn btn-outline-secondary" runat="server" 
                                       Text="Send OTP" onclick="btnOtpSend_Click" />
                                   <asp:Button ID="btnOtpVerify" class="btn btn-outline-secondary" runat="server" 
                                       Text="Verify" onclick="btnOtpVerify_Click" />
  
</div>
  


                            </div>
                            <div class="input-box">
                                <asp:TextBox ID="txtPassword" class="input"  runat="server"  TextMode="Password"></asp:TextBox>
                                <label for="txtPassword" class="label-name">
                                    <span class="content-name">Password</span>
                                </label>
                            </div>

                     

                           


                          

                            <div class="btnContainer">
                               

                                <asp:Button ID="btnRegister" Text="Register" class="fas fa-user-plus" 
                                    CssClass="btn" runat="server" OnClientClick="Confirm to register!" 
                                    onclick="btnRegister_Click"   />

                                <asp:LinkButton ID="linkCancel" CssClass="btn" runat="server" 
                                    OnClientClick="return confirm('All unsaved data will be lost.')" onclick="linkCancel_Click" 
                                    ><i class="fas fa-times-circle"></i>Clear</asp:LinkButton>
                            </div>
                                       <div class="input-box">
                                
                                           <asp:Label ID="lblMass" runat="server" ></asp:Label>
                                
                            </div>


                        </asp:Panel>
                      
                    </div>
                </div>
          </ContentTemplate>
        </asp:UpdatePanel>

       
    </form>
</body>
</html>


