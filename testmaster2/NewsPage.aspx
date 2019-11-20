<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewsPage.aspx.cs" Inherits="DICT_Website.NewsPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/News.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
    <!--<div class="top-box">
        <h1 class="header">News</h1>
    </div>-->
    <div>
        <h2 class="subheader">News</h2>
    </div>
    <!-- ##### Featured News Start ##### -->
    <div>
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-8 col-lg-8">
                    <div class="row">
                        <!-- Single Featured Post -->
                        <div class="col-12 col-md-6 col-lg-7">

                            <div>
                                <div class="news-thumb img-hover">
                                    <asp:Image ID="newsimage0" runat="server"
                                        Height="330px" Width="400px"></asp:Image>                                   
                                </div>
                                <div class="news-data">
                                    <div class="news-title">
                                        <asp:HyperLink ID="newslink0" runat="server">
                                        </asp:HyperLink>
                                    </div>
                                    <asp:Label ID="newsTextLabel0" runat="server">
                                    </asp:Label>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-6 col-lg-5">
                            <!-- Single Featured Post -->
                            <div>
                                <div class="news-thumb img-hover">
                                        <asp:Image ID="newsimage1" runat="server"
                                            Height="200px" Width="240px"></asp:Image>
                                </div>
                                <div class="news-data-1">
                                    <div class="news-title-1">
                                        <asp:HyperLink ID="newsLink1" runat="server">
                                        </asp:HyperLink>
                                    </div>
                                </div>

                            </div>

                            <!-- Single Featured Post -->
                            <div>
                                <div class="news-thumb img-hover">
                                        <asp:Image ID="newsimage2" runat="server"
                                            Height="200px" Width="240px"></asp:Image>
                                </div>
                                <div class="news-data-1">
                                    <div class="news-title-1">
                                        <asp:HyperLink ID="newsLink2" runat="server">
                                        </asp:HyperLink>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-md-4 col-lg-4">
                    <!-- Single Featured Post -->
                    <div class="d-flex">
                        <asp:DataList ID="dlCategoryNews" CellPadding="5" CellSpacing="5" RepeatLayout="Table" RepeatDirection="Vertical" HeaderStyle-VerticalAlign="Top" runat="server">
                            <ItemTemplate>

                                <div class="featured-news d-flex">
                                    <div class="news-thumb">
                                        <asp:Image ID="newsimage" runat="server"
                                            ImageUrl='<%# "data:image/png;base64," + Convert.ToBase64String((byte[])Eval("News_Image"))%>'
                                            Height="120px" Width="120px"></asp:Image>
                                    </div>
                                    <div class="news-data">
                                        <div class="news-catagory">
                                            <asp:HyperLink runat="server" NavigateUrl='<%# "MoreNews.aspx?type=" + Eval("News_Ctgry_No").ToString() %>' Text='<%# GetCatDescription(Eval("News_Ctgry_No").ToString()) %>'></asp:HyperLink>
                                        </div>

                                        <div class="news-title-2">
                                            <asp:HyperLink NavigateUrl='<%# "NewsResult.aspx?NewsId=" + Eval("News_Id")%>' runat="server"
                                                Text='<%# Eval("News_Title") %>'>
                                            </asp:HyperLink>
                                            <div class="news-date">
                                                <asp:Label ID="newsdate" Text='<%# Eval("News_Date", "{0:MMM dd}") %>' runat="server">
                                                </asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </ItemTemplate>

                        </asp:DataList>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
