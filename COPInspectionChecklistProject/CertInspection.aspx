<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CertInspection.aspx.cs" Inherits="COPInspectionChecklistProject.CertInspection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <asp:Button ID="btnPreviousPage" runat="server" OnClick="btnPreviousPage_Click" Text="Previous Page" Width="200px" />

    </div>
    <h1 style="margin-left: 240px">CERTIFICATE OF INSPECTION</h1>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           
            <br />
        <div>
            <b style="text-align: left">General Inspection Information</b>
         <br />
            <br />
	    </div>
        <table>
        <asp:HiddenField id="txtPropertyId" runat="server"/>
  		<tbody>
              <tr> 
 <td class="auto-style4" >Case Number</td>
           <td class="auto-style2"><asp:TextBox ID="txtCaseNum" runat="server" Width="300px"  ></asp:TextBox> </td>
 <td class="auto-style4">Inspection Date</td>
           <td  class="auto-style2"><asp:TextBox ID="txtInspectDate" runat="server" Width="300px"  ></asp:TextBox> </td>
        </tr> 
       <tr> 
           <td class="auto-style4" >Property Address</td>
           <td  class="auto-style2"><asp:TextBox ID="txtPropAddr" runat="server" Width="300px"  ></asp:TextBox> </td>
 <td class="auto-style4">Inspection Type</td>
           <td  class="auto-style2"><asp:TextBox ID="txtInspType" runat="server" Width="300px"  ></asp:TextBox> </td>
          
 </tr>
           <tr> 

<td class="auto-style4" >Applicant</td>
           <td class="auto-style2"><asp:TextBox ID="txtApplicant" runat="server" Width="300px"  ></asp:TextBox> </td>
 <td class="auto-style4">Number Of Units</td>
           <td  class="auto-style2"><asp:TextBox ID="txtNumOfUnit" runat="server" Width="300px"  ></asp:TextBox> </td>
        </tr> 
 
              <tr> 

<td class="auto-style4" >Inspector</td>
           <td class="auto-style2"><asp:TextBox ID="txtInspector" runat="server" Width="300px"  ></asp:TextBox> </td>
 <td class="auto-style4">Dwelling Info</td>
           <td  class="auto-style2"><asp:TextBox ID="txtDwellInfo" runat="server" Width="300px"  ></asp:TextBox> </td>
        </tr> 
     
              </tbody>
	    </table>
       <br /> 

<div style="width: 999px">
      <b style="text-align: justify"> 
          NOTE:</b>
          <br />
      This Certifcate should not be relied on as conclusive proof that the property meets all local and state codes.  Illegal conditions may have&nbsp;been missed<br />
&nbsp;during this inspection.The failure of an inspection to have uncovered the illegal condition(s) does not render the illegal&nbsp;condition(s) as legal or permitted. 
          The City of Pasadena has the right to reinspect this property to ensure compliance with the local and&nbsp; state codes if needed. Lastly, this inspection does 
          <br />
          not satisfy any private party disclosure requirements mandated by local, state, and federal&nbsp; law applying to the property.&nbsp;

        </div>
<div style="width: 978px">
            <b style="text-align: left">
            <br />
            INSPECTOR NOTES:</b>
         <br />
    <asp:ListBox ID="lstInspectorNotes" runat="server" Width="588px" ></asp:ListBox>
        </div>
 <p>&nbsp;</p>
            <p style="width: 983px">
                <asp:TextBox ID="txtInspectSig" runat="server" Width="363px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                
                <asp:TextBox ID="txtCertIssueDate" runat="server" Width="396px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ____________________________________________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_______________________________________________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label1" runat="server" Text="INSPECTOR SIGNATURE"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                <asp:Label ID="Label2" runat="server" Text="CERTIFIED ISSUE DATE"></asp:Label>
            </p>

        <footer>
            </footer>   
      <p>
        &nbsp;</p>
    
       <footer style="width: 1097px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;175N Garfield Av 1st floor paedena Ca 91101-1704&nbsp;&nbsp;&nbsp;&nbsp;<br />
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.cityofpasedena.net">www.cityofpasedena.net</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (626) 744-7144&nbsp; (626)744-3979 fax&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </footer>    
</asp:Content>
