<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="RemoveStudent.aspx.cs" Inherits="DICT_Website.RemoveStudent" %>
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
                <table>
                    <tr>
                        <td style="width:130px; height:auto">
                             <asp:Image  runat="server" CssClass="imageLogo"  ImageUrl="~/Images/DICTlogoNew.png" Height="98px"/>
                        </td>
                        <td style="width:400px;height:auto; ">
                           <asp:Label ID="lblPageTitle" runat="server" Text="Remove A Student - Admin Action"  CssClass="pageTitle" ></asp:Label>
                        </td>
                    </tr>
                </table>
                </div>
                <div style="padding-top:30px ;">
                <div style="height:500px;text-align: center;  align-content:center;  width:800px; border-color:white; border-width:thin; border-style:solid ">
                   <asp:GridView ID="gv_StudentDetails" runat="server" BackColor="Transparent" BorderColor="#CCCCCC" BorderStyle="None"  GridLines="Both"
                        BorderWidth="1px" Width="690px"  Height="490px" CellPadding="3" ViewStateMode="Enabled" AutoGenerateColumns="False"
                         AllowPaging="true" PageSize="2"  OnPageIndexChanging="gv_StudentDetails_PageIndexChanging"  > 
                        <PagerSettings  NextPageText="Next>>" PreviousPageText="Previous>>" Mode="NextPrevious"   Position="Bottom"  PageButtonCount="4"  />
                        <PagerStyle  Font-Size="15px" Font-Bold="true" BorderStyle="Dotted"   />
                        <Columns>
                            
                            <asp:TemplateField HeaderText="Student Name"   >
                                <ItemTemplate>                                                                               
                                    <asp:Label ID="lblStudentName" runat="server" Text='<%# Bind("First_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Last Name"   >
                                <ItemTemplate>                                                                               
                                    <asp:Label ID="lblLastName" runat="server" Text='<%# Bind("Last_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Register ID">                                
                                <ItemTemplate>                                    
                                    <asp:Label ID="lblCreatedBy" runat="server" Text='<%# Bind("Register_ID") %>'></asp:Label>
                                    <br>                                
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate> 
                                     <asp:Button ID="btnRemove"  runat="server" Text="Remove Student"  CssClass="btnSubmitControls" CommandName="Remove"    OnClick="btnRemove_Click"  Tooltip='<%# DataBinder.Eval(Container.DataItem, "Register_ID") %>'  CommandArgument='<%#Eval("Register_ID")%>'   />                                                                                                         
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
                    </div></div>
                </asp:Panel>
         </asp:Panel>
</asp:Content>
