using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COPInspectionChecklistProject {
    public partial class InspectionChecklist : Page {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnPreviousPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("CaseMain.aspx");
        }
        protected void cBMajor_CheckedChanged(object sender, EventArgs e)
        {
            //major violation noted
        }
        protected void cbMinor_CheckedChanged(object sender, EventArgs e)
        {
            //minor violation noted
        }
        protected void cBNoMajor_CheckedChanged(object sender, EventArgs e)
        {
            //no major violations
        }
        protected void cBNoMinor_CheckedChanged(object sender, EventArgs e)
        {
            //no minor violations
        }
        protected void cbNoViolations_CheckedChanged(object sender, EventArgs e)
        {
            //no violations
        }
    }
}