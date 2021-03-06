﻿using COPInspectionChecklistProject.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COPInspectionChecklistProject
{
    public partial class TestDbConnection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                DbCommon clsCommon = new DbCommon();
                string SQL = "SELECT * From [PROPERTY_INFO]";
                var dt2 = clsCommon.TestDBConnection(SQL);
                lblPropCnt.Text = dt2.Rows.Count.ToString();


            }
            catch (Exception ee)
            {
                lblPropCnt.Text = ee.ToString();
            }

        }
    }
}