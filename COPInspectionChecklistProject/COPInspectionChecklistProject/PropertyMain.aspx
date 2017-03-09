<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PropertyMain.aspx.cs" Inherits="COPInspectionChecklistProject.PropertyMain" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div>
            <h1 style="margin:20px;"><b>Property Main</b></h1>
	    </div>
    <table style="margin: 20px; width: 50%; border: 5px none #C0C0C0; background-color: #EFEFEF;">
  		<tbody>
          
		    <tr>
			<td style="width: 124px; height: 48px;">Property Address</td>
			<td style="height: 48px; width: 236px;"><asp:TextBox ID="txtPropAdd" runat="server" Width="435px" Height="35px" style="margin-left: 140" BackColor="#E8E8E8"></asp:TextBox>
                <br />
                </td>
		    </tr>
		    <tr>
			<td style="width: 124px">Responsible Party</td>
			<td style="width: 236px"><asp:TextBox ID="txtRespParty" runat="server" Width="435px" Height="35px" BackColor="#E8E8E8"></asp:TextBox>
                <br />
                 </td>
		    </tr>
		    <tr>
			<td style="width: 124px">Mailing Address</td>
			<td style="width: 236px"><asp:TextBox ID="txtMailAdd" runat="server" Width="435px" Height="35px" BackColor="#E8E8E8"></asp:TextBox>
                <br />
                </td>
		    </tr>
		    <tr>
			<td style="width: 124px">Email</td>
			<td style="width: 236px"> <asp:TextBox ID="txtEmail" runat="server" Width="435px" Height="35px" BackColor="#E8E8E8"></asp:TextBox>
                <br />
                </td>
		    </tr>
		    <tr>
			<td style="width: 124px">Applicant Phone</td>
			<td style="width: 236px"> <asp:TextBox ID="txtAppPhone" runat="server" Width="435px" Height="36px" BackColor="#E8E8E8"></asp:TextBox>
                <br />
                </td>
		    </tr>
		    <tr>
			<td style="width: 124px">Occupant Dwelling Info</td>
			<td style="width: 236px"><asp:TextBox ID="txtOccDwell" runat="server" Width="435px" Height="35px" BackColor="#E8E8E8"></asp:TextBox>
                <br />
                </td>
		    </tr>
		    <tr>
			<td style="width: 124px; height: 43px;">Number of Units</td>
			<td style="width: 236px; height: 43px;"><asp:TextBox ID="txtNumUnits" runat="server" Width="435px" Height="35px" BackColor="#E8E8E8"></asp:TextBox>
                <br />
                </td>
		    </tr>
		    <tr>
			<td style="width: 124px">Owner Name</td>
			<td style="width: 236px"> <asp:TextBox ID="txtOwnerName" runat="server" Width="435px" Height="35px" BackColor="#E8E8E8"></asp:TextBox>
                <br />
                </td>
		    </tr>
		    <tr>
			<td style="width: 124px">Owner Phone</td>
			<td style="width: 236px"><asp:TextBox ID="txtOwnerPhone" runat="server" Width="435px" Height="35px" BackColor="#E8E8E8"></asp:TextBox>
                <br />
                </td>
		    </tr>
		    <tr>
			<td style="width: 124px">Sidewalk Fees</td>
			<td style="width: 236px"><asp:TextBox ID="txtSidewalk" runat="server" Width="435px" Height="35px" BackColor="#E8E8E8"></asp:TextBox>
                <br />
                <br />
                </td>
		    </tr>
			
		</tbody>
	    </table>
       
        <div>
        
        <!-- InspectionMain (Rectange) -->
        <!-- Viewcases (Rectangle) -->
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    <asp:Button ID="btnInspectionMain" runat="server" OnClick="btnInspectionMain_Click" Text="Inspection Main" Width="200px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnViewCases" runat="server" OnClick="btnViewCases_Click" Text="View Cases" Width="200px" />
        </div>
	   
</asp:Content>
