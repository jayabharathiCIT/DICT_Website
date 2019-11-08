<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DeleteAccount.aspx.cs" Inherits="DICT_Website.DeleteAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style type='text/css'>
        
    </style>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
                           <asp:Label ID="lblPageTitle" runat="server" Text="Are you sure you want to delete your account??"  CssClass="pageTitle" ></asp:Label>
                        </td>
                    </tr>
                </table>
                </div>


              <%--<asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell>
                            <asp:Button ID="btnSubmit" runat="server" Text="Delete" CssClass="btnSubmitControls" OnClick="btnSubmit_Click" /></asp:TableCell>
                        <asp:TableCell>
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btnCancelControls" OnClick="btnCancel_Click" /></asp:TableCell>
                    </asp:TableRow>--%>
                    
        
                <asp:Label ID="lblSuccessMessage" runat="server" Text=""></asp:Label>     
    </asp:Panel>
</asp:Panel>
  
</asp:Content>
