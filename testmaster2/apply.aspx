<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="apply.aspx.cs" Inherits="DICT_Website.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <link rel="stylesheet" href="content/apply.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap" rel="stylesheet">

    <div class="top-box">
        <h1 class="header">Study At CIT</h1>
    </div>

    <div class="content-box">
        <table class="content-table"> 
        <tr> 
            <th>ENROLMENT TYPE</th> 
            <th>DESCRIPTION</th> 
        </tr> 
        <tr> 
            <td><strong>STANDARD</strong></td> 
            <td>Applicants are automatically accepted into the course and only need to enrol into subjects.</td> 
            
        </tr> 
        <tr> 
            <td><strong>FULL FEE</strong></td> 
            <td>Applicants are automatically accepted into the course and only need to enrol into subjects.</td> 
       
        </tr> 
        <tr> 
            <td><strong>PORTFOLIO-STANDARD	</strong></td> 
            <td>Fees are subsidised. You will be contacted by CIT after your initial enrolment request has been submitted. If you are successful in meeting all of the entry requirements you will receive details on to complete the final stage in the enrolment process.</td> 
        </tr>
        <tr> 
            <td><strong>PORTFOLIO-FULL FEE</strong></td> 
            <td>Fees are NOT subsidised. You will be contacted by CIT after your initial enrolment request has been submitted. If you are successful in meeting all of the entry requirements you will receive details on to complete the final stage in the enrolment process.</td> 
        </tr>
        <tr> 
            <td><strong>SKILLS TRAINING</strong></td> 
            <td>Applicants are automatically accepted into the course and only need to enrol into subjects.</td> 
        </tr>
        <tr> 
            <td><strong>BACHELOR</strong></td> 
            <td>Applicants will be contacted by CIT after their step 1 of the enrolment has been submitted. Successful applicants will receive details on how to enrol into subjects.</td> 
        </tr>
        <tr> 
            <td><strong>NURSING</strong></td> 
            <td>Applicants will be contacted by CIT after step 1 of the enrolment has been submitted. Successful applicants will receive details on how to enrol into subjects.</td> 
        </tr>
        <tr> 
            <td><strong>APPRENTICE/TRAINEE</strong></td> 
            <td>If you are entering this course as a Trainee/Apprentice under the Australian Apprenticeships arrangements, you must be employed in the industry and you must register with an Apprentice Network Provider (ANP) prior to completing the next stage in the enrolment process.</td> 
        </tr>
        <tr> 
            <td><strong>INTERNATIONAL ENGLISH</strong></td> 
            <td>Enrol for CIT English language training for International students.</td> 
        </tr>

    </table> 
    </div>

</asp:Content>
