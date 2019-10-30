<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AnnCreate.aspx.cs" Inherits="DICT_Website.AnnCreate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link rel="stylesheet" href="Content/AnnStyle.css" />
   <%-- <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap" rel="stylesheet"> --%> 

    <div class="top-box"> 
    <h1 class="top-head">Announcements</h1>  
    </div>

 
    <div class="content">
           <h2>Create Announcement</h2>
         <div class="container1">
  
    <div class="col-25">
        <div class="lbl">
            <label for="title">Title</label> 
        </div>
        <div class="txt">
            <asp:TextBox  ID="txtTitle" runat="server"></asp:TextBox>
          <%--<input type="text" id="Title" name="Title" placeholder="The title of the Announcement..."> --%>  
        </div>   
    </div>
    </div>
    <div class="container2">
    <div class="col-75">     
     <div class="lbl">
         <label for="description">Description</label>
     </div>
     <div class="text-area">
         <asp:TextBox ID="txtDesc" runat="server"></asp:TextBox>
       <%-- <textarea id="description" name="description" placeholder="Write here...">
        </textarea> --%> 
     </div>       
    </div>
    
    <div class="row">

        

        <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />

       <%--
           <input id="cancel" type="reset" value="Cancel">

           OnClick="btnSubmit_Click"
           
           <input id="submit" type="submit" value="Submit">
       --%>
    </div>
    </div>
 </div>
    
</asp:Content>
