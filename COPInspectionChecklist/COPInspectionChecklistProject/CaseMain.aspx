<%@ Page Title="Case Main" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CaseMain.aspx.cs" Inherits="COPInspectionChecklistProject.CaseMain" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="Inspection Report">
        <b>Case Main</b>
        <asp:Table ID="CaseMainTable" runat="server">
            <asp:TableRow>
                <asp:TableCell>Case Number:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCaseNum" runat="server" Width="300px" Enabled="false" ></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblCaseMessage" runat="server" ForeColor="Red" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>Property Address:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtPropAdd" runat="server" Width="300px" Enabled="false"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtPropID" runat="server" Visible="false"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>Responsible Party:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtRespParty" runat="server" Width="300px" Enabled="false"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell Enabled="false">Mailing Address:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtMailAdd" runat="server" Width="300px" Enabled="false"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell Enabled="false">Applicant Email:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAppEmail" runat="server" Width="300px" Enabled="false"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell Enabled="false">Applicant Phone:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAppPhone" runat="server" Width="300px" Enabled="false"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell Enabled="false">Dwelling Info:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtOccDwell" runat="server" Width="300px" Enabled="false"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell Enabled="false">Number of Units:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtNumUnits" runat="server" Width="300px" Enabled="false"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell Enabled="false">Owner Name:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtOwnerName" runat="server" Width="300px" Enabled="false"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell Enabled="false">Owner Phone:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtOwnerPhone" runat="server" Width="300px" Enabled="false"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell Enabled="false">Sidewalk Fees:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtSidewalk" runat="server" Width="300px" Enabled="false"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell Enabled="false">Inspection Type</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtInspectionType" runat="server" Width="300px" Enabled="true"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell Enabled="false">Inspection Status</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtInspectionStatus" runat="server" Width="300px" Enabled="false"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>Inspector Name:</asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="ddlInspector" runat="server" Width="300px" AutoPostBack="true" DataTextField = "InspectorName" DataValueField = "Inspector_ID" OnSelectedIndexChanged="ddlInspector_SelectedIndexChanged" ></asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell Enabled="false">Inspector Email:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtInspectEmail" runat="server" Width="300px" Enabled="false"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>Inspection Date:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtInspectDate" runat="server" Width="300px" />
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Image ID="imgInsp" runat="server" AlternateText="Calendar" Height="25px" ImageAlign="AbsMiddle" ImageUrl="~/Images/calendar.jpg" Width="25px" onclick="inspectionDate()" />
                    <script>
                        $(function () {
                            $('#MainContent_txtInspectDate').datepicker({
                                format: 'mm/dd/yyyy'
                            });
                        });
                        function inspectionDate() {
                            $('#MainContent_txtInspectDate').focus();
                        }
                    </script>
                </asp:TableCell>
                <asp:TableCell >
                    <asp:Label ID="lblInspectMessage" runat="server" ForeColor="Red" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>Re-Inspection Date:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtReinspectDate" runat="server" Width="300px" />
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Image ID="imgRein" runat="server" AlternateText="Calendar" Height="25px" ImageAlign="AbsMiddle" ImageUrl="~/Images/calendar.jpg" Width="25px"  onclick="reinspectionDate()" />
                    <script>
                        $(function () {
                            $('#MainContent_txtReinspectDate').datepicker({
                                format: 'mm/dd/yyyy'
                            });
                        });
                        function reinspectionDate() {
                            $('#MainContent_txtReinspectDate').focus();
                        }
                    </script>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblReinspectMessage" runat="server" ForeColor="Red" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
    <br />
    <div>
        <asp:Button ID="btnInspectionChecklist" runat="server" OnClick="btnInspectionChecklist_Click" Text="Inspection Checklist" Height="38px" Width="250px" />
        <asp:Button ID="btnCertificateInspection" runat="server" OnClick="btnCertificateInspection_Click" Text="Certificate of Inspection" Height="38px" Width="250px" />
        <br />
        <br />
        <asp:Button ID="btnReinspectionNotice" runat="server" OnClick="btnReinspectionNotice_Click" Text="Reinspection Notice" Height="38px" Width="250px" />
        <asp:Button ID="btnNoticeNonCompliance" runat="server" OnClick="btnNoticeNonCompliance_Click" Text="Notice of NonCompliance" Height="38px" Width="250px" />
        <br />
        <br />
        <asp:Button ID="InspectionMain" runat="server" OnClick="btnInspectionMain_Click" Text="Inspection Main" Height="38px" Width="250px" />
        <asp:Button ID="Save" runat="server" OnClick="btnSave_Click" Text="Save Case" Height="38px" Width="250px" />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
    </div>
</asp:Content>
