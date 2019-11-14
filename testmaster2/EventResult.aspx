<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventResult.aspx.cs" Inherits="DICT_Website.EventResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/News.css" rel="stylesheet" />
    <link href="Content/Events.css" rel="stylesheet" />
    <div class="top-box">
        <!------------------------------------------- Main heading ---------------------------->
        <h1 class="header">Event</h1>

    </div>
    <div class="content-box">
        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" OnItemDataBound="Repeater1_ItemDataBound">
            <ItemTemplate>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-8">
                            <div>
                                <asp:Label ID="title" Text='<%# Eval("Evt_Title") %>' CssClass="newsresult-title" runat="server"></asp:Label>
                            </div>
                            <div>
                                <asp:Image ID="eventimage" ImageUrl='<%# "data:image/png;base64," + Convert.ToBase64String((byte[])Eval("Evt_Image"))%>' CssClass="img" runat="server"></asp:Image>
                            </div>
                            <div>
                                <asp:Label ID="Content" Text='<%# Eval("Evt_Content") %>' CssClass="newsresult-content" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="evt-reg-button">
                                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="news-submit" OnClick="btnRegister_Click" />
                            </div>
                            <div class="event-date">
                                <div style="text-align: center"><i class="fa fa-clock" aria-hidden="true"></i></div>
                                <div style="text-align: center">
                                    <asp:Label ID="Label4" Text='<%# Eval("Evt_Strt_tm") + "-" + Eval("Evt_End_tm") %>' runat="server">
                                    </asp:Label>
                                </div>
                            </div>
                            <div class="event-date">
                                <div style="text-align: center"><i class="fa fa-map-marker" aria-hidden="true"></i></div>
                                <div style="text-align: center">
                                    <asp:Label ID="Label3" Text='<%# Eval("Evt_Location") %>' runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-8"></div>
                        <div class="col-2">
                            <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="news-submit" CommandArgument='<%# Eval("Evt_ID") %>' CommandName="EditEvent" />
                        </div>
                        <div class="col-2">
                            <asp:Button ID="btnDelete" runat="server" Text="Remove" CssClass="news-cancel" CommandArgument='<%# Eval("Evt_ID") %>' CommandName="DeleteEvent" />
                        </div>
                    </div>
                </div>
            </ItemTemplate>

        </asp:Repeater>
    </div>
</asp:Content>
