<%@ Page Title="Inspection Checklist" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InspectionChecklist.aspx.cs" Inherits="COPInspectionChecklistProject.InspectionChecklist" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Previous Page (Rectangle) -->
    <asp:Button ID="btnPreviousPage" runat="server" OnClick="btnPreviousPage_Click" Text="Previous Page" Width="200px" />
    <div class="container">
        <img src="Images/Cop_logo.jpg" alt="City of Pasadena" style="float:right;width:200px;height:200px;" /> 
        <h1 style="font-size:50px;"><b>City of Pasadena</b></h1>
        <h3>Planning and Community Development Department</h3>
        <h3>Building and Safety Division</h3>
    </div>
    <div>
        <hr style="border:double"/>
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
        <hr />
        <h3><b>Inspection Findings</b></h3>
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
                </asp:TableRow>
                <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
                    <asp:TableCell BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="40%">1.1 Floorings, foundations, or floor supports</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
                    <asp:TableCell BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle">Inadequate flooring. Flooring must be free of large cracks, holes, or missing/damaged parts. Members may not be split, lean, list, or buckle due to defective material or deterioration.
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="10%">PMC 14.12.610A-C</asp:TableCell>
                    <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="10%">
                        <asp:CheckBox id="cb11Major" runat="server" Text="Major" TextAlign="Right" Font-Size="Large" />
                        <asp:CheckBox id="cb11Minor" runat="server" Text="Minor" TextAlign="Right" Font-Size="Large" />
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Top" Width="40%"></asp:TableCell>
                </asp:TableRow>
        </asp:Table>     
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

