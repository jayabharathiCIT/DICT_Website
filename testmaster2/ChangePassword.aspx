<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="DICT_Website.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style type='text/css'>
        
    </style>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
  $( function() {
    $("#datepicker").datepicker();
      //document.getElementById('#TextBox1').datepicker();
      //$('#TextBox1').datepicker({
      //    dateFormat: 'dd/mm/yy'
      //});
      $('#MainContent_tbDate').datepicker({
         dateFormat: 'dd-mm-yy'
      });
  });
    //$(document).ready(function () {
    //    $('#tbDate').datepicker({
    //        dateFormat: 'dd/mm/yy'
    //    });
    //});
</script>
     
    <link href="Content/forumStyles.css" rel="stylesheet" />
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
        
               
        
          <asp:Table Height ="550" ID="tblAddPost" runat="server" CssClass="tableRegister" HorizontalAlign="center" >
            
            <asp:TableRow Width="250" >
                <asp:TableCell > <asp:Label runat="server" ID="lblID" Text="Your ID*" CssClass="textLables"></asp:Label></asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtID" CssClass="txtControlRegister" Type="Integer" ErrorMessage="Your ID muxt be numbers." runat="server"></asp:TextBox><br/> 
                    <asp:Label ID="lblErrorID" runat="server" Text="" CssClass="textLablesSmall"></asp:Label></asp:TableCell>
            </asp:TableRow>

            <asp:TableRow Width="250" >
                <asp:TableCell > <asp:Label runat="server" ID="lblPassword" Text="Current password*" CssClass="textLables"></asp:Label><br/>
                    <asp:Label ID="lblInfo" runat="server" Text="**Password should be alphanumeric and  character between 6 to 10." CssClass="textLablesInfo"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtPassword1" CssClass="txtControlRegister" runat="server" TextMode="Password"></asp:TextBox><br/>
                     <asp:Label ID="lblErrorPassword" runat="server" Text="" CssClass="textLablesSmall"></asp:Label></asp:TableCell>
            </asp:TableRow>

              <asp:TableRow Width="250" >
                <asp:TableCell > <asp:Label runat="server" ID="lblNewPassword" Text="New password*" CssClass="textLables"></asp:Label><br/>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtNewPassword" CssClass="txtControlRegister" runat="server" TextMode="Password"></asp:TextBox><br/>
                     <asp:Label ID="lblErrorNewPassword" runat="server" Text="" CssClass="textLablesSmall"></asp:Label></asp:TableCell>
            </asp:TableRow>
            
            <asp:TableRow Width="250" >
                <asp:TableCell > <asp:Label runat="server" ID="lblConfirmPassword" Text="Confirm Password*" CssClass="textLables"></asp:Label></asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtConfirmPassword" CssClass="txtControlRegister" runat="server" TextMode="Password"></asp:TextBox><br/>
                    <asp:Label ID="lblErrorConfirm" runat="server" Text="" CssClass="textLablesSmall"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>

                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell>
                            <asp:Button ID="btnCreatePost" runat="server" Text="Change password" CssClass="btnSubmitControls" OnClick="btnChangePassword_Click" /></asp:TableCell>
                        <asp:TableCell>
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btnCancelControls" OnClick="btnCancel_Click" /></asp:TableCell>
                    </asp:TableRow>
        </asp:Table>
                <asp:Label ID="lblSuccessMessage" runat="server" Text=""></asp:Label>     
    </asp:Panel>
</asp:Panel>
   <%-- </div>--%>
</asp:Content>
