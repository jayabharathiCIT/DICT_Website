<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MoreNews.aspx.cs" Inherits="DICT_Website.MoreNews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <link href="Content/News.css" rel="stylesheet" />
    <asp:ListView ID="ListView1" runat="server">
          <ItemTemplate>
            <div class="container">
                <div class="row">
                    <div class="col-1 newsmore">
                        <%-- -------------------------------------Latest news date from data base ----------------------%>
                        <asp:Label ID="newsdate" Text='<%# Eval("News_Date", "{0:dd MMM yyyy}") %>' runat="server">
                        </asp:Label>
                    </div>
                    
                    <div class="col-3 img-hover">
                        <%-------------------------------- latest news image from data base------------------------- --%>
                        <figure>
                            <asp:Image ID="newsimage" runat="server"
                                ImageUrl='<%# "data:image/png;base64," + Convert.ToBase64String((byte[])Eval("News_Image"))%>'
                                Height="150px" Width="250px"></asp:Image>
                        </figure>
                    </div>
                    <%-- -------------------------------------Latest news label from data base ----------------------%>
                    <div class="col-7">
                        <asp:HyperLink ID="lbLatestNews" CssClass="news-title-more" NavigateUrl='<%# "NewsResult.aspx?NewsId=" + Eval("News_Id")%>' runat="server"
                            Text='<%# Eval("News_Title").ToString().Substring(0,Math.Min(50,Eval("News_Title").ToString().Length)) %>'>
                        </asp:HyperLink>

                        <p><asp:Label ID="HyperLink1" CssClass="newsresult-content" NavigateUrl='<%# "NewsResult.aspx?NewsId=" + Eval("News_Id")%>' runat="server"
                            Text='<%# Eval("News_Content").ToString().Substring(0,Math.Min(250,Eval("News_Content").ToString().Length)) + " ..." %>'>
                        </asp:Label></p>
                    </div>

                </div>
            </div>
        </ItemTemplate>
        <EmptyDataTemplate>
            No data
        </EmptyDataTemplate>
    </asp:ListView>
    <asp:DataPager ID="lvDataPager1" runat="server" PagedControlID="ListView1" PageSize="5">
        <Fields>
            <asp:NumericPagerField ButtonCount="10"
                CurrentPageLabelCssClass="PagerCurrent"
                NextPreviousButtonCssClass="PagerNormal" 
                NumericButtonCssClass="PagerNormal"
                NextPageText=">>"
                PreviousPageText="<<" />
        </Fields>
    </asp:DataPager>
    
</asp:Content>
