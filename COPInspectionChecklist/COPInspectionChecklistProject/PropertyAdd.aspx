<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PropertyAdd.aspx.cs" Inherits="COPInspectionChecklistProject.PropertyAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div>
            <b>Property Add</b>
         <br />
            <br />
          <asp:Label ID="lblPropertyMessage" runat="server" ForeColor="Red" />
	    </div>
    <table>
        <asp:HiddenField id="txtPropertyId" runat="server"/>
  		<tbody>
          
		    <tr>
			<td >Property Street Number</td>
			<td ><asp:TextBox ID="txtStreetNum" runat="server" Width="300px"></asp:TextBox>
                <br />
                </td>
		    </tr>
              <tr>
			<td >Property Street Name</td>
			<td ><asp:TextBox ID="txtStreetName" runat="server" Width="300px"></asp:TextBox>
                <br />
                </td>
		    </tr>
              <tr>
			<td >Property Zip</td>
			<td ><asp:TextBox ID="txtZip" runat="server" Width="300px"></asp:TextBox>
                <br />
                </td>
		    </tr>
		    <tr>
			<td >Responsible Party</td>
			<td ><asp:TextBox ID="txtRespParty" runat="server" Width="300px"></asp:TextBox>
                <br />
                 </td>
		    </tr>
		    <tr>
			<td>Mailing Address Number</td>
			<td><asp:TextBox ID="txtMailNum" runat="server" Width="300px"></asp:TextBox>
                <br />
                </td>
		    </tr>
		    <tr>
                 <tr>
			<td>Mailing Address Name</td>
			<td><asp:TextBox ID="txtMailName" runat="server" Width="300px"></asp:TextBox>
                <br />
                </td>
		    </tr>
		    <tr>
                 <tr>
			<td>Mailing Address Zip</td>
			<td><asp:TextBox ID="txtMailZip" runat="server" Width="300px"></asp:TextBox>
                <br />
                </td>
		    </tr>
		    <tr>
			<td>Email</td>
			<td> <asp:TextBox ID="txtEmail" runat="server" Width="300px"></asp:TextBox>
                <br />
                </td>
		    </tr>
		    <tr>
			<td>Applicant Phone</td>
			<td> <asp:TextBox ID="txtAppPhone" runat="server" Width="300px"></asp:TextBox>
                <br />
                </td>
		    </tr>
		    <tr>
			<td>Occupant Dwelling Info</td>
			<td><asp:TextBox ID="txtOccDwell" runat="server" Width="300px"></asp:TextBox>
                <br />
                </td>
		    </tr>
		    <tr>
			<td>Number of Units</td> 
			<td><asp:TextBox ID="txtNumUnits" runat="server" Width="300px"></asp:TextBox>
                <br />
                </td>
		    </tr>
		    <tr>
			<td>Owner Name</td>
			<td> <asp:TextBox ID="txtOwnerName" runat="server" Width="300px"></asp:TextBox>
                <br />
                </td>
		    </tr>
		    <tr>
			<td >Owner Phone</td>
			<td ><asp:TextBox ID="txtOwnerPhone" runat="server" Width="300px"></asp:TextBox>
                <br />
                </td>
		    </tr>
		    <tr>
			<td >Sidewalk Fees</td>
			<td ><asp:DropDownList ID="ddlsidewalk" runat="server" Width="300px"><asp:ListItem Text="Yes" Value="1"/><asp:ListItem Text="No" Value="0"/></asp:DropDownList>

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
        &nbsp;<asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" Height="38px" Width="250px" />
        </div>
</asp:Content>
