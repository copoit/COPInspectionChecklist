﻿<%@ Page Title="NonCompliance Notice" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NoticeNonCompliance.aspx.cs" Inherits="COPInspectionChecklistProject.NoticeNonCompliance" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server"> 
  <div> 
	    <div> 
	        <b>Notice of Non-Compliance</b>
            <br/>
            <table >
		        <tbody>
		            <tr>
			        <td style="width: 160px;">Case Number</td>
			            <td><asp:TextBox ID="txtNonComplianceCaseNum" runat="server" Width="300px" ReadOnly="true"></asp:TextBox></td>
		            </tr>
		            <tr>
			        <td style="width: 160px">Property Address</td>
			            <td><asp:TextBox ID="txtNonCompliancePropAdd" runat="server" Width="300px" ReadOnly="true"></asp:TextBox></td>
		            </tr>
		            <tr>
			        <td style="width: 160px">Date</td>
			            <td><asp:TextBox ID="txtDate" runat="server" Width="300px" ReadOnly="true"></asp:TextBox></td>
		            </tr>
                   
                    
                </tbody>
            </table>
            <br /><br />
            <table >
		        <tbody>
		            <tr>
                         <td style="width: 660px">Dear Property Owner/Management Company,</td>
		            </tr>
                    <tr>
                         <td style="width: 660px">This letter is to inform you that a housing inspection was conducted on: <asp:TextBox ID="txtInspectionDate" runat="server" Width="100px"  ReadOnly="true"></asp:TextBox></td>
		            </tr>
                 </tbody>
            </table>
            <div style="width:660px;">
                <p>
                    at the above referenced property.There appears to remain outstanding violations that
                    need to be corrected before a Certificate of Inspection can be issued per Pasadena
                    Municipal Code Chapter 14.16. We have attached a copy of inspection record for your
                    review which includes the outstanding violations.

                    It is the responsibility of the property owner to bring the property into compliance in
                    order to avoid penalties. All outstanding violations identified in the attached report must be
                    completed within 30 days from the day of this notice. If the violation noted is minor,
                    please aknowledge that the work is done, sign the report and return it to our office. For
                    major violations, please call 626-744 to schedule a re-inspection.

                    Some of the work identified in the report may require additional permit and inspections
                    from the Building & Safety Division. To obtain a permits, please visit the Permit Center
                    located at 175 N. Garfield Avenue, Pasadena CA 91101 or you may call (622)744-4200
                    for additional information. The Permit Center is open Monday-Thursday 8:00AM-5:00PM
                    and Friday 8:00AM to 12:00 noon.

                    
                </p>
            </div>
            
            
            <table >
		        <tbody>
                    <tr>
                         <td style="width: 660px">If you have any questions, feel free to contact me directly at 622-744- </td>
		            </tr>
                    <tr><td>&nbsp</td></tr>
                    <tr>
                         <td style="width: 360px">Sincerely,</td>
		            </tr>
                    <tr>
                         <td style="width: 360px"><asp:TextBox ID="txtInspector" runat="server" Width="200px" ReadOnly="true"></asp:TextBox></td>
		            </tr>
                    <tr>
                         <td style="width: 360px">Inspector</td>
		            </tr>
                    
                    </tbody>
              </table>
                <br />
                <div>
                    <asp:Button ID="btnNonComplianceSave" runat="server" OnClick="btnNonComplianceSave_Click" Text="Save" Width="100px" />&nbsp
                    <asp:Button ID="btnNonComplianceCancel" runat="server" OnClick="btnNonComplianceCancel_Click" Text="Cancel"  Width="100px"  />&nbsp
                    <asp:Button ID="btnNonComplianceCheckList" runat="server" OnClick="btnNonComplianceCheckList_Click" Text="Check List"  Width="100px"  />&nbsp
                    <asp:Button ID="btnNonComplianceCaseMain" runat="server" OnClick="btnNonComplianceCaseMain_Click" Text="Case Main"  Width="100px" />&nbsp
                    <asp:Button ID="btnNonComplianceMainMenaul" runat="server" OnClick="btnNonComplianceMainMenaul_Click" Text="Main Menu"  Width="100px" />                   
                </div>
         </div>
 </div>
    <br /><br /><br />
</asp:Content>