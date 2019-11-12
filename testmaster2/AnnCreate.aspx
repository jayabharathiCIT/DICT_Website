<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AnnCreate.aspx.cs" Inherits="DICT_Website.AnnCreate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link rel="stylesheet" href="Content/AnnStyle.css" />
   <%-- <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap" rel="stylesheet"> --%> 

    <div class="top-box"> 

    <h1 class="top-head">
        Announcements
    </h1>  
    </div>

 
    <div class="content">
           <h2>Create Announcement</h2>
         <div class="container1">
  
    <div class="col-25">
     
        <div class="lbl">
            <label for="title">Title :</label> 
        </div>
        <div class="txt">
            <asp:TextBox CssClass="txtTitle" ID="txtTitle" placeholder="Enter Title here..." runat="server"></asp:TextBox>
          <%--<input type="text" id="Title" name="Title" placeholder="The title of the Announcement..."> --%>  
        </div>   
    </div>
    </div>
    <div class="container2">
    <div class="col-75">     
     <div class="lbl2">
         <label for="description">Description :</label>
     </div>
     <div class="textDesc">
         <div class="tbox">
                <asp:TextBox CssClass="txtDesc" ID="txtDesc" TextMode="MultiLine" placeholder= "Enter Description here..." runat="server"></asp:TextBox>         
         </div>
         
       <%-- <textarea id="description" name="description" placeholder="Write here...">
        </textarea> --%> 
     </div>       
    </div>
    
    <div class="row">

         <asp:Label ID="lblSuccessMessage" runat="server" Text=""></asp:Label>
        
        <div class="button"> 
            
                <asp:Button ID="btnCancel" CssClass="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                <asp:Button ID="btnSubmit" CssClass="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            
         </div>
        

       
    </div>
    </div>
 </div>
    
</asp:Content>
