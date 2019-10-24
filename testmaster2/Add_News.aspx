<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add_News.aspx.cs" Inherits="DICT_Website.Add_News" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/Add_News.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
    <%-- ---------------------------------------------Heading1---------------------- --%>
    <div class="top-box">
        <h1 class="header">News</h1>
    </div>
    <%-- ---------------------------------------------Heading2---------------------- --%>
    <div class="content-box">
        <h1 class="header2">Add News</h1>
        
        <div class="form-container">
             <form action="#">
    <%-- -----------------------------------------Add News Form -------------------------%>
  <div class="row">
    <div class="col-25">
      <label for="fname">Newsitle</label>
    </div>
    <div class="col-75">
      <input type="text" id="name" name="News Title" placeholder="Title(required)">
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="Date">Date</label>
    </div>
    <div class="date">
      <input type="date" name="Date">
    </div>
  </div>
     <div class="row">
    <div class="col-25">
      <label for="Category">Category</label>
    </div>
    <div class="col-75">
        <asp:DropDownList ID="ctgry" runat="server"></asp:DropDownList>
      <%--<input type="text" id="catgry" name="Category" placeholder="Category(required)">--%>
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="Source">Source</label>
    </div>
    <div class="col-75">
      <input type="text" id="Src" name="Source" placeholder="Source(required)" >
        
      
    </div>
  </div>
   <div class="row">
     <button type="button" class="btn btn-default">Add image</button>

  </div>
  <div class="row">
    <div class="col-25">
      <label for="content">Content</label>
    </div>
    <div class="col-75">
      <textarea id="subject" name="subject" placeholder="Write something.." style="height:200px"></textarea>
    </div>
  </div>
  <div class="row">
   <button type="button" class="btn btn-default">Submit</button>
   <button type="button" class="btn btn-default">Cancel</button>
    </div>
    
  </form>
        </div>
    </div>
</asp:Content>
