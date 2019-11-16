<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminForumPage.aspx.cs" EnableEventValidation="false" Inherits="DICT_Website.AdminForumPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/forumStyles.css" rel="stylesheet" />
    
      <asp:Panel ID="Panel1" runat="server" CssClass="plnOutlineHorizontal" >
         
            <asp:Panel ID="Panel2" CssClass="plnInlineHorizontal" BorderStyle="Solid"  BorderColor="black" BorderWidth="2px" runat="server">
                <%-- Added login dropdown --%>
                 <div class="nav navbar-nav navbar-right">
              <table  style="width:200px;" >
                  <tr>
                      <td> <asp:Label ID="lbluserInfo" Font-Bold="true" Font-Size="Medium" ForeColor="#007bff"  runat="server" Text="Label"></asp:Label></td>                                          
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
                        <td style="height:auto; ">
                           <asp:Label ID="lblPageTitle" runat="server" Text="Admin Forum Page"  CssClass="pageTitle" ></asp:Label>
                        </td>
                    </tr>
                </table>
                </div>
                <div style="padding-top:30px ;">
                <div style="height:450px;text-align: center; float:left; align-content:center;  width:100%; border-color:black; border-width:thin; border-style:solid ">
                    <asp:GridView ID="gv_ForumDetails" runat="server" BackColor="Transparent" BorderStyle="None"  GridLines="Both" ForeColor="Black"
                        BorderWidth="1px" Width="100%"  Height="480px" CellPadding="3" ViewStateMode="Enabled" AutoGenerateColumns="False" 
                        OnRowDataBound="OnRowDataBound" OnRowCommand="gv_ForumDetails_RowCommand" AllowPaging="true" PageSize="3"  OnPageIndexChanging="gv_ForumDetails_PageIndexChanging"  > 
                        <PagerSettings  NextPageText="Next>>" PreviousPageText="Previous>>" Mode="NextPrevious"    Position="Bottom"  PageButtonCount="4"  />
                        <PagerStyle  Font-Size="15px" Font-Bold="true" BorderStyle="None"  />
                        <Columns>
                            
                            <asp:TemplateField HeaderText="Topic">
                                <ItemTemplate>                                          
                                    <asp:HyperLink ID="hyLnk_Topic" runat="server" ForeColor="#007bff" Text='<%# Bind("Topic_Title") %>' NavigateUrl='<%# Eval("Post_ID", "~/ViewandReplyPost.aspx?PostID={0}") %>'  Font-Underline="true" ></asp:HyperLink>                                    
                                    <br>
                                    </br>
                                    <asp:Label ID="lblDescription" ForeColor="Black" runat="server" Text='<%# Bind("Description_Post") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Category">                                
                                <ItemTemplate>                                                                       
                                    <asp:Label ID="lblCategory" ForeColor="Black"  runat="server" Text='<%# Bind("Category_ID") %>'></asp:Label>                                                                       
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Replies">
                                <ItemTemplate>                                                                          
                                    <asp:Label ID="lblReply" Font-Bold="true" ForeColor="Black" runat="server" Text='<%# Bind("No_Replies") %>'></asp:Label>                                  
                                </ItemTemplate>
                            </asp:TemplateField>        
                            <asp:TemplateField HeaderText="Delete" >
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnDelete" runat="server" Width="50px" Height="40px"  ImageUrl="~/Images/delete.png" OnClick="imgbtnDelete_Click" CommandName="Delete" CommandArgument='<%#Eval("Post_ID")%>' />
                               <%-- <asp:Button ID="btnReply"  runat="server" Text="Reply"  CssClass="btnReply" CommandName="Reply"   OnClick="btnReply_Click1"   Tooltip='<%# DataBinder.Eval(Container.DataItem, "Post_ID") %>'  CommandArgument='<%#Eval("Post_ID")%>' />  --%>
                                </ItemTemplate>
                            </asp:TemplateField>
                                                        
                        </Columns>
                        <FooterStyle BackColor="Transparent"  ForeColor="White" />
                        <HeaderStyle  CssClass="gridheader"  />
                        <PagerStyle  BackColor="Transparent" ForeColor="Black" HorizontalAlign="Left" />
                        <PagerStyle BackColor="Transparent" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle  BackColor="Transparent" Font-Bold="true" ForeColor="Black" Font-Size="14px" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="Transparent" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="Transparent" />
                        <SortedAscendingHeaderStyle BackColor="Transparent" />
                        <SortedDescendingCellStyle BackColor="Transparent" />
                        <SortedDescendingHeaderStyle BackColor="Transparent" />
                        
                    </asp:GridView>
                                         
                    <asp:Label ID="lblSucessMessage" runat="server" Text=""></asp:Label>
                    
                </div>                        
                
                    <div style="bottom:0; float:right; width:100%; right:0; color:transparent; height:30px;" dir="auto">
                        <table>
                            <tr>
                      
                                <td style="text-align: right; width:100%" > <asp:Button ID="btnCancel" runat="server"  Text="Cancel" CssClass="btnReply"  CausesValidation="false" OnClick="btnCancel_Click" /></td>
                            </tr>
                        </table>
                       
                    </div>
                    </div>
                   <asp:Label ID="lblSuccessMessage" runat="server" Text=""></asp:Label>
                </asp:Panel>

          </asp:Panel>
</asp:Content>
