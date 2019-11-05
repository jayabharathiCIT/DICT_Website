<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AnnHomepage.aspx.cs" Inherits="DICT_Website.AnnHomepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <link rel="stylesheet" href="Content/AnnStyle.css" />
   <%-- <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap" rel="stylesheet"> --%> 

    <div class="top-box"> 
    <h1 class="top-head">Announcements</h1> 
    </div>

    <div class="content">

           <h2>Announcement HomePage</h2>

         <div class="containerh1">
             
             <asp:GridView ID="GridView1" runat="server">

             </asp:GridView>

         </div>

   </div>
</asp:Content>
