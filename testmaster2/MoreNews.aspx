<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MoreNews.aspx.cs" Inherits="DICT_Website.MoreNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Table ID="Table1" runat="server"  GridLines="None" >
        <asp:TableHeaderRow>
<%--            <asp:TableCell>Networking</asp:TableCell>
            <asp:TableCell>Cyber Security</asp:TableCell>
             <asp:TableCell>Software Development</asp:TableCell>
            <asp:TableCell>System Analysis and Programming</asp:TableCell>
            <asp:TableCell>Games and Virtual world</asp:TableCell>--%>
        </asp:TableHeaderRow>
        <asp:TableRow>
            <asp:TableCell>                
                <asp:GridView ID="gv_Networking" runat="server" AutoGenerateColumns="false" GridLines="None" >
                   <Columns>                            
 <asp:TemplateField HeaderText="Newtwork News" >
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
 </asp:TemplateField>
                       </Columns>

                </asp:GridView>
                Networking NEWSSSSSSSSSSSSSSS
            </asp:TableCell>
            <asp:TableCell>
                <asp:GridView ID="gv_CyberSec" runat="server" AutoGenerateColumns="false" GridLines="None" >
                         <Columns>                            
 <asp:TemplateField HeaderText="Cyber Security" >
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
 </asp:TemplateField>
                       </Columns>

                </asp:GridView>
                Cyber Security NEWS   
            </asp:TableCell>
              <asp:TableCell>
                   <asp:GridView ID="gvSoft" runat="server" AutoGenerateColumns="false" GridLines="None">
                                                <Columns>                            
 <asp:TemplateField HeaderText="Software Development News" >
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
 </asp:TemplateField>
                       </Columns>

                   </asp:GridView>
                Software Development NEWSS
            </asp:TableCell>
                <asp:TableCell>
                     <asp:GridView ID="gvSystem" runat="server" AutoGenerateColumns="false" GridLines="None">
                                                <Columns>                            
 <asp:TemplateField HeaderText="Software Development News" >
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
 </asp:TemplateField>
                       </Columns>

                   </asp:GridView>
                System Analysis and Programming NEWSS
            </asp:TableCell>
              <asp:TableCell>
                       <asp:GridView ID="gvGames" runat="server" AutoGenerateColumns="false" GridLines="None" >
                                                             <Columns>                            
 <asp:TemplateField HeaderText="Software Development News" >
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
 </asp:TemplateField>
                       </Columns>

                       </asp:GridView>
                Games and Virtual world  NEWSS
            </asp:TableCell>
        </asp:TableRow>

    </asp:Table>
</asp:Content>
