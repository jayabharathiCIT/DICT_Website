<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="testmaster2.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/Contactus.css" rel="stylesheet" />
    <div class="contactsBackground" >
    <%----------------- Heading --------------------------------%>

    <div class="contactus-header">
        <h2 class="contactus-label"><%: Title %>.</h2>
    </div>
    <%------------------ Infoline --------------------%>

    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div style="padding-left: 3em"><i class="fa fa-phone fa-3x" aria-hidden="true"></i></div>
                <div>
                    <h2 class="c-form" style="padding-right: 5em">Infoline</h2>
                </div>
                <div>
                    <h4>62073188</h4>
                </div>
                <div>
                    <h6>(during normail working hours)</h6>
                </div>

                <hr />

                <div>
                    <h6>From Outside Australia</h6>
                </div>
                <div>
                    <h4>+61 2 6207 3188</h4>
                </div>

                <hr />

                <div>
                    <h6>Within Australia</h6>
                </div>
                <div>
                    <h4>02 6207 3188</h4>
                </div>

            </div>

            <div class="col-lg-4">
                <div style="padding-left: 6em"><i class="fa fa-envelope fa-3x" aria-hidden="true"></i></div>
                <div style="padding-left: 1em">
                    <h2 class="c-form">CIT Student Service</h2>
                </div>
                <div>
                    <h4 style="padding-left: 2em">infoline@cit.edu.au</h4>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="col-lg-6">
            <div class="row mt-1">
                <h3 class="c-form">Contact Form</h3>
            </div>
            <%-- -----------------------------Contact form ------------------------------------ --%>

            <%---------------- Username ----------------------%>
            <div class="input-group input-group-lg mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fa fa-user" aria-hidden="true"></i></span>
                </div>
                <asp:TextBox CssClass="form-control" ID="txtName" runat="server" placeholder="Yor name  (required)"></asp:TextBox>
            </div>


            <%--------------- Phone number------------------%>

            <div class="input-group input-group-lg mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fa fa-phone" aria-hidden="true"></i></span>
                </div>
                <asp:TextBox class="form-control" ID="txtPhone" runat="server" placeholder="Phone number"></asp:TextBox>
            </div>


            <%---------------- Email -----------------------%>

            <div class="input-group input-group-lg mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fa fa-envelope" aria-hidden="true"></i></span>
                </div>
                <asp:TextBox TextMode="Email" class="form-control" ID="txtemail" runat="server" placeholder="Your email (required)"></asp:TextBox>
                <asp:RequiredFieldValidator ID="r1" runat="server" ErrorMessage="Email address required" ControlToValidate="txtemail"></asp:RequiredFieldValidator>
            </div>


            <%-- -------------Subject ----------------------%>

            <div class="input-group input-group-lg mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fa fa-envelope" aria-hidden="true"></i></span>
                </div>
                <asp:TextBox class="form-control" ID="TextBox1" runat="server" placeholder="Subject"></asp:TextBox>
            </div>


            <%--------------- Message -----------------------%>

            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fa fa-pen" aria-hidden="true"></i>     </span>
                </div>
                <asp:TextBox class="form-control" ID="txtMessage" TextMode="multiline" Columns="50" Rows="1" runat="server" placeholder="Message (required)"></asp:TextBox>
            </div>

            <%-- --------------Send------------------------- --%>

            <div class="row mt-3">
                <div class="md-6">
                    <asp:Button CssClass="btn btn-danger btn-lg" ID="btnSend" runat="server" Text="SEND" OnClick="btnSend_Click" />
                </div>
            </div>
        </div>
        <div class="col-lg-6">

            <h3 class="c-form">Connect with us</h3>


            <div>
                <div class="row">
                    <div class="col-lg-2 connect"><a href="http://www.twitter.com/@Canberra_CIT"><i class="fab fa-twitter fa-3x"></i></a></div>
                    <div class="col-lg-2 connect" ><a href="http://www.facebook.com.au/CITCanberra"><i class="fab fa-facebook-f fa-3x"></i></a></div>
                    <div class="col-lg-2 connect"><a href="https://instagram.com/citcanberra/"><i class="fab fa-instagram fa-3x"></i></a></div>
                </div>
                <div class="row">
                    <div class="col-lg-2 connect"><a href="https://www.youtube.com/channel/UC9r80Tqaa6RiPb9la-TrTyw"><i class="fab fa-youtube fa-3x"></i></a></div>
                    <div class="col-lg-2 connect"><a href="https://au.linkedin.com/school/canberra-institute-of-technology/"><i class="fab fa-linkedin-in fa-3x"></i></a></div>
                </div>
            </div>
        </div>
    </div>


        </div>



</asp:Content>
