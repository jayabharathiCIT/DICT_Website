<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewsResult.aspx.cs" Inherits="DICT_Website.NewsResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/News.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
    <div class="top-box">
        <!------------------------------------------- Main heading ---------------------------->
        <h1 class="header">News</h1>

    </div>
    <div class="content-box">
        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" OnItemDataBound="Repeater1_ItemDataBound" >
            <ItemTemplate>
                <div class="container-fluid">
                    <div class="row">
                        <asp:Label ID="title" Text='<%# Eval("News_Title") %>' CssClass="newsresult-title" runat="server"></asp:Label>
                    </div>
                    <div class="row">
                        <asp:Label ID="newsdate" Text='<%# Eval("News_Date", "{0:dd MMM}") %>' CssClass="date" runat="server"></asp:Label>
                    </div>
                    <div class="row">
                        <asp:Image ID="newsimage" ImageUrl='<%# "data:image/png;base64," + Convert.ToBase64String((byte[])Eval("News_Image"))%>' CssClass="img" runat="server"></asp:Image>
                    </div>

                    <div class="row">
                        <asp:Label ID="Content" Text='<%# Eval("News_Content") %>' CssClass="newsresult-content" runat="server"></asp:Label>
                    </div>
                    <div class="row">
                        <asp:Label ID="Source" Text='<%# Eval("Source") %>' CssClass="newsresult-source" runat="server"></asp:Label>
                    </div>

                    <asp:TableRow runat="server"  HorizontalAlign="Center">
                        <asp:TableCell>
                            <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btnSubmitControls" OnClick="btnEdit_Click" CommandArgument='<%# Eval("News_Id") %>' CommandName="EditNews" />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Button ID="btnDelete" runat="server" Text="Remove" CssClass="btnSubmitControls" CommandArgument='<%# Eval("News_Id") %>' CommandName="DeleteNews" />
                        </asp:TableCell>
                    </asp:TableRow>


                </div>
            </ItemTemplate>

        </asp:Repeater>
    </div>

</asp:Content>
