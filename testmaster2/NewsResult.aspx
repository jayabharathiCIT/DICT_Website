<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewsResult.aspx.cs" Inherits="DICT_Website.NewsResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/News.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
    <div>
        <h2 class="subheader">News</h2>
    </div>
    <div class="content-box">
        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" OnItemDataBound="Repeater1_ItemDataBound">
            <ItemTemplate>
                <div class="container-fluid newsresult-container">
                    <div class="row">
                        <asp:Label ID="title" Text='<%# Eval("News_Title") %>' CssClass="newsresult-title" runat="server"></asp:Label>
                    </div>
                    <div class="row">
                        <asp:Label ID="newsdate" Text='<%# "Posted On " + Eval("News_Date", "{0:dd MMM yyyy}") %>' CssClass="posted-date" runat="server"></asp:Label>
                    </div>
                    <div class="row">
                        <asp:Image ID="newsimage" ImageUrl='<%# "data:image/png;base64," + Convert.ToBase64String((byte[])Eval("News_Image"))%>' CssClass="newsresult-img" runat="server"></asp:Image>
                    </div>

                    <div class="row">
                        <asp:Label ID="Content" Text='<%# Eval("News_Content") %>' CssClass="newsresult-content" runat="server"></asp:Label>
                    </div>
                    <%-- <div class="row">
                        <asp:Label ID="Source" Text='<%# Eval("Source") %>' CssClass="newsresult-source" runat="server"></asp:Label>
                    </div>--%>
                    <div class="row">
                        <div class="col-8"></div>
                        <div class="col-2">
                            <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="news-submit" OnClick="btnEdit_Click" CommandArgument='<%# Eval("News_Id") %>' CommandName="EditNews" />
                        </div>
                        <div class="col-2">
                            <asp:Button ID="btnDelete" runat="server" Text="Remove" CssClass="news-cancel" CommandArgument='<%# Eval("News_Id") %>' CommandName="DeleteNews" />
                        </div>
                    </div>
                </div>
            </ItemTemplate>

        </asp:Repeater>
    </div>

</asp:Content>
