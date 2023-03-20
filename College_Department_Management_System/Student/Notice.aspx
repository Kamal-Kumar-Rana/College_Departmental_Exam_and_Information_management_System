<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Notice.aspx.cs" Inherits="Student_Notice" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Student | Notice</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
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
 

        <asp:UpdatePanel ID="updatePage" runat="server">
            <ContentTemplate>
           
       <div id="header">
                    <div id="logo"><span>Notice Section</span></div>
                </div>
                    <div id="content">
                        <div class="notice-section">
        
        <ul>
          <li>
                
             <div id="update" class="window" runat="server">
                         <h3>Notice</h3>   
                        </div>
                 <asp:Panel ID="task" class="window" runat="server" Visible="false">
                       
                            <div class="lbl">
                                <asp:Label ID="lblDailyTask" runat="server" Text="Notice"></asp:Label>
                            </div>
                        </asp:Panel>
          </li>
         
          
        </ul>
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
