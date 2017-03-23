<%@ Page Title="Inspection Checklist" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InspectionChecklist.aspx.cs" Inherits="COPInspectionChecklistProject.InspectionChecklist" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <b>Housing Inspection Report</b>
    <div class="Inspection Report">
        <asp:Table ID="HousingInspectionReport" runat="server">
            <asp:TableHeaderRow VerticalAlign="Middle" ID="heading2">
                <asp:TableHeaderCell ColumnSpan="2"><b>General Inspection Information</b></asp:TableHeaderCell>
            </asp:TableHeaderRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell>Case Number:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCaseNum" runat="server" Width="100%"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell >Property Address:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtPropAdd" runat="server" Width="100%"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell >Dwelling Info:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtDwellInfo" runat="server" Width="100%"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell >Applicant Name:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtApplicant" runat="server" Width="100%"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell >Applicant Phone:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAppPhone" runat="server" Width="100%"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell >Applicant Email:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAppEmail" runat="server" Width="100%"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell >Inspector Name:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtInspectName" runat="server" Width="100%"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell >Inspector Email:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtInspectEmail" runat="server" Width="100%"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell >Inspection Date:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtInspectDate" runat="server" Width="100%"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell >Inspection Type:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtInspectType" runat="server" Width="100%"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell >Mailing Address:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtMailAdd" runat="server" Width="100%"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell >Number of Units:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtNumUnit" runat="server" Width="100%"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell >Owner Phone:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtOwnerPhone" runat="server" Width="100%"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell >Sidewalk Fees:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtSidewalk" runat="server" Width="100%"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
    <div class="InspectionBreakdown">
        <asp:Table ID="NoticeTable1" runat="server">
            <asp:TableRow runat="server">
                <asp:TableCell Style="padding-left: 20px;" >This inspection should not be relied on as conclusive proof that the property meets all local and state codes.  Illegal conditions may have
                    been missed during this inspection. The failure of an inspection to have uncovered the illegal condition(s) does not render the illegal 
                    condition(s) as legal or permitted. The City of Pasadena has the right to reinspect this property to ensure compliance with the local and
                    state codes if needed. Lastly, this inspection does not satisfy any private party disclosure requirements mandated by local, state, and federal
                    law applying to the property.
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
    <div class="ViolationsUpdate">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Table ID="InspectionFindingsTable" runat="server">
                    <asp:TableHeaderRow VerticalAlign="Middle" ID="headin2">
                        <asp:TableHeaderCell VerticalAlign="Middle">Inspection Findings</asp:TableHeaderCell>
                        <asp:TableHeaderCell></asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                    <asp:TableRow VerticalAlign="Middle">
                        <asp:TableCell HorizontalAlign="Left" VerticalAlign="Middle" Width="50%">THIS INSPECTION REVEALED MAJOR VIOLATIONS - SEE BELOW</asp:TableCell>
                        <asp:TableCell>
                            <asp:CheckBox ID="cBMajor" runat="server" Style="padding-left: 30px;" Text="" Font-Names="Arial Black" TextAlign="Right" OnCheckedChanged="cBMajor_CheckedChanged" AutoPostBack="true" Enabled="False" /></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow VerticalAlign="Middle">
                        <asp:TableCell HorizontalAlign="Left" VerticalAlign="Middle" Width="50%">THIS INSPECTION REVEALED MINOR VIOLATIONS - SEE BELOW</asp:TableCell>
                        <asp:TableCell>
                            <asp:CheckBox ID="cBMinor" runat="server" Style="padding-left: 30px;" Text="" Font-Names="Arial Black" TextAlign="Right" OnCheckedChanged="cBMinor_CheckedChanged" AutoPostBack="true" Enabled="False" /></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow VerticalAlign="Middle">
                        <asp:TableCell HorizontalAlign="Left" VerticalAlign="Middle" Width="50%">THIS INSPECTION REVEALED NO MAJOR VIOLATIONS</asp:TableCell>
                        <asp:TableCell>
                            <asp:CheckBox ID="cBNoMajor" runat="server" Style="padding-left: 30px;" Text="" Font-Names="Arial Black" TextAlign="Right" OnCheckedChanged="cBNoMajor_CheckedChanged" AutoPostBack="true" Enabled="False" /></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow VerticalAlign="Middle">
                        <asp:TableCell HorizontalAlign="Left" VerticalAlign="Middle" Width="50%">THIS INSPECTION REVEALED NO MINOR VIOLATIONS</asp:TableCell>
                        <asp:TableCell>
                            <asp:CheckBox ID="cBNoMinor" runat="server" Style="padding-left: 30px;" Text="" Font-Names="Arial Black" TextAlign="Right" OnCheckedChanged="cBNoMinor_CheckedChanged" AutoPostBack="true" Enabled="False" /></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow VerticalAlign="Middle">
                        <asp:TableCell HorizontalAlign="Left" VerticalAlign="Middle" Width="50%">NO VIOLATIONS WERE OBSERVED</asp:TableCell>
                        <asp:TableCell>
                            <asp:CheckBox ID="cBNoViolations" runat="server" Style="padding-left: 30px;" Text="" Font-Names="Arial Black" TextAlign="Right" OnCheckedChanged="cBNoViolations_CheckedChanged" AutoPostBack="true" Enabled="False" /></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <%--   <div class="Inspection Details">
        <asp:Table ID="InspectionDetails" runat="server" Width="960px" " BorderWidth="3px" CellPadding="1" CellSpacing="1" HorizontalAlign="Left" BorderColor="Black">
            <asp:TableHeaderRow " VerticalAlign="Middle" ID="headin1">
                <asp:TableHeaderCell BorderStyle="Inset" VerticalAlign="Middle">Inspection Details</asp:TableHeaderCell>
                <asp:TableHeaderCell BorderStyle="Inset" VerticalAlign="Middle">Section</asp:TableHeaderCell>
                <asp:TableHeaderCell HorizontalAlign="Center" BorderStyle="Inset" VerticalAlign="Middle">Major</asp:TableHeaderCell>
                <asp:TableHeaderCell HorizontalAlign="Center" BorderStyle="Inset" VerticalAlign="Middle">Minor</asp:TableHeaderCell>
            </asp:TableHeaderRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell " BorderWidth="2px" Font-Bold="True" Font-Underline="true" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%"><u>1.0 Building and Structure</u></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" />
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">1.1 Floorings, foundations, or floor supports</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" />
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Inadequate flooring. Flooring must be free of large cracks, holes, or missing/damaged parts. Members may not be split, lean, list, or buckle due to defective material or deterioration.</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.610 A-C</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">1.2 Condition of vertical supports</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" />
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Inadequate vertical supports. Structural members are insufficient to carry imposed loads.</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.610 D-E</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">1.3 Condition of ceiling joists</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" />
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Inadequate/sagging joists.</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.610 F-G</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">1.4 Condition of fireplaces or chimneys</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" />
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Loose bricks/missing mortar observed at firebox.</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.610 H-I</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Loose bricks/missing mortar observed at exterior chimney.</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.610 H-I</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">1.5 Inadequate room dimension</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" />
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Habitable room does not meet minimum size requirements - 7' min width</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.380</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Habitable room does not meet minimum height requirement of 7'6".</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.360</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">1.6 Illegal addition, construction, alteration, repair, conversion or demolition</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" />
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Attic: The attic has been converted to livable space without obtaining necessary approvals and permits</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.320</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Bathroom: One or more bathrooms have been added to the structure without obtaining necessary permits</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.320</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Attic: The attic has been converted to livable space without obtaining necessary approvals and permits</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.320</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Copper repipe: One or more bathrooms have been added to the structure without obtaining necessary permits</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.320</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Deck: The attic has been converted to livable space without obtaining necessary approvals and permits</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.320</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Electrical: One or more bathrooms have been added to the structure without obtaining necessary permits</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.320</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Fencing: One or more bathrooms have been added to the structure without obtaining necessary permits</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.320</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Garage: The attic has been converted to livable space without obtaining necessary approvals and permits</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.320</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Heater: One or more bathrooms have been added to the structure without obtaining necessary permits</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.320</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">HVAC: The attic has been converted to livable space without obtaining necessary approvals and permits</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.320</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Illegal Unit: One or more bathrooms have been added to the structure without obtaining necessary permits</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.320</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Laundry: One or more bathrooms have been added to the structure without obtaining necessary permits</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.320</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Porch Enclosure: The attic has been converted to livable space without obtaining necessary approvals and permits</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.320</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Patio Enclosure: One or more bathrooms have been added to the structure without obtaining necessary permits</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.320</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Patio: The attic has been converted to livable space without obtaining necessary approvals and permits</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.320</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Recessed Lighting: One or more bathrooms have been added to the structure without obtaining necessary permits</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.320</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Re-roof: One or more bathrooms have been added to the structure without obtaining necessary permits</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.320</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Plumbing: The attic has been converted to livable space without obtaining necessary approvals and permits</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.320</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Walls: One or more bathrooms have been added to the structure without obtaining necessary permits</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.320</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Water Heater: The attic has been converted to livable space without obtaining necessary approvals and permits</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.320</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Windows: One or more bathrooms have been added to the structure without obtaining necessary permits</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.320</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%"><b>The following permits have expired or do not have final approval:</b></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" />
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Building Permit: BLD</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.320</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Building Permit: BMN</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.320</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Electrical Permit: ELE</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.320</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Fence Permit: ZON</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.320</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Roofing Permit: BMN</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.320</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Mechanical Permit: MEC</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.320</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Plumbing Permit: PLM</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.320</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell Style="padding-left: 50px;" Width="80%" Font-Italic="True">For more information on how to obtain a new permit or reactivate the exiting permit, contact the Building Division at (626) 744-4200 or visit the Permit Center - 175 N Garfield Ave.</asp:TableCell>
                <asp:TableCell />
                <asp:TableCell />
                <asp:TableCell />
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">1.7 Owner responsible for inspection</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.16.100</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">No access into:</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Garage</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Shed</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Bedroom(s)</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Other room:</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell " BorderWidth="2px" Font-Bold="True" Font-Underline="true" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%"><u>2.0 WEATHER PROTECTION</u></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" />
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">2.1 Building must provide protection from the elements and dampness</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" />
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Damaged Siding</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.660</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Broken/cracked plaster</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.660</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">2.2 Condition of exterior and/or interior walls or roof coverings</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" />
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Broken windows</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.660</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Paint finish is chipped/peeling at:</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.660</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 100px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Walls</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.660</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 100px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Eaves</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.660</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 100px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Window frames</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.660</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">2.3 Condition of weather protection</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" />
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Faulty weather protection</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.660</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Inadequate roof covering</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.660 B</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">Missing exterior outlet cover plates</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true">PMC 14.12.630</asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></asp:TableCell>
            </asp:TableRow>
                <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell " BorderWidth="2px" Font-Bold="True" Font-Underline="true" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" ><u>3.0  FIRE DETECTION , PROTECTION, EXITS AND SAFETY </u></asp:TableCell>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%"/>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
                <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >3.1 Self-closing door between garage and dwelling</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Not fire rated</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.720</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Not self-closing</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.720</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Holes in fire wall</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.720</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Door into bedroom</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.720</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >3.2 Quick release mechanism on windows and doors</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Windows do not open</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.710 B</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Double keyed deadbolt</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.710 B</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >No quick release mechanism on window bars</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.710 B</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Inadequate egress</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.710 B</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >3.3 Fire detection</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >No carbon monoxide detectors</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.580</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >No smoke detectors</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.580</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Smoke detector battery missing</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.580</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >3.4 Interior and exterior stairway</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >No hand railing – exterior staircase</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.530</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Loose hand railing</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.530</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Steps loose or damaged</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.530</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Rise/run improper</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.530</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >3.5 Combustible Material</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Excessive accumulation of combustible material</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.670</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >3.6 Exit Doors</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Double keyed deadbolt</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.710 B</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Inadequate egress</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.710 B</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell " BorderWidth="2px" Font-Bold="True" Font-Underline="true" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" ><u>4.0 NATURAL LIGHT AND VENTILATION</u></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >4.1 Natural light and ventilation</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.390</asp:TableCell> 
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >4.2 Mechanical Ventilation</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Inoperable bathroom ventilation fan</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.450</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >No bath vent</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.450</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Inoperable kitchen vent fan/hood </asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.450</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell " BorderWidth="2px" Font-Bold="True" Font-Underline="true" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" ><u>5.0 ELECTRICAL</u></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >5.1 Unsafe electrical/over fusing</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Exposed wires</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.630</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Missing knock out cover plates at electrical panel</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.630</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >5.2 Hazardous wiring</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Electrical equipment </asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.630</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Inoperable kitchen vent fan/hood </asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.630</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >5.3 Ground fault circuit interrupter required after 1975</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Bad GFCI </asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.630</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >No GFCI </asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.631</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >5.4 Missing electrical and outlet switch cover plates</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Location(s): hall closet</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.670</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell " BorderWidth="2px" Font-Bold="True" Font-Underline="true" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" ><u>6.0 HEATING AND MECHANICAL</u></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >6.1 Heating facility in dwelling</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >No heating</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.540</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Hazardous mechanical equipment</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.650</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >6.2 Venting system required</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Improper venting</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.560</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Inadequate clearance</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.560</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Vent disconnected </asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.560</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:80px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Furnace </asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.560</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:80px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Water heater </asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.560</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >6.3 Combustion air supply</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Inadequate at furnace </asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.650</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Inadequate at water heater</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.650</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >6.4 Gas shutoff valve</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >No shutoff</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.650</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell " BorderWidth="2px" Font-Bold="True" Font-Underline="true" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" ><u>7.0 PLUMBING</u></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >7.1 Condition of sewer drains, water pipes or faucets</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%"/>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Corrosion, leaks</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.640</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Bad disposal</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.640</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >Loose toilet</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.640</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow " HorizontalAlign="Left" VerticalAlign="Top">
            <asp:TableCell Style="padding-left:20px;" " BorderWidth="2px" HorizontalAlign="Left" VerticalAlign="Middle" Width="60%" >No P-trap and laundry drain pipe</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" Font-Bold="true" >PMC 14.12.640</asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
            <asp:TableCell " BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" ></asp:TableCell>
        </asp:TableRow>
        </asp:Table>
    </div>--%>
    <div class="InspectionGrid">
        <b>Inspection Details</b>
        <asp:GridView ID="InspectionGrid" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AutoGenerateEditButton="false">
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="ID" SortExpression="ID" ReadOnly="True" />
                <asp:BoundField HeaderText="Heading" DataField="Heading" SortExpression="Heading" ReadOnly="True" />
                <asp:BoundField HeaderText="Description" DataField="Description" SortExpression="Description" ReadOnly="True" />
                <asp:BoundField DataField="Building Code" HeaderText="Building Code" SortExpression="Building Code" ReadOnly="True" ></asp:BoundField>                
                <asp:TemplateField HeaderText="Major" SortExpression="Major">                    
                    <ItemTemplate>
                        <asp:CheckBox ID="tbMajor" runat="server" Checked='<%# Bind("Major") %>' Enabled="true" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Minor" SortExpression="Minor">                    
                    <ItemTemplate>
                        <asp:CheckBox ID="tbMinor" runat="server" Checked='<%# Bind("Minor") %>' Enabled="true" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Notes" SortExpression="Notes">                    
                    <ItemTemplate>
                        <asp:TextBox ID="tbNotes" runat="server" Text='<%# Bind("Notes") %>' ></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBOIT %>" 
            SelectCommand="SELECT 
                                CL_SectionDetail.SubSection_Minor AS Minor, 
                                CL_SectionDetail.SubSection_Major AS Major, 
                                CL_SectionDetail.SubSection_Code AS [Building Code], 
                                CL_SectionDetail.SubSection_Notes AS Notes, 
                                CL_SectionDetail.SubSection_Desc AS Description, 
                                CL_SectionDetail.Section_ID AS ID, 
                                CL_Section.Section_Name AS Heading 
                            FROM 
                                CL_SectionDetail 
                            INNER JOIN 
                                CL_Section ON CL_SectionDetail.Section_ID = CL_Section.Section_ID 
                            Order by 
                                CL_SectionDetail.SubSection_ID">
        </asp:SqlDataSource>
    </div>
    <div class="Inspection Notice">
        <fieldset style="padding: 15px;">
            If violations were noted above, all such violations marked by the inspector must be repaired within thirty (30) days from the date of the inspection, 
            unless otherwise noted by the inspector. Major violations require reinspection. Minor violations do not require reinspection (at the discretion of 
            the inspector); however, the property owner must correct the violations, sign the report, and return it to the address listed at the bottom of this 
            report before issuance of the Certificate of Inspection.
        </fieldset>
    </div>
    <div class="Certification">
        <asp:Table ID="CertTable" runat="server">
            <asp:TableHeaderRow VerticalAlign="Middle" ID="header1">
                <asp:TableHeaderCell ColumnSpan="2">I hereby certify that all the violations listed above have been corrected</asp:TableHeaderCell>
            </asp:TableHeaderRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" >Date</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtDate" runat="server" Width="100%"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" >Property Address</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtProp" runat="server" Width="100%"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" >PRINT: Property Owner/Owner Representative Name</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtPrint" runat="server" Width="100%"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;" >SIGN: Property Owner/Owner Representative Name</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtSign" runat="server" Width="100%"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:Table ID="InspectionPhotosTable" runat="server" >
            <asp:TableHeaderRow VerticalAlign="Middle" ID="header2">
                <asp:TableHeaderCell ColumnSpan="2">Inspection Photos:</asp:TableHeaderCell>
            </asp:TableHeaderRow>
        </asp:Table>
    </div>
    <div class="buttons">
        <asp:Button ID="btnSave" runat="server" BorderWidth="3px" Font-Bold="True" Font-Names="Arial Black" Text="Save" Width="150px" Style="margin-left: 75px;" OnClick="btnSave_Click" />
        <asp:Button ID="btnDelete" runat="server" BorderWidth="3px" Font-Bold="True" Font-Names="Arial Black" Text="Delete" Width="150px" Style="margin-left: 50px;" OnClick="btnDelete_Click" />
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <asp:Button ID="btnCaseMain" runat="server" OnClick="btnCaseMain_Click" Text="Case Main" Height="38px" Width="250px" Visible="true" />
                <asp:Button ID="btnSendMail" runat="server" OnClick="btnSendMail_Click" Text="Email Inspection Deficiencies" Height="38px" Width="250px" Visible="false" />
                <asp:Button ID="btnCertificateInspection" runat="server" OnClick="btnCertificateInspection_Click" Text="Certificate of Inspection" Height="38px" Width="250px" Visible="true" />
                <asp:Button ID="btnReinspectionNotice" runat="server" OnClick="btnReinspectionNotice_Click" Text="Reinspection Notice" Height="38px" Width="250px" Visible="false" />
                <asp:Button ID="btnNoticeNonCompliance" runat="server" OnClick="btnNoticeNonCompliance_Click" Text="Notice of NonCompliance" Height="38px" Width="250px" Visible="false" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
