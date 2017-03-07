using System;
using System.Data;
using System.Data.SqlClient;

namespace COPInspectionChecklistProject
{
    public partial class CaseList : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e)
        {
 
        }
        protected void btnNewCase_Click(Object sender, EventArgs e)
        {
            Response.Redirect("CaseMain.aspx");
        }
        protected void btnSearchCase_Click(object sender, EventArgs e)
        {
            //Response.Redirect("~/CaseMain.aspx.CaseNumber" + txtCaseNumber.Text);
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }
    }
}