using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using COPInspectionChecklistProject.Common;

namespace COPInspectionChecklistProject {
    public partial class InspectionChecklist : Page {
        public Case newCase;
        protected void Page_Load(object sender, EventArgs e)  {
            try
            {
                if (Request.QueryString["CaseNumber"] != null)
                {
                    string caseNumber = Request.QueryString["CaseNumber"];
                    getCase(caseNumber);                    
                }
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
        private void getCase(string caseNumber) {

            DbCommon clsCommon = new DbCommon();
            string SQL = "SELECT * FROM[CASE_INFO] INNER JOIN[PROPERTY_INFO] ON[CASE_INFO].Property_ID = [PROPERTY_INFO].Property_ID Where[CASE_INFO].Case_Num ='" + caseNumber + "'";

            var dt = clsCommon.TestDBConnection(SQL);

            if (dt.Rows.Count > 0)
            {

                string SQL2 = "SELECT * FROM[INSPECTOR_INFO] Where[INSPECTOR_INFO].Inspector_ID ='" + dt.Rows[0]["Inspector_ID"].ToString() + "'";

                var dtInspector = clsCommon.TestDBConnection(SQL2);

                txtCaseNum.Text = dt.Rows[0]["Case_Num"].ToString();
                txtPropAdd.Text = dt.Rows[0]["Property_StreetNumber"].ToString() + " " + dt.Rows[0]["Property_StreetName"].ToString() + " " + dt.Rows[0]["Property_Zip"].ToString();              
                txtMailAdd.Text = dt.Rows[0]["Mailing_StreetNumber"].ToString() + " " + dt.Rows[0]["Mailing_StreetName"].ToString() + " " + dt.Rows[0]["Mailing_Zip"].ToString();
                txtAppEmail.Text = dt.Rows[0]["Applicant_Email"].ToString();
                txtAppPhone.Text = dt.Rows[0]["Applicant_Phone"].ToString();
                txtDwellInfo.Text = dt.Rows[0]["Dwelling_info"].ToString();
                txtNumUnit.Text = dt.Rows[0]["NumberOfUnits"].ToString();
                txtApplicant.Text = dt.Rows[0]["Property_Owner_Name"].ToString();
                txtOwnerPhone.Text = dt.Rows[0]["Property_Owner_Phone"].ToString();
                txtSidewalk.Text = dt.Rows[0]["Sidewalk_Fee"].ToString();
                txtInspectName.Text = dtInspector.Rows[0]["Inspector_FName"].ToString() + " " + dtInspector.Rows[0]["Inspector_LName"].ToString();
                txtInspectEmail.Text = dtInspector.Rows[0]["Inspector_Email"].ToString();
                txtInspectDate.Text = Convert.ToDateTime(dt.Rows[0]["Inspection_Date"]).ToString();
            }
        }
    }
}
/*
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
*/
