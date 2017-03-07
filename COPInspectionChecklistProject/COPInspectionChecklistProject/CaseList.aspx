<%@ Page Title="Case List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CaseList.aspx.cs" Inherits="COPInspectionChecklistProject.CaseList" %> 

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server"> 
    <%--This page displays information that was called for and retrieved from the database. Data is loaded per request 
    by a Case Number from CaseList page or InspectionMain page--%> 
    <div class="container"> 
	<img src="Images/Cop_logo.jpg" alt="City of Pasadena" style="float:left;width:200px;height:200px;" />  
	<h1 style="font-size:50px;"><b>City of Pasadena</b></h1> 
	<h3>Planning and Community Development Department</h3> 
	<h3>Building and Safety Division</h3> 
    </div> 
    <div> 
	    <div> 
	        <h1>Case List</h1>
	        <asp:Label runat="server" Text="Property Address" /> 
	        <asp:TextBox ID="txtPropAdd" runat="server" Text="Enter a property Address here" Width="500px" />
 	        <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField AccessibleHeaderText="CaseNumber" />
                    <asp:BoundField AccessibleHeaderText="Inspection Date" />
                    <asp:BoundField AccessibleHeaderText="Inspector" />
                    <asp:BoundField AccessibleHeaderText="Inspection Type" />
                    <asp:BoundField AccessibleHeaderText="Inspection Status" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
            <br />
 	    </div>
	    <asp:Button ID="btnNewCase" runat="server" Onclick="btnNewCase_Click" Text="New Case" Width="200px" />
	    <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" Width="200px" />
    </div>
</asp:Content>