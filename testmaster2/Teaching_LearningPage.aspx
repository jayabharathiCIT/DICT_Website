<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Teaching_LearningPage.aspx.cs" Inherits="DICT_Website.Teaching_LearningPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <link href="Content/TeachingStyle.css" rel="stylesheet" />

    <div  id= "divContainer">
          <div   class="divHeader" >
              <p id= "divHeader" > ICT Teaching & learning</p>
                            <div>
                                <table>
                                    <tr >
                                        <td style="width:700px; height:auto">
                                            <a href="Teaching_LearningPage#PBL"><p Class= "divSubHeader" >PROJECT BASED LEARNING</p></a>
                                        
                                        </td>
                                        <td style="width:700px;height:auto; ">
                                            <a href="Teaching_LearningPage#WIL"><p Class="divSubHeader" >WORK INTEGRATED LEARNING</p></a>
                                        </td>
                                        <td style="width:700px;height:auto; ">
                                            <a href="Teaching_LearningPage#FL"><p Class= "divSubHeader">FLEXIBLE  LEARNING</p></a>
                                       
                                        </td>
                                    </tr>
                                  </table>
                               </div>
           </div>

            <div id="PBL">
                 <br><br/> 
                <a href="http://itdp.com.au/"><h1 style="color:black">Project Based Learning </h1></a>
                <br><br/> 
                
                <div class = "divContent">   
                <table>
                        <tr>
                            <td>
                              <p > Project Based Learning is a teaching method in which students gain knowledge and skills by working for an extended period 
                                  of time to investigate and respond to an authentic, engaging, and complex question, problem, or challenge </p>
                            </td>
                                </tr>
                    <tr>
                     <td style=" text-align: center;">
                       <a  href="http://itdp.com.au/" ><img class="Icons" src="Images/IconWorkCooperative.png" alt="WorkCooperative" title="Project Based Learning"></a>
                    </td>
                    </tr>
                        </table>
                </div>

            </div>

             <div id="WIL">
             <br><br/><a href="https://cit.edu.au/current/my_study/student_information_guide/a_to_z/work_placement"><h1 style="color:black"> Work Integrated Learning </h1></a><br><br/>

                     <div class ="divContent">
                            <br />
                       <table>
                            <tr>
                                <td> <p > Work-based learning (WBL) is learning that occurs in real work environments through participation 
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
                                   <a  href="https://cit.edu.au/current/my_study/student_information_guide/a_to_z/work_placement" ><img class="Icons" src="Images/IconWorkIntegrated.jpg" alt="WorkIntegrated" title="Work Placement"></a>
                               </td>
                           </tr>
                          </table>
                    </div>
               </div>
                   

           
                 
               <div id="FL">
                      <br><br/>  <a href="https://cit.edu.au/study/flexible_learning"><h1 style="color:black"> Flexible Learning </h1></a><br><br/>
                        <div class ="divContent">
                             <br />
                           <table>
                                <tr>
                                    <td>
                                            <p >Providing you with more choices and greater access to study at times 
                                                convenient to you by offering flexible, self-paced learning for a range of courses. 
                                            </p>                      
                                   </td>
                                </tr>
                                <tr>
                                     <td style=" text-align: center;">
                                         <a  href="https://cit.edu.au/study/flexible_learning" ><img class="Icons" src="Images/IconFlexibleLearning.png" alt="FlexibleLearning" title="Flexible Learning"></a>
                                     </td>
                            </tr>
                                </table>
                         </div>
            </div>
        </div>
</asp:Content>
 







