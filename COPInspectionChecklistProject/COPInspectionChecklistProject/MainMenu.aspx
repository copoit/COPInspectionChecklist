<%@ Page Title="Main Menu" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MainMenu.aspx.cs" Inherits="COPInspectionChecklistProject.MainMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <b>Main Menu</b>
            <br />
            <br />
         <table>
            <tr>
                <td><asp:Button ID="Button3" runat="server" Text="Inspection Menu" PostBackUrl="~/InspectionMain.aspx" Height="38px" Width="223px"/></td>
            </tr>
            <tr>
                <td><asp:Button ID="Button1" runat="server" Text="Reports Menu" PostBackUrl="~/Reports.aspx" Height="38px" Width="223px"/></td>
            </tr>          
        </table>
</asp:Content>
