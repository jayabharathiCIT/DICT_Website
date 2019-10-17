<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DICT_Website.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <link href="Content/forumStyles.css" rel="stylesheet" />
        <asp:Panel ID="Panel1" runat="server" CssClass="plnOuterLogin">
            <asp:Panel ID="Panel2" CssClass="plnInnerLogin" BorderStyle="Solid"  BorderColor="White" BorderWidth="2px" runat="server">
            <div id="divHeader" class="divHeader"> 
                <table>
                    <tr>
                        <td style="width:120px; height:auto">
                             <asp:Image  runat="server" CssClass="imageLogo"  ImageUrl="~/Images/DictFullLogo.png"/>
                        </td>
                        <td style="width:300px;height:auto; ">
                           <asp:Label ID="lblPageTitle" runat="server" Text="Login"  CssClass="pageTitle" ></asp:Label>
                        </td>
                    </tr>
                </table>
                </div>
                <asp:Table ID="tbllogin" runat="server" HorizontalAlign="Center" CssClass="tablelogin" >
            <asp:TableRow Width="150" >
                <asp:TableCell > <asp:Label runat="server" ID="lblLogin" Text="Username" CssClass="textLables"></asp:Label></asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtUserName" CssClass="txtControl" runat="server"></asp:TextBox> </asp:TableCell>
               
            </asp:TableRow>
                    <asp:TableRow>
                         <asp:TableCell ColumnSpan="2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"   
                    ControlToValidate="txtUserName" ErrorMessage="Please Enter Your Username"   
                    ForeColor="Red"></asp:RequiredFieldValidator> 
                </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblPassword" runat="server" CssClass="textLables" Text="Password"></asp:Label></asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtPassword" CssClass="txtControl" runat="server"></asp:TextBox></asp:TableCell>                        
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="2">
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"   
                            ControlToValidate="txtPassword" ErrorMessage="Please Enter Your password"   
                            ForeColor="Red"></asp:RequiredFieldValidator>  
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell   ColumnSpan="2">
                        <asp:Button id="btnLogin" runat="server" CssClass="btnReply" Text="Login" OnClick="btnLogin_Click" /> 
                            </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center"   >
                        <asp:TableCell ColumnSpan="2"  >
                            <asp:LinkButton ID="lnkForgotPassword" ForeColor="Black"  Font-Underline="true"  Font-Size="14px" runat="server">Forgot Password</asp:LinkButton>
                        </asp:TableCell>
                        
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center" >
                        <asp:TableCell ColumnSpan="2" >
                            <asp:Label ID="lblSuccessMessage" runat="server" Font-Size="14px" ForeColor="Red" Text=""></asp:Label></asp:TableCell>
                    </asp:TableRow>
                    </asp:Table>
                
                </asp:Panel>
            </asp:Panel>
    <asp:Panel runat="server">
        <div style="height:178px;" >

        </div>
    </asp:Panel>
</asp:Content>
