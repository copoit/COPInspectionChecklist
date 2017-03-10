<%@ Page Title="Case Main" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CaseMain.aspx.cs" Inherits="COPInspectionChecklistProject.CaseMain" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--This page displays information that was called for and retrieved from the database. Data is loaded per request
    by a Case Number from CaseList page or InspectionMain page--%>
    
    <div>
	    <div>
           <b>Case Main</b>
             <br />
            <br />
	    </div>
	    <table >
		<tbody>
		    <tr>
			<td style="width: 160px">Case Number</td>
			<td><asp:TextBox ID="txtCaseNum" runat="server" Width="300px"></asp:TextBox></td>
		    </tr>
		    <tr>
			<td style="width: 160px">Property Address</td>
			<td><asp:TextBox ID="txtPropAdd" runat="server" Width="300px"></asp:TextBox></td>
		    </tr>
		    <tr>
			<td style="width: 160px">Responsible Party</td>
			<td><asp:TextBox ID="txtRespParty" runat="server" Width="300px"></asp:TextBox></td>
		    </tr>
		    <tr>
			<td style="width: 160px">Mailing Address</td>
			<td><asp:TextBox ID="txtMailAdd" runat="server" Width="300px"></asp:TextBox></td>
		    </tr>
		    <tr>
			<td style="width: 160px">Email</td>
			<td> <asp:TextBox ID="txtEmail" runat="server" Width="300px"></asp:TextBox></td>
		    </tr>
		    <tr>
			<td style="width: 160px">Applicant Phone</td>
			<td> <asp:TextBox ID="txtAppPhone" runat="server" Width="300px"></asp:TextBox></td>
		    </tr>
		    <tr>
			<td style="width: 160px">Occupant Dwelling Info</td>
			<td><asp:TextBox ID="txtOccDwell" runat="server" Width="300px"></asp:TextBox></td>
		    </tr>
		    <tr>
			<td style="width: 160px">Number of Units</td>
			<td><asp:TextBox ID="txtNumUnits" runat="server" Width="300px"></asp:TextBox></td>
		    </tr>
		    <tr>
			<td style="width: 160px">Owner Name</td>
			<td> <asp:TextBox ID="txtOwnerName" runat="server" Width="300px"></asp:TextBox></td>
		    </tr>
		    <tr>
			<td style="width: 160px">Owner Phone</td>
			<td><asp:TextBox ID="txtOwnerPhone" runat="server" Width="300px"></asp:TextBox></td>
		    </tr>
		    <tr>
			<td style="width: 160px">Sidewalk Fees</td>
			<td><asp:TextBox ID="txtSidewalk" runat="server" Width="300px"></asp:TextBox></td>
		    </tr>
		    <tr>
			<td style="width: 160px">Inspector</td>
			<td><asp:TextBox ID="txtInspector" runat="server" Width="300px"></asp:TextBox></td>
		    </tr>
		    <tr>
			<td style="width: 160px">Inspector Email</td>
			<td><asp:TextBox ID="txtInspectEmail" runat="server" Width="300px"></asp:TextBox></td>
		    </tr>
		    <tr>
			<td style="width: 160px; height: 24px;">Inspection Date</td>
			<td><asp:TextBox ID="txtInspectDate" runat="server" Width="300px"></asp:TextBox></td>
		    </tr>
		    <tr>
			<td style="width: 160px">Re-Inspection Date</td>
			<td><asp:TextBox ID="txtReinspectDate" runat="server" Width="300px"></asp:TextBox></td>
		    </tr>
		</tbody>
	    </table>
        <br />
        
  <%--      <div>
        <!-- Save (Rectangle) -->
        <asp:Button ID="btnSave" runat="server" BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" Font-Names="Arial Black" Text="Save" Width="150px" style="margin-left:75px;" OnClick="btnSave_Click"/>
        <!-- Delete (Rectangle) -->
        <asp:Button ID="btnDelete" runat="server" BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" Font-Names="Arial Black" Text="Delete" Width="150px" style="margin-left:50px;" OnClick="btnDelete_Click" />
        <hr />
        </div>--%>
        <div>
        <!-- InspectionChecklist (Rectangle) -->
            <asp:Button ID="btnInspectionChecklist" runat="server" OnClick="btnInspectionChecklist_Click" Text="Inspection Checklist" Height="38px" Width="250px" PostBackUrl="~/InspectionChecklist.aspx" />
        <!-- CertificateInspection (Rectangle) -->
            <asp:Button ID="btnCertificateInspection" runat="server" OnClick="btnCertificateInspection_Click" Text="Certificate of Inspection" Height="38px" Width="250px" PostBackUrl="~/CertInspection.aspx" />
        <!-- ReinspectionNotice (Rectange) -->
            <br />
            <br />
		    <asp:Button ID="btnReinspectionNotice" runat="server" OnClick="btnReinspectionNotice_Click" Text="Reinspection Notice" Height="38px" Width="250px" PostBackUrl="~/ReinspectNotice.aspx" />
            <asp:Button ID="btnNoticeNonCompliance" runat="server" OnClick="btnNoticeNonCompliance_Click" Text="Notice of NonCompliance" Height="38px" Width="250px" />            
            <br />
            <br />  
            <asp:Button ID="InspectionMain" runat="server" OnClick="btnInspectionMain_Click" Text="Inspection Main" Height="38px" Width="250px" />
           </div>
	    <hr />
    </div>
</asp:Content>
