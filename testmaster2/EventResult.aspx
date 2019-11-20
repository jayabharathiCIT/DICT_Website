<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventResult.aspx.cs" Inherits="DICT_Website.EventResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/News.css" rel="stylesheet" />
    <link href="Content/Events.css" rel="stylesheet" />
    <div>
        <h2 class="subheader">Events</h2>
    </div>
    <div class="content-box">
        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" OnItemDataBound="Repeater1_ItemDataBound">
            <ItemTemplate>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-8">
                            <div>
                                <asp:Label ID="title" Text='<%# Eval("Evt_Title") %>' CssClass="eventresult-title" runat="server"></asp:Label>
                            </div>
                            <div>
                                <asp:Image ID="eventimage" ImageUrl='<%# "data:image/png;base64," + Convert.ToBase64String((byte[])Eval("Evt_Image"))%>' CssClass="eventresult-img" runat="server"></asp:Image>
                            </div>
                            <div>
                                <asp:Label ID="Content" Text='<%# Eval("Evt_Content") %>' CssClass="eventresult-content" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="col-4 register-block">
                            <div class="eventresult-date">
                                <div><i class="fa fa-clock" aria-hidden="true"></i></div>
                                <div>
                                    <asp:Label ID="Label4" Text='<%# GetTime(Eval("Evt_Strt_tm").ToString()) + " - " + GetTime(Eval("Evt_End_tm").ToString()) %>' runat="server">
                                    </asp:Label>
                                </div>
                                <div>
                                    <asp:Label ID="Label1" Text='<%# Eval("Evt_Date", "{0:dd MMM yyyy}") %>' runat="server">
                                    </asp:Label>
                                </div>
                            </div>
                            <div class="eventresult-date">
                                <div><i class="fa fa-map-marker" aria-hidden="true"></i></div>
                                <div>
                                    <asp:Label ID="Label3" Text='<%# Eval("Evt_Location") %>' runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="evt-reg-button">
                                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="news-submit" CommandArgument='<%# Eval("Evt_ID") %>' CommandName="RegisterEvent"/>
                            </div>
                        </div>
                    </div>

                    <div class="row subcontrol">
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
    <div class="participants">
        <asp:Label ID="lblCount" runat="server"></asp:Label>
    </div>
</asp:Content>
