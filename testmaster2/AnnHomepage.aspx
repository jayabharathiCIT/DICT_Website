<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AnnHomepage.aspx.cs" Inherits="DICT_Website.AnnHomepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <link rel="stylesheet" href="Content/AnnStyle.css" />
   <%-- <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap" rel="stylesheet"> --%> 

    <div class="top-box"> 
    <h1 class="top-head">Announcements</h1> 
    </div>

    <div class="content">

           <h2>Announcement HomePage</h2>

             <div class="ContainerH1">
              
             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid"
                            AllowPaging="true" PageSize="4" HorizontalAlign="Center" Font-size="15px"  >
                
                <PagerSettings  NextPageText="Next>>" PreviousPageText="Previous>>" Mode="NextPrevious"   Position="Bottom"  PageButtonCount="4"  />
                <PagerStyle  Font-Size="15px" Font-Bold="true" ForeColor="Black" BorderStyle="none"/>  
                 
                 <Columns>
                            
                            <asp:TemplateField HeaderText="Annoncements"  >
                                <ItemTemplate>
                                    
                                    <asp:HyperLink ID="hyLnk_Topic" runat="server" ForeColor="Black" Font-size="13px" Font-Bold="true" Text='<%# Bind("Ann_Title") %>'  Font-Underline="true" ></asp:HyperLink>
                                    <%--<asp:Label ID="Label2" runat="server" Text='<%# Bind("Topic_Title") %>'></asp:Label>--%>
                                    <br>
                                    </br>
                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("Ann_Body") %>'></asp:Label>
                                    <br>
                                    </br>
                                    
                                    <asp:Label ID="lblPostedDate" runat="server" Font-size="11px" ForeColor="Black" Text="Posted On: "></asp:Label>
                                    <asp:Label ID="lblPostedOn" runat="server" Text='<%# Bind("Posted_On","{0:f}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Posted By">   
                                
                                <ItemTemplate>
                                    <asp:Label ID="lblUser" runat="server" Text="User" ForeColor="Black"></asp:Label>
                                    <asp:Label ID="lblCreatedBy" runat="server" Text='<%# Bind("Register_ID") %>'></asp:Label>
                                    <br>
                                    </br> 
                                    <asp:Button ID="btnEdit"  runat="server" Text="Edit"  CssClass="btnOptions" CommandName="Edit"   OnClick="btnEdit_Click"    />                                  
                                    <asp:Button ID="btnDelete"  runat="server" Text="Delete"  CssClass="btnOptions" CommandName="Delete"   OnClick="btnDelete_Click"  />                                    
                                </ItemTemplate>

                            </asp:TemplateField>

                           <%-- 
                               Visible='<%# HasEditPermission((int)Eval("Register_ID")) %>' 
                               <asp:Label ID="lblReply" Font-Bold="true" ForeColor="Black" runat="server" Text='<%# Bind("No_Replies") %>'></asp:Label>
                                
                                     <asp:Button ID="btnEdit"  runat="server" Text="Edit"  CssClass="btnOptions" CommandName="Edit"   OnClick="btnEdit_Click"  CommandArgument='<%#Eval("Announcement_ID")%>' Visible='<%# HasEditPermission((int)Eval("Register_ID")) %>'  />                                 
                                                                       
                                    <asp:Button ID="btnDelete"  runat="server" Text="Delete"  CssClass="btnOptions" CommandName="Delete"   OnClick="btnDelete_Click" CommandArgument='<%#Eval("Announcement_ID")%>' Visible='<%# HasEditPermission((int)Eval("Register_ID")) %>'   />                                    
                                </ItemTemplate>
                  
                             --%>  
                     
              </Columns>
             </asp:GridView>
             </div>
         

   </div>
</asp:Content>
