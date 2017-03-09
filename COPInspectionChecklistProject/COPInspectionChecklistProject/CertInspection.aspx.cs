using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COPInspectionChecklistProject
{
    public partial class CertInspection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string caseNumber = Request.QueryString["CaseNumber"];
        }
    }
}