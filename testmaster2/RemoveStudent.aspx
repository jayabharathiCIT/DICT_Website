<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="RemoveStudent.aspx.cs" Inherits="DICT_Website.RemoveStudent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
         <link href="Content/forumStyles.css" rel="stylesheet" />
     <asp:Panel ID="Panel1" runat="server" CssClass="plnOutlineHorizontal" >
         
            <asp:Panel ID="Panel2" CssClass="plnInlineHorizontal" BorderStyle="Solid"  BorderColor="Black" BorderWidth="1px" runat="server">
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
                           <asp:Label ID="lblPageTitle" runat="server" Text="Remove A Student - Admin Action"  CssClass="pageTitle" ></asp:Label>
                        </td>
                    </tr>
                </table>
                </div>
                <div style="padding-top:30px ;">
                <div style="height:500px;text-align: center;  align-content:center;  width:100%; border-color:black; border-width:thin; border-style:solid ">
                   <asp:GridView ID="gv_StudentDetails" runat="server" BackColor="Transparent" BorderColor="#CCCCCC" BorderStyle="None"  GridLines="Both"
                        BorderWidth="1px"  Width="100%" Height="490px" CellPadding="3" ViewStateMode="Enabled" AutoGenerateColumns="False" ShowHeaderWhenEmpty="true"
                         AllowPaging="true" PageSize="5"  OnPageIndexChanging="gv_StudentDetails_PageIndexChanging"  > 
                        <PagerSettings  NextPageText="Next>>" PreviousPageText="Previous>>" Mode="NextPrevious"   Position="Bottom"  PageButtonCount="4"  />
                        <PagerStyle  Font-Size="15px" Font-Bold="true" BorderStyle="None"   />
                       <EmptyDataTemplate>No One Student requested for Reset Password</EmptyDataTemplate>
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
                        <FooterStyle BackColor="Transparent"  ForeColor="Black" />
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
                    <div style="bottom:0; float:right; width:100%; right:0; color:transparent; height:30px;" dir="auto">
                        <table>
                            <tr>                                
                                <td style="text-align: right" > <asp:Button ID="btnCancel" runat="server"  Text="Cancel" CssClass="btnReply"  CausesValidation="false" OnClick="btnCancel_Click" /></td>
                            </tr>
                        </table>
                       
                    </div>
                    
                </div>
                </asp:Panel>
         </asp:Panel>
</asp:Content>
