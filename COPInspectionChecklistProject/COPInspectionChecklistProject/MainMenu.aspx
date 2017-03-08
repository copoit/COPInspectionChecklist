<%@ Page Title="Main Menu" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MainMenu.aspx.cs" Inherits="OITMain._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <img src="Images/CoP_logo.jpg" alt="Pasadena Logo" style="float:right;width:215px; height:194px; margin-left: 92px;"><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Main&nbsp; Menu<br />
         <asp:Button ID="Button1" runat="server" Text="Reports Menu"
PostBackUrl="~/Reports.aspx" Height="38px" OnClick="btnConfirm_Click" Width="223px"/>
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button3" runat="server" Text="Inspection Menu"
PostBackUrl="~/Inspection.aspx" Height="39px" Width="219px" OnClick="Button3_Click1"/><br />
        
    <div class="row">
        <div class="col-md-4">
            <h2>    &nbsp;</h2>
        </div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        <br />
    </div>

        <div class="col-md-4">
            <h2>    &nbsp;&nbsp;&nbsp;
            </h2>
        </div>
        <div class="col-md-4">
            <h2>&nbsp;</h2>
        </div>
    </div>

</asp:Content>
