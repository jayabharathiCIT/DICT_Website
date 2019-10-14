<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="DICT_Website.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <style type='text/css'>
        
    </style>
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
                           <asp:Label ID="lblPageTitle" runat="server" Text="Register"  CssClass="pageTitle" ></asp:Label>
                        </td>
                    </tr>
                </table>
                </div>
               
          <asp:Table ID="tblAddPost" runat="server" CssClass="tableRegister" HorizontalAlign="Center" >
            
            <asp:TableRow Width="250" >
                <asp:TableCell > <asp:Label runat="server" ID="lblID" Text="Your ID*" CssClass="textLables"></asp:Label></asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtID" CssClass="txtControlRegister" runat="server"></asp:TextBox> </asp:TableCell>
            </asp:TableRow>

           <asp:TableRow Width="250" >
                <asp:TableCell > <asp:Label runat="server" ID="lblFirstname" Text="First Name*" CssClass="textLables"></asp:Label></asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFirstname" CssClass="txtControlRegister" runat="server"></asp:TextBox> </asp:TableCell>
            </asp:TableRow>
                   
            <asp:TableRow Width="250" >
                <asp:TableCell > <asp:Label runat="server" ID="lblLastname" Text="Last Name*" CssClass="textLables"></asp:Label></asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtLastname" CssClass="txtControlRegister" runat="server"></asp:TextBox> </asp:TableCell>
            </asp:TableRow>
               
            <asp:TableRow Width="250" >
                <asp:TableCell > <asp:Label runat="server" ID="lblPassword" Text="Password*" CssClass="textLables"></asp:Label></asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtPassword" CssClass="txtControlRegister" runat="server"></asp:TextBox> </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow Width="250" >
                <asp:TableCell > <asp:Label runat="server" ID="Label1" Text="" CssClass="textLables"></asp:Label></asp:TableCell>
                <asp:TableCell>
                    <asp:Label runat="server" ID="Label2" Text="*Password should be alphanumeric and  character between 6 to 10." CssClass="textLablesSmall"></asp:Label></asp:TableCell>
            </asp:TableRow>
            
            <asp:TableRow Width="250" >
                <asp:TableCell > <asp:Label runat="server" ID="lblConfirmPassword" Text="Confirm Password*" CssClass="textLables"></asp:Label></asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtConfirmPassword" CssClass="txtControlRegister" runat="server"></asp:TextBox> </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow Width="250" >
                <asp:TableCell > <asp:Label runat="server" ID="lblDOB" Text="Date of Birth*" CssClass="textLables"></asp:Label></asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtDOB" CssClass="txtControlRegister" runat="server"></asp:TextBox> </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow Width="250" >
                <asp:TableCell > <asp:Label runat="server" ID="lblEmail" Text="Email*" CssClass="textLables"></asp:Label></asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtEmail" CssClass="txtControlRegister" runat="server"></asp:TextBox> </asp:TableCell>
            </asp:TableRow>

                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell>
                            <asp:Button ID="btnCreatePost" runat="server" Text="Create Post" CssClass="btnSubmitControls" OnClick="btnCreatePost_Click" /></asp:TableCell>
                        <asp:TableCell>
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btnCancelControls" OnClick="btnCancel_Click" /></asp:TableCell>
                    </asp:TableRow>
        </asp:Table>

                <asp:Label ID="lblSuccessMessage" runat="server" Text=""></asp:Label>     
    </asp:Panel>
</asp:Panel>
   <%-- </div>--%>
</asp:Content>
