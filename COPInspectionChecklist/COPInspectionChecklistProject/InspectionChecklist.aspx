<%@ Page Title="Inspection Checklist" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InspectionChecklist.aspx.cs" Inherits="COPInspectionChecklistProject.InspectionChecklist" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <b>Housing Inspection Report</b>
    <div class="Inspection Report">
        <asp:Table ID="HousingInspectionReport" runat="server">
            <asp:TableHeaderRow VerticalAlign="Middle" ID="heading2">
                <asp:TableHeaderCell ColumnSpan="2"><b>General Inspection Information</b></asp:TableHeaderCell>
            </asp:TableHeaderRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Enabled="False">Case Number:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCaseNum" runat="server" Width="300px"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell>Property Address:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtPropAdd" runat="server" Width="300px"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell>Dwelling Info:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtDwellInfo" runat="server" Width="300px"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell>Applicant Name:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtApplicant" runat="server" Width="300px"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell>Applicant Phone:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAppPhone" runat="server" Width="300px"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell>Applicant Email:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAppEmail" runat="server" Width="300px"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell>Inspector Name:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtInspectName" runat="server" Width="300px"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell>Inspector Email:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtInspectEmail" runat="server" Width="300px"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell>Inspection Date:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtInspectDate" runat="server" Width="300px"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell>Inspection Type:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtInspectType" runat="server" Width="300px"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell>Mailing Address:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtMailAdd" runat="server" Width="300px"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell>Number of Units:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtNumUnit" runat="server" Width="300px"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell>Owner Phone:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtOwnerPhone" runat="server" Width="300px"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell>Sidewalk Fees:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtSidewalk" runat="server" Width="300px"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
    <div class="InspectionBreakdown">
        <asp:Table ID="NoticeTable1" runat="server">
            <asp:TableRow runat="server">
                <asp:TableCell Style="padding-left: 20px;">This inspection should not be relied on as conclusive proof that the property meets all local and state codes.  Illegal conditions may have
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
                    <%--Checkboxes are set to Enable="True" for testing purposes. Once completed and a update function for checkboxes in InspectionDetails, these will be returned to false.--%>
                    <asp:TableRow VerticalAlign="Middle">
                        <asp:TableCell HorizontalAlign="Left" VerticalAlign="Middle" Width="50%">THIS INSPECTION REVEALED MAJOR VIOLATIONS - SEE BELOW</asp:TableCell>
                        <asp:TableCell>
                            <asp:CheckBox ID="cBMajor" runat="server" Style="padding-left: 30px;" Text="" Font-Names="Arial Black" TextAlign="left" OnCheckedChanged="cBMajor_CheckedChanged" AutoPostBack="true" Enabled="true" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow VerticalAlign="Middle">
                        <asp:TableCell HorizontalAlign="Left" VerticalAlign="Middle" Width="50%">THIS INSPECTION REVEALED MINOR VIOLATIONS - SEE BELOW</asp:TableCell>
                        <asp:TableCell>
                            <asp:CheckBox ID="cBMinor" runat="server" Style="padding-left: 30px;" Text="" Font-Names="Arial Black" TextAlign="left" OnCheckedChanged="cBMinor_CheckedChanged" AutoPostBack="true" Enabled="true" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow VerticalAlign="Middle">
                        <asp:TableCell HorizontalAlign="Left" VerticalAlign="Middle" Width="50%">THIS INSPECTION REVEALED NO MAJOR VIOLATIONS</asp:TableCell>
                        <asp:TableCell>
                            <asp:CheckBox ID="cBNoMajor" runat="server" Style="padding-left: 30px;" Text="" Font-Names="Arial Black" TextAlign="left" OnCheckedChanged="cBNoMajor_CheckedChanged" AutoPostBack="true" Enabled="true" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow VerticalAlign="Middle">
                        <asp:TableCell HorizontalAlign="Left" VerticalAlign="Middle" Width="50%">THIS INSPECTION REVEALED NO MINOR VIOLATIONS</asp:TableCell>
                        <asp:TableCell>
                            <asp:CheckBox ID="cBNoMinor" runat="server" Style="padding-left: 30px;" Text="" Font-Names="Arial Black" TextAlign="left" OnCheckedChanged="cBNoMinor_CheckedChanged" AutoPostBack="true" Enabled="true" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow VerticalAlign="Middle">
                        <asp:TableCell HorizontalAlign="Left" VerticalAlign="Middle" Width="50%">NO VIOLATIONS WERE OBSERVED</asp:TableCell>
                        <asp:TableCell>
                            <asp:CheckBox ID="cBNoViolations" runat="server" Style="padding-left: 30px;" Text="" Font-Names="Arial Black" TextAlign="left" OnCheckedChanged="cBNoViolations_CheckedChanged" AutoPostBack="true" Enabled="true" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div class="InspectionGrid">
        <asp:Label ID="caseLoaded" runat="server" Text=""></asp:Label>
        <asp:GridView ID="InspectionGrid" runat="server" AutoGenerateColumns="False" Width="1000px">
            <Columns>
                <%--<asp:BoundField DataField="Section_ID" HeaderText="Section ID" SortExpression="Section_ID" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px"></asp:BoundField>--%>
                <asp:TemplateField HeaderText="Section ID" SortExpression="Section_ID">
                    <ItemTemplate>
                        <asp:Label ID="lblSubSection_ID" runat="server" Text='<%# Bind("Section_ID") %>' Enabled="false" ></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" Width="30px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="Section_Name" HeaderText="Heading" SortExpression="Section_Name" HeaderStyle-Width="100px" ReadOnly="true" >
                    <HeaderStyle Width="100px"></HeaderStyle>
                </asp:BoundField>
                <asp:BoundField DataField="SubSection_Desc" HeaderText="Description" SortExpression="SubSection_Desc" HeaderStyle-Width="100px" ReadOnly="true" >
                    <HeaderStyle Width="100px"></HeaderStyle>
                </asp:BoundField>
                <asp:BoundField DataField="SubSection_Code" HeaderText="Building Code" SortExpression="SubSection_Code" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="50px" ReadOnly="true" >
                    <HeaderStyle HorizontalAlign="Center" Width="50px"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                </asp:BoundField>
                <asp:TemplateField HeaderText="Major" SortExpression="Expr1" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:CheckBox ID="cbMajor" runat="server" Checked='<%# Bind("Expr1") %>' Enabled="true" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Minor" SortExpression="Expr2" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:CheckBox ID="cbMinor" runat="server" Checked='<%# Bind("Expr2") %>' Enabled="true" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Notes" SortExpression="Expr3">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNotes" runat="server" Text='<%# Bind("Expr3") %>' TextMode="MultiLine" Enabled="true" Rows="3"></asp:TextBox>                        
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <%--<asp:SqlDataSource ID="DBOIT" runat="server" ConnectionString="<%$ ConnectionStrings:DBOIT %>" SelectCommand="SELECT CL_Section.Section_Name, CL_SectionDetail.SubSection_Desc, CL_SectionDetail.SubSection_Minor AS Expr1, CL_SectionDetail.SubSection_Major AS Expr2, CL_SectionDetail.SubSection_Code, CL_SectionDetail.SubSection_Notes AS Expr3, CL_SectionDetail.Section_ID FROM CL_Section INNER JOIN CL_SectionDetail ON CL_Section.Section_ID = CL_SectionDetail.Section_ID"></asp:SqlDataSource>--%>
    </div>
    <fieldset style="padding: 15px;">
        If violations were noted above, all such violations marked by the inspector must be repaired within thirty (30) days from the date of the inspection, 
        unless otherwise noted by the inspector. Major violations require reinspection. Minor violations do not require reinspection (at the discretion of 
        the inspector); however, the property owner must correct the violations, sign the report, and return it to the address listed at the bottom of this 
        report before issuance of the Certificate of Inspection.
   
    </fieldset>
    <div class="Certification">
        <asp:Table ID="CertTable" runat="server">
            <asp:TableHeaderRow VerticalAlign="Middle" ID="header1">
                <asp:TableHeaderCell ColumnSpan="2">I hereby certify that all the violations listed above have been corrected</asp:TableHeaderCell>
            </asp:TableHeaderRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;">Date</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtDate" runat="server" Width="300px"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;">Property Address</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtProp" runat="server" Width="300px"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;">PRINT: Property Owner/Owner Representative Name</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtPrint" runat="server" Width="300px"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Left" VerticalAlign="Top">
                <asp:TableCell Style="padding-left: 20px;">SIGN: Property Owner/Owner Representative Name</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtSign" runat="server" Width="300px"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:Table ID="InspectionPhotosTable" runat="server">
            <asp:TableHeaderRow VerticalAlign="Middle" ID="header2">
                <asp:TableHeaderCell ColumnSpan="2">Inspection Photos:</asp:TableHeaderCell>
            </asp:TableHeaderRow>
        </asp:Table>
    </div>
    <div class="buttons">
        <asp:Button ID="btnSave" runat="server" Text="Save" Width="250px" Height="38px" Style="margin-left: 75px;" OnClick="btnSave_Click" />
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
