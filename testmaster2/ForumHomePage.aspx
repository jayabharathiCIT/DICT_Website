﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="false"  CodeBehind="ForumHomePage.aspx.cs" Inherits="DICT_Website.ForumHomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <link href="Content/forumStyles.css" rel="stylesheet" />
    
      <%--<asp:Panel ID="Panel1" runat="server" CssClass="plnOutlineHorizontal"  > 
        <%--  <div id="divOuter" class="divOuterHorizontal"  >--%>
         
           <%--  <asp:Panel ID="Panel2" CssClass="plnInlineHorizontal"  runat="server" >--%>
             <%--    <div id ="divInner" class="divInnerHorizontal" >--%>
                <%-- Added login dropdown --%>
                <table id="testdiv" style="border:thin; border-color:black; border-style:solid; height:auto; width:100%; ;">
                    <tr>
                        <td>
                 <div class="nav navbar-nav navbar-right">
              <table  style="width:200px;  " >
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
                    <tr >
                       <%-- <td style="width:130px; height:auto">
                             <asp:Image  runat="server" CssClass="imageLogo"  ImageUrl="~/Images/transLogo.png" Height="98px"/>
                        </td>--%>
                        <td style="height:auto; text-align:center ">
                           <asp:Label ID="lblPageTitle" runat="server" Text="Forum Page"  CssClass="pageTitle" ></asp:Label>
                        </td>
                    </tr>
                </table>
                </div>              
                <div style=" float:left;height:auto; width:80%; margin-top:20px; border-color:white; border-width:thin; border-style:solid ">
                    <asp:GridView ID="gv_ForumDetails" runat="server" BackColor="Transparent" BorderStyle="None"  GridLines="Both"
                        BorderWidth="1px" Width="100%"  CellPadding="3" ViewStateMode="Enabled" AutoGenerateColumns="False" ShowHeaderWhenEmpty="true"
                        OnRowDataBound="OnRowDataBound" OnRowCommand="gv_ForumDetails_RowCommand" AllowPaging="true" PageSize="5"  OnPageIndexChanging="gv_ForumDetails_PageIndexChanging"  > 
                        <PagerSettings  NextPageText="Next>>" PreviousPageText="Previous>>" Mode="NextPrevious"   Position="Bottom"  PageButtonCount="4"  />
                        <PagerStyle  Font-Size="15px" Font-Bold="true"   />
                        <EmptyDataTemplate>No Record Found</EmptyDataTemplate>
                        <Columns>
                            
                            <asp:TemplateField HeaderText="Topic"   >
                                <ItemTemplate>
                                    <asp:Image runat="server" Width="51px"  Height="50px" ImageUrl="~/Images/Comment.png" />        
                                    <asp:HyperLink ID="hyLnk_Topic" runat="server" ForeColor="#007bff" Text='<%# Bind("Topic_Title") %>' NavigateUrl='<%# Eval("Post_ID", "~/ViewandReplyPost.aspx?PostID={0}") %>'  Font-Underline="true" ></asp:HyperLink>
                                    <%--<asp:Label ID="Label2" runat="server" Text='<%# Bind("Topic_Title") %>'></asp:Label>--%>
                                    <br>
                                    </br>
                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("Description_Post") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Created By">                                
                                <ItemTemplate>
                                    <asp:Label ID="lblUser" runat="server" Text="User :" ForeColor="Black"></asp:Label>
                                    <asp:Label ID="lblCreatedBy" runat="server" Text='<%# Bind("Register_ID") %>'></asp:Label>
                                    <br>
                                    </br>
                                    <asp:Label ID="lblCategoryDis" runat="server" ForeColor="Black" Text="Category :"></asp:Label>
                                    <asp:Label ID="lblCategory" runat="server" Text='<%# Bind("Category_ID") %>'></asp:Label>
                                    <br>
                                    </br>
                                    <asp:Label ID="lblPostedDate" runat="server" ForeColor="Black" Text="Posted On : "></asp:Label>
                                    <asp:Label ID="lblPostedOn" runat="server"  Text='<%# Bind("Date_Posted","{0:f}") %>'></asp:Label>
                                    
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Reply">
                                <ItemTemplate> 
                                     <asp:Button ID="btnEdit"  runat="server" Text="Edit"  CssClass="btnReply" CommandName="Edit"   OnClick="btnEdit_Click"   Tooltip='<%# DataBinder.Eval(Container.DataItem, "Post_ID") %>'  CommandArgument='<%#Eval("Post_ID")%>' Visible='<%# HasEditPermission((int)Eval("Register_ID")) %>'   />                                    
                                    <asp:Image runat="server" Width="51px"  Height="50px" ImageUrl="~/Images/replyall.png" />
                                    <asp:Label ID="lblReply" Font-Bold="true" ForeColor="Black" runat="server" Text='<%# Bind("No_Replies") %>'></asp:Label>
                                    <asp:Button ID="btnReply"  runat="server" Text="Reply"  CssClass="btnReply" CommandName="Reply"   OnClick="btnReply_Click1"   Tooltip='<%# DataBinder.Eval(Container.DataItem, "Post_ID") %>'  CommandArgument='<%#Eval("Post_ID")%>' />                                    
                                </ItemTemplate>
                            </asp:TemplateField>                                                       
                                                        
                        </Columns>
                        <FooterStyle BackColor="Transparent"  ForeColor="White" />
                        <HeaderStyle  CssClass="gridheader"  />
                        <PagerStyle  BackColor="Transparent" ForeColor="Black" HorizontalAlign="Left" />
                        <PagerStyle BackColor="Transparent" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle  BackColor="Transparent" Font-Bold="true" ForeColor="Black" Font-Size="14px" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="Transparent" Font-Bold="True" ForeColor="Black" />
                        <SortedAscendingCellStyle BackColor="Transparent" />
                        <SortedAscendingHeaderStyle BackColor="Transparent" />
                        <SortedDescendingCellStyle BackColor="Transparent" />
                        <SortedDescendingHeaderStyle BackColor="Transparent" />
                        
                    </asp:GridView>
                </div>
                    <div style="float:right; height:500px; width:200px; border-color:white; border-width:thin; border-style:solid ">
                        <div  style="margin-bottom:20px;  margin-top:20px; " >
                        <asp:Button ID="btnCreatePost" runat="server" Text="Create New Topic" CssClass="btnSubmitControls" OnClick="btnCreatePost_Click" />
                            </div>
                        <div id="divQuick" class="divQuickLinks" >
                            <asp:Table ID="tblQuickLinks" runat="server" GridLines="Horizontal" BorderColor="Black" Width="100%" Height="100%" Font-Bold="True" Font-Size="16px" BorderStyle="Ridge" >
                                <asp:TableHeaderRow VerticalAlign="Middle" HorizontalAlign="Center">
                                    <asp:TableHeaderCell>Quick Links</asp:TableHeaderCell>                                    
                                </asp:TableHeaderRow>
                                <asp:TableRow  > 
                                    <asp:TableCell>
                                        <asp:LinkButton ID="lnkProgramming" OnClick="lnkProgramming_Click"  runat="server">Programming</asp:LinkButton></asp:TableCell>                                       
                                </asp:TableRow>
                                <asp:TableRow>
                                     <asp:TableCell>
                                         <asp:LinkButton ID="lnkDesign" OnClick="lnkDesign_Click" runat="server">Designing</asp:LinkButton></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                     <asp:TableCell>
                                         <asp:LinkButton ID="lnkNetwork" OnClick="lnkNetwork_Click"  runat="server">Networking</asp:LinkButton></asp:TableCell>  
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:LinkButton ID="lnkSecuity" OnClick="lnkSecuity_Click" runat="server">Security</asp:LinkButton>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                            
                        </div>

                        <div id="divTopPost" class="divTopLinks" >
                            <asp:Table ID="tblTopPost" runat="server" GridLines="Horizontal" BorderColor="Black" Width="100%" Height="100%" Font-Bold="True" Font-Size="12px" BorderStyle="Ridge">
                                <asp:TableHeaderRow VerticalAlign="Middle" HorizontalAlign="Center">
                                    <asp:TableHeaderCell Font-Size="16px" >Top Posts</asp:TableHeaderCell>
                                </asp:TableHeaderRow>
                                <asp:TableRow  > 
                                    <asp:TableCell>
                                        <asp:LinkButton ID="lnkTop1"  runat="server" OnClick="lnkTop1_Click" >top link1</asp:LinkButton></asp:TableCell>                                       
                                </asp:TableRow>
                                <asp:TableRow>
                                     <asp:TableCell>
                                         <asp:LinkButton ID="lnkTop2" runat="server" OnClick="lnkTop2_Click" >top link2</asp:LinkButton></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                     <asp:TableCell>
                                         <asp:LinkButton ID="lnkTop3" runat="server" OnClick="lnkTop3_Click" >top link3</asp:LinkButton></asp:TableCell>  
                                </asp:TableRow>
                            </asp:Table>

                        </div>
                        
                    </div>
                            </td>
                    </tr>
                    </table>
                   <%-- </div>--%>
               <%-- </asp:Panel>
          <%--</div>--%>
          <%--</asp:Panel>--%>

</asp:Content>
