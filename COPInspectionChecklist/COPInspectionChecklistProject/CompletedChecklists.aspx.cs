using COPInspectionChecklistProject.Common;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COPInspectionChecklistProject
{
    public partial class CompletedChecklists : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayRecord();
            }
        }
        public void DisplayRecord()
        {
            DbCommon clsCommon = new DbCommon();
            string SQL = "SELECT * FROM[CASE_INFO] INNER JOIN[PROPERTY_INFO] ON[CASE_INFO].Property_ID = [PROPERTY_INFO].Property_ID Where[CASE_INFO].Inspection_Status = 'Scheduled'";
            var dt1 = clsCommon.TestDBConnection(SQL);
            if (dt1.Rows.Count > 0)
            
                {
                string SQL1 = "SELECT CASE_INFO.Case_Num,CASE_INFO.Inspection_Date, CASE_INFO.Inspection_Status, INSPECTOR_INFO.Inspector_FName+' '+INSPECTOR_INFO.Inspector_LName as Inspector, PROPERTY_INFO.Property_StreetNumber+' '+PROPERTY_INFO.Property_StreetName+' '+PROPERTY_INFO.Property_Zip as Address" +
                        " FROM CASE_INFO left join INSPECTOR_INFO ON CASE_INFO.Inspector_ID=INSPECTOR_INFO.Inspector_ID left join PROPERTY_INFO ON CASE_INFO.Property_ID = PROPERTY_INFO.Property_ID Where[CASE_INFO].Inspection_Status = 'Scheduled'";
                var dt2 = clsCommon.TestDBConnection(SQL1);
                    InspectionGrid1.DataSource = dt2;
                    InspectionGrid1.DataBind();
              

            }
            
        }

        protected void btnReportMainPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ReportsMain.aspx");
        }
    
        
    }
}
    