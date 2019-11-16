<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="testmaster2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link rel="stylesheet" href="content/homepage.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css">
 

        <div class="slideshow-container">
            <div class="slidershow middle">
                <div class="slides">
                  <input type="radio" name="r" id="r1" checked>
                  <input type="radio" name="r" id="r2">
                  <input type="radio" name="r" id="r3">
                  <input type="radio" name="r" id="r4">
                  <input type="radio" name="r" id="r5">
                  <div class="slide s1">
                    <img src="images/test1.jpg" alt="">
                  </div>
                  <div class="slide">
                    <img src="images/test3.jpg" alt="">
                  </div>
                </div>
          
                <div class="navigation">
                  <label for="r1" class="bar"></label>
                  <label for="r2" class="bar"></label>
                </div>
              </div>
        </div>


     <div class="middle-container">
            <h1 class="about-header">Welcome to the DICT</h1>
            <div class="middle-text">
                <div class="textbox-1">
                    Here at the DICT we pride ourselves in delivering ICT courses that get you ready for the real world. We offer a range of
                    courses with flexible online options, so you can study anywhere at anytime.
                    <br />
                    <p class="quote">Dream it, Learn it, Be it.</p>
                </div>
                <h1 class="offer-head">Here's what we offer you...</h1>
                <div class="textbox-2">
                       <div class="box-1">
                            <i class="fas fa-user-graduate"></i>
                            <h2 class="box-head">Great Courses</h2>
                       </div>
                    <div class="box-1">
                        <i class="fas fa-hand-holding-usd"></i>
                            <h2 class="box-head">Financial Support</h2>
                       </div>
                    <div class="box-1">
                        <i class="fas fa-laptop-code"></i>
                            <h2 class="box-head">Quality Tech</h2>
                       </div>
                    <div class="box-1">
                        <i class="fas fa-chalkboard-teacher"></i>
                            <h2 class="box-head">Skillful Teachers</h2>
                       </div>

                </div>
            </div>
        </div>

     <div class="bottom-container"> 
        <div id="st-box"> 
            <h1 class="box-header" >Courses</h1>
            <i class="fas fa-graduation-cap"></i>
            <div class="button-container">
                <a href="courses.aspx"><button type="button" class="btn btn-info">More Info</button></a>
            </div>
        </div> 
          
        <div id="nd-box"> 
            <h1 class="box-header">News</h1>
            <i class="fas fa-newspaper"></i>
            <div class="button-container">
              <a href="NewsPage.aspx"><button type="button" class="btn btn-info">More Info</button></a>
            </div>
        </div> 
          
        <div id="rd-box">
                <h1 class="box-header">About</h1>
            <i class="fas fa-question"></i>
                <div class="button-container">
                    <a href="About.aspx"><button type="button" class="btn btn-info">More Info</button></a>
                </div>
        </div> 
    </div>
    

</asp:Content>
