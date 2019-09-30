<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ForumHomePage.aspx.cs" Inherits="DICT_Website.ForumHomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <link href="Content/forumStyles.css" rel="stylesheet" />
      <asp:Panel ID="Panel1" runat="server" CssClass="plnOutlineHorizontal">
            <asp:Panel ID="Panel2" CssClass="plnInlineHorizontal" BorderStyle="Solid"  BorderColor="White" BorderWidth="2px" runat="server">
            <div id="divHeader" class="divHeader"> 
                <table>
                    <tr>
                        <td style="width:130px; height:auto">
                             <asp:Image  runat="server" CssClass="imageLogo"  ImageUrl="~/Images/DictFullLogo.png"/>
                        </td>
                        <td style="width:350px;height:auto; ">
                           <asp:Label ID="lblPageTitle" runat="server" Text="Forum Page"  CssClass="pageTitle" ></asp:Label>
                        </td>
                    </tr>
                </table>
                </div>
                <div style="padding-top:30px ;">
                <div style=" float:left;height:450px; width:600px; border-color:white; border-width:thin; border-style:solid ">
                    <asp:GridView ID="gv_ForumDetails" runat="server" BackColor="Transparent" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" ViewStateMode="Enabled" AutoGenerateColumns="False" OnRowDataBound="OnRowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="Topic">
                                <ItemTemplate>
                                    <asp:Image runat="server" ImageUrl="~/Images/Comment.png" />        
                                    <asp:HyperLink ID="hyLnk_Topic" runat="server" ForeColor="Black" Text='<%# Bind("Topic_Title") %>'  Font-Underline="true" ></asp:HyperLink>
                                    <%--<asp:Label ID="Label2" runat="server" Text='<%# Bind("Topic_Title") %>'></asp:Label>--%>
                                    <br>
                                    </br>
                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("Topic_Description") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Created By">                                
                                <ItemTemplate>
                                    <asp:Label ID="lblUser" runat="server" Text="User" ForeColor="Black"></asp:Label>
                                    <asp:Label ID="lblCreatedBy" runat="server" Text='<%# Bind("CreatedBy") %>'></asp:Label>
                                    <br>
                                    </br>
                                    <asp:Label ID="lblCategoryDis" runat="server" ForeColor="Black" Text="Category"></asp:Label>
                                    <asp:Label ID="lblCategory" runat="server" Text='<%# Bind("Category") %>'></asp:Label>
                                    <br>
                                    </br>
                                    <asp:Label ID="lblPostedDate" runat="server" ForeColor="Black" Text="Posted On: "></asp:Label>
                                    <asp:Label ID="lblPostedOn" runat="server" Text='<%# Bind("PostedOn") %>'></asp:Label>
                                    
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Reply">
                                <ItemTemplate>         
                                    <asp:Image runat="server" ImageUrl="~/Images/replyall.png" />
                                    <asp:Label ID="lblReply" Font-Bold="true" ForeColor="Black" runat="server" Text='<%# Bind("Reply") %>'></asp:Label>
                                    <asp:Button ID="btnReply"  runat="server" Text="Reply"  CssClass="btnReply" />
                                    
                                </ItemTemplate>
                            </asp:TemplateField>                                                       
                                                        
                        </Columns>
                        <FooterStyle BackColor="Transparent"  ForeColor="White" />
                        <HeaderStyle BackColor="#E5E5E5" Font-Bold="True" ForeColor="Black"  Font-Size="18px"  />
                        <PagerStyle  BackColor="Transparent" ForeColor="White" HorizontalAlign="Left" />
                        <PagerStyle BackColor="Transparent" ForeColor="White" HorizontalAlign="Left" />
                        <RowStyle  BackColor="Transparent" ForeColor="White" Font-Size="14px" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="Transparent" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="Transparent" />
                        <SortedAscendingHeaderStyle BackColor="Transparent" />
                        <SortedDescendingCellStyle BackColor="Transparent" />
                        <SortedDescendingHeaderStyle BackColor="Transparent" />
                        
                    </asp:GridView>
                </div>
                    <div style="float:right; height:450px; width:200px; border-color:white; border-width:thin; border-style:solid ">
                        
                    </div>
                    </div>
                </asp:Panel>

          </asp:Panel>

</asp:Content>
