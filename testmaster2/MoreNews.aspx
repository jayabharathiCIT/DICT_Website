<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MoreNews.aspx.cs" Inherits="DICT_Website.MoreNews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <link href="Content/News.css" rel="stylesheet" />
    <div>
        <h2 class="subheader">News</h2>
    </div>

    <asp:ListView ID="ListView1" runat="server">
          <ItemTemplate>
            <div class="container">
                <div class="row">
                    <div class="col-2 newsmore">
                        <%-- -------------------------------------Latest news date from data base ----------------------%>
                        <asp:Label ID="newsdate" Text='<%# Eval("News_Date", "{0:dd MMM yyyy}") %>' runat="server">
                        </asp:Label>
                    </div>
                    
                    <div class="col-4 img-hover">
                        <%-------------------------------- latest news image from data base------------------------- --%>
                        <figure>
                            <asp:Image ID="newsimage" runat="server"
                                ImageUrl='<%# "data:image/png;base64," + Convert.ToBase64String((byte[])Eval("News_Image"))%>'
                                Height="200px" Width="300px"></asp:Image>
                        </figure>
                    </div>
                    <%-- -------------------------------------Latest news label from data base ----------------------%>
                    <div class="col-6 morenews-title">
                        <asp:HyperLink ID="lbLatestNews" NavigateUrl='<%# "NewsResult.aspx?NewsId=" + Eval("News_Id")%>' runat="server"
                            Text='<%# GetShortTitle(Eval("News_Title").ToString(), 100) %>'>
                        </asp:HyperLink>

                        <p class="morenews-content"><asp:Label ID="HyperLink1" NavigateUrl='<%# "NewsResult.aspx?NewsId=" + Eval("News_Id")%>' runat="server"
                            Text='<%# GetShortTitle(Eval("News_Content").ToString(), 300) %>'>
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
    <div class="row">
      <asp:Button ID="buttonBack" CssClass="btn btn-dark" runat="server" Text="Back" OnClick="buttonBack_Click"/>   
       </div>

</asp:Content>
