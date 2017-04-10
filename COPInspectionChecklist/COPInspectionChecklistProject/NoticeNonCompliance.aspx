<%@ Page Title="NonCompliance Notice" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NoticeNonCompliance.aspx.cs" Inherits="COPInspectionChecklistProject.NoticeNonCompliance" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server"> 
  <div> 
	    <div> 
	        <b>Notice of Non-Compliance</b>
            <br/>
            <asp:Table ID="NonComplianceNoticeTable" runat="server">
                <asp:TableRow>
                    <asp:TableCell Width="20%">Case Number:</asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtNonComplianceCaseNum" runat="server" Width="300px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Width="20%">Property Address:</asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtNonCompliancePropAdd" runat="server" Width="300px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Width="20%">Date:</asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtDate" runat="server" Width="300px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
                      
            <asp:Table runat="server">
                  <asp:TableRow>
                    <asp:TableCell Width="100%">Dear Property Owner/Management Company,</asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell Width="100%">This letter is to inform you that a housing inspection was conducted on: <asp:TextBox ID="txtInspectionDate" runat="server"  ReadOnly="true"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
            </asp:Table>

            <!--
            <table >
		        <tbody>
		            <tr>
                         <td style="width: 660px">Dear Property Owner/Management Company,</td>
		            </tr>
                    <tr>
                         <td style="width: 660px"></td>
		            </tr>
                 </tbody>
            </table>
            -->
            <div>
                <p>
                    at the above referenced property.There appears to remain outstanding violations that
                    need to be corrected before a Certificate of Inspection can be issued per Pasadena
                    Municipal Code Chapter 14.16. We have attached a copy of inspection record for your
                    review which includes the outstanding violations.

                    It is the responsibility of the property owner to bring the property into compliance in
                    order to avoid penalties. All outstanding violations identified in the attached report must be
                    completed within 30 days from the day of this notice. If the violation noted is minor,
                    please aknowledge that the work is done, sign the report and return it to our office. For
                    major violations, please call <asp:Label id="lblInspectorPhone2"  Font-Underline="false"  runat="server"></asp:Label> to schedule a re-inspection.

                    Some of the work identified in the report may require additional permit and inspections
                    from the Building & Safety Division. To obtain a permits, please visit the Permit Center
                    located at 175 N. Garfield Avenue, Pasadena CA 91101 or you may call (622)744-4200
                    for additional information. The Permit Center is open Monday-Thursday 8:00AM-5:00PM
                    and Friday 8:00AM to 12:00 noon.

                    
                </p>
            </div>
            
             <asp:Table runat="server" >
                  <asp:TableRow>  
                    <asp:TableCell Width="100%">If you have any questions, feel free to contact me directly at <asp:Label id="lblInspectorPhone" Font-Underline="false" runat="server"></asp:Label> </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                     <asp:TableCell Width="100%"> <br />Sincerely,</asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell Width="100%"><asp:TextBox ID="txtInspector" runat="server" Width="300px" ReadOnly="true"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                  <asp:TableRow>
                    <asp:TableCell Width="100%">Inspector</asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <!--
            <table >
		        <tbody>
                    <tr>
                         <td style="width: 660px"> </td>
		            </tr>
                    <tr><td>&nbsp</td></tr>
                    <tr>
                         <td style="width: 360px">Sincerely,</td>
		            </tr>
                    <tr>
                         <td style="width: 360px"></td>
		            </tr>
                    <tr>
                         <td style="width: 360px">Inspector</td>
		            </tr>
                    
                    </tbody>
              </table>
            -->
                      
         </div>
 </div>
    <br />
    <div>
        <asp:Button ID="btnNonComplianceCheckList" runat="server" OnClick="btnNonComplianceCheckList_Click" Text="Inspection Checklist"  Height="38px" Width="250px"  />&nbsp                  
        <asp:Button ID="btnNonComplianceCaseMain" runat="server" OnClick="btnNonComplianceCaseMain_Click" Text="Case Main"  Height="38px" Width="250px" />&nbsp
        <br />
        <br />
        <asp:Button ID="btnNonComplianceMainMenaul" runat="server" OnClick="btnNonComplianceMainMenaul_Click" Text="Main Menu"  Height="38px" Width="250px" />                 
    </div>
</asp:Content>
