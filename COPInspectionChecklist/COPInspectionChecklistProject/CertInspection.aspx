<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CertInspection.aspx.cs" Inherits="COPInspectionChecklistProject.CertInspection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1 style="margin-left: 60px">CERTIFICATE OF INSPECTION</h1>
               <br />
        <div class="Inspection Report">
        <asp:Table ID="HousingInspectionReport" runat="server">
            <asp:TableHeaderRow VerticalAlign="Middle" ID="heading2">
                <asp:TableHeaderCell ColumnSpan="2"><b>General Inspection Information</b></asp:TableHeaderCell>
            </asp:TableHeaderRow>
             </asp:Table>
	    </div>
        <table>
        <asp:HiddenField id="txtPropertyId" runat="server"/>
  		<tbody>
              <tr> 
 <td class="auto-style4" >Case Number:</td>
           <td class="auto-style2"><asp:TextBox ID="txtCaseNum" runat="server" Width="300px"  ></asp:TextBox> </td>
 <td class="auto-style4">Inspection Date:</td>
           <td  class="auto-style2"><asp:TextBox ID="txtInspectDate" runat="server" Width="300px"  ></asp:TextBox> </td>
        </tr> 
       <tr> 
           <td class="auto-style4" >Property Address:</td>
           <td  class="auto-style2"><asp:TextBox ID="txtPropAddr" runat="server" Width="300px"  ></asp:TextBox> </td>
 <td class="auto-style4">Inspection Type:</td>
           <td  class="auto-style2"><asp:TextBox ID="txtInspType" runat="server" Width="300px"  ></asp:TextBox> </td>
          
 </tr>
           <tr> 

<td class="auto-style4" >Applicant:</td>
           <td class="auto-style2"><asp:TextBox ID="txtApplicant" runat="server" Width="300px"  ></asp:TextBox> </td>
 <td class="auto-style4">Number Of Units:</td>
           <td  class="auto-style2"><asp:TextBox ID="txtNumOfUnit" runat="server" Width="300px"  ></asp:TextBox> </td>
        </tr> 
 
              <tr> 

<td class="auto-style4" >Inspector:</td>
           <td class="auto-style2"><asp:TextBox ID="txtInspector" runat="server" Width="300px"  ></asp:TextBox> </td>
 <td class="auto-style4">Dwelling Info:</td>
           <td  class="auto-style2"><asp:TextBox ID="txtDwellInfo" runat="server" Width="300px"  ></asp:TextBox> </td>
        </tr> 
     
              </tbody>
	    </table>
       <br /> 

<div style="width: 887px">
               <div class="InspectionBreakdown">
        <asp:Table ID="NoticeTable1" runat="server" Width="874px">
            <asp:TableRow runat="server">
                 <asp:TableCell Width="100%"> <b>   Note:</b></asp:TableCell>
        </asp:TableRow>
                  <asp:TableRow>
        
      <asp:TableCell Style="padding-left: 20px;">This Certifcate should not be relied on as conclusive proof that the property meets all local and state codes.  Illegal conditions may have&nbsp;been missed
&nbsp;during this inspection.The failure of an inspection to have uncovered the illegal condition(s) does not render the illegal&nbsp;condition(s) as legal or permitted. 
          The City of Pasadena has the right to reinspect this property to ensure compliance with the local and&nbsp; state codes if needed. Lastly, this inspection does
          not satisfy any private party disclosure requirements mandated by local, state, and federal&nbsp; law applying to the property.&nbsp;
</asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
        </div>
            <br />

<asp:Table runat="server" Width="884px" ID="Table1" Height="42px">
     <asp:TableRow>
           <asp:TableCell Width="100%"> <b> Inspector Notes:</b></asp:TableCell>
     </asp:TableRow>
    <asp:TableRow>
           <asp:TableCell Width="100%">  <asp:Textbox ID="txtInspectorNotes" runat="server"  Width="700px" TextMode="multiline" Columns="50" Rows="5"></asp:TextBox></asp:TableCell>
     </asp:TableRow>
    </asp:Table>
      <br />
          
    <asp:Table runat="server" Width="700px" ID="Table2">
                        <asp:TableRow>
                              
                    <asp:TableCell Width="100%"><asp:TextBox ID="txtInspectSig" runat="server" Width="300px" ReadOnly="true"></asp:TextBox></asp:TableCell>
                    <asp:TableCell Width="100%"><asp:TextBox ID="txtCertIssueDate" runat="server" Width="300px" ReadOnly="true"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                  <asp:TableRow>
                    <asp:TableCell Width="100%">Inspector Signature</asp:TableCell>
                       <asp:TableCell Width="100%">Certificate Issue Date</asp:TableCell>
                </asp:TableRow>
            </asp:Table>
           
        <br />

               <p>
           
                   &nbsp;</p>
     <footer style="width: 1097px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;175N Garfield Av 1st floor paedena Ca 91101-1704&nbsp;&nbsp;&nbsp;&nbsp;<br />
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.cityofpasedena.net">www.cityofpasedena.net</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fax: (626)744-7144&nbsp; (626)744-3979 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
         <br />
           
        <asp:Button ID="btnCaseMainPage" runat="server" OnClick="btnCaseMainPage_Click" Text="Previous Page"  Height="38px" Width="250px" />

               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </footer>    
</asp:Content>
      