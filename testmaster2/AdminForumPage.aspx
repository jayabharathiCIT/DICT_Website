﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminForumPage.aspx.cs" EnableEventValidation="false" Inherits="DICT_Website.AdminForumPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/forumStyles.css" rel="stylesheet" />
    
      <asp:Panel ID="Panel1" runat="server" CssClass="plnOutlineHorizontal" >
         
            <asp:Panel ID="Panel2" CssClass="plnInlineHorizontal" BorderStyle="Solid"  BorderColor="White" BorderWidth="2px" runat="server">
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
                             <asp:Image  runat="server" CssClass="imageLogo"  ImageUrl="~/Images/logoBlue.png" Height="98px"/>
                        </td>
                        <td style="width:350px;height:auto; ">
                           <asp:Label ID="lblPageTitle" runat="server" Text="Admin Forum Page"  CssClass="pageTitle" ></asp:Label>
                        </td>
                    </tr>
                </table>
                </div>
                <div style="padding-top:30px ;">
                <div style="height:500px;text-align: center;  align-content:center;  width:800px; border-color:white; border-width:thin; border-style:solid ">
                    <asp:GridView ID="gv_ForumDetails" runat="server" BackColor="Transparent" BorderColor="#CCCCCC" BorderStyle="None"  GridLines="Both"
                        BorderWidth="1px" Width="800px"  Height="490px" CellPadding="3" ViewStateMode="Enabled" AutoGenerateColumns="False"
                        OnRowDataBound="OnRowDataBound" OnRowCommand="gv_ForumDetails_RowCommand" AllowPaging="true" PageSize="2"  OnPageIndexChanging="gv_ForumDetails_PageIndexChanging"  > 
                        <PagerSettings  NextPageText="Next>>" PreviousPageText="Previous>>" Mode="NextPrevious"    Position="Bottom"  PageButtonCount="4"  />
                        <PagerStyle  Font-Size="15px" Font-Bold="true" BorderStyle="Dotted"   />
                        <Columns>
                            
                            <asp:TemplateField HeaderText="Topic">
                                <ItemTemplate>                                          
                                    <asp:HyperLink ID="hyLnk_Topic" runat="server" ForeColor="Black" Text='<%# Bind("Topic_Title") %>' NavigateUrl='<%# Eval("Post_ID", "~/ViewandReplyPost.aspx?PostID={0}") %>'  Font-Underline="true" ></asp:HyperLink>                                    
                                    <br>
                                    </br>
                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("Description_Post") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Category">                                
                                <ItemTemplate>                                                                       
                                    <asp:Label ID="lblCategory" runat="server" Text='<%# Bind("Category_ID") %>'></asp:Label>                                                                       
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
                        <PagerStyle  BackColor="Transparent" ForeColor="White" HorizontalAlign="Left" />
                        <PagerStyle BackColor="Transparent" ForeColor="White" HorizontalAlign="Left" />
                        <RowStyle  BackColor="Transparent" Font-Bold="true" ForeColor="White" Font-Size="14px" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="Transparent" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="Transparent" />
                        <SortedAscendingHeaderStyle BackColor="Transparent" />
                        <SortedDescendingCellStyle BackColor="Transparent" />
                        <SortedDescendingHeaderStyle BackColor="Transparent" />
                        
                    </asp:GridView>
                </div>                    
                    </div>
                </asp:Panel>

          </asp:Panel>
</asp:Content>