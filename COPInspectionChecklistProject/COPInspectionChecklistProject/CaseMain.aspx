<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CaseMain.aspx.cs" Inherits="COPInspectionChecklistProject.CaseMain" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <-- This page displays information that was called for and retrieved from the database. Data is loaded per request
    by either a Case Number -->
    <div class="container">
        <img src="Images/Cop_logo.jpg" alt="City of Pasadena" style="float:left;width:200px;height:200px;" /> 
        <h1 style="font-size:50px;"><b>City of Pasadena</b></h1>
        <h3>Planning and Community Development Department</h3>
        <h3>Building and Safety Division</h3>
    </div>
    <div>
	    <div>
            <h1 style="margin:20px;"><b>Case Main</b></h1>
	    </div>
	    <table style="margin: 10px; width: 50%; border: 5px solid #000000">
		<tbody>
		    <tr>
			<td style="width: 160px">Case Number</td>
			<td><input name="txtCaseNum" id="MainContent-txtCaseNum" type="text" readonly="readonly" /></td>
		    </tr>
		    <tr>
			<td style="width: 160px">Property Address</td>
			<td><input name="txtPropertyAddress" id="MainContent-txtPropertyAddress" type="text" readonly="readonly" /></td>
		    </tr>
		    <tr>
			<td style="width: 160px">Responsible Party</td>
			<td><input name="txtRespParty" id="MainContent-txtRespParty" type="text" readonly="readonly" /></td>
		    </tr>
		    <tr>
			<td style="width: 160px">Mailing Address</td>
			<td><input name="txtMailing Address" id="MainContent-txtMailing Address" type="text" readonly="readonly" />
			</td>
		    </tr>
		    <tr>
			<td style="width: 160px">Email</td>
			<td><input name="txtEmail" id="MainContent-txtEmail" type="email" readonly="readonly" />
			</td>
		    </tr>
		    <tr>
			<td style="width: 160px">Applicant Phone</td>
			<td><input name="txtAppPhone" id="MainContent-txtAppPhone" type="tel" readonly="readonly" />
			</td>
		    </tr>
		    <tr>
			<td style="width: 160px">Occupant Dwelling Info</td>
			<td><input name="txtOccDwellInfo" id="MainContent-txtOccDwellInfo" type="text" readonly="readonly" />
			</td>
		    </tr>
		    <tr>
			<td style="width: 160px">Number of Units</td>
			<td><input name="txtNumUnits" id="MainContent-txtNumUnits" type="number" readonly="readonly" />
			</td>
		    </tr>
		    <tr>
			<td style="width: 160px">Owner Name</td>
			<td><input name="txtOwnerName" id="MainContent-txtOwnerName" type="text" readonly="readonly" />
			</td>
		    </tr>
		    <tr>
			<td style="width: 160px">Owner Phone</td>
			<td><input name="txtOwnerPhone" id="MainContent-txtOwnerPhone" type="tel" readonly="readonly" />
			</td>
		    </tr>
		    <tr>
			<td style="width: 160px">Sidewalk Fees</td>
			<td><input name="txtSidewalk" id="MainContent-txtSidewalk" type="text" readonly="readonly" />
			</td>
		    </tr>
		    <tr>
			<td style="width: 160px">Inspector</td>
			<td><input name="txtInspector" id="MainContent-txtInspector" type="text" readonly="readonly" />
			</td>
		    </tr>
		    <tr>
			<td style="width: 160px">Inspector Email</td>
			<td><input name="txtInspectEmail" id="MainContent-txtInspectEmail" type="email" readonly="readonly" />
			</td>
		    </tr>
		    <tr>
			<td style="width: 160px">Inspection Date</td>
			<td><input name="txtInspectDate" id="MainContent-txtInspectDate" type="date" readonly="readonly" />
			</td>
		    </tr>
		    <tr>
			<td style="width: 160px">Re-Inspection Date</td>
			<td><input name="txtReInspectDate" id="MainContent-txtReInspectDate" type="date" readonly="readonly" />
			</td>
		    </tr>
		</tbody>
	    </table>
        <asp:Button ID="btnSave" runat="server" BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" Font-Names="Arial Black" Text="Save" Width="150px" style="margin-left:100px;" OnClick="btnSave_Click"/>
        <asp:Button ID="btnDelete" runat="server" BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" Text="Delete" Width="150px" OnClick="btnDelete_Click" />
        <hr />
        <!-- cmd_InspectionMenu (Rectangle) -->
		    <input name="btnInspectionMenu" id="MainContent_btnInspectionMenu" style="width: 200px;" type="submit" value="Inspection Menu" />
        <!-- cmd_InspectionChecklist (Rectangle) -->
		    <input name="btnInspectionChecklist" id="MainContent_btnInspectionChecklist" style="width: 200px;" type="submit" value="Inspection Checklist" />	
        <!-- cmd_CertificateInspection (Rectangle) -->
		    <input name="btnCertificateInspection" id="MainContent_btnCertificateInspection" style="width: 200px;" type="submit" value="Certificate of Inspection" />
        <!-- cmd_ReinspectionNotice (Rectange) -->
		    <input name="btnReinspectionNotice" id="MainContent_btnReinspectionNotice" style="width: 200px;" type="submit" value="ReinspectionNotice" />
        <!-- cmd_NoticeNonCompliance (Rectangle) -->
		    <input name="btnNoticeNonCompliance" id="MainContent_btnNoticeNonCompliance" style="width: 220px;" type="submit" value="Notice of NonCompliance" />
	    <hr />
    </div>
</asp:Content>
