<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="testmaster2.About" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

		  <title>About DICT</title>
    <link rel="stylesheet" type="text/css" href="style.css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap" rel="stylesheet">
  </head>
    <body>
        <div class="container-image">
          <img src="books.png" alt="Books">
        </div>

        <div class="content-container">
            <h1 class="header">About DICT</h1>
            <div class="text-container">
                <p>
                    CIT has an impressive 90 year history providing technical and further education in the ACT and surrounding area.
                    Today, it trains around 20,000 students each year, touching more lives post- secondary school than any other tertiary education institution in the ACT.<br>
                    <br/>
                    Offering apprenticeships and certificate level training through to diplomas, bachelor degrees and graduate certificates, 
                    CIT offers the full gamut of the tertiary experience and can help you identify a training pathway to help you reach your goals, whether you are new to study or already hold qualifications.
                  </p>
            </div>

            <h1 class="header2">Head of Department Message</h1>

            <div class="text-container2">
                <div class="sample-image">
                    <asp: runat="server" CssClass="Image" ImageURL="~/Images/Sample.png"/>
                </div>
                
                <div class="text-container3">
                    <p>
                      As the region's premier and largest vocational education and training provider, CIT offers over 400 courses ranging from Statement of Attainments, traineeships and apprenticeships, through to diplomas and degrees.<br>
                      <br>
                      Whatever your career goal, CIT has a study option to put you on the right path to build the future you want.<br>
                    </p>
                </div>
                <div class="text-container4">
                    <p>
                      CIT’s nationally-recognised courses offer practical experience, not just theory, meaning you end up with real industry skills.<br>
                      <br>
                      Our strong connection with industry means you will gain invaluable connections and real-world experience and opportunities.<br>
                      <br>
                      At CIT, we pride ourselves on achieving excellence in teaching and learning. We provide progressive and accessible education solutions using the latest technology and most up-to-date in learning capabilities, with options for flexible and online learning.<br>
                      <br>
                      Our four campuses and two Learning Centres are designed to create a supportive learning environment for our diverse student population, and are home to world-class libraries and information technology resources, as well as sporting and recreational facilities.<br>
                      <br>
                      If you ever need help, we're here to assist you with student support, peer tutoring, counselling, disability support, and our dedicated Yurauna Centre providing support services to Aboriginal and Torres Strait Islander students.<br>
                      <br>
                     We trust this site gives a sense of the community and spirit at CIT, and we look forward to welcoming you and being a part of your future.
                    </p>
                </div>
            </div>
              <h1 class="header3">Campus Map</h1>

              <div class="map-image">
                <img src="map.png" alt="Map">
              </div>
        </div>
</body>    
</asp:Content>
