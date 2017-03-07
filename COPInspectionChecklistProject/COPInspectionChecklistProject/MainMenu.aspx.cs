using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using COPInspectionChecklistProject.Common;

namespace COPInspectionChecklistProject
{
	public partial class MainMenu : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            DbCommon clsCommon = new DbCommon();
            string SQL = "SELECT * [property_info]";
            var dt2 = clsCommon.TestDBConnection(SQL);

            lblPropCnt.Text = dt2.Rows.Count.ToString();
        }
	}
}