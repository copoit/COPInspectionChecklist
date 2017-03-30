<%@ Page Title="Failed Checklists" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FailedChecklists.aspx.cs" Inherits="COPInspectionChecklistProject.FailedChecklists" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div> 
         <div>   
	        <b>Failed Case List</b>
            <asp:HiddenField id="txtPropertyId" runat="server"/>
                    
	               <br /> 
     <div class="InspectionGrid1">
    <asp:Label ID="caseLoaded" runat="server" Text=""></asp:Label>
    </div>
    <asp:GridView ID="InspectionGrid1" runat="server" AutoGenerateColumns="False"  Width="1200px" >
        <Columns>
            <asp:TemplateField HeaderText="Case Number">  
                <ItemTemplate>  
                 <asp:Label ID="LblCaseNum" runat="server" Text='<%#Bind("Case_Num") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
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
	    <asp:Button ID="btnReportMainPage" runat="server" OnClick="btnReportMainPage_Click" Text="Previous Page"  Height="38px" Width="250px" />
    </div>
</asp:Content>


