<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventPage.aspx.cs" Inherits="DICT_Website.EventPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/News.css" rel="stylesheet" />
    <link href="Content/Events.css" rel="stylesheet" />
    <div class="top-box">
        <!------------------------------------------- Main heading ---------------------------->
        <h1 class="header">Event</h1>

    </div>
    <div class="content-box">
    <asp:ListView ID="ListView1" runat="server">
        <ItemTemplate>
            <div class="container">
                <div class="row">
                    <div class="col-1 event-date">
                        <%-- -------------------------------------Latest news date from data base ----------------------%>
                        <asp:Label ID="Label1" Text='<%# Eval("Evt_Date", "{0:dd MMM}") %>' runat="server">
                        </asp:Label>
                    </div>
                    <div class="col-4 img-hover">
                        <%-------------------------------- latest news image from data base------------------------- --%>
                        <figure>
                            <asp:Image ID="eventimage" runat="server"
                                ImageUrl='<%# "data:image/png;base64," + Convert.ToBase64String((byte[])Eval("Evt_Image"))%>'
                                Height="180px" Width="300px"></asp:Image>
                        </figure>
                    </div>
                    <%-- -------------------------------------Latest news label from data base ----------------------%>
                    <div class="col-4">
                        <div class="event-title">
                            <asp:HyperLink ID="lbEvent" CssClass="title-link" NavigateUrl='<%# "EventResult.aspx?EventID=" + Eval("Evt_ID")%>' runat="server"
                                Text='<%# Eval("Evt_Title").ToString().Substring(0,Math.Min(30,Eval("Evt_Title").ToString().Length))+ "..." %>'>
                            </asp:HyperLink>
                        </div>
                        <div class="event-content">
                            <asp:Label ID="Label2" Text='<%# Eval("Evt_Content").ToString().Substring(0,Math.Min(150,Eval("Evt_Content").ToString().Length))+ "..." %>' runat="server">
                            </asp:Label>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="event-content">
                            <div style="text-align: center"><i class="fa fa-map-marker" aria-hidden="true"></i></div>
                            <div style="text-align: center">
                                <asp:Label ID="Label3" Text='<%# Eval("Evt_Location") %>' runat="server">
                                </asp:Label>
                            </div>
                        </div>
                        <div class="event-content">
                            <div style="text-align: center"><i class="fa fa-clock" aria-hidden="true"></i></div>
                            <div style="text-align: center">
                                <asp:Label ID="Label4" Text='<%# Eval("Evt_Strt_tm") + "-" + Eval("Evt_End_tm") %>' runat="server">
                                </asp:Label>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:ListView>
    <asp:DataPager ID="lvDataPager1" runat="server" PagedControlID="ListView1" PageSize="4">
        <Fields>
            <asp:NumericPagerField ButtonCount="10"
                CurrentPageLabelCssClass="PagerCurrent"
                NextPreviousButtonCssClass="PagerNormal" 
                NumericButtonCssClass="PagerNormal"
                NextPageText=">>"
                PreviousPageText="<<" />
        </Fields>
    </asp:DataPager>
        </div>
</asp:Content>
