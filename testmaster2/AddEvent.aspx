<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddEvent.aspx.cs" Inherits="DICT_Website.AddEvent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/Events.css" rel="stylesheet" />
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Title is required" ControlToValidate="txtTitle"></asp:RequiredFieldValidator>
                </div>
            </div>
            <%-------------------------------------------------- Date --%>
            <div class="row">
                <div class="col-3">
                    <label for="fname">Date</label>
                </div>
                <div class="col-9">
                    <asp:TextBox CssClass="form-control" TextMode="date" ID="txtDate" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Date is required" ControlToValidate="txtDate"></asp:RequiredFieldValidator>
                </div>
            </div>
            <%-------------------------------------------------- Location--%>

            <div class="row">
                <div class="col-3">
                    <label for="fname">Location</label>
                </div>
                <div class="col-9">
                    <asp:TextBox CssClass="form-control" ID="txtSource" runat="server" placeholder="Source(required)"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Source is required" ControlToValidate="txtSource"></asp:RequiredFieldValidator>
                </div>
            </div>
            
            
         <div class="row">
                <div class="col-3">
                    <label for="fname">Start time</label>
                </div>
                <div class="col-9">
                    <asp:TextBox CssClass="form-control" TextMode="time" ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Date is required" ControlToValidate="txtDate"></asp:RequiredFieldValidator>
                </div>
            </div>
            <%-------------------------------------------------- Add image --%>
            <div class="row">
                <div class="col-3">
                    <label for="fname">Add Image</label>
                </div>
                <div class="col-9">
                    <asp:FileUpload CssClass="form-control" ID="NewsFileUpload" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Image is required" ControlToValidate="NewsFileUpload"></asp:RequiredFieldValidator>
                </div>
            </div>
            <%-------------------------------------------------- Content --%>
            <div class="row">
                <div class="col-3">
                    <label for="fname">Content</label>
                </div>
                <div class="col-9">
                    <asp:TextBox ID="txtContent" TextMode="multiline" runat="server" placeholder="Content(required)"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Content is required" ControlToValidate="txtContent"></asp:RequiredFieldValidator>
                </div>
            </div>
            <%-------------------------------------------------- Submit --%>
            
               <div>
                    <%--<asp:Button Cssclass="news-submit"  ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"/>--%>
                   </div>    
          
                   <div>
                      <%--<asp:Button Cssclass="news-cancel" ID="btnCancel" CausesValidation="false"  runat="server" Text="Cancel"  OnClick="btnCancel_Click" />--%>
                </div>

                </div>    
        
         
        
   

</asp:Content>
