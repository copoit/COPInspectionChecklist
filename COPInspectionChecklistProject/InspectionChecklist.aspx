<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InspectionChecklist.aspx.cs" Inherits="COPInspectionChecklistProject.InspectionChecklist" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <img src="Images/Cop_logo.jpg" alt="City of Pasadena" style="float:left;width:200px;height:200px;" /> 
        <h1 style="font-size:50px;"><b>City of Pasadena</b></h1>
        <h3>Planning and Community Development Department</h3>
        <h3>Building and Safety Division</h3>
    </div>
    <div>
        <br />
        <div><h1 style="align-content:center">Housing Inspection Report</h1></div>
        <br />
        <table style="margin: 10px; width: 80%; border: 5px solid #000000">
            <tr>
                <th colspan="2" style="font-size:30px;">General Inspection Information</th>
            <tr>
            <td style="border:1px solid #000000; width: 399px;" class="auto-style2">Case Number:<input type="text" style="width: 207px" /></td>
            <td style="border:1px solid #000000; width: 420px;" class="auto-style3">Inspection Date:<input type="date" style="width: 207px" /></td>
        </tr>
        <tr>
            <td style="border:1px solid #000000; width: 399px;" class="auto-style2">Property Address:<input type="text" style="width: 207px" /></td>
            <td style="border:1px solid #000000; width: 420px;" class="auto-style3">Inspection Type<input type="text" style="width: 207px" /></td>
        </tr>
        <tr>
            <td style="border:1px solid #000000; width: 399px;" class="auto-style2">Dwelling Info:<input type="text" style="width: 207px"/></td>
            <td style="border:1px solid #000000; width: 420px;" class="auto-style3">Mailing Address:<input type="text" style="width: 207px"/></td>
        </tr>
        <tr>
            <td style="border:1px solid #000000; width: 399px;" class="auto-style2">Applicant:<input type="text" style="width: 207px"/></td>
            <td style="border:1px solid #000000; width: 420px;" class="auto-style3"># of Units:<input type="number" style="width: 207px"/></td>
        </tr>
        <tr>
            <td style="border:1px solid #000000; width: 399px;" class="auto-style2">Applicant Phone:<input type="text" style="width: 207px"/></td>
            <td style="border:1px solid #000000; width: 420px;" class="auto-style3">Applicant Email:<input type="email" style="width: 207px"/></td>
        </tr>
        <tr>
            <td style="border:1px solid #000000; width: 399px;" class="auto-style2">Inspector:<input type="text" style="width: 207px"/></td>
            <td style="border:1px solid #000000; width: 420px;" class="auto-style3">Owner Phone:<input type="text" style="width: 207px"/></td>
        </tr>
        <tr>
            <td style="border:1px solid #000000; width: 399px;" class="auto-style2">Inspector Email:<input type="email" style="width: 207px"/></td>
            <td style="border:1px solid #000000; width: 420px;" class="auto-style3">Sidewalk Fee:<input type="text" style="width: 207px"/></td>
        </tr>
        </table>
        <br />
        <fieldset style="width: 80%;">
            This inspection should not be relied on as conclusive proof that the property meets all local and state codes.  Illegal conditions may have
            been missed during this inspection. The failure of an inspection to have uncovered the illegal condition(s) does not render the illegal 
            condition(s) as legal or permitted. The City of Pasadena has the right to reinspect this property to ensure compliance with the local and
            state codes if needed. Lastly, this inspection does not satisfy any private party disclosure requirements mandated by local, state, and federal
            law applying to the property.
        </fieldset>
    </div>
</asp:Content>
