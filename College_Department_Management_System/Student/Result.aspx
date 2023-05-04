<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Result.aspx.cs" Inherits="User_Result" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Student | Result</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="CSS/Dashboard.css" rel="stylesheet" type="text/css" />
     <link href="CSS/Notice.css" rel="stylesheet" type="text/css" />
   <link href="CSS/Dashboard.css" rel="stylesheet" type="text/css" />
    <link href="CSS/Profile.css" rel="stylesheet" type="text/css" />
    <link href="../HOD/CSS/Candidates.css" rel="stylesheet" type="text/css" />
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
                        <asp:Label ID="status" runat="server" Text="Result"></asp:Label>
                        <asp:Label ID="lblInfo" runat="server" Text="name (id)"></asp:Label>
                    </div>
                    <div id="content">

                              <div class="row">
                            <div class="input-box ddl">
                                <asp:DropDownList ID="ddlCategory" CssClass="input ddl" runat="server" required
                                    AutoPostBack="True" 
                                    onselectedindexchanged="ddlCategory_SelectedIndexChanged" >
                                    <asp:ListItem Value="Select a option">Select a option</asp:ListItem>
                                    <asp:ListItem Value="Student_Id">Student Id</asp:ListItem>
                                    <asp:ListItem Value="Name">Name</asp:ListItem>
                                    <asp:ListItem Value="Semester">Semester</asp:ListItem>
                                    <asp:ListItem Value="Roll_No">Roll No</asp:ListItem>
                                    <asp:ListItem Value="Paper_Code">Paper Code</asp:ListItem>
                                    
                                </asp:DropDownList>
                                <label for="ddlRequestCategory" class="label-name">
                                    <div class="icon"><i class="fas fa-list-ul"></i></div>
                                    <span class="content-name">Search Student by</span>
                                </label>
                            </div>

                            <div class="input-box txt">
                                <asp:TextBox ID="txtKey" CssClass="input" type="text" autocomplete="off"
                                    runat="server" required MaxLength="50"></asp:TextBox>
                                <label for="txtKey" class="label-name">
                                    <div class="icon"><i class="fas fa-key"></i></div>
                                    <span class="content-name" id="lblKey" runat="server">Enter keyword</span>
                                    
                                </label>
                            </div>
                        </div>
                        <div class="btnContainer">
                            <asp:Button ID="btnSearch" Text="Search" class="fas fa-user-plus" CssClass="btn"
                                runat="server" OnClientClick="Confirm to register!" 
                                onclick="btnSearch_Click"  />
                        </div>
                  
                       
                        <asp:GridView ID="gvMarks" CssClass="gv" runat="server" 
                                AutoGenerateColumns="False" DataKeyNames="Student_Id">  
                              
                           
                                <Columns>
                                    <asp:TemplateField HeaderText="Student Id" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Student_Id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Student_Id") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                        <ItemStyle CssClass="gvitem"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Semester" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Semester") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("Semester") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                        <ItemStyle CssClass="gvitem"></ItemStyle>
                                    </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Paper Code" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Paper_Code") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("Paper_Code") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                        <ItemStyle CssClass="gvitem"></ItemStyle>
                                    </asp:TemplateField>
                                        <asp:TemplateField HeaderText="CIA 1 " ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("CIA-1") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("CIA-1") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                        <ItemStyle CssClass="gvitem"></ItemStyle>
                                    </asp:TemplateField>
                                        <asp:TemplateField HeaderText="CIA-2" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("CIA-2") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("CIA-2") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                        <ItemStyle CssClass="gvitem"></ItemStyle>
                                    </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Final Marks" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Total_Marks") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Total_Marks") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                        <ItemStyle CssClass="gvitem"></ItemStyle>
                                    </asp:TemplateField>
                                    
                                    
                                   
                                </Columns>
                                <EmptyDataTemplate>
                                    <div class="error">
                                        <asp:Label ID="lblError" runat="server" Text="No data found."></asp:Label>
                                    </div>
                                </EmptyDataTemplate>
                            </asp:GridView>
            

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


