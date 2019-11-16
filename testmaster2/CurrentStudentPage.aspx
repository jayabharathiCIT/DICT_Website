<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CurrentStudentPage.aspx.cs" Inherits="DICT_Website.CurrentStudentPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
    <link href="Content/StudentStyle.css" rel="stylesheet" />

    <div  id= "divContainer">
          <div   class="divHeader" >
              <h1 id= "divHeader" > Current Students</h1>
                            <div>
                                <table>
                                    <tr >
                                        <td style="width:480px;height:auto; ">
                                            <a href="#CallService" ><p Class= "divSubHeader" >Services</p></a>
                                        </td>
                                        <td style="width:480px;height:auto; ">
                                            <a href="#CallImportant_Information" ><p Class= "divSubHeader">Important Information</p></a>
                                       
                                        </td>
                                         <td style="width:480px;height:auto; ">
                                            <a href="https://international.cit.edu.au/home" target="_blank"  ><p Class= "divSubHeader">International Students</p></a>
                                        </td>

                                    </tr>
                                  </table>
                               </div> 
           </div >

            <div id= "QuickAccess">
                 <br><br/> 
                <h1 style="color:black ">Quick Access</h1><br />
                               
                <div >   
                <table>
                        <tr>
                            <td class ="QuickAccessTable">
                              <a href="https://cit.edu.au/study/applying_and_enrolling/help_with_enrolling" target="_blank" ><img class="QuickAccessIcons" src="Images/EnrollingIcon.png" alt="Enrolling" title=" Applying / Enrolling"></a>
                                <br /><p style="font-size: medium; color:black">Help with Enrolling</p>
                            </td>
                            <td class ="QuickAccessTable">
                              <a href=" http://elearn.cit.edu.au/" target="_blank"><img class="QuickAccessIcons" src="Images/Elearning.png" alt="Elearning" title="eLearn"></a>
                                    <br /><p style="font-size: medium; color:black">eLearn</p>
                            </td>
                            <td class ="QuickAccessTable">
                              <a href="https://cit.edu.au/library" target="_blank"><img class="QuickAccessIcons" src="Images/Library Icon.png" alt="Library" title="Library"></a>
                                    <br /><p style="font-size: medium; color:black">Library</p>
                            </td>
                        </tr>
                                    
                </table>
                    <br><br/> 
                </div>

            </div>

         <div id="CallService"></div>
     

  
             <div id="Service"   >
             <br><br/><h1 id="Service_Header" > Services </h1><br/><br />

                     <div  id="CIT Support services" class ="divContent" >
                            <br />
                       <table>
                            <tr>
                                <td>  
                                    <a href="https://cit.edu.au/current/services/student_support" target="_blank" ><img class="Icons" src="Images/IconWorkIntegrated.jpg" alt="Supportservices" title="Support services"></a>
                               </td>
                                <td style="text-align:center ; width : 1000px;"> 
                                    <a href="https://cit.edu.au/current/services/student_support" target="_blank" style="color:black" >
                               <br /><h2>CIT Support services</h2>
                               <p  style="font-size:15px;"> At CIT, staff in CIT Student Support can provide you with guidance, 
                                   referral and support through services such as Counselling, Disability Support, Migrant Support and Careers Advice. </p> 
                                    </a>
                               </td>
                           </tr>
                          </table>
                    </div>

                   <br />
                   <div  id="CITSA" class ="divContent">
                       <table>
                            <tr>
                                <td>  
                                    <a href="http://www.citsa.com.au/" target="_blank"><img class="Icons" src="Images/CITSAIcon.png" alt="CITSA" title="CIT Student Association"></a>
                               </td>
                                <td style="text-align:center ; width : 1000px;"> 
                                    <a href="http://www.citsa.com.au/" target="_blank" style="color:black" >
                               <br /> <h2>CIT Student Association (CITSA)</h2>
                               <p style="font-size:15px;"> CIT looks after all your educational needs. CITSA (that’s us!) 
                                   Is here to do the rest: Your student experience & it’s all about you! </p> </a>    
                               </td>
                           </tr>
                          </table>
                    </div>

                  <br />
                   <div  id="CIT Self Service" class ="divContent">
                       <table>
                            <tr>
                                <td>  
                                    <a href="https://cit.edu.au/current/services/student_services" target="_blank" ><img class="Icons" src="Images/SelfServiceIcon.jpg" alt="SelfService" title="CIT Self Service"></a>
                               </td>
                                <td style="text-align:center ; width : 1000px;"> 
                                    <a href="https://cit.edu.au/current/services/student_services" target="_blank" style="color:black" >
                               <br /> <h2>CIT Self Service</h2>
                               <p style="font-size:15px;"> The CIT Student Services on each campus is designed to be a one-stop shop to assist you with all the services you need. </p>
                                    </a>
                               </td>
                           </tr>
                          </table>
                    </div>

                 <br />
                   <div  id="CSCIT" class ="divContent">
                       <table>
                            <tr>
                                <td>  
                                    <a href="https://cit.edu.au/services" target="_blank" ><img class="Icons" src="Images/CSIcon.jpg" alt="CommercialServices" title="Commercial services"></a>
                               </td>
                                <td style="text-align:center ; width : 1000px;"> 
                                     <a href="https://cit.edu.au/services" target="_blank" style="color:black" >
                               <br /> <h2>Commercial services at CIT</h2>
                               <p style="font-size:15px;"> CIT offers a range of unique, hands-on training environments that operate as commercial businesses on campus. </p> 
                                    </a>
                               </td>
                           </tr>
                          </table>
                    </div>

                 <br />
                   <div  id="Accommodation" class ="divContent">
                       <table>
                            <tr>
                                <td>  
                                    <a href="https://cit.edu.au/current/services/accommodation" target="_blank" ><img class="Icons" src="Images/accommodationIcon.jpg" alt="Acommodation" title="Acommodation"></a>
                               </td>
                                <td style="text-align:center ; width : 1000px;"> 
                                    <a href="https://cit.edu.au/current/services/accommodation" target="_blank" style="color:black" >
                               <br /> <h2>CIT Accommodation</h2>
                               <p style="font-size:15px;"> At CIT, we seek to make the transition into study as easy as possible 
                                   by offering comfortable, well-equipped accommodation close to our campuses. </p>    
                                    </a>
                               </td>
                           </tr>
                          </table>
                    </div>

                  <br />
                   <div  id="Ask us" class ="divContent">
                       <table>
                            <tr>
                                <td>  
                                    <a href="https://cit.edu.au/study/need_help"  target="_blank"><img class="Icons" src="Images/AskusIcon.png" alt="NeedHelp" title="Need Help?"></a>
                               </td>
                                <td style="text-align:center; width : 1000px;"> 
                                    <a href="https://cit.edu.au/study/need_help" target="_blank" style="color:black" >
                               <br /> <h2>CIT Ask us</h2>
                               <p style="font-size:15px;" > How can we help? </p>     
                                    </a>
                               </td>
                           </tr>
                          </table>
                    </div>

               </div>


        <div id="CallImportant_Information"></div>

        <a href="#divContainer" style="color:dimgrey ; font-size:small; text-align:center" ><p > Go to top </p></a> 
       
        <div >
             <br><br/><h1 id="Important_Information"> Important Information </h1><br/><br />

                     <div  id="Graduation" class ="divContent">
                            <br />
                       <table>
                            <tr>
                                <td>  
                                    <a href="https://cit.edu.au/current/my_study/graduation" target="_blank" ><img class="Icons" src="Images/GraduationIcon.png" alt="Graduation" title="Graduation"></a>
                               </td>
                                <td style="text-align:center ; width : 1000px;"> 
                                    <a href="https://cit.edu.au/current/my_study/graduation" target="_blank" style="color:black" >
                               <br /><h2>Graduation</h2>
                               <p style="font-size:15px;"> Each year CIT students who have successfully completed their studies may 
                                   attend a CIT Celebration Event and receive formal recognition of their success at the Institute. </p>  
                                    </a>
                               </td>
                           </tr>
                          </table>
                    </div>

                    <br />
                    <div  id="SemesterDates" class ="divContent">
                                    <br />
                               <table>
                                    <tr>
                                        <td>  
                                            <a href="https://cit.edu.au/current/my_study/important_dates" target="_blank" ><img class="Icons" src="Images/SemesterDatesIcon.png" alt="SemesterDates" title="Semester Dates"></a>
                                       </td>
                                        <td style="text-align:center ; width : 1000px;"> 
                                            <a href="https://cit.edu.au/current/my_study/important_dates" target="_blank" style="color:black" >
                                       <br /><h2>Semester Dates</h2>
                                       <p style="font-size:15px;"> Check the important dates of your semester.  </p> 
                                            </a>
                                       </td>
                                   </tr>
                                  </table>
                            </div>

                    <br />
                    <div  id="StudentsForms" class ="divContent">
                                            <br />
                                       <table>
                                            <tr>
                                                <td>  
                                                    <a href="https://cit.edu.au/current/my_study/student_forms" target="_blank" ><img class="Icons" src="Images/StudentFormsIcon.png" alt="StudentForms"title="Student Forms"></a>
                                               </td>
                                                <td style="text-align:center ; width : 1000px;"> 
                                                    <a href="https://cit.edu.au/current/my_study/student_forms" target="_blank" style="color:black" >
                                               <br /><h2>Students Forms</h2>
                                               <p style="font-size:15px;">  Find a list of forms for you to download, print off ,complete and use at  CIT Student Services on your campus. </p>    
                                                   </a>
                                               </td>
                                           </tr>
                                          </table>
                                    </div>
            
                    <br />
                    <div  id="Internet" class ="divContent">
                                            <br />
                                       <table>
                                            <tr>
                                                <td>  
                                                    <a href="https://cit.edu.au/current/my_study/internet_and_wifi_access" target="_blank" ><img class="Icons" src="Images/InternetAccesIcon.png" alt="InternetAccess" title="Internet Access"></a>
                                               </td>
                                                <td style="text-align:center ; width : 1000px;"> 
                                                    <a href="https://cit.edu.au/current/my_study/internet_and_wifi_access" target="_blank" style="color:black" >
                                               <br /><h2>Internet and WIFI Access</h2>
                                               <p style="font-size:15px;"> CIT students and staff have WiFi internet access at all CIT locations. </p>    
                                                    </a>
                                               </td>
                                           </tr>
                                          </table>
                                    </div>

                 <br>   <a href="#divHeader" style="color:dimgrey ; font-size:small; text-align:center" ><p > Go to top </p></a><br>
       
                </div>             

</div> 
           
                 
              

</asp:Content>
