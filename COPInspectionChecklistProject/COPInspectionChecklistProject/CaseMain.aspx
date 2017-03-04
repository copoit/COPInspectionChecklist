<%@ Page Title="Case Main" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CaseMain.aspx.cs" Inherits="COPInspectionChecklistProject.CaseMain" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--This page displays information that was called for and retrieved from the database. Data is loaded per request
    by a Case Number from CaseList page or InspectionMain page--%>
    <div class="container">
        <img src="Images/Cop_logo.jpg" alt="City of Pasadena" style="float:left;width:200px;height:200px;" /> 
        <h1 style="font-size:50px;"><b>City of Pasadena
            </b></h1>
        <h3>Planning and Community Development Department</h3>
        <h3>Building and Safety Division</h3>
<%--    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CoPOITConnectionString %>" SelectCommand="SELECT * FROM [CASE_ACTION]"></asp:SqlDataSource>--%>
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
        <!-- Save (Rectangle) -->
        <asp:Button ID="btnSave" runat="server" BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" Font-Names="Arial Black" Text="Save" Width="150px" style="margin-left:100px;" OnClick="btnSave_Click"/>
        <!-- Delete (Rectangle) -->
        <asp:Button ID="btnDelete" runat="server" BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" Text="Delete" Width="150px" OnClick="btnDelete_Click" />
        <hr />
        <div>
        <!-- InspectionChecklist (Rectangle) -->
            <asp:Button ID="btnInspectionChecklist" runat="server" OnClick="btnInspectionChecklist_Click" Text="Inspection Checklist" Width="200px" />
        <!-- CertificateInspection (Rectangle) -->
            <asp:Button ID="btnCertificateInspection" runat="server" OnClick="btnCertificateInspection_Click" Text="Certificate of Inspection" Width="200px" />
        <!-- ReinspectionNotice (Rectange) -->
		    <asp:Button ID="btnReinspectionNotice" runat="server" OnClick="btnReinspectionNotice_Click" Text="Reinspection Notice" Width="200px" />
        <!-- NoticeNonCompliance (Rectangle) -->
            <asp:Button ID="btnNoticeNonCompliance" runat="server" OnClick="btnNoticeNonCompliance_Click" Text="Notice of NonCompliance" Width="200px" />
        </div>
	    <hr />
    </div>
</asp:Content>
