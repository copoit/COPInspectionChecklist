<%@ Page Title="Inspection Checklist" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InspectionChecklist.aspx.cs" Inherits="COPInspectionChecklistProject.InspectionChecklist" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="Inspection Report">
        <h2><b>Housing Inspection Report</b></h2>
        <asp:Table ID="HousingInspectionReport" runat="server" Width="960px" BorderStyle="Solid" BorderWidth="5px" CellPadding="1" CellSpacing="1" HorizontalAlign="Left">
            <asp:TableHeaderRow BorderStyle="Solid" VerticalAlign="Middle" ID="heading2">
                <asp:TableHeaderCell BorderStyle="Inset" VerticalAlign="Middle" ColumnSpan="2" ><b>General Inspection Information</b></asp:TableHeaderCell>
            </asp:TableHeaderRow>
            <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" >Case Number:</asp:TableCell>
                <asp:TableCell><asp:TextBox ID="txtCaseNum" runat="server" Width="100%"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" >Property Address:</asp:TableCell>
                <asp:TableCell><asp:TextBox ID="txtPropAdd" runat="server" Width="100%" ></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" >Dwelling INfo:</asp:TableCell>
                <asp:TableCell><asp:TextBox ID="txtDwellInfo" runat="server" Width="100%" ></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" >Applicant Name:</asp:TableCell>
                <asp:TableCell><asp:TextBox ID="txtApplicant" runat="server" Width="100%" ></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" >Applicant Phone:</asp:TableCell>
                <asp:TableCell><asp:TextBox ID="txtAppPhone" runat="server" Width="100%" ></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" >Applicant Email:</asp:TableCell>
                <asp:TableCell><asp:TextBox ID="txtAppEmail" runat="server" Width="100%" ></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" >Inspector Name:</asp:TableCell>
                <asp:TableCell><asp:TextBox ID="txtInspectName" runat="server" Width="100%" ></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" >Inspector Email:</asp:TableCell>
                <asp:TableCell><asp:TextBox ID="txtInspectEmail" runat="server" Width="100%" ></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" >Inspection Date:</asp:TableCell>
                <asp:TableCell><asp:TextBox ID="txtInspectDate" runat="server" Width="100%" ></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" >Inspection Type:</asp:TableCell>
                <asp:TableCell><asp:TextBox ID="txtInspectType" runat="server" Width="100%" ></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" >Mailing Address:</asp:TableCell>
                <asp:TableCell><asp:TextBox ID="txtMailAdd" runat="server" Width="100%" ></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" >Number of Units:</asp:TableCell>
                <asp:TableCell><asp:TextBox ID="txtNumUnit" runat="server" Width="100%" ></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" >Owner Phone:</asp:TableCell>
                <asp:TableCell><asp:TextBox ID="txtOwnerPhone" runat="server" Width="100%" ></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" >Sidewalk Fees:</asp:TableCell>
                <asp:TableCell><asp:TextBox ID="txtSidewalk" runat="server" Width="100%" ></asp:TextBox></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
    <fieldset style="padding:15px; width:960px; border: solid" >
        This inspection should not be relied on as conclusive proof that the property meets all local and state codes.  Illegal conditions may have
        been missed during this inspection. The failure of an inspection to have uncovered the illegal condition(s) does not render the illegal 
        condition(s) as legal or permitted. The City of Pasadena has the right to reinspect this property to ensure compliance with the local and
        state codes if needed. Lastly, this inspection does not satisfy any private party disclosure requirements mandated by local, state, and federal
        law applying to the property.
    </fieldset>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <h2><b>Inspection Findings</b></h2>
            <asp:CheckBox ID="cBMajor" runat="server" Style="padding-left:20px;" Text="THIS INSPECTION REVEALED MAJOR VIOLATIONS - SEE BELOW" Font-Names="Arial Black" TextAlign="Left" OnCheckedChanged="cBMajor_CheckedChanged" AutoPostBack="true" />
            <br />
            <asp:CheckBox ID="cBMinor" runat="server"  Style="padding-left:20px;" Text="THIS INSPECTION REVEALED MINOR VIOLATIONS - SEE BELOW" Font-Names="Arial Black" TextAlign="Left" OnCheckedChanged="cBMinor_CheckedChanged" AutoPostBack="true" />
            <br />  
            <asp:CheckBox ID="cBNoMajor" runat="server"  Style="padding-left:20px;" Text="THIS INSPECTION REVEALED NO MAJOR VIOLATIONS" Font-Names="Arial Black" TextAlign="Left" OnCheckedChanged="cBNoMajor_CheckedChanged" AutoPostBack="true" />
            <br />
            <asp:CheckBox ID="cBNoMinor" runat="server"  Style="padding-left:20px;" Text="THIS INSPECTION REVEALED NO MINOR VIOLATIONS" Font-Names="Arial Black" TextAlign="Left" OnCheckedChanged="cBNoMinor_CheckedChanged" AutoPostBack="true" />
            <br />
            <asp:CheckBox ID="cBNoViolations" runat="server"  Style="padding-left:20px;" Text="NO VIOLATIONS WERE OBSERVED" Font-Names="Arial Black" TextAlign="Left" OnCheckedChanged="cBNoViolations_CheckedChanged" AutoPostBack="true" Checked="True" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="Inspection Details">
    <h2><b>Inspection Details</b></h2>
    <asp:Table ID="InspectionDetails" runat="server" Width="960px" BorderStyle="Solid" BorderWidth="5px" CellPadding="1" CellSpacing="1" HorizontalAlign="Left">
        <asp:TableHeaderRow BorderStyle="Solid" VerticalAlign="Middle" ID="headin1">
            <asp:TableHeaderCell BorderStyle="Inset" VerticalAlign="Middle" >Inspection Details</asp:TableHeaderCell>
            <asp:TableHeaderCell BorderStyle="Inset" VerticalAlign="Middle" >Section</asp:TableHeaderCell>
            <asp:TableHeaderCell HorizontalAlign="Center" BorderStyle="Inset" VerticalAlign="Middle">Major</asp:TableHeaderCell>
            <asp:TableHeaderCell HorizontalAlign="Center" BorderStyle="Inset" VerticalAlign="Middle">Minor</asp:TableHeaderCell>
        </asp:TableHeaderRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" Font-Underline="true" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" ><u>1.0 Building and Structure</u></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%"/>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >1.1 Floorings, foundations, or floor supports</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%"/>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Inadequate flooring. Flooring must be free of large cracks, holes, or missing/damaged parts. Members may not be split, lean, list, or buckle due to defective material or deterioration.</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.610 A-C</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >1.2 Condition of vertical supports</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%"/>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Inadequate vertical supports. Structural members are insufficient to carry imposed loads.</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.610 D-E</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
            <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >1.3 Condition of ceiling joists</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%"/>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Inadequate/sagging joists.</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.610 F-G</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >1.4 Condition of fireplaces or chimneys</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%"/>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Loose bricks/missing mortar observed at firebox.</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.610 H-I</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Loose bricks/missing mortar observed at exterior chimney.</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.610 H-I</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
            <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >1.5 Inadequate room dimension</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%"/>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Habitable room does not meet minimum size requirements - 7' min width</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.380</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Habitable room does not meet minimum height requirement of 7'6".</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.360</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >1.6 Illegal addition, construction, alteration, repair, conversion or demolition</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%"/>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Attic: The attic has been converted to livable space without obtaining necessary approvals and permits</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.320</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Bathroom: One or more bathrooms have been added to the structure without obtaining necessary permits</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.320</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Attic: The attic has been converted to livable space without obtaining necessary approvals and permits</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.320</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Copper repipe: One or more bathrooms have been added to the structure without obtaining necessary permits</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.320</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Deck: The attic has been converted to livable space without obtaining necessary approvals and permits</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.320</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Electrical: One or more bathrooms have been added to the structure without obtaining necessary permits</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.320</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
            <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Fencing: One or more bathrooms have been added to the structure without obtaining necessary permits</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.320</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Garage: The attic has been converted to livable space without obtaining necessary approvals and permits</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.320</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Heater: One or more bathrooms have been added to the structure without obtaining necessary permits</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.320</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >HVAC: The attic has been converted to livable space without obtaining necessary approvals and permits</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.320</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Illegal Unit: One or more bathrooms have been added to the structure without obtaining necessary permits</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.320</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
            <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Laundry: One or more bathrooms have been added to the structure without obtaining necessary permits</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.320</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Porch Enclosure: The attic has been converted to livable space without obtaining necessary approvals and permits</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.320</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Patio Enclosure: One or more bathrooms have been added to the structure without obtaining necessary permits</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.320</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Patio: The attic has been converted to livable space without obtaining necessary approvals and permits</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.320</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Recessed Lighting: One or more bathrooms have been added to the structure without obtaining necessary permits</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.320</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
            <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Re-roof: One or more bathrooms have been added to the structure without obtaining necessary permits</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.320</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Plumbing: The attic has been converted to livable space without obtaining necessary approvals and permits</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.320</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Walls: One or more bathrooms have been added to the structure without obtaining necessary permits</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.320</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Water Heater: The attic has been converted to livable space without obtaining necessary approvals and permits</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.320</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Windows: One or more bathrooms have been added to the structure without obtaining necessary permits</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.320</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" ><b>The following permits have expired or do not have final approval:</b></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%"/>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Building Permit: BLD</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.320</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Building Permit: BMN</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.320</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Electrical Permit: ELE</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.320</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Fence Permit: ZON</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.320</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Roofing Permit: BMN</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.320</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Mechanical Permit: MEC</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.320</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Plumbing Permit: PLM</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.320</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell Style="padding-left:50px;" Width="80%" >For more information on how to obtain a new permit or reactivate the exiting permit, contact the Building Division at (626) 744-4200 or visit the Permit Center - 175 N Garfield Ave.</asp:TableCell>
            <asp:TableCell />
            <asp:TableCell />
            <asp:TableCell />
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >1.7 Owner responsible for inspection</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.16.100</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >No access into:</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Garage</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Shed</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Bedroom(s)</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Other room:</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" Font-Underline="true" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" ><u>2.0 WEATHER PROTECTION</u></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%"/>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >2.1 Building must provide protection from the elements and dampness</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%"/>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Damaged Siding</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.660</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Broken/cracked plaster</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.660</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >2.2 Condition of exterior and/or interior walls or roof coverings</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%"/>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Broken windows</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.660</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Paint finish is chipped/peeling at:</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.660</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:100px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Walls</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.660</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:100px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Eaves</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.660</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:100px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Window frames</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.660</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >2.3 Condition of weather protection</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%"/>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Faulty weather protection</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.660</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Inadequate roof covering</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.660 B</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow BorderStyle="Solid" HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Missing exterior outlet cover plates</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.630</asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    </div>
    <br />
    <div contextmenu="buttons" >
        <asp:Button ID="btnSave" runat="server" BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" Font-Names="Arial Black" Text="Save" Width="150px" Style="margin-left: 75px;" OnClick="btnSave_Click" />
        <asp:Button ID="btnDelete" runat="server" BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" Font-Names="Arial Black" Text="Delete" Width="150px" Style="margin-left: 50px;" OnClick="btnDelete_Click" />
        <br />
        <br />
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <asp:Button ID="btnCaseMain" runat="server" OnClick="btnCaseMain_Click" Text="Case Main" Height="38px" Width="250px" Visible="true" />
                     <asp:Button ID="btnEmailInspectionDeficencies" runat="server" OnClick="btnEmailInspectionDeficencies_Click" Text="Email Inspection Deficencies" Height="38px" Width="250px" Visible="false" />
		    <asp:Button ID="btnCertificateInspection" runat="server" OnClick="btnCertificateInspection_Click" Text="Certificate of Inspection" Height="38px" Width="250px" Visible="false" />
		        <asp:Button ID="btnReinspectionNotice" runat="server" OnClick="btnReinspectionNotice_Click" Text="Reinspection Notice" Height="38px" Width="250px" Visible="false" />
                <asp:Button ID="btnNoticeNonCompliance" runat="server" OnClick="btnNoticeNonCompliance_Click" Text="Notice of NonCompliance" Height="38px" Width="250px" Visible="false" />            
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
    </div>
</asp:Content>
