<%@ Page Title="Inspection Checklist" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InspectionChecklist.aspx.cs" Inherits="COPInspectionChecklistProject.InspectionChecklist" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <b>Housing Inspection Report</b>
    <br />
        <table> 
	    <tr><th colspan="2">General Inspection Information</th></tr>
            <tr><td>Case Number</td><td><asp:TextBox ID="txtCaseNum" runat="server" Width="300px" ></asp:TextBox></td></tr>
		    <tr><td>Property Address</td><td><asp:TextBox ID="txtPropAdd" runat="server" Width="300px"></asp:TextBox></td></tr>
		    <tr><td>Dwelling Info</td><td><asp:TextBox ID="txtDwellInfo" runat="server" Width="300px"></asp:TextBox></tr>
		    <tr><td>Applicant</td><td><asp:TextBox ID="txtApplicant" runat="server" Width="300px"></asp:TextBox></tr>
		    <tr><td>Applicant Phone</td><td><asp:TextBox ID="txtAppPhone" runat="server" Width="300px"></asp:TextBox></tr>
		    <tr><td>Applicant Email</td><td><asp:TextBox ID="txtAppEmail" runat="server" Width="300px"></asp:TextBox></tr>
		    <tr><td>Inspector Name</td><td><asp:TextBox ID="txtInspectName" runat="server" Width="300px"></asp:TextBox></tr>
		    <tr><td>Inspector Email</td><td><asp:TextBox ID="txtInspectEmail" runat="server" Width="300px"></asp:TextBox></tr>
		    <tr><td>Inspection Date</td><td><asp:TextBox ID="txtInspectDate" runat="server" Width="300px"></asp:TextBox></tr>
		    <tr><td>Inspection Type</td><td><asp:TextBox ID="txtInspectType" runat="server" Width="300px"></asp:TextBox></tr>
		    <tr><td>Mailing Address</td><td><asp:TextBox ID="txtMailAdd" runat="server" Width="300px"></asp:TextBox></tr>
		    <tr><td># of Units</td><td><asp:TextBox ID="txtNumUnit" runat="server" Width="300px"></asp:TextBox></tr>
		    <tr><td>Owner Phone</td><td><asp:TextBox ID="txtOwnerPhone" runat="server" Width="300px"></asp:TextBox></tr>
		    <tr><td>Sidewalk Fee</td><td><asp:TextBox ID="txtSidewalk" runat="server" Width="300px"></asp:TextBox></tr>
        </table>
    <br />
    <fieldset style="width: 80%;border:solid">
        This inspection should not be relied on as conclusive proof that the property meets all local and state codes.  Illegal conditions may have
        been missed during this inspection. The failure of an inspection to have uncovered the illegal condition(s) does not render the illegal 
        condition(s) as legal or permitted. The City of Pasadena has the right to reinspect this property to ensure compliance with the local and
        state codes if needed. Lastly, this inspection does not satisfy any private party disclosure requirements mandated by local, state, and federal
        law applying to the property.
    </fieldset>
<br />
      <table>
            <tr>
                <td><asp:Button ID="btnMainMenu" runat="server" Text="Main Menu" PostBackUrl="~/MainMenu.aspx" Height="38px" Width="250px"/></td>
            </tr>          
        </table>
</asp:Content>

<%--        <h3><b>Inspection Findings</b></h3>
        <asp:CheckBox ID="cBMajor" runat="server" Text="THIS INSPECTION REVEALED MAJOR VIOLATIONS - SEE BELOW" Font-Names="Arial Black" TextAlign="Left" OnCheckedChanged="cBMajor_CheckedChanged" />
        <br />
        <asp:CheckBox ID="cBMinor" runat="server" Text="THIS INSPECTION REVEALED MINOR VIOLATIONS - SEE BELOW" Font-Names="Arial Black" TextAlign="Left" OnCheckedChanged="cbMinor_CheckedChanged" />
        <br />
        <asp:CheckBox ID="cBNoMajor" runat="server" Text="THIS INSPECTION REVEALED NO MAJOR VIOLATIONS" Font-Names="Arial Black" TextAlign="Left" OnCheckedChanged="cBNoMajor_CheckedChanged" />
        <br />
        <asp:CheckBox ID="cBNoMinor" runat="server" Text="THIS INSPECTION REVEALED NO MINOR VIOLATIONS" Font-Names="Arial Black" TextAlign="Left" OnCheckedChanged="cBNoMinor_CheckedChanged"/>
        <br />
        <asp:CheckBox ID="cBNoViolations" runat="server" Text="NO VIOLATIONS WERE OBSERVED" Font-Names="Arial Black" TextAlign="Left" OnCheckedChanged="cbNoViolations_CheckedChanged" />
        <hr />
        <h3><b>Inspection Details</b></h3>
 
        <asp:Table ID="InspectionDetails" runat="server" Width="969px" BorderStyle="Solid" BorderWidth="5px" CellPadding="1" CellSpacing="1" HorizontalAlign="Left">
            <asp:TableHeaderRow BorderStyle="Solid" HorizontalAlign="Center" VerticalAlign="Middle" ID="headin1">
                <asp:TableHeaderCell BorderStyle="Inset" VerticalAlign="Middle">Inspection Description</asp:TableHeaderCell>
                <asp:TableHeaderCell HorizontalAlign="Center" BorderStyle="Inset" VerticalAlign="Middle">Section</asp:TableHeaderCell>
                <asp:TableHeaderCell HorizontalAlign="Center" BorderStyle="Inset" VerticalAlign="Middle">Status</asp:TableHeaderCell>
                <asp:TableHeaderCell HorizontalAlign="Left" BorderStyle="Inset" VerticalAlign="Middle">Comments/Notes</asp:TableHeaderCell>
            </asp:TableHeaderRow>
                <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
                    <asp:TableCell HorizontalAlign="Left" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" VerticalAlign="Middle" Width="40%">1.0 Building &amp; Structure</asp:TableCell>
                    <asp:TableCell />
                    <asp:TableCell />
                    <asp:TableCell />
                </asp:TableRow>
                <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
                    <asp:TableCell BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="40%">1.1 Floorings, foundations, or floor supports</asp:TableCell>
                    <asp:TableCell />
                    <asp:TableCell />
                    <asp:TableCell />
                </asp:TableRow>
                <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
                    <asp:TableCell BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle">Inadequate flooring. Flooring must be free of large cracks, holes, or missing/damaged parts. Members may not be split, lean, list, or buckle due to defective material or deterioration.
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="10%" Font-Bold="true">PMC 14.12.610A-C</asp:TableCell>
                    <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Middle" Width="10%">
                        <asp:CheckBox id="cb11Major" runat="server" Text="Major" TextAlign="Left" Font-Size="Large" />
                        <asp:CheckBox id="cb11Minor" runat="server" Text="Minor" TextAlign="Left" Font-Size="Large" />
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Top" Width="40%"></asp:TableCell>
                </asp:TableRow>
        </asp:Table>     
    </div>--%>