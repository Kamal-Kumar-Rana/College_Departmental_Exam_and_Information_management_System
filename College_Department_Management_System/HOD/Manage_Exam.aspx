<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manage_Exam.aspx.cs" Inherits="Admin_Exam_Paper" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Admin Panel | Manage Exam</title>
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
            string headerpath = HttpContext.Current.Server.MapPath("Html/Header.htm");
           
            string headercontent = System.IO.File.ReadAllText(headerpath);
            Response.Write(headercontent);
        %>

        <asp:UpdatePanel ID="pageUpdate" runat="server">
            <ContentTemplate>
                <div id="body" >
                    <div class="status top">
                        <i class="fas fa-user-shield"></i>
                        <asp:Label ID="Label1" class="lbl" runat="server" Text="Admin"></asp:Label>
                        <span class="info">
                            <asp:Label ID="lblId" class="lbl" runat="server" Text="Id"></asp:Label> - <asp:Label ID="lblName" class="lbl" runat="server" Text="Name"></asp:Label>
                        </span>
                    </div>
                    <div class="status bottom">
                        <i class="fas fa-angle-double-right"></i>
                        <asp:Label ID="status" runat="server" Text="Admin Panel / Manage Exam"></asp:Label>
                    </div>
                    <div id="content" >
                      
                      <div style="display:flex">
                          


                       
                        
                            <div class="gvContainer">
                            <asp:GridView ID="gvUpdates" CssClass="gv" runat="server" 
                                AutoGenerateColumns="False" ShowFooter="True"
                                DataKeyNames="Exam_Id" OnRowCancelingEdit="gvUpdates_RowCancelingEdit" OnRowCommand="gvUpdates_RowCommand"
                                OnRowDeleting="gvUpdates_RowDeleting" OnRowEditing="gvUpdates_RowEditing" 
                                OnRowUpdating="gvUpdates_RowUpdating" HorizontalAlign="Justify" 
                                >
                                <Columns>
                                    <asp:TemplateField HeaderText="Exam_Id" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
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
                                             <asp:TextBox ID="txtExamDate" CssClass="gvTextbox" runat="server" Text='<%# Bind("Exam_Date") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditExamDate" CssClass="gvTextbox" runat="server" Text='<%# Bind("Exam_Date") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                         <FooterTemplate>
                                            <asp:TextBox ID="txtExamDate" CssClass="gvTextbox" placeholder="DD-MM-yyyy" autocomplete="off" runat="server"
                                                 Rows="10" MaxLength="500" TextMode="Date"></asp:TextBox>
                                        </FooterTemplate>
                                        <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                        <ItemStyle CssClass="gvitem"></ItemStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Start Time" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("Start_Time") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                           <asp:TextBox ID="txtEditStartTime" CssClass="gvTextbox" runat="server" Text='<%# Bind("Start_Time") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                         <FooterTemplate>
                                            <asp:TextBox ID="txtStartTime" CssClass="gvTextbox" placeholder="Time" autocomplete="off" runat="server"
                                                 Rows="10" MaxLength="500" TextMode="Time"></asp:TextBox>
                                        </FooterTemplate>
                                        <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                        <ItemStyle CssClass="gvitem"></ItemStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Semester" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                        <ItemTemplate>

                                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("Semester") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                        <asp:DropDownList ID="ddlEditSemester" runat="server">
                                             <asp:ListItem Value="1">1</asp:ListItem>
                                    <asp:ListItem Value="2">2</asp:ListItem>
                                    <asp:ListItem Value="3">3</asp:ListItem>
                                     <asp:ListItem Value="4">4</asp:ListItem>
                                    <asp:ListItem Value="5">5</asp:ListItem>
                                    <asp:ListItem Value="6">6</asp:ListItem>
                                            </asp:DropDownList>
                                            <!-- <asp:TextBox ID="txtEditSemester" CssClass="gvTextbox" runat="server" Text='<%# Bind("Semester") %>'></asp:TextBox>-->
                                        </EditItemTemplate>
                                           <FooterTemplate>
                                            <!--<asp:TextBox ID="txtSemester" CssClass="gvTextbox" placeholder="(1,2,....,6)" autocomplete="off" runat="server"
                                                 Rows="10" MaxLength="500" TextMode="SingleLine"></asp:TextBox>-->
                                                 <asp:DropDownList ID="ddlSemester" runat="server">
                                             <asp:ListItem Value="1">1</asp:ListItem>
                                    <asp:ListItem Value="2">2</asp:ListItem>
                                    <asp:ListItem Value="3">3</asp:ListItem>
                                     <asp:ListItem Value="4">4</asp:ListItem>
                                    <asp:ListItem Value="5">5</asp:ListItem>
                                    <asp:ListItem Value="6">6</asp:ListItem>
                                            </asp:DropDownList>
                                        </FooterTemplate>
                                        <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                        <ItemStyle CssClass="gvitem"></ItemStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Paper Code(e.g: BCA-101,BCA-102,etc)" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("Paper_Code") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                           <!-- <asp:TextBox ID="txtEditPaperCode" CssClass="gvTextbox" runat="server" Text='<%# Bind("Paper_Code") %>'></asp:TextBox>-->
                                             <asp:DropDownList ID="ddlEditPaperCode" runat="server">
                                             <asp:ListItem Value="BCA-101">BCA-101</asp:ListItem>
                                    <asp:ListItem Value="BCA-102">BCA-102</asp:ListItem>
                                    <asp:ListItem Value="BCA-201">BCA-201</asp:ListItem>
                                     <asp:ListItem Value="BCA-202">BCA-202</asp:ListItem>
                                    <asp:ListItem Value="BCA-301">BCA-301</asp:ListItem>
                                    <asp:ListItem Value="BCA-302">BCA-302</asp:ListItem>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                        <asp:DropDownList ID="ddlPaperCode" runat="server">
                                                  <asp:ListItem Value="BCA-102">BCA-102</asp:ListItem>
                                    <asp:ListItem Value="BCA-201">BCA-201</asp:ListItem>
                                     <asp:ListItem Value="BCA-202">BCA-202</asp:ListItem>
                                    <asp:ListItem Value="BCA-301">BCA-301</asp:ListItem>
                                    <asp:ListItem Value="BCA-302">BCA-302</asp:ListItem>
                                            </asp:DropDownList>
                                        </FooterTemplate>
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
                                        <FooterTemplate>
                                        <asp:TextBox ID="txtDuration" CssClass="gvTextbox" runat="server" Text='<%# Bind("Duration") %>'></asp:TextBox>
                                        </FooterTemplate>
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
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtFull_Marks" CssClass="gvTextbox" runat="server" Text='<%# Bind("Full_Marks") %>'
                                                onkeypress='validate(event)' MaxLength="10"></asp:TextBox>
                                        </FooterTemplate>
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
                                        <FooterTemplate>
                                        <asp:TextBox ID="txtTotal_Questionl" CssClass="gvTextbox" runat="server" Text='<%# Bind("Total_Question") %>'></asp:TextBox>
                                        </FooterTemplate>
                                        <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                        <ItemStyle CssClass="gvitem"></ItemStyle>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Exam Link" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                        <ItemTemplate>
                                            <asp:Label ID="Label14" runat="server" Text='<%# Eval("Link") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditLink" CssClass="gvTextbox" runat="server" Text='<%# Bind("Link") %>'
                                                ></asp:TextBox>
                                        </EditItemTemplate>
                                       <FooterTemplate>
                                       <asp:TextBox ID="txtLink" CssClass="gvTextbox" runat="server" Text='<%# Bind("Link") %>'
                                               ></asp:TextBox>
                                       </FooterTemplate>
                                        <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                        <ItemStyle CssClass="gvitem"></ItemStyle>
                                    </asp:TemplateField>

                                  <asp:TemplateField HeaderText="Action" ItemStyle-CssClass="gvaction" HeaderStyle-CssClass="gvheader">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" CssClass="gvbtn" runat="server" CommandName="Edit" OnClientClick="return confirm('Do you want to edit the selected row?')"
                                                ToolTip="Edit"><i class="fas fa-user-edit"></i>Edit</asp:LinkButton>
                                            <asp:LinkButton ID="LinkButton2" CssClass="gvbtn delete" runat="server" CommandName="Delete"
                                                OnClientClick="return confirm('Do you want to delete the selected notice? It cannot be undone!')"
                                                ToolTip="Delete the entire row"><i class="fas fa-trash-alt delete"></i>Delete</asp:LinkButton>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="LinkButton3" CssClass="gvbtn" runat="server" CommandName="Update" OnClientClick="return confirm('Do you want to update?')"
                                                ToolTip="Update row"><i class="fas fa-save"></i>Update</asp:LinkButton>
                                            <asp:LinkButton ID="LinkButton4" CssClass="gvbtn" runat="server" CommandName="Cancel" OnClientClick="return confirm('All unsaved data will be lost!')"
                                                ToolTip="Cancel editing"><i class="fas fa-window-close"></i>Cancel</asp:LinkButton>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:LinkButton ID="LinkButton1"  CssClass="gvbtn" runat="server" CommandName="New" ToolTip="Add notice"
                                                OnClientClick="return confirm('Do you want to publish new notice?')"><i class="fas fa-user-plus"></i>Publish</asp:LinkButton>
                                        </FooterTemplate>
                                        <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                        <ItemStyle CssClass="gvaction"></ItemStyle>
                                        <FooterStyle CssClass="gvaction"></FooterStyle>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <div class="error">
                                        <asp:Label ID="lblError" runat="server" Text="No data found."></asp:Label>
                                    </div>
                                </EmptyDataTemplate>
                            </asp:GridView>



                        </div>


                         <div id="frame" style="margine-left:10%">

                           <iframe src="https://www.google.com/forms/about" width="350" height="400"></iframe>
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
