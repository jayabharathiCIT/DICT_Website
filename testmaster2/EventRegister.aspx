<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventRegister.aspx.cs" Inherits="DICT_Website.EventRegister" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/News.css" rel="stylesheet" />
    <div class="form-container">
        <div class="row">
            <div class="col-3">
                <label for="fname">CIT ID:</label>
            </div>
            <div class="col-9">
                <asp:TextBox CssClass="form-control" ID="txtCitId" runat="server" placeholder="CIT ID(required)"></asp:TextBox>
                
            </div>
        </div>
        <%-------------------------------------------------- Date --%>
        <div class="row">
            <div class="col-3">
                <label for="fname">Mobile No.:</label>
            </div>
            <div class="col-9">
                <asp:TextBox CssClass="form-control" TextMode="Number" ID="txtMobile" runat="server"></asp:TextBox>
                
            </div>
        </div>
        <div class="row">
            <div class="col-8"></div>
            <div class="col-2">
                <asp:Button CssClass="news-submit" ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
            </div>
            <div class="col-2">
                <asp:Button CssClass="news-cancel" ID="btnCancel" CausesValidation="false" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
            </div>
        </div>
    </div>
</asp:Content>
