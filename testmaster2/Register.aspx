<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="DICT_Website.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<style type='text/css'>
        
    .auto-style1 {
        width: 2300px;
        height: 1456px;
    }
        
    </style>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script>
    //$(function () {
    //    $("#datepicker").datepicker();
    //    $('#MainContent_tbDate').datepicker({
    //        dateFormat: 'dd-mm-yy'
    //    });
    //});
</script>

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
  
     <script type="text/javascript">
         function CheckAvailability() {
             var Register_ID = document.getElementById("txt_ID").value;
             var request;
             if (window.XMLHttpRequest) {
                 //New browsers.
                 request = new XMLHttpRequest();
             }
             else if (window.ActiveXObject) {
                 //Old IE Browsers.
                 request = new ActiveXObject("Microsoft.XMLHTTP");
             }
             if (request != null) {
                 var url = "Register.aspx/CheckUserName";
                 request.open("POST", url, false);
                 var sendStr = "{Register_ID: '" + Register_ID + "'}";
                 request.setRequestHeader("Content-Type", "application/json");
                 request.onreadystatechange = function () {
                     if (request.readyState == 4 && request.status == 200) {
                         var messages = document.getElementById("message");
                         if (JSON.parse(request.responseText).d) {
                             //Username available.
                             message.style.color = "green";
                             message.innerHTML = "Username is available";
                         }
                         else {
                             //Username not available.
                             message.style.color = "red";
                             message.innerHTML = "Username is NOT available";
                         }
                     }
                 };
                 request.send(sendStr);
             }
         }

         function ClearMessage() {
             document.getElementById("message").innerHTML = "";
         };
</script>

<link href="Content/RegisterStyles.css" rel="stylesheet" />
   <%-- <div  style="vertical-align:middle; text-align:center; width:800px; height:900px; background-image:url(Images/background.png) " >--%>
         <%--<div  class="divPageContent"    >--%>
        <asp:Panel ID="Panel1" runat="server" CssClass="plnOutlineRegister">
            <asp:Panel ID="Panel2" CssClass="plnInlineRegister" BorderStyle="Solid"  BorderColor="Black" BorderWidth="2px" runat="server">
            <div id="divHeader" class="divHeader"> 
                <table>
                    <tr>
                        <%--<td style="width:150px; height:auto">
                             <asp:Image  runat="server" CssClass="imageLogo"  ImageUrl="~/Images/DictFullLogo.png"/>
                        </td>--%>
                        <td style="width:350px;height:auto; ">
                           <asp:Label ID="lblPageTitle" runat="server" Text="Register Account"  CssClass="pageTitle" ></asp:Label>
                        </td>
                    </tr>
                </table>
                </div>
               
        
         <asp:Table Height ="550" ID="tblAddPost" runat="server" CssClass="tableRegister" HorizontalAlign="center" >
            
            <asp:TableRow Width="250" >
                <asp:TableCell > <asp:Label runat="server" ID="lblID" Text="Your ID*" CssClass="textLables"></asp:Label></asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtID" CssClass="txtControlRegister" runat="server" ></asp:TextBox><br/>
                       <asp:RangeValidator id="Range1" ControlToValidate="txtID" Font-Size="Small" Font-Bold="true" ForeColor="Red" MinimumValue="1" MaximumValue="10" Type="Integer" EnableClientScript="false" Text="Your ID must be number." runat="server"> </asp:RangeValidator><br/>
                       <asp:Label ID="lblErrorID" runat="server" Text="" CssClass="textLablesSmall"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>

           <asp:TableRow Width="250" >
                <asp:TableCell > <asp:Label runat="server" ID="lblFirstname" Text="First Name*" CssClass="textLables"></asp:Label></asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFirstname" CssClass="txtControlRegister" runat="server" ></asp:TextBox><br/>
                    <asp:Label ID="lblErrorFirstname" runat="server" Text="" CssClass="textLablesSmall"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
                   
            <asp:TableRow Width="250" >
                <asp:TableCell > <asp:Label runat="server" ID="lblLastname" Text="Last Name*" CssClass="textLables"></asp:Label></asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtLastname" CssClass="txtControlRegister" runat="server"></asp:TextBox><br/>
                    <asp:Label ID="lblErrorLastname" runat="server" Text="" CssClass="textLablesSmall"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow Width="250" >
                <asp:TableCell > <asp:Label runat="server" ID="lblPassword" Text="Password*" CssClass="textLables" ></asp:Label><br />
                    <asp:Label ID="lblInfo" runat="server" Text="**Password should be numeric between 6 to 10." CssClass="textLablesInfo"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtPassword1" CssClass="txtControlRegister" runat="server" TextMode="Password" min="5" max="10"></asp:TextBox><br/>
                     <asp:RangeValidator id="RangeValidator1" ControlToValidate="txtPassword1" Font-Size="Small" Font-Bold="true" ForeColor="Red"  MinimumValue="6" MaximumValue="10" Type="Integer" EnableClientScript="false" Text="Your Password must be number." runat="server"> </asp:RangeValidator><br/>
                    <asp:Label ID="lblErrorPassword" runat="server" Text="" CssClass="textLablesSmall"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>  
                
            
            <asp:TableRow Width="250" >
                <asp:TableCell > <asp:Label runat="server" ID="lblConfirmPassword" Text="Confirm Password*" CssClass="textLables"></asp:Label></asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtConfirmPassword" CssClass="txtControlRegister" runat="server" TextMode="Password"  min="5" max="10" ></asp:TextBox><br/>
                     <asp:RangeValidator id="RangeValidator2" ControlToValidate="txtConfirmPassword" Font-Size="Small" Font-Bold="true" ForeColor="Red"  MinimumValue="6" MaximumValue="10" Type="Integer" EnableClientScript="false" Text="Your Confirm Password must be number." runat="server"> </asp:RangeValidator><br/>
                    <asp:Label ID="lblErrorConfirmPassword" runat="server" Text="" CssClass="textLablesSmall"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
       
    
            <asp:TableRow Width="250" >
                <asp:TableCell > <asp:Label runat="server" ID="lblDOB" Text="Date of Birth*" CssClass="textLables"></asp:Label></asp:TableCell>
                <asp:TableCell>
                     <asp:TextBox ID="tbDate" TextMode="date" runat="server" placeholder="Select a Date" CssClass="txtControlRegister"></asp:TextBox><br/>
                    <asp:Label ID="lblErrorDOB" runat="server" Text="" CssClass="textLablesSmall"></asp:Label>
                    </asp:TableCell>
            </asp:TableRow>  

             
            <asp:TableRow Width="250" >
                <asp:TableCell > <asp:Label runat="server" ID="lblEmail" Text="Email*" CssClass="textLables" TextMode="Email"></asp:Label></asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtEmail" CssClass="txtControlRegister" runat="server"></asp:TextBox><br/>
                    <asp:Label ID="lblErrorEmail" runat="server" Text="" CssClass="textLablesSmall"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>

                     <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell>
                            <asp:Button ID="btnCreatePost" runat="server" Text="Register" CssClass="btnSubmitControls" OnClick="btnCreatePost_Click" OnClientClick="return ValidateRegForm();" /></asp:TableCell>
                        <asp:TableCell>
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btnCancelControls" OnClick="btnCancel_Click" /></asp:TableCell>
                    </asp:TableRow>
        </asp:Table>
                <asp:Label ID="lblSuccessMessage" runat="server" Text=""></asp:Label>     
    </asp:Panel>
</asp:Panel>
   <%-- </div>--%>
</asp:Content>
  