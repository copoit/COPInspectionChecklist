using System;

namespace COPInspectionChecklistProject
{
    public partial class NoticeNonCompliance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblNumber.Text = Request.QueryString["CaseNumber"];          
        }
        protected void btnPreviousPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("CaseMain.aspx");
        }
    }
}
//CaseMain previousPage = PreviousPage;
//if(previousPage !=null && previousPage.IsCrossPagePostBack)
//{
//    txtCaseNumber.Text = previousPage.CaseNumber;
//}
//txtCaseNumber.Text = Request.QueryString["CaseNumber"].ToString();