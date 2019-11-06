<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditNews.aspx.cs" Inherits="DICT_Website.Edit_News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="newsHiddenId" runat="server" />

    <link href="Content/News.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
    <div class="top-box">
        <%-------------------------------------------------- Main heading --%>
        <h1 class="header">News</h1>
    </div>
    <%-------------------------------------------------- Sub heading --%>
    <div class="content-box">
        <h1 class="header2">Add News</h1>
        <%--------------------------------------------------Creating Form  --%>
        <div class="form-container">
            <%-------------------------------------------------- Title --%>
            <div class="row">
                <div class="col-3">
                    <label for="fname">News title</label>
                </div>
                <div class="col-9">
                    <asp:TextBox ID="newsTitle" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="row">
                <div class="col-3">
                    <label for="fname">Date</label>
                </div>
                <div class="col-9">
                    <asp:TextBox ID="newsDate" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="row">
                <div class="col-3">
                    <label for="fname">Add Image</label>
                </div>
                <div class="col-9">
                    <asp:FileUpload ID="newsImageFile" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <label for="fname">Category</label>
                </div>
                <div class="col-9">
                    <asp:DropDownList ID="ddlnewsCategory" runat="server" AppendDataBoundItems="true"></asp:DropDownList>
                </div>
            </div>

            <div class="row">
                <div class="col-3">
                    <label for="fname">Source</label>
                </div>
                <div class="col-9">
                    <asp:TextBox ID="newsSource" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <label for="fname">Content</label>
                </div>
                <div class="col-9">
                    <asp:TextBox ID="newsContent" CssClass="form-control" TextMode="multiline" runat="server"></asp:TextBox>
                </div>
            </div>
            <asp:Button ID="btnSubmit" CssClass="news-submit" Text="Update" runat="server" OnClick="btnSubmit_Click" />
            <asp:Button ID="btnCancel" CssClass="news-cancel" Text="Cancel" runat="server" OnClick="btnCancel_Click" />
        </div>
    </div>

</asp:Content>
