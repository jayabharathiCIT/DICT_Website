<%@ Page Title="News" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddNews.aspx.cs" Inherits="DICT_Website.AddNews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="Content/News.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
    <div class="top-box">
        <h1 class="header">News</h1>
    </div>

    <div class="content-box">
        <h1 class="header2">Add News</h1>
        
        <div class="form-container">
             <form action="#">
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
      <label for="fname">First Name</label>
    </div>
    <div class="col-75">
      <input type="text" id="fname" name="firstname" placeholder="Your name..">
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="country">Country</label>
    </div>
    <div class="col-75">
      <select id="country" name="country">
        <option value="australia">Australia</option>
        <option value="canada">Canada</option>
        <option value="usa">USA</option>
      </select>
    </div>
  </div>
   <div class="row">
     <button type="button" class="btn btn-default">Add image</button>

  </div>
  <div class="row">
    <div class="col-25">
      <label for="subject">Subject</label>
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
