<%@ Page Title="Reports Main" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ReportsMain.aspx.cs" Inherits="COPInspectionChecklistProject.ReportsMain" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <b>Reports Main</b>
   <br />
   <br />
   <table>      
       <tr><td><asp:Button ID="btnCompInspect" Height="38px" runat="server" Text="Completed Checklist" width="250px" /></td></tr> 
       <tr><td><asp:Button ID="btnFailedInspect" Height="38px" runat="server" Text="Failed Checklist" width="250px" /></td></tr> 
       <tr><td><asp:Button ID="btnPendingInspect" Height="38px" runat="server" Text="Checklists Pending Inspection" width="250px" /></td></tr> 
       <tr><td><asp:Button ID="btnPendingReInspect" Height="38px" runat="server" Text="Checklists Pending Re-Inspection" width="250px" /></td></tr> 
       <tr><td><asp:Button ID="btnMain" runat="server" Height="38px" PostBackUrl="~/MainMenu.aspx" Text="Main Menu" width="250px"/></td></tr> 
   </table>

</asp:Content>
