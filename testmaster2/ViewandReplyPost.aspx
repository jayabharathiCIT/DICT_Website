<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewandReplyPost.aspx.cs" Inherits="DICT_Website.ViewandReplyPost" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/forumStyles.css" rel="stylesheet" />
     <asp:Panel ID="Panel1" runat="server" CssClass="plnOutlineViewPost">
            <asp:Panel ID="Panel2" CssClass="plnInlineViewPost" BorderStyle="Solid"  BorderColor="White" BorderWidth="2px" runat="server" Font-Bold="True">
                <%-- Added login dropdown --%>
                 <div class="nav navbar-nav navbar-right">
              <table  style="width:200px;" >
                  <tr>
                      <td> <asp:Label ID="lbluserInfo" Font-Bold="true" Font-Size="Medium" ForeColor="#FACF5A" runat="server" Text="Label"></asp:Label></td>                                          
                  </tr>      
                  <tr>
                      <td><asp:DropDownList ID="ddlLogin" CssClass="ddllogin1" runat="server" Width="150px"  AutoPostBack="true" OnSelectedIndexChanged="ddlLogin_SelectedIndexChanged" BackColor="White" Font-Size="14px" ForeColor="Black"   >
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
                <table>
                    <tr>
                        <td style="width:130px; height:auto">
                             <asp:Image  runat="server" CssClass="imageLogo"  ImageUrl="~/Images/DictFullLogo.png"/>
                        </td>
                        <td style="width:350px;height:auto; ">
                           <asp:Label ID="lblPageTitle" runat="server" Text="Post View and Reply"  CssClass="pageTitle" ></asp:Label>
                        </td>
                    </tr>
                </table>
                </div>
                <div style=" float:left;height:190px; width:550px; border-color:white; border-width:thin; border-style:solid ">
                    <asp:Table ID="tblPostTitleDec"  CssClass="tableViewReplyPost" runat="server" CellSpacing="3"  HorizontalAlign="Center" >
                        <asp:TableRow>
                            <asp:TableCell Width="65px" > <asp:Image runat="server" ImageUrl="~/Images/Comment.png" /></asp:TableCell>
                            <asp:TableCell Width ="150px" >
                   <asp:Label ID="lblPostTitle" runat="server" Text="Title of the Post : " Font-Bold="True" Font-Size="16px" ForeColor="Black"></asp:Label>                                                               
                            </asp:TableCell>
                            <asp:TableCell>  <asp:Label ID="lblPostTitleValue" runat="server" Text="" Font-Size="16px" ForeColor="White"></asp:Label></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell Width="65px" >
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/User.png" />                                
                            </asp:TableCell>
                            <asp:TableCell  ColumnSpan="2" >
                                <asp:Label ID="lblCreatedByValue" runat="server" Text="" Font-Size="16px" ForeColor="White"></asp:Label>
                            </asp:TableCell>                                                        
                        </asp:TableRow>
                        <asp:TableRow>

                            <asp:TableCell Width="65px" >
                                <asp:Image ID="Image2" ImageUrl="~/Images/ZoomIn.png" runat="server" />                                
                            </asp:TableCell>
                            <asp:TableCell Width="140px" >
                                <asp:Label ID="lblDescription" runat="server" Text="Description : " Font-Bold="True" Font-Size="16px" ForeColor="Black" ></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell >
                                <asp:Label ID="lblDescValue"    runat="server"  Font-Size="16px" ForeColor="White" ></asp:Label>
                                
                            </asp:TableCell>
                        </asp:TableRow>

                    </asp:Table>
                    

                    </div>
                <div style=" float:left;height:350px; width:550px; border-color:white; border-width:thin; border-style:solid ">
                     <asp:Table ID="tblReplyView"  Height="155px" CssClass="tableViewReplyPost" runat="server" CellSpacing="3"  HorizontalAlign="Center" >
                        <asp:TableRow>
                            <asp:TableCell Width="65px" > <asp:Image runat="server" ImageUrl="~/Images/replyall.png" /></asp:TableCell>      
                            <asp:TableCell ColumnSpan="2" >
                                <asp:Label runat="server" ID="lblReplies" Font-Size="16px" ForeColor="White" ></asp:Label>                         
                            </asp:TableCell>
                        </asp:TableRow>
                         </asp:Table>
                    <table>
                    <tr>
                        <td style="width:130px; height:auto">
                             <asp:Image ID="Image3"  runat="server" ImageUrl="~/Images/sendReply.png" />
                        </td>
                        <td style="width:350px;height:auto; ">
                           <asp:Label ID="Label1" runat="server" Text="Send Reply"  CssClass="pageTitle" ></asp:Label>
                        </td>
                    </tr>
                </table>
                    
                    <asp:Table ID="tblReply"  Height="130px"   CellSpacing="3" runat="server">
                        <asp:TableRow  >
                            <asp:TableCell Width="200px" >
                                 <asp:Label ID="lblComment" runat="server"  CssClass="textLables" Text="Comment"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                 <asp:TextBox ID="txtComment" TextMode="MultiLine" CssClass="txtControl" runat="server"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                     
                       <asp:TableRow>
                           <asp:TableCell >
                               <asp:Button ID="btnReply" runat="server" Text="Reply" CssClass="btnCancelControls"  OnClick="btnReply_Click" />                               
                           </asp:TableCell>
                           <asp:TableCell>
                               <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btnCancelControls" OnClick="btnCancel_Click" />
                           </asp:TableCell>
                       </asp:TableRow>
                    </asp:Table>
                    
                    <asp:Label ID="lblSuccessMessage"  runat="server" ForeColor="Black" Font-Size="14px"  ></asp:Label>         
                    </div>

                </asp:Panel>
         </asp:Panel>

</asp:Content>