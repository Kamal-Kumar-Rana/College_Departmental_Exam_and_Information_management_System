<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manage_Paper.aspx.cs" Inherits="Admin_Manage_Subject" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Admin Panel | Manage Paper</title>
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
    <form id="form1" runat="server">
    
   
           
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
                        <asp:Label ID="Label2" runat="server" Text="Control Panel / Users"></asp:Label>
                    </div>
                    <div id="content">

     <div class="gvContainer">
                            <asp:GridView ID="gvUser" CssClass="gv" runat="server" 
                                AutoGenerateColumns="False" ShowFooter="True"
                                DataKeyNames="Exam_Id" OnRowCancelingEdit="gvUser_RowCancelingEdit" 
                                OnRowDeleting="gvUser_RowDeleting" OnRowEditing="gvUser_RowEditing" 
                                OnRowUpdating="gvUser_RowUpdating" 
                                >
                                <Columns>
                                    <asp:TemplateField HeaderText="Exam Id" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Exam_Id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Exam_Id") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                        <ItemStyle CssClass="gvitem"></ItemStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Exam Date" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Exam_Date") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtExamDate" CssClass="gvTextbox" runat="server" Text='<%# Bind("Exam_Date") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                        <ItemStyle CssClass="gvitem"></ItemStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Start Time" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("Start_Time") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                           <asp:TextBox ID="txtStartTime" CssClass="gvTextbox" runat="server" Text='<%# Bind("Start_Time") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                        <ItemStyle CssClass="gvitem"></ItemStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Semester(1,2,....,6)" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("Semester") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                             <asp:TextBox ID="txtSemester" CssClass="gvTextbox" runat="server" Text='<%# Bind("Semester") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                        <ItemStyle CssClass="gvitem"></ItemStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Paper Code(e.g: BCA-101,BCA-102,etc)" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("Paper_Code") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtPaperCode" CssClass="gvTextbox" runat="server" Text='<%# Bind("Paper_Code") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                        <ItemStyle CssClass="gvitem"></ItemStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Duration(HH)" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                        <ItemTemplate>
                                            <asp:Label ID="Label11" runat="server" Text='<%# Eval("Duration") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditDuration" CssClass="gvTextbox" runat="server" Text='<%# Bind("Duration") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                        <ItemStyle CssClass="gvitem"></ItemStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Full Marks" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                        <ItemTemplate>
                                            <asp:Label ID="Label12" runat="server" Text='<%# Eval("Full_Marks") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditFull_Marks" CssClass="gvTextbox" runat="server" Text='<%# Bind("Full_Marks") %>'
                                                onkeypress='validate(event)' MaxLength="10"></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                        <ItemStyle CssClass="gvitem"></ItemStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Total Questions" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                        <ItemTemplate>
                                            <asp:Label ID="Label13" runat="server" Text='<%# Eval("Total_Question") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditTotal_Questionl" CssClass="gvTextbox" runat="server" Text='<%# Bind("Total_Question") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                        <ItemStyle CssClass="gvitem"></ItemStyle>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Exam Link" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                        <ItemTemplate>
                                            <asp:Label ID="Label14" runat="server" Text='<%# Eval("Link") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditLink" CssClass="gvTextbox" runat="server" Text='<%# Bind("Link") %>'
                                                onkeypress='validate(event)' MaxLength="10"></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                        <ItemStyle CssClass="gvitem"></ItemStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Action" ItemStyle-CssClass="gvaction" HeaderStyle-CssClass="gvheader">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" CssClass="gvbtn" runat="server" CommandName="Edit" OnClientClick="return confirm('Do you want to edit the selected row?')"
                                                ToolTip="Edit"><i class="fas fa-user-edit"></i>Edit</asp:LinkButton>
                                            <asp:LinkButton ID="LinkButton2" CssClass="gvbtn delete" runat="server" CommandName="Delete"
                                                OnClientClick="return confirm('Do you want to delete the selected user? It can not be undone!')"
                                                ToolTip="Delete the entire row"><i class="fas fa-trash-alt delete"></i>Delete</asp:LinkButton>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="LinkButton3" CssClass="gvbtn" runat="server" CommandName="Update" OnClientClick="return confirm('Do you want to update?')"
                                                ToolTip="Update row"><i class="fas fa-save"></i>Update</asp:LinkButton>
                                            <asp:LinkButton ID="LinkButton4" CssClass="gvbtn" runat="server" CommandName="Cancel" OnClientClick="return confirm('All unsaved data will be lost!')"
                                                ToolTip="Cancel editing"><i class="fas fa-window-close"></i>Cancel</asp:LinkButton>
                                        </EditItemTemplate>
                                          <FooterTemplate>
                                            <asp:LinkButton ID="LinkButton5"  CssClass="gvbtn" runat="server" CommandName="New" ToolTip="Add notice"
                                                OnClientClick="return confirm('Do you want to publish new notice?')"><i class="fas fa-user-plus"></i>Publish</asp:LinkButton>
                                        </FooterTemplate>
                                        <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                        <ItemStyle CssClass="gvaction"></ItemStyle>
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
          
    </form>
</body>
</html>
