<%@ Page Title="Reinspection" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReinspectNotice.aspx.cs" Inherits="COPInspectionChecklistProject.ReinspectNotice" %> 

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server"> 
  <div> 
	    <div> 
	        <b>Quadrennial Re-inspection : Notice and Order to Comply</b>
            <br/>
            <table >
		        <tbody>
		            <tr>
			        <td style="width: 160px;">Case Number</td>
			            <td><asp:TextBox ID="txtReinspectionCaseNum" runat="server" Width="300px" ReadOnly="true"></asp:TextBox></td>
		            </tr>
		            <tr>
			        <td style="width: 160px">Property Address</td>
			            <td><asp:TextBox ID="txtReinspectionPropAdd" runat="server" Width="300px" ReadOnly="true"></asp:TextBox></td>
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
                         <td style="width: 660px">A quadrenial inspection of the above referenced property was conducted on: <asp:TextBox ID="txtInspectionDate" runat="server" Width="100px" DataFormatString="{0:d}" ReadOnly="true"></asp:TextBox></td>
		            </tr>
                 </tbody>
            </table>
            <div style="width:660px;">
                <p>
                    and has revealed conditions that affect the health and safety of occupants and cause
                    the building to be determined to be in violation of the city of Pasadena Municipal Code.
                    There conditions, there locations on the premises and specific violation(s) of the
                    Pasadena Municipal Code (PMC) and/or California Health and Safety Code are described on
                    the attached inspection report.

                    You, as the property owner or responsible party, are ordered to eliminate all of the 
                    described conditions and diligently pursue the work necessary to eliminate and violations
                    of the PMC and Health and Safety Code.

                    Some of the work required to repair the building may require that you obtain a permit and
                    request related inspection from the Planning Department. We strongly urge you to
                    seek the service on qualified installer, propably licensed by the State Contractors
                    License Board. All violations must be corrected and any required permit must be completed.
                </p>
            </div>
            
            <table >
		        <tbody>
                     <tr>
                         <td style="width: 660px">A reinspection of the premises will conducted on: <asp:TextBox ID="txtReinspectionDate" runat="server" Width="100px"></asp:TextBox>
                            
                         </td>
		            </tr>
                    <tr>
                         <td style="width: 660px">Failure to honor this appointment will result in a citation being issued in the amount up to <asp:TextBox ID="txtCitationAmount" runat="server"  Width="100px"></asp:TextBox></td>
		            </tr>
                     </tbody>
            </table>
            <div style="width:660px;">
                <p>
                You or your representative must be present to escort the Code Complience Inspector. You
                must provide notice to all affected tenants not less than 24 hours prior to the scheduled
                inspection. The entire premises must be in full compliance with Pasadena Municipal
                Code 14.16.030(A). Should you have any questions please contact the Inspector below.
                </p>
            </div>
            <table >
		        <tbody>
                    <tr>
                         <td style="width: 360px">Sincerely,</td>
		            </tr>
                    <tr>
                         <td style="width: 360px"><asp:TextBox ID="txtInspector" runat="server" Width="200px" ReadOnly="true"></asp:TextBox></td>
		            </tr>
                    <tr>
                         <td style="width: 360px">Code Compliance Officer</td>
		            </tr>
                    <tr>
                         <td style="width: 160px"> <asp:TextBox ID="txtInspectorPhone" runat="server" Width="200px"  BorderStyle="None"  ReadOnly="true"></asp:TextBox></td>
		            </tr>
                    </tbody>
              </table>
                <br />
                <div>
                    <asp:Button ID="btnReinspectionSave" runat="server" OnClick="btnReinspectionSave_Click" Text="Save" Height="38px" Width="250px" />&nbsp
                    <asp:Button ID="btnReinspectionCancel" runat="server" OnClick="btnReinspectionCancel_Click" Text="Cancel"  Height="38px" Width="250px" />&nbsp
                    <br />
                    <br />
                    <asp:Button ID="btnReinspectionCheckList" runat="server" OnClick="btnReinspectionCheckList_Click" Text="Check List"  Height="38px" Width="250px"  />&nbsp
                    <asp:Button ID="btnReinspectionCaseMain" runat="server" OnClick="btnReinspectionCaseMain_Click" Text="Case Main"  Height="38px" Width="250px" />&nbsp
                    <br />
                    <br />
                    <asp:Button ID="btnReinspectionMainMenaul" runat="server" OnClick="btnReinspectionMainMenaul_Click" Text="Main Menu"  Height="38px" Width="250px" />                   
                </div>
         </div>
 </div>
    <br /><br /><br />
</asp:Content>
