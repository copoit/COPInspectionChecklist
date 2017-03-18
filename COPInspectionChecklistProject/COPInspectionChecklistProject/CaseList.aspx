<%@ Page Title="Case List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CaseList.aspx.cs" Inherits="COPInspectionChecklistProject.CaseList" %> 

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server"> 
    <%--This page displays information that was called for and retrieved from the database. Data is loaded per request 
    by a Case Number from CaseList page or InspectionMain page--%> 
    <div> 
	    <div> 
	        <h1>Case List</h1>
            <asp:HiddenField id="txtPropertyId" runat="server"/>
            <br />
            <br />
	        <asp:Label runat="server" Text="Property Address" /> 
	        <asp:TextBox ID="txtPropAdd" runat="server" Text="Enter a property Address here" Width="500px" />
 	        <br />
            <br />
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
 	    </div>
	    <asp:Button ID="btnNewCase" runat="server" Onclick="btnNewCase_Click" Text="New Case" Width="200px" />
	    <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" Width="200px" />
    </div>
</asp:Content>