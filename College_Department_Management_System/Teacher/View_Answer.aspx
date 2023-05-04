<%@ Page Language="C#" AutoEventWireup="true" CodeFile="View_Answer.aspx.cs" Inherits="Teacher_View_Answer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
       <link href="CSS/Dashboard.css" rel="stylesheet" type="text/css" />
       <link href="CSS/Dashboard.css" rel="stylesheet" type="text/css" />
    <link href="CSS/Footer.css" rel="stylesheet" type="text/css" />
    <link href="CSS/Notice.css" rel="stylesheet" type="text/css" />
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
                        <asp:Label ID="status" runat="server" Text="Dashboard"></asp:Label>
                        <asp:Label ID="lblInfo" runat="server" Text="name (id)"></asp:Label>
                    </div>
                    <div id="content">
                        
                       
                    
  
        
         <div class="gvContainer">
                            <asp:GridView ID="gvUpdates" CssClass="gv" runat="server" AutoGenerateColumns="False" ShowFooter="false"
                                DataKeyNames="Ass_Id" >
                                <Columns>
                                    <asp:TemplateField HeaderText="Ass_Id" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Ass_Id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Ass_Id") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                        <ItemStyle CssClass="gvitem"></ItemStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Paper_Code" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Paper_Code") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtMessage" CssClass="gvTextbox" runat="server" Text='<%# Bind("Paper_Code") %>'
                                                TextMode="MultiLine" Rows="10" MaxLength="500"></asp:TextBox>
                                        </EditItemTemplate>
                                       
                                        <HeaderStyle CssClass="gvheader" />
                                        <ItemStyle CssClass="gvitem" />
                                       
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Semester" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Semester") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtMessage" CssClass="gvTextbox" runat="server" Text='<%# Bind("Semester") %>'
                                                TextMode="MultiLine" Rows="10" MaxLength="500"></asp:TextBox>
                                        </EditItemTemplate>
                                       
                                        <HeaderStyle CssClass="gvheader" />
                                        <ItemStyle CssClass="gvitem" />
                                       
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Student_Id" ItemStyle-CssClass="gvitem">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Student_Id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtMessage" CssClass="gvTextbox" runat="server" Text='<%# Bind("Student_Id") %>'
                                                TextMode="MultiLine" Rows="10" MaxLength="500"></asp:TextBox>
                                        </EditItemTemplate>
                                       
                                        <HeaderStyle CssClass="gvheader" />
                                        <ItemStyle CssClass="gvitem" />
                                       
                                    </asp:TemplateField>
                                    
                                    <asp:HyperLinkField HeaderText="Answer"  HeaderStyle-CssClass="gvheader"
                                        Text="View And Answer" DataNavigateUrlFields="Answer" >
                                                            




                                 
                                    <HeaderStyle CssClass="gvheader" />
                                    </asp:HyperLinkField>
                                                            




                                 
                                </Columns>
                                
                            </asp:GridView>
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

    
    </div>
    </form>
</body>
</html>
