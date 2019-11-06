<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="DICT_Website.ForgetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style type='text/css'>
        
    </style>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script lang="javascript" type="text/javascript">
            function ValidateRegForm() {
                var email = document.getElementById("<%=txtEmail.ClientID%>");
                var filter = /^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9]{2,4})+$/;
                if (!filter.test(email.value)) {
                    alert('Please provide a valid email address');
                    email.focus;
                    return false;
                }
                return true;
            }
</script>

    <link href="Content/ForgetPasswordStyles.css" rel="stylesheet" />
   <%-- <div  style="vertical-align:middle; text-align:center; width:800px; height:900px; background-image:url(Images/background.png) " >--%>
         <%--<div  class="divPageContent"    >--%>
        <asp:Panel ID="Panel1" runat="server" CssClass="plnOutlineForgetPassword">
            <asp:Panel ID="Panel2" CssClass="plnInlineForgetPassword" BorderStyle="Solid"  BorderColor="White" BorderWidth="2px" runat="server">
            <div id="divHeader" class="divHeader"> 
                <table>
                    <tr>
                        <td style="width:100px; height:auto">
                             <asp:Image  runat="server" CssClass="imageLogo"  ImageUrl="~/Images/DictFullLogo.png"/>
                        </td>
                         <td style="width:380px;height:auto; ">
                           <asp:Label ID="lblPageTitle" runat="server" Text="Forget your password??"  CssClass="pageTitle" ></asp:Label>
                        </td>
                    </tr>
                </table>
                </div>

                <div id="divDetail" class="divDetail"> 
                <table>
                    <tr>
                     <td style="width:550px;height:auto; ">
                           <asp:Label ID="lblPageDetail" runat="server" Text="Please enter the email address registered on your account."  CssClass="pageDetail" ></asp:Label>
                        </td>
                        </tr>
                </table>
                </div>
              
        
          <asp:Table Height ="200" ID="tblAddPost" runat="server" CssClass="tableForgetPassword" HorizontalAlign="center" >
            
            <asp:TableRow Width="50" >
                <asp:TableCell > <asp:Label runat="server" ID="lblID" Text="Your ID*" CssClass="textLablesForgetPassword"></asp:Label></asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtID" CssClass="txtControlForgetPassword" runat="server" ></asp:TextBox><br/>
                       <asp:Label ID="lblErrorID" runat="server" Text="" CssClass="textLablesSmall"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow Width="50" >
                <asp:TableCell > <asp:Label runat="server" ID="lblEmail" Text="Email*" CssClass="textLablesForgetPassword" TextMode="Email"></asp:Label></asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtEmail" CssClass="txtControlForgetPassword" runat="server"></asp:TextBox><br/>
                    <asp:Label ID="lblErrorEmail" runat="server" Text="" CssClass="textLablesSmall"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>

              <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell>
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btnSubmitControls" OnClick="btnSubmit_Click" OnClientClick="return ValidateRegForm();" /></asp:TableCell>
                        <asp:TableCell>
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btnCancelControls" OnClick="btnCancel_Click" /></asp:TableCell>
                    </asp:TableRow>
                    
        </asp:Table>
                <asp:Label ID="lblSuccessMessage" runat="server" Text=""></asp:Label>     
    </asp:Panel>
</asp:Panel>
  
</asp:Content>
