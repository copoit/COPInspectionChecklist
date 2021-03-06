﻿<%@ Page Title="Checklists Pending Inspections" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChecklistsPendingInspections.aspx.cs" Inherits="COPInspectionChecklistProject.ChecklistPendingInspections" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div> 
         <div>   
	        <b>Pending Inspections Case List</b>
            <asp:HiddenField id="txtPropertyId" runat="server"/>
                    
	               <br /> 
     <div class="InspectionGrid1">
    <asp:Label ID="caseLoaded" runat="server" Text=""></asp:Label>
    </div>
    <asp:GridView ID="InspectionGrid1" runat="server" AutoGenerateColumns="False" >
        <Columns>
         <asp:HyperLinkField HeaderText="Case Number" DataTextField="Case_Num" DataNavigateUrlFields="Case_Num" DataNavigateUrlFormatString="CaseMain.aspx?CaseNumber={0}" /> 
         <asp:TemplateField HeaderText="Address">  
             <ItemTemplate>  
                 <asp:Label ID="LblAddress" runat="server" Text='<%#Bind("Address") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
         <asp:TemplateField HeaderText="Inspector">  
             <ItemTemplate>  
                 <asp:Label ID="LblInspector" runat="server" Text='<%#Bind("Inspector") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
         <asp:TemplateField HeaderText="Inspection Date">  
             <ItemTemplate>  
                 <asp:Label ID="LbIInspectionDate" runat="server" Text='<%#Bind("Inspection_Date") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
         <asp:TemplateField HeaderText="Inspection Status">  
             <ItemTemplate>  
                 <asp:Label ID="LblInspectionStatus" runat="server" Text='<%#Bind("Inspection_Status") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
             </Columns>
    </asp:GridView>
        <br />
 	    </div>
          <asp:Label ID="lblError" runat="server" ForeColor="Red"/>  
         <br />
         <br/>
	    <asp:Button ID="btnReportMainPage" runat="server" OnClick="btnReportMainPage_Click" Text="Previous Page"  Height="38px" Width="250px" />
    </div>
</asp:Content>
