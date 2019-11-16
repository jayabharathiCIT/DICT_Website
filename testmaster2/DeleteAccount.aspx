<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DeleteAccount.aspx.cs" Inherits="DICT_Website.DeleteAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style type='text/css'>
        
    </style>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <script  lang="javascript" type="text/javascript">
    function ValidateRegForm() {
        var userPreference;
        if (confirm("Do you want to delete this account?") == true) {
            userPreference = "Delete account successfully!";
        } else {
            userPreference = "Delete account canceled!";
        }
        document.getElementById("lblSuccessMessage").innerHTML = userPreference;
    }
</script>

    <link href="Content/ChangePasswordStyles.css" rel="stylesheet" />
   <%-- <div  style="vertical-align:middle; text-align:center; width:800px; height:900px; background-image:url(Images/background.png) " >--%>
         <%--<div  class="divPageContent"    >--%>
        <%--<asp:Panel ID="Panel1" runat="server" CssClass="plnOutlineDelete">
            <asp:Panel ID="Panel2" CssClass="plnInlineDelete" BorderStyle="Solid"  BorderColor="Black" BorderWidth="2px" runat="server">--%>
            <table id="testdiv" style="border:thin; border-color:black; border-style:solid; height:auto; width:100%; ;">
                    <tr>
                        <td>
             <%-- Added login dropdown --%>
                 <div class="nav navbar-nav navbar-right">
              <table  style="width:200px;" >
                  <tr>
                      <td> <asp:Label ID="lbluserInfo" Font-Bold="true" Font-Size="Medium" ForeColor="#007bff" runat="server" Text="Label"></asp:Label></td>                                          
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
                       <%-- <td style="width:130px; height:auto">
                             <asp:Image  runat="server" CssClass="imageLogo"  ImageUrl="~/Images/DictFullLogo.png"/>
                        </td>--%>
                        <td style="width:350px;height:auto; ">
                           <asp:Label ID="lblPageTitle" runat="server" Text="Delete account"  CssClass="pageTitle" ></asp:Label>
                        </td>
                    </tr>
                </table>
                </div>


              <asp:Table Height ="150px" ID="tblAddPost" runat="server" CssClass="tableDelete" HorizontalAlign="center" Width="684px" >
                <asp:TableRow Width="450" >
                <asp:TableCell >  <asp:Label ID="Label1" runat="server" Text="Are you sure you want to delete your account?? "  CssClass="pageTitleDelete" ></asp:Label></asp:TableCell>
            </asp:TableRow>

                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell>
                            <asp:Button ID="btnCreatePost" runat="server" Text="Delete" CssClass="btnSubmitControls" OnClick="btnsubmit_Click" OnClientClick="return ValidateRegForm();" /></asp:TableCell>
                        <asp:TableCell>
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btnCancelControls" OnClick="btnCancel_Click" /></asp:TableCell>
                    </asp:TableRow>
        </asp:Table>
                <asp:Label ID="lblSuccessMessage" runat="server" Text=""></asp:Label>     
  <%--  </asp:Panel>
</asp:Panel>--%>
                           
                            </td>
                    </tr>
                    </table>
  
</asp:Content>
