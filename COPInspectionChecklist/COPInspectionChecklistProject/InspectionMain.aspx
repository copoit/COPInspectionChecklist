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
      <tr><td><asp:GridView ID="gvProperties" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
              <AlternatingRowStyle BackColor="White" />
              <Columns>
                  <asp:HyperLinkField DataNavigateUrlFields="Property_ID" DataNavigateUrlFormatString="PropertyMain.aspx?PropertyID={0}" DataTextField="Property_ID" DataTextFormatString="{0}" HeaderText="Property ID" />
                  <asp:BoundField DataField="Property_StreetNumber" HeaderText="Street No." />
                  <asp:BoundField DataField="Property_StreetName" HeaderText="Street Name" />
                  <asp:BoundField DataField="Property_Zip" HeaderText="Zip" />
                  <asp:BoundField DataField="Property_Owner_Name" HeaderText="Owner" />
              </Columns>
              <FooterStyle BackColor="#CCCC99" />
              <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
              <RowStyle BackColor="#F7F7DE" />
              <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#FBFBF2" />
              <SortedAscendingHeaderStyle BackColor="#848384" />
              <SortedDescendingCellStyle BackColor="#EAEAD3" />
              <SortedDescendingHeaderStyle BackColor="#575357" />
          </asp:GridView>
          </td></tr>
      <tr><td colspan="2"><asp:Label ID="lblError" runat="server" ForeColor="Red" EnableViewState="False"/></td><td>&nbsp;</td></tr> 
      <tr><td colspan="2"><asp:Button ID="btnMain" runat="server" Text="Main Menu" Height="38px" Width="250px" OnClick="btnMain_Click" /></td><td>&nbsp;</td></tr> 
   </table>
</asp:Content>
