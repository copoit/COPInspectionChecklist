<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NoticeNonCompliance.aspx.cs" Inherits="COPInspectionChecklistProject.NoticeNonCompliance" %>
<%@ PreviousPageType VirtualPath="~/CaseMain.aspx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="btnPreviousPage" runat="server" OnClick="btnPreviousPage_Click" Text="Previous Page" Width="200px" />
    </div>
        <asp:Label ID="lblCaseNumber" runat="server" Text="CASENUMBER:"></asp:Label>
        <asp:Label ID="lblNumber" runat="server" Text="Label"></asp:Label>
    </form>
</body>
</html>
