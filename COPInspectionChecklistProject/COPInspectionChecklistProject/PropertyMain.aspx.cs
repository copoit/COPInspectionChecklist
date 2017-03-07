using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COPInspectionChecklistProject
{
      public partial class PropertyMain : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnInspectionMain_Click(object sender, EventArgs e)
        {
            Response.Redirect("InspectionMain.aspx");
        }

        protected void btnViewCases_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewCases.aspx");
        }
    }
}