<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminProfilePage.aspx.cs" Inherits="DICT_Website.AdminProfilePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <link href="Content/forumStyles.css" rel="stylesheet" />
    <asp:Panel ID="Panel1" runat="server" CssClass="plnOutlineHorizontal" >
         
            <asp:Panel ID="Panel2" CssClass="plnInlineHorizontal" BorderStyle="Solid"  BorderColor="black" BorderWidth="1px" runat="server">
                <%-- Added login dropdown --%>
                 <div class="nav navbar-nav navbar-right">
              <table  style="width:200px;" >
                  <tr>
                      <td> <asp:Label ID="lbluserInfo" Font-Bold="true" Font-Size="Medium" ForeColor="#007bff" runat="server" Text="Label"></asp:Label></td>                                          
                  </tr>      
                  <tr>
                      <td><asp:DropDownList ID="ddlLogin" CssClass="ddllogin1" runat="server" Width="150px"  AutoPostBack="true" OnSelectedIndexChanged="ddlLogin_SelectedIndexChanged" BackColor="White" Font-Size="14px" ForeColor="Black"   >
                              <asp:ListItem Value ="0" >Select One</asp:ListItem>                       
                          <asp:ListItem Value ="4" >Admin Profile</asp:ListItem>
                           
                          <asp:ListItem Value="1">Change Password</asp:ListItem>

                  <asp:ListItem Value="2">Delete Account</asp:ListItem>

                  <asp:ListItem Value="3" >LogOut</asp:ListItem>
                    </asp:DropDownList> 
                          </td>
                  </tr>
              </table>                                                              
                </div>
                 <%-- Added login dropdown --%> 
            <div id="divHeader" class="divHeader"> 
                <table align="Center">
                    <tr>
                        <td style="height:auto; text-align:center ">
                           <asp:Label ID="lblPageTitle" runat="server" Text="Admin Profile Page"  CssClass="pageTitle" ></asp:Label>
                        </td>
                    </tr>
                </table>
                </div>
                <div style="padding-top:30px ;">
                <div style="height:500px;text-align: center;  align-content:center;  width:100%; border-color:black; border-width:thin; border-style:solid ">
                    <asp:Table ID="tblAdminActions" Width="100%" Height="100%" runat="server" EnableTheming="true" GridLines="Both"  ForeColor="black" Font-Bold="True" Font-Size="16px" BorderStyle="None" >
                        <asp:TableHeaderRow CssClass="gridheader"  >
                            <asp:TableHeaderCell>
                                NO
                            </asp:TableHeaderCell>
                            <asp:TableHeaderCell>
                                Admin Special Privillages
                            </asp:TableHeaderCell>
                            <asp:TableHeaderCell>
                                Actions
                            </asp:TableHeaderCell>
                        </asp:TableHeaderRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                1.
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="lblStudentForum" runat="server" Text="View Posts of student. "></asp:Label><br></br>
                                <asp:Label ID="Label1" runat="server" Text="Remove Post of Students."></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                 <asp:Button ID="btnRemovePost" runat="server" Text="Forum Post Actions" CssClass="btnSubmitControls"  OnClick="btnRemovePost_Click" />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>2.</asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="lblRemoveStudent" runat="server" Text="Remove a CIT Students from Froum Portal."></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                 <asp:Button ID="btnRemoveStudent" runat="server" Text="Remove A Student" CssClass="btnSubmitControls"  OnClick="btnRemoveStudent_Click" />
                            </asp:TableCell>
                        </asp:TableRow>
                         <asp:TableRow>
                            <asp:TableCell>3.</asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="lblResetPassword" runat="server" Text="Reset Pasword of students."></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                 <asp:Button ID="btnResetPassword" runat="server" Text="Reset Password" CssClass="btnSubmitControls"  OnClick="btnResetPassword_Click" />
                            </asp:TableCell>
                        </asp:TableRow>
                         <asp:TableRow>
                            <asp:TableCell>3.</asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="lblAddAnnouncement" runat="server" Text="Add new Announcement for students."></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                 <asp:Button ID="btnAddAnnu" runat="server" Text="Add Announcement" CssClass="btnSubmitControls"  OnClick="btnAddAnnu_Click" />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>4.</asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="Label2" runat="server" Text="Add News for students."></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                 <asp:Button ID="btnAddNews" runat="server" Text="Add News" CssClass="btnSubmitControls"  OnClick="btnAddNews_Click" />
                            </asp:TableCell>
                        </asp:TableRow>
                         <asp:TableRow>
                            <asp:TableCell>5.</asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="Label3" runat="server" Text="Add Events for students."></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                 <asp:Button ID="btnEvent" runat="server" Text="Add Events" CssClass="btnSubmitControls"  OnClick="btnEvent_Click" />
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                    </div>
                    </div>
                </asp:Panel>
        </asp:Panel>
</asp:Content>
