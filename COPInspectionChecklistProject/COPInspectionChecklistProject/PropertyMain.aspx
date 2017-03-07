<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PropertyMain.aspx.cs" Inherits="COPInspectionChecklistProject.PropertyMain" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container">
        <img src="Images/Cop_logo.jpg" alt="City of Pasadena" style="float:left;width:200px;height:200px;" /> 
        <h1 style="font-size:50px;"><b>City of Pasadena
            </b></h1>
        <h3>Planning and Community Development Department</h3>
        <h3>Building and Safety Division</h3>
        </div>
    <div><hr style="border:double"/>
         <p>&nbsp;</p></div>
   
        <asp:Panel ID="Panel1" runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Height="701px" HorizontalAlign="Justify" Width="792px" style="margin-left: 24px; margin-top: 0px; margin-right: 0px;">
            <h1 style="height: 26px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><span style="font-size: x-large">&nbsp; </span><span style="font-size: xx-large">Property Main</span></strong></h1>
            <p style="height: 26px">
                <asp:Panel ID="Panel2" runat="server" BackColor="#EFEFEF" Height="600px" style="margin-left: 11px; margin-top: 0px; margin-right: 16px;" Width="757px">
                    &nbsp;<br /> &nbsp; Property Address&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtPropAdd" runat="server" BackColor="#E8E8E8" Height="30px" Width="360px"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp; Responsible Party&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtRespParty" runat="server" BackColor="#E8E8E8" Height="30px" Width="360px"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp; Mailing Address&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtMailAdd" runat="server" BackColor="#E8E8E8" Height="30px" Width="360px"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp; Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtEmail" runat="server" BackColor="#E8E8E8" Height="30px" Width="360px"></asp:TextBox>
                    &nbsp;<br />
                    <br />
                    &nbsp; Application Phone&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtAppPhone" runat="server" BackColor="#E8E8E8" Height="30px" Width="360px"></asp:TextBox>
                    &nbsp;
                    <br />
                    <br />
                    &nbsp; Occ Dwelling Info&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtOccDwell" runat="server" BackColor="#E8E8E8" Height="30px" Width="361px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                    &nbsp; Number of Units&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtNumUnits" runat="server" BackColor="#E8E8E8" Height="30px" Width="360px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                    &nbsp; Owner Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:TextBox ID="txtOwnername" runat="server" BackColor="#E8E8E8" Height="30px" Width="360px"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp; Owner Phone&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtOwnerPhone" runat="server" BackColor="#E8E8E8" Height="30px" Width="360px"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp; Sidewalk Fees&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtSideWalk" runat="server" BackColor="#E8E8E8" Height="30px" Width="360px"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnInspectionMain" runat="server" BackColor="White" Height="43px" OnClick="btnInspectionMain_Click" Text="Inspection Main" Width="173px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnViewCases" runat="server" BackColor="White" Height="43px" OnClick="btnViewCases_Click" Text="View Cases" Width="173px" style="margin-top: 0" />
                    <br />
                </asp:Panel>
                <p>
                </p>
                <p>
                </p>
                <p>
                </p>
                <p>
                </p>
                <p>
                </p>
                <p>
                </p>
            </p>
        </asp:Panel>
</asp:Content>

