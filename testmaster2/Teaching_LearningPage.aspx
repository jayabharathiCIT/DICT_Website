<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Teaching_LearningPage.aspx.cs" Inherits="DICT_Website.Teaching_LearningPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <link href="Content/TeachingStyle.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">

    <div  id= "divContainer">
          <div   class="divHeader" >
              <h1 id= "divHeader" > ICT Teaching & learning</h1>
                            <div>
                                <table>
                                    <tr >
                                        <td style="width:700px;height:auto; ">
                                            <a href="Teaching_LearningPage#WIL"><p Class="divSubHeader" >Work Integrated Learning</p></a>
                                        </td>
                                        <td style="width:700px;height:auto; ">
                                            <a href="Teaching_LearningPage#FL"><p Class= "divSubHeader">Flexible Learning</p></a>
                                       
                                        </td>
                                    </tr>
                                  </table>
                               </div>
           </div>
    
                    

            <div id="PBL">
                            
                <div class = "divContentPBL">   
                <table>
                        <tr>
                                <td>
                               <a href="http://itdp.com.au/" target="_blank" ><h1 style="color:white ; text-align:center;"  class="paragraphtag">Project Based Learning </h1></a>
                                </td>
                                    </tr>  
                    
                    <tr>
                            <td>
                              <p  class="paragraphtag" > Project Based Learning is a teaching method in which students gain knowledge and skills by working for an extended period 
                                  of time to investigate and respond to an authentic, engaging, and complex question, problem, or challenge. <br />
                                teachers make learning come alive for students.
                                Students work on a project over an extended period of time – from a week up to a semester – that engages them in solving a real-world problem or answering a complex question. 
                                  They demonstrate their knowledge and skills by creating a public product or presentation for a real audience. <br />

                                As a result, students develop deep content knowledge as well as critical thinking, collaboration, creativity, and communication skills.
                                  Project Based Learning unleashes a contagious, creative energy among students and teachers.</p>
                            </td>
                                </tr>
                    <tr>
                     <td style=" text-align: center;">
                       <a  href="http://itdp.com.au/" target="_blank"  ><img class="Icons" src="Images/IconWorkCooperative.png" alt="WorkCooperative" title="Project Based Learning"></a>
                       <p style="font-style:italic;" class="paragraphtag">Knows Our Current Projects</p>
                    </td>
                    </tr>
                        </table>
                </div>
</div>


        <div ></div>
   
             <div id="WIL">
                      <div class ="divContentWIL">
                       <table>
                            <tr>
                                <td>
                                <a href="https://cit.edu.au/current/my_study/student_information_guide/a_to_z/work_placement" target="_blank" ><h1 style="color:white  ; text-align:center"> Work Integrated Learning </h1></a>
                                </td>
                                    </tr>
                                <tr>
                                <td> <div id="CallWIL"></div><p  class="paragraphtag" > Work-based learning (WBL) is learning that occurs in real work environments through participation 
                                                       in authentic work activities and interactions.It provides students with opportunities to develop practical 
                                                       and conceptual skills  related to their training and to apply them in workplace settings. 
                                                       <br/><br/>The common model implemented for DICT allows that the learner will be an employee who is in the workplace 
                                                       more than in the classroom. By th    is method is possible perform a Simulation what provides experiential learning experiences,
                                                       whereby students are engaged in analysis and decision-making in real work situations in an educational setting. 
                                                        </p>                      
                               </td>
                           </tr>
                           <tr>
                               <td style=" text-align: center;">
                                   <a  href="https://cit.edu.au/current/my_study/student_information_guide/a_to_z/work_placement" target="_blank"  ><img class="Icons" src="Images/IconWorkIntegrated.jpg" alt="WorkIntegrated" title="Work Placement"></a>
                               <p style="font-style:italic;" class="paragraphtag" >Work Placement</p>
                               </td>
                           </tr>
                          </table>
                    </div>
               </div>
                   

           
                  <div id="CallFL"></div>
                    <br /><br /><br />
                    
               <div id="FL">
                      
                        <div class ="divContentFL">
                             <br />
                           <table>
                                <tr>
                                <td>
                                 <a href="https://cit.edu.au/study/flexible_learning" target="_blank" ><h1 style="color:black ; text-align:center"> Flexible Learning </h1></a>
                                </td>
                                    </tr>
                               
                               
                               <tr>
                                    <td>
                                            <p class="paragraphtag" >Flexible Learning is offered at CIT Reid and at CIT Gungahlin and CIT Tuggeranong.  Providing you with more choices and greater access to study at times convenient to you by offering flexible, self-paced learning for a range of courses. <br />
                                                You can study nationally recognised courses and subjects at a time and place that suits you. You start when you like and study where you like - whether in the CIT Library, at home, in the workplace, or online - with support from staff committed to helping you achieve your learning goals. You are given access to online resources and support. 
                                            </p>                      
                                   </td>
                                </tr>
                                <tr>
                                     <td style=" text-align: center;">
                                         <a  href="https://cit.edu.au/study/flexible_learning" target="_blank"  ><img class="Icons" src="Images/IconFlexibleLearning.png" alt="FlexibleLearning" title="Flexible Learning"></a>
                                        <p style="font-style:italic;" class="paragraphtag" >Learn more about Flexible Learning</p>
                                         </td>
                            </tr>
                                </table>
                         </div>
            </div>
        </div>
</asp:Content>
 







