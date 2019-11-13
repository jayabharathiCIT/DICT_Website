<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="courses.aspx.cs" Inherits="DICT_Website.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <link rel="stylesheet" href="content/courses.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap" rel="stylesheet">

    <div class="top-image-container">
            <img src="images/course1.jpg" alt="Courses" class="topimage">
    </div>

    <div class="top-text-container">
            <h1 class="top-header">Our DICT Courses</h1>
            <div class="textbox1">
                    "Contemporary skills in a modern learning environment.
                    From our trade qualifications to diplomas, degrees and postgraduate qualifications, our focus is on developing your practical skills and real world experience for a future limited only by your imagination.

                    Take one of our speciliased Information Technology Courses today."
            </div>
        </div>

     <div class="courses-search-container">
            <h1 class="search-header">Find A Course</h1>
           <div class="dropdown">
  <button class="dropbtn">Courses</button>
  <div class="dropdown-content">
    <a href="cyber.aspx">Networking and Cyber Security</a>
    <a href="course-detail.aspx">Information Technology</a>
    <a href="soft.aspx">Software Development</a>
      <a href="net.aspx">Information Technology Networking</a>
      <a href="games.aspx">Games Development</a>
  </div>
</div>
        </div>

    <div class="courses-main-container">
               
            <h1 class="courses-header">Our Courses</h1>
            <h1 class="cyber-header">Cyber Security</h1>
            <h1 class="network-header">Networking</h1>
            <h1 class="it-header">Information Technology</h1>
            <h1 class="prg-header">Programming</h1>
            <h1 class="games-header">Games Development</h1>

            <hr class="cyber-break">
            <hr class="network-break">
            <hr class="it-break">
            <hr class="prg-break">
            <hr class="games-break">

           <div class="cyber-container">
                    <div class="cyber-box1">
                            <i class="fas fa-shield-alt"></i>
                            <h2 class="cyber-text">Graduate Certificate</h2>
                    </div>
                    <div class="cyber-box1">
                            <i class="fas fa-user-secret"></i>
                            <h2 class="cyber-text">Certificate IV</h2>
                    </div>
                    <div class="cyber-box1">
                            <i class="fas fa-user-shield"></i>
                            <h2 class="cyber-text">Statement of Attainment</h2>
                    </div>
            </div>
                 <div class="cyber-link-container">
                    <a href="cyber.aspx" class="cyber-link">Networking and Cyber Security 10198NAT</a>
                    <a href="#" class="cyber-link">Cyber Security 22334VIC</a>
                    <a href="#" class="cyber-link">Networking and Cyber Security 10198NAT</a>
                </div>

                <div class="network-container">
                        <div class="course-box-2">
                                <i class="fas fa-server"></i>
                                <h2 class="cyber-text">Diploma</h2>
                        </div>
                        <div class="course-box-2">
                                <i class="fas fa-network-wired"></i>
                                <h2 class="cyber-text">Certificate IV</h2>
                        </div>
                        <div class="course-box-2">
                                <i class="fas fa-project-diagram"></i>
                                <h2 class="cyber-text">Non-Acredited Training</h2>
                        </div>
                </div>

                <div class="network-link-container">
                        <a href="net.aspx" class="net-link">Information Technology Networking ICT50418</a>
                        <a href="#" class="net-link">Information Technology Networking ICT40418</a>
                        <a href="#" class="net-link">Preparation for CISCO Assessment</a>
                </div>

                <div class="it-container">
                        <div class="course-box-3">
                                <i class="fas fa-laptop"></i>
                                <h2 class="cyber-text">Diploma</h2>
                        </div>
                        <div class="course-box-3">
                                <i class="fas fa-desktop"></i>
                                <h2 class="cyber-text">Certificate IV</h2>
                        </div>
                        <div class="course-box-3">
                                <i class="fas fa-laptop-code"></i>
                                <h2 class="cyber-text">Non-Acredited Training</h2>
                        </div>
                </div>

                <div class="it-link-container">
                        <a href="course-detail.aspx" class="it-link">	Information Technology ICT50118</a>
                        <a href="#" class="it-link">	Information Technology ICT40115</a>
                        <a href="#" class="it-link">	Information, Digital Media and Technology ICT30118</a>
                </div>

                <div class="prg-container">
                        <div class="course-box-4">
                                <i class="fas fa-code"></i>
                                <h2 class="cyber-text">Diploma</h2>
                        </div>
                        <div class="course-box-4">
                                <i class="fas fa-file-code"></i>
                                <h2 class="cyber-text">Certificate IV</h2>
                        </div>
                        <div class="course-box-4">
                                <i class="fas fa-bug"></i>
                                <h2 class="cyber-text">Certificate IV</h2>
                        </div>
                </div>

                <div class="prg-link-container">
                        <a href="soft.aspx" class="prg-link">		Software Development ICT50718</a>
                        <a href="#" class="prg-link">		Programming ICT40518</a>
                        <a href="#" class="prg-link">		Information Technology Testing ICT40615</a>
                </div>

                <div class="games-container">
                        <div class="course-box-5">
                                <i class="fas fa-gamepad"></i>
                                <h2 class="cyber-text">Bachelor</h2>
                        </div>
                </div>

                <div class="games-link-container">
                        <a href="games.aspx" class="games-link">	Games and Virtual Worlds (Programming)</a>
                </div>

        </div>
</asp:Content>
