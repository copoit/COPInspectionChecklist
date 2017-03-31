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
                    <asp:TableRow VerticalAlign="Middle">
                        <asp:TableCell HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">THIS INSPECTION REVEALED MAJOR VIOLATIONS - SEE BELOW</asp:TableCell>
                        <asp:TableCell>
                            <asp:CheckBox ID="cBMajor" runat="server" Style="padding-left: 30px;" Text="" Font-Names="Arial Black" TextAlign="left" OnCheckedChanged="cBMajor_CheckedChanged" AutoPostBack="true" Enabled="false" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow VerticalAlign="Middle">
                        <asp:TableCell HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">THIS INSPECTION REVEALED MINOR VIOLATIONS - SEE BELOW</asp:TableCell>
                        <asp:TableCell>
                            <asp:CheckBox ID="cBMinor" runat="server" Style="padding-left: 30px;" Text="" Font-Names="Arial Black" TextAlign="left" OnCheckedChanged="cBMinor_CheckedChanged" AutoPostBack="true" Enabled="false" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow VerticalAlign="Middle">
                        <asp:TableCell HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">THIS INSPECTION REVEALED NO MAJOR VIOLATIONS</asp:TableCell>
                        <asp:TableCell>
                            <asp:CheckBox ID="cBNoMajor" runat="server" Style="padding-left: 30px;" Text="" Font-Names="Arial Black" TextAlign="left" OnCheckedChanged="cBNoMajor_CheckedChanged" AutoPostBack="true" Enabled="false" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow VerticalAlign="Middle">
                        <asp:TableCell HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">THIS INSPECTION REVEALED NO MINOR VIOLATIONS</asp:TableCell>
                        <asp:TableCell>
                            <asp:CheckBox ID="cBNoMinor" runat="server" Style="padding-left: 30px;" Text="" Font-Names="Arial Black" TextAlign="left" OnCheckedChanged="cBNoMinor_CheckedChanged" AutoPostBack="true" Enabled="false" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow VerticalAlign="Middle">
                        <asp:TableCell HorizontalAlign="Left" VerticalAlign="Middle" Width="60%">NO VIOLATIONS WERE OBSERVED</asp:TableCell>
                        <asp:TableCell>
                            <asp:CheckBox ID="cBNoViolations" runat="server" Style="padding-left: 30px;" Text="" Font-Names="Arial Black" TextAlign="left" OnCheckedChanged="cBNoViolations_CheckedChanged" AutoPostBack="true" Enabled="false" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div class="InspectionGrid">
    <asp:Label ID="caseLoaded" runat="server" Text=""></asp:Label>
    <asp:GridView ID="InspectionGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="Section_ID" Width="1200px" >
        <Columns>
            <asp:BoundField DataField="Section_ID" HeaderText="Section ID" ReadOnly="True" SortExpression="Section_ID" >
            <HeaderStyle HorizontalAlign="Center" Width="30px" />
            <ItemStyle HorizontalAlign="Center" Width="30px" />
            </asp:BoundField>
             <asp:TemplateField SortExpression="SubSection_ID" Visible="false" HeaderText="SubSection_ID">
                <ItemTemplate>
                    <asp:Label ID="lblSubSection_ID" runat="server" Text='<%# Bind("SubSection_ID") %>'></asp:Label>
                    <input type="hidden" runat="server" id="subSection_ID" value='<%#Eval("SubSection_ID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Section_Name" HeaderText="Heading" SortExpression="Section_Name" >
            <HeaderStyle HorizontalAlign="Left" Width="250px" />
            <ItemStyle HorizontalAlign="Left" Width="250px" />
            </asp:BoundField>
            <asp:BoundField DataField="SubSection_Desc" HeaderText="Description" SortExpression="SubSection_Desc" >
            <HeaderStyle HorizontalAlign="Left" Width="400px" />
            <ItemStyle HorizontalAlign="Left" Width="400px" />
            </asp:BoundField>
            <asp:BoundField DataField="SubSection_Code" HeaderText="Building Code" SortExpression="SubSection_Code" >
            <HeaderStyle HorizontalAlign="Right" Width="90px" />
            <ItemStyle HorizontalAlign="Center" Width="90px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Major" SortExpression="Expr1">
                <ItemTemplate>
                    <asp:CheckBox ID="cbMajor" runat="server" Checked='<%# /*Eval("Expr1")==DBNull.Value ? false :*/ Eval("Expr1") %>' Enabled="true" />
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Right" Width="30px" />
                <ItemStyle HorizontalAlign="Center" Width="30px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Minor" SortExpression="Expr2">
                <ItemTemplate>
                        <asp:CheckBox ID="cbMinor" runat="server" Checked='<%# /*Eval("Expr2") == DBNull.Value ? false :*/ Eval("Expr2") %>' Enabled="true" />
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Right" Width="30px" />
                <ItemStyle HorizontalAlign="Center" Width="30px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Notes" SortExpression="Expr3">
                <ItemTemplate>
                    <asp:TextBox ID="txbNotes" runat="server" Text='<%# Bind("Expr3")  %>' TextMode="MultiLine" Height="100%" MaxLength="250" Rows="3" Width="100%" Enabled="true" ></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" Width="400px" />
                <ItemStyle HorizontalAlign="Left" Width="400px" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
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
              
                 <asp:Button ID="btnMail" runat="server" OnClick="btnMail_Click" Text="Email Inspection Deficiencies" Height="38px" Width="250px" Visible="true" />
                <asp:Button ID="btnCaseMain" runat="server" OnClick="btnCaseMain_Click" Text="Case Main" Height="38px" Width="250px" Visible="true" />  
                <asp:Button ID="btnCertificateInspection" runat="server" OnClick="btnCertificateInspection_Click" Text="Certificate of Inspetion" Height="38px" Width="250px" Visible="true" />
                <asp:Button ID="btnReinspectionNotice" runat="server" OnClick="btnReinspectionNotice_Click" Text="Reinspection Notice" Height="38px" Width="250px" Visible="false" />
                <asp:Button ID="btnNoticeNonCompliance" runat="server" OnClick="btnNoticeNonCompliance_Click" Text="Notice of NonCompliance" Height="38px" Width="250px" Visible="false" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
