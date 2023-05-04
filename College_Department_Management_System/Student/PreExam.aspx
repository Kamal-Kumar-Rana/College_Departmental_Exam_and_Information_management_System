<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PreExam.aspx.cs" Inherits="Student_PreExam" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
       <link href="CSS/Dashboard.css" rel="stylesheet" type="text/css" />
       <link href="CSS/Dashboard.css" rel="stylesheet" type="text/css" />
    <link href="CSS/Footer.css" rel="stylesheet" type="text/css" />
    <link href="CSS/Notice.css" rel="stylesheet" type="text/css" />
    <link href="../Global/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    
    <link href="CSS/Notice.css" rel="stylesheet" type="text/css" />
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
                        
                       
           
         <div class="gvContainer" style="padding-left:30%; padding-top:10px">
                            <asp:GridView ID="gvUpdates" CssClass="gv" runat="server" AutoGenerateColumns="False"
                                DataKeyNames="Exam_Id" BackColor="#DEBA84" BorderColor="#DEBA84" 
                                BorderStyle="None" BorderWidth="1px" CellPadding="5" CellSpacing="3" 
                                Height="100px" >
                                <Columns>
                                    <asp:TemplateField HeaderText="Paper_Code" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Paper_Code") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Paper_Code") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                        <ItemStyle CssClass="gvitem"></ItemStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Exam_Date" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Exam_Date") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtMessage" CssClass="gvTextbox" runat="server" Text='<%# Bind("Exam_Date") %>'
                                                TextMode="MultiLine" Rows="10" MaxLength="500"></asp:TextBox>
                                        </EditItemTemplate>
                                       
                                        <HeaderStyle CssClass="gvheader" />
                                        <ItemStyle CssClass="gvitem" />
                                       
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Start_Time" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Start_Time") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtMessage" CssClass="gvTextbox" runat="server" Text='<%# Bind("Start_Time") %>'
                                                TextMode="MultiLine" Rows="10" MaxLength="500"></asp:TextBox>
                                        </EditItemTemplate>
                                       
                                        <HeaderStyle CssClass="gvheader" />
                                        <ItemStyle CssClass="gvitem" />
                                       
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Semester" ItemStyle-CssClass="gvitem">
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
                                    <asp:HyperLinkField DataNavigateUrlFields="Link" HeaderText="Link" 
                                        Text="Click Here" />
                                    
                       
                                </Columns>
                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                                <SortedDescendingHeaderStyle BackColor="#93451F" />
                            </asp:GridView>
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
