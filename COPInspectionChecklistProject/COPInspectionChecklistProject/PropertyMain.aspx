<%@ Page Title="Property Main" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PropertyMain.aspx.cs" Inherits="COPInspectionChecklistProject.PropertyMain" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div>
            <b>Property Main</b>
         <br />
            <br />
	    </div>
    <table>
        <asp:HiddenField id="txtPropertyId" runat="server"/>
  		<tbody>
          
		    <tr>
			<td >Property Address</td>
			<td ><asp:TextBox ID="txtPropAdd" runat="server" Width="300px"  ></asp:TextBox>
                <br />
                </td>
		    </tr>
		    <tr>
			<td >Responsible Party</td>
			<td ><asp:TextBox ID="txtRespParty" runat="server" Width="300px" ></asp:TextBox>
                <br />
                 </td>
		    </tr>
		    <tr>
			<td>Mailing Address</td>
			<td><asp:TextBox ID="txtMailAdd" runat="server" Width="300px" ></asp:TextBox>
                <br />
                </td>
		    </tr>
		    <tr>
			<td>Email</td>
			<td> <asp:TextBox ID="txtEmail" runat="server" Width="300px" ></asp:TextBox>
                <br />
                </td>
		    </tr>
		    <tr>
			<td>Applicant Phone</td>
			<td> <asp:TextBox ID="txtAppPhone" runat="server" Width="300px" ></asp:TextBox>
                <br />
                </td>
		    </tr>
		    <tr>
			<td>Occupant Dwelling Info</td>
			<td><asp:TextBox ID="txtOccDwell" runat="server" Width="300px" ></asp:TextBox>
                <br />
                </td>
		    </tr>
		    <tr>
			<td>Number of Units</td>
			<td><asp:TextBox ID="txtNumUnits" runat="server" Width="300px" ></asp:TextBox>
                <br />
                </td>
		    </tr>
		    <tr>
			<td>Owner Name</td>
			<td> <asp:TextBox ID="txtOwnerName" runat="server" Width="300px"  ></asp:TextBox>
                <br />
                </td>
		    </tr>
		    <tr>
			<td >Owner Phone</td>
			<td ><asp:TextBox ID="txtOwnerPhone" runat="server" Width="300px" ></asp:TextBox>
                <br />
                </td>
		    </tr>
		    <tr>
			<td >Sidewalk Fees</td>
			<td ><asp:TextBox ID="txtSidewalk" runat="server" Width="300px" ></asp:TextBox>
                <br />
                <br />
                </td>
		    </tr>
			
		</tbody>
	    </table>
       
        <div>
        
        <!-- InspectionMain (Rectange) -->
        <!-- Viewcases (Rectangle) -->
            
		    <asp:Button ID="btnInspectionMain" runat="server" OnClick="btnInspectionMain_Click" Text="Inspection Main" Height="38px" Width="250px" />
        &nbsp;<asp:Button ID="btnViewCases" runat="server" OnClick="btnViewCases_Click" Text="View Cases" Height="38px" Width="250px" />
        </div>
	   
</asp:Content>
