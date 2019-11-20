<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditEvent.aspx.cs" Inherits="DICT_Website.EditEvent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="evtHiddenId" runat="server" />
    <link href="Content/News.css" rel="stylesheet" />
    <div class="top-box">
        <%-------------------------------------------------- Main heading --%>
        <h1 class="header">Events</h1>
    </div>
    <%-------------------------------------------------- Sub heading --%>
    <div class="content-box">
        <h1 class="header2">Add Event</h1>
    </div>
    <%--------------------------------------------------Creating Form  --%>
    <div class="form-container">
        <%-------------------------------------------------- Title --%>
        <div class="row">
            <div class="col-3">
                <label for="fname">Event title</label>
            </div>
            <div class="col-9">
                <asp:TextBox CssClass="form-control" ID="txtTitle" runat="server" placeholder="Title(required)"></asp:TextBox>
                
            </div>
        </div>
        <%-------------------------------------------------- Date --%>
        <div class="row">
            <div class="col-3">
                <label for="fname">Date</label>
            </div>
            <div class="col-9">
                <asp:TextBox CssClass="form-control" TextMode="date" ID="txtDate" runat="server"></asp:TextBox>
                
            </div>
        </div>
        <%-------------------------------------------------- Location--%>

        <div class="row">
            <div class="col-3">
                <label for="fname">Location</label>
            </div>
            <div class="col-9">
                <asp:TextBox CssClass="form-control" ID="txtLocation" runat="server" placeholder="Location(required)"></asp:TextBox>
               
            </div>
        </div>


        <div class="row">
            <div class="col-3">
                <label for="fname">Time</label>
            </div>
            <div class="col-1">
                <label for="fname">Start</label>
            </div>
            <div class="col-2">
                <asp:TextBox CssClass="form-control" TextMode="time" ID="txtStartTime" runat="server"></asp:TextBox>
                
            </div>
            <div class="col-1">
                <label for="fname">End</label>
            </div>
            <div class="col-2">
                <asp:TextBox CssClass="form-control" TextMode="time" ID="txtEndTime" runat="server"></asp:TextBox>
                    
            </div>
        </div>
        <%-------------------------------------------------- Add image --%>
        <div class="row">
            <div class="col-3">
                <label for="fname">Add Image</label>
            </div>
            <div class="col-9">
                <asp:Image ID="Image1" runat="server" />
                <asp:FileUpload CssClass="form-control" ID="EventFileUpload" runat="server" />
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Image is required" ControlToValidate="EventFileUpload"></asp:RequiredFieldValidator>--%>
            </div>
        </div>
        <%-------------------------------------------------- Content --%>
        <div class="row">
            <div class="col-3">
                <label for="fname">Content</label>
            </div>
            <div class="col-9">
                <asp:TextBox ID="txtContent" TextMode="multiline" runat="server" placeholder="Content(required)"></asp:TextBox>
                
            </div>
        </div>
        <%-------------------------------------------------- Submit --%>

        <div class="row">
            <div class="col-8"></div>
            <div class="col-2">
                <asp:Button CssClass="news-submit" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click1" />
            </div>
            <div class="col-2">
                <asp:Button CssClass="news-cancel" ID="btnCancel" CausesValidation="false" runat="server" Text="Cancel" OnClick="btnCancel_Click1" />
            </div>
        </div>
    </div>
</asp:Content>
