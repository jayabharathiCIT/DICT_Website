<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FutureStudentsPage.aspx.cs" Inherits="DICT_Website.FutureStudentsPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/StudentStyle.css" rel="stylesheet" />

    <div  id= "divContainer">
          <div   class="divHeader" >
              <h1 id= "divHeader" > Future Students </h1>
                            <div>
                                <table>
                                    <tr >
                                        <td style="width:720px; height:auto">
                                            <a href="https://cit.edu.au/study/applying_and_enrolling"><p Class= "divSubHeader" >How to Apply /Enrol</p></a>
                                        
                                        </td>
                                        <td style="width:720px;height:auto; ">
                                            <a href="https://international.cit.edu.au/home" target="_blank"><p Class= "divSubHeader">International Students</p></a>
                                        </td>

                                    </tr>
                                  </table>
                               </div>
           </div >

           
                
                    <div style="Background:rgba(8, 95, 99, 0.88)">
                         <br /><h1 style="color: whitesmoke ; text-align:center"> Why study at CIT?</h1>
                        <br /><p style="color:white ;font-size: medium; text-align:center">Contemporary skills in a modern learning environment.
                            From our trade qualifications to diplomas, <br /> degrees and postgraduate qualifications, our focus is on developing your
                            practical skills and real world experience <br /> for a future limited only by your imagination.</p><br />
                    </div>
          
      
               
            <div id = "QuickAccessFS">
                                            
                <div >  
                    <br />
                <table>
                        <tr>
                            <td class ="QuickAccessTable">
                              <a href="https://cit.edu.au/courses" target="_blank" ><img class="Icons" src="Images/CourseIcon.png" alt="Course" title=" Course"></a>
                                <br /><p style="font-size: medium; color:black">Course</p>
                                <br /><p style="font-size: small; color:dimgrey">CIT's nationally recognised qualifications,<br /> from certificate to postgraduate level.</p>

                            </td>
                            <td class ="QuickAccessTable">
                              <a href=" https://cit.edu.au/apprentices_trainees" target="_blank" ><img class="Icons" src="Images/ApprenticeIcon.png" alt="Elearning" title="ApprenticeShip"></a>
                                    <br /><p style="font-size: medium; color:black">ApprenticeShips</p>
                                <br /><p style="font-size: small; color:dimgrey">GEt straight into the workforce with an <br />apprenticeship or trainesship.</p>
                            </td>
                            <td class ="QuickAccessTable">
                              <a href="https://cit.edu.au/library" target="_blank" ><img class="Icons" src="Images/EmploymentIcon.png" alt="Employment" title="Employment"></a>
                                    <br /><p style="font-size: medium; color:black">Employment</p>
                                    <br /><p style="font-size: small; color:dimgrey">Register a job vacancy or view current <br /> job opportunities.</p>
                            </td>
                            </tr>
                            <tr style="height:20px"></tr>
                            <tr>
                            <td class ="QuickAccessTable">
                              <a href="https://cit.edu.au/study/course_fees_and_assistance" target="_blank" ><img class="Icons" src="Images/infoIcon.png" alt="Fee" title="Info"></a>
                                <br /><p style="font-size: medium; color:black">Info</p>
                                <br /><p style="font-size: small; color:dimgrey">Information and enrolement sessions to get started.</p>
                            </td>
                            <td class ="QuickAccessTable">
                              <a href=" https://cit.edu.au/study/course_fees_and_assistance" target="_blank" ><img class="Icons" src="Images/FeeIcon.png" alt="Fee" title="Fee"></a>
                                    <br /><p style="font-size: medium; color:black">Fee</p>
                                <br /><p style="font-size: small; color:dimgrey">Current fee information,fee help, and scholarships.</p>
                            </td>
                            <td class ="QuickAccessTable">
                              <a href="https://cit.edu.au/study/cit_yurauna" target="_blank" ><img class="Icons" src="Images/infoIcon.png" alt="CIT Yurauna" title="CIT Yurauna"></a>
                                    <br /><p style="font-size: medium; color:black">CIT Yurauna</p>
                                    <br /><p style="font-size: small; color:dimgrey">CIT's dedicated Aboriginal and Torres Strait Islander support.</p>
                            </td>
                        </tr>
                                    
                </table>
                    <br><br/> 
                </div>
                </div>

                <div id="Important_InformationFS">
                   <br />
                    <table>
                        <tr>  
                            <td style="width:100px"></td>
                      <td class="InformationBox">

                         <div id="Study Information">
                         <br/><h1 style="color:black ;font-size: 20px;"> Study Information </h1><br/>
                             <a href="https://cit.edu.au/study/cit_support/are_you_study_ready" target="_blank" class="InformationBoxFS">Are You Study Ready?</a><br />
                             <a href="https://cit.edu.au/study/schools" target="_blank" class="InformationBoxFS">CIT for Schools</a><br />
                             <a href="https://cit.edu.au/study/applying_and_enrolling/pathways" target="_blank" class="InformationBoxFS">Pathways</a><br />
                             <a href="https://cit.edu.au/courses/education_community/english_language" target="_blank" class="InformationBoxFS">English Language</a><br />

                     
                           </div>
                            </td>
                            <td style="width:100px"></td>

                            <td  class="InformationBox">
                          <div id="Services" >
                         <br/><h1 style="color:black ;font-size: 20px;"> Services </h1><br/>
                           <a href="CurrentStudentPage" target="_blank" class="InformationBoxFS">Current Student</a><br />
                             <a href="https://cit.edu.au/services/cit_travel" target="_blank" class="InformationBoxFS">CIT Travel</a><br />
                             <a href="https://cit.edu.au/services/apprentice_kitchen_cafe_and_shop" target="_blank" class="InformationBoxFS">CIT Apprentice Kitchen Cafe and Shop</a><br />
                             <a href="https://cit.edu.au/study/mature_workers_support" target="_blank" class="InformationBoxFS">Mature Workers Support</a><br /><br />
                           </div>  
                                </td>
                            <td style="width:100px"></td>
                            </tr>
                       
                    </table>
                    <br />
                </div>
 
        </div>
</asp:Content>
