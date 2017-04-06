<%@ Page Title="Inspection Main" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InspectionMain.aspx.cs" Inherits="COPInspectionChecklistProject.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
       <b>Inspection Main</b>
   <br />
   <br />
   <table>      
      <tr><td>Case Number:</td></tr>
       <tr><td><asp:TextBox ID="txtCase" runat="server"></asp:TextBox></td></tr>
       <tr><td><asp:Button ID="btnCase" runat="server" Text="Search Case" Height="38px" Width="250px" OnClick="btnCase_Click" /></td></tr>
       <tr><td>Property Address</td></tr>
       <tr><td>Street Number:</td></tr>
       <tr><td><asp:TextBox ID="txtStreetNum" runat="server"></asp:TextBox></td></tr>
       <tr><td>Street Name:</td></tr>
       <tr><td><asp:TextBox ID="txtStreetName" runat="server"></asp:TextBox></td></tr>
       <tr><td>Zip:</td></tr>
       <tr><td><asp:TextBox ID="txtZip" runat="server"></asp:TextBox></td></tr>
      <tr><td colspan="2"><asp:Button ID="btnProperty" runat="server" Text="Search Property" Height="38px" Width="250px" OnClick="btnProperty_Click" /></td></tr>
      <tr><td colspan="2"><asp:Label ID="lblError" runat="server" ForeColor="Red"/></td><td>&nbsp;</td></tr> 
      <tr><td colspan="2"><asp:Button ID="btnMain" runat="server" Text="Main Menu" Height="38px" Width="250px" OnClick="btnMain_Click" /></td><td>&nbsp;</td></tr> 
   </table>
</asp:Content>
