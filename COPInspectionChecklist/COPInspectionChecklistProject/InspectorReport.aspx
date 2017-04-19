<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InspectorReport.aspx.cs" Inherits="COPInspectionChecklistProject.InspectorReport" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server"> 
    <div> 
	    <div>  
	        <b>Inspector Report</b>           
            <br />
             <table>
                <tbody>
                    <tr>
                       <td><asp:Label ID="lblMessage" runat="server" ForeColor="Red"/></td>
                   </tr>
                </tbody>
            </table>
            <br />
            <asp:Table ID="InspectorReportTable" runat="server">
	            <asp:TableRow>
                    <asp:TableCell>Inspector Name:</asp:TableCell>
                    <asp:TableCell>
                         <asp:DropDownList ID="ddlInspector" runat="server" Width="300px" AutoPostBack="true" DataTextField = "InspectorName" DataValueField = "Inspector_ID" OnSelectedIndexChanged="ddlInspector_SelectedIndexChanged" ></asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:GridView ID="CaseListGridView" runat="server" autogeneratecolumns="false">
                <Columns>
                    <asp:HyperLinkField HeaderText="Case Number" DataTextField="Case_Num" DataNavigateUrlFields="Case_Num" DataNavigateUrlFormatString="CaseMain.aspx?CaseNumber={0}" /> 
                    <asp:BoundField HeaderText="Inspector"  DataField="Inspector" />
                    <asp:BoundField HeaderText="Inspection Date"  DataField="Inspection_Date" DataFormatString="{0:d}" />
                    <asp:BoundField HeaderText="Inspection Type" DataField="Inspection_Type" />
                    <asp:BoundField HeaderText="Inspection Status" DataField="Inspection_Status"  />
                </Columns>
            </asp:GridView>
            <br />
           
             <br/>
	        <asp:Button ID="btnInspectorReportPage" runat="server" OnClick="btnInspectorReportPage_Click" Text="Previous Page"  Height="38px" Width="250px" />
 	        </div>	   
    </div>
</asp:Content>
