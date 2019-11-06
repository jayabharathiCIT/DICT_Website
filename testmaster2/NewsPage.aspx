<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewsPage.aspx.cs" Inherits="DICT_Website.NewsPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/News.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
    <div class="top-box">
        <!------------------------------------------- Main heading ---------------------------->
        <h1 class="header">News</h1>
    </div>
    <div class="content-box">
        <div class="container-fluid">
            <%--================================================= Latest new================================--%>
            <div class="row">
                <div class="item-header">
                    <h2>Latest News</h2>
                </div>
                <div class="col-12">
                    <asp:DataList ID="dlLatestNews" CellPadding="5" CellSpacing="5" RepeatLayout="Table" RepeatDirection="Horizontal" HeaderStyle-VerticalAlign="Top" runat="server">
                        <ItemTemplate>
                            <div class="container display">
                                <div class="row">
                                    <div class="col-12 img-hover">
                                        <%-------------------------------- latest news image from data base------------------------- --%>
                                        <figure>
                                            <asp:Image ID="newsimage" runat="server"
                                                ImageUrl='<%# "data:image/png;base64," + Convert.ToBase64String((byte[])Eval("News_Image"))%>'
                                                Height="75px" Width="150px"></asp:Image>
                                        </figure>


                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-3">
                                        <%-- -------------------------------------Latest news date from data base ----------------------%>
                                        <asp:Label ID="newsdate" CssClass="news-date" Text='<%# Eval("News_Date", "{0:dd MMM}") %>' runat="server">
                                        </asp:Label>
                                    </div>
                                    <%-- -------------------------------------Latest news label from data base ----------------------%>
                                    <div class="col-9 news-title">
                                        <asp:HyperLink ID="lbLatestNews" CssClass="title-link" NavigateUrl='<%# "NewsResult.aspx?NewsId=" + Eval("News_Id")%>' runat="server" 
                                            Text='<%# Eval("News_Title").ToString().Substring(0,Math.Min(50,Eval("News_Title").ToString().Length)) %>'>
                                        </asp:HyperLink>
                                    </div>

                                </div>
                            </div>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />

                        <SeparatorTemplate>
                            <table style="width: 30px">
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </SeparatorTemplate>
                    </asp:DataList>

                </div>
            </div>
            <div class="row">
                <div class="item-header">
                    <%---================================================= Networking=============================== --%>
                    <h2>Networking</h2>
                </div>
                <div class="col-12">
                    <asp:DataList ID="dlNetworkNews" CellPadding="5" CellSpacing="5" RepeatLayout="Table" RepeatDirection="Horizontal" HeaderStyle-VerticalAlign="Top" runat="server">
                        <ItemTemplate>
                            <div class="container display">

                                <div class="row">
                                    <div class="col-12 img-hover">
                                        <%-------------------------------- networking news image from data base------------------------- --%>
                                        <figure>

                                            <asp:Image ID="newsimage" runat="server"
                                                ImageUrl='<%# "data:image/png;base64," + Convert.ToBase64String((byte[])Eval("News_Image"))%>'
                                                Height="75px" Width="150px"></asp:Image>
                                        </figure>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-3">

                                        <%-- -------------------------------------networking news label from data base ----------------------%>

                                        <asp:Label ID="newsdate" CssClass="news-date" Text='<%# Eval("News_Date", "{0:dd MMM}") %>' runat="server">
                                        </asp:Label>
                                    </div>

                                    <div class="col-9 news-title">
                                        <asp:HyperLink ID="newslabel" CssClass="title-link" NavigateUrl='<%# "NewsResult.aspx?NewsId=" + Eval("News_Id")%>' runat="server" 
                                            Text='<%# Eval("News_Title").ToString().Substring(0,Math.Min(50,Eval("News_Title").ToString().Length)) %>'>
                                        </asp:HyperLink>

                                                                            </div>

                                </div>
                            </div>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />

                        <SeparatorTemplate>
                            <table style="width: 30px">
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </SeparatorTemplate>
                    </asp:DataList>
                </div>
            </div>
            <div class="row">
                <div class="item-header">
                    <%---================================== Cyber security============================================== --%>
                    <h2>Cyber Security</h2>
                </div>
                <div class="col-12">
                    <asp:DataList ID="dlCyberNews" CellPadding="5" CellSpacing="5" RepeatLayout="Table" RepeatDirection="Horizontal" HeaderStyle-VerticalAlign="Top" runat="server">
                        <ItemTemplate>
                            <div class="container display">
                                <div class="row">
                                    <div class="col-12 img-hover">
                                        <figure>
                                            <asp:Image ID="newsimage" runat="server"
                                                ImageUrl='<%# "data:image/png;base64," + Convert.ToBase64String((byte[])Eval("News_Image"))%>'
                                                Height="75px" Width="150px"></asp:Image>
                                        </figure>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-3">
                                        <asp:Label ID="newsdate" CssClass="news-date" Text='<%# Eval("News_Date", "{0:dd MMM}") %>' runat="server">
                                        </asp:Label>
                                    </div>
                                    <div class="col-9 news-title">
                                        <asp:HyperLink ID="newslabel" CssClass="title-link" NavigateUrl='<%# "NewsResult.aspx?NewsId=" + Eval("News_Id")%>' runat="server" 
                                            Text='<%# Eval("News_Title").ToString().Substring(0,Math.Min(50,Eval("News_Title").ToString().Length)) %>'>
                                        </asp:HyperLink>
                                                                            </div>

                                </div>
                            </div>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />

                        <SeparatorTemplate>
                            <table style="width: 30px">
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </SeparatorTemplate>
                    </asp:DataList>
                </div>
            </div>
            <div class="row">
                <div class="item-header">
                    <%---================================== Software development============================================== --%>
                    <h2>Software development</h2>
                </div>
                <div class="col-12">
                    <asp:DataList ID="dlSoftwareNews" CellPadding="5" CellSpacing="5" RepeatLayout="Table" RepeatDirection="Horizontal" HeaderStyle-VerticalAlign="Top" runat="server">
                        <ItemTemplate>
                            <div class="container display">
                                <div class="row">
                                    <div class="col-12 img-hover">
                                        <figure>
                                            <asp:Image ID="newsimage" runat="server"
                                                ImageUrl='<%# "data:image/png;base64," + Convert.ToBase64String((byte[])Eval("News_Image"))%>'
                                                Height="75px" Width="150px"></asp:Image>
                                        </figure>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-3">
                                        <asp:Label ID="newsdate" CssClass="news-date" Text='<%# Eval("News_Date", "{0:dd MMM}") %>' runat="server">
                                        </asp:Label>
                                    </div>
                                    <div class="col-9 news-title">
                                        <asp:HyperLink ID="newslabel" CssClass="title-link" NavigateUrl='<%# "NewsResult.aspx?NewsId=" + Eval("News_Id")%>' runat="server" 
                                            Text='<%# Eval("News_Title").ToString().Substring(0,Math.Min(50,Eval("News_Title").ToString().Length)) %>'>
                                        </asp:HyperLink>
                                        
                                    </div>

                                </div>
                            </div>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />

                        <SeparatorTemplate>
                            <table style="width: 30px">
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </SeparatorTemplate>
                    </asp:DataList>
                </div>
            </div>
            <div class="row">
                <div class="item-header">
                    <%---================================== System analysis and programming============================================== --%>
                    <h2>System Analysis and Programming</h2>
                </div>
                <div class="col-12">
                    <asp:DataList ID="dlSystemsNews" CellPadding="5" CellSpacing="5" RepeatLayout="Table" RepeatDirection="Horizontal" HeaderStyle-VerticalAlign="Top" runat="server">
                        <ItemTemplate>
                            <div class="container display">
                                <div class="row">
                                    <div class="col-12 img-hover">
                                        <figure>
                                            <asp:Image ID="newsimage" runat="server"
                                                ImageUrl='<%# "data:image/png;base64," + Convert.ToBase64String((byte[])Eval("News_Image"))%>'
                                                Height="75px" Width="150px"></asp:Image>
                                        </figure>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-3">
                                        <asp:Label ID="newsdate" CssClass="news-date" Text='<%# Eval("News_Date", "{0:dd MMM}") %>' runat="server">
                                        </asp:Label>
                                    </div>
                                    <div class="col-9 news-title">
                                        <asp:HyperLink ID="newslabel" CssClass="title-link" NavigateUrl='<%# "NewsResult.aspx?NewsId=" + Eval("News_Id")%>' runat="server" 
                                            Text='<%# Eval("News_Title").ToString().Substring(0,Math.Min(50,Eval("News_Title").ToString().Length)) %>'>
                                        </asp:HyperLink>
                                        <
                                    </div>

                                </div>
                            </div>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />

                        <SeparatorTemplate>
                            <table style="width: 30px">
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </SeparatorTemplate>
                    </asp:DataList>
                </div>
            </div>
            <div class="row">
                <div class="item-header">
                    <%---================================== Games and virtual world============================================== --%>
                    <h2>Games and virtual world</h2>
                </div>
                <div class="col-12">
                    <asp:DataList ID="dlGamesNews" CellPadding="5" CellSpacing="5" RepeatLayout="Table" RepeatDirection="Horizontal" HeaderStyle-VerticalAlign="Top" runat="server">
                        <ItemTemplate>
                            <div class="container display">
                                <div class="row">
                                    <div class="col-12 img-hover">
                                        <figure>
                                            <asp:Image ID="newsimage" runat="server"
                                                ImageUrl='<%# "data:image/png;base64," + Convert.ToBase64String((byte[])Eval("News_Image"))%>'
                                                Height="75px" Width="150px"></asp:Image>
                                        </figure>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-3">
                                        <asp:Label ID="newsdate" CssClass="news-date" Text='<%# Eval("News_Date", "{0:dd MMM}") %>' runat="server">
                                        </asp:Label>
                                    </div>
                                    <div class="col-9 news-title">
                                        <asp:HyperLink ID="newslabel" CssClass="title-link" NavigateUrl='<%# "NewsResult.aspx?NewsId=" + Eval("News_Id")%>' runat="server" 
                                            Text='<%# Eval("News_Title").ToString().Substring(0,Math.Min(50,Eval("News_Title").ToString().Length)) %>'>
                                        </asp:HyperLink>
                                        
                                    </div>

                                </div>
                            </div>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />

                        <SeparatorTemplate>
                            <table style="width: 30px">
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </SeparatorTemplate>
                    </asp:DataList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
