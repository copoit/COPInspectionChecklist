<%@ Page Title="Case List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CaseList.aspx.cs" Inherits="COPInspectionChecklistProject.CaseList" %> 

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server"> 
    <%--This page displays information that was called for and retrieved from the database. Data is loaded per request 
    by a Case Number from CaseList page or InspectionMain page--%> 
    <div> 
	    <div> 
	        <h1>Case List</h1>
            <br />
            <br />
	        <asp:Label runat="server" Text="Property Address" /> 
	        <asp:TextBox ID="txtPropAdd" runat="server" Text="Enter a property Address here" Width="500px" />
 	        <br />
            <br />
            <asp:GridView ID="GridView1" runat="server">
                <Columns>
                    <asp:BoundField AccessibleHeaderText="CaseNumber" />
                    <asp:BoundField AccessibleHeaderText="Inspection Date" />
                    <asp:BoundField AccessibleHeaderText="Inspector" />
                    <asp:BoundField AccessibleHeaderText="Inspection Type" />
                    <asp:BoundField AccessibleHeaderText="Inspection Status" />
                </Columns>
            </asp:GridView>
            <br />
 	    </div>
	    <asp:Button ID="btnNewCase" runat="server" Onclick="btnNewCase_Click" Text="New Case" Width="200px" />
	    <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" Width="200px" />
    </div>
</asp:Content>