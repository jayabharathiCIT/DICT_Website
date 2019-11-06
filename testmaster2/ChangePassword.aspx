<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="DICT_Website.ChangePassword" %>
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
        if (confirm("Do you want to changes the password?") == true) {
            userPreference = "Change password successfully!";
        } else {
            userPreference = "Change password canceled!";
        }
        document.getElementById("lblSuccessMessage").innerHTML = userPreference;
    }
</script>

  
    <link href="Content/ChangePasswordStyles.css" rel="stylesheet" />
   <%-- <div  style="vertical-align:middle; text-align:center; width:800px; height:900px; background-image:url(Images/background.png) " >--%>
         <%--<div  class="divPageContent"    >--%>
        <asp:Panel ID="Panel1" runat="server" CssClass="plnOutline">
            <asp:Panel ID="Panel2" CssClass="plnInline" BorderStyle="Solid"  BorderColor="White" BorderWidth="2px" runat="server">
            <div id="divHeader" class="divHeader"> 
                <table>
                    <tr>
                        <td style="width:130px; height:auto">
                             <asp:Image  runat="server" CssClass="imageLogo"  ImageUrl="~/Images/DictFullLogo.png"/>
                        </td>
                        <td style="width:350px;height:auto; ">
                           <asp:Label ID="lblPageTitle" runat="server" Text="Change your password"  CssClass="pageTitle" ></asp:Label>
                        </td>
                    </tr>
                </table>
                </div>
        
               
        
          <asp:Table Height ="450" ID="tblAddPost" runat="server" CssClass="tableRegister" HorizontalAlign="center" >
            
            <asp:TableRow Width="150" >
                <asp:TableCell > <asp:Label runat="server" ID="lblID" Text="Your ID*" CssClass="textLables"></asp:Label></asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtID" CssClass="txtControlRegister" runat="server" ></asp:TextBox><br/>
                       <asp:Label ID="lblErrorID" runat="server" Text="" CssClass="textLablesSmall"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow Width="150" >
                <asp:TableCell > <asp:Label runat="server" ID="lblPassword" Text="Password*" CssClass="textLables" MinimumValue="6" MaxLength="10"></asp:Label><br />
                    <asp:Label ID="lblInfo" runat="server" Text="**Password should be numeric between 6 to 10." CssClass="textLablesInfo"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtPassword1" CssClass="txtControlRegister" runat="server" TextMode="Password"></asp:TextBox><br/>   
                    <asp:Label ID="lblErrorPassword" runat="server" Text="" CssClass="textLablesSmall"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>  
                
            <asp:TableRow Width="150" > 
                <asp:TableCell > <asp:Label runat="server" ID="lblNewPassword" Text="New Password*" CssClass="textLables"></asp:Label></asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtNewPassword" CssClass="txtControlRegister" runat="server" TextMode="Password" MinimumValue="6" MaxLength="10"></asp:TextBox><br/> 
                    <asp:Label ID="lblErrorNewPassword" runat="server" Text="" CssClass="textLablesSmall"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            
            <asp:TableRow Width="150" >
                <asp:TableCell > <asp:Label runat="server" ID="lblConfirmPassword" Text="Confirm Password*" CssClass="textLables"></asp:Label></asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtConfirmPassword" CssClass="txtControlRegister" runat="server" TextMode="Password" MinimumValue="6" MaxLength="10"></asp:TextBox><br/>
                    <asp:Label ID="lblErrorConfirmPassword" runat="server" Text="" CssClass="textLablesSmall"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>

                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell>
                            <asp:Button ID="btnCreatePost" runat="server" Text="Change password" CssClass="btnSubmitControls" OnClick="btnChangePassword_Click" OnClientClick="return ValidateRegForm();" /></asp:TableCell>
                        <asp:TableCell>
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btnCancelControls" OnClick="btnCancel_Click" /></asp:TableCell>
                    </asp:TableRow>
        </asp:Table>
                <asp:Label ID="lblSuccessMessage" runat="server" Text=""></asp:Label>     
    </asp:Panel>
</asp:Panel>
  
</asp:Content>

