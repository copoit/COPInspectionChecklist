using COPInspectionChecklistProject.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COPInspectionChecklistProject
{
    public partial class CertInspection : Page
    {
        Case newCase = new Case();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if page loads with a current case (from page InspectionMain or CaseList), run this code
            if (Request.QueryString["CaseNumber"] != null)
            {
                string caseNumber = Request.QueryString["CaseNumber"];
                getCase(caseNumber);
            }
            //else populate Case with a generated CaseNumber with either a scheduled caseNumber or
            //incrementing the last Case_ID from CASE_INFO
            txtCaseNum.Attributes.Add("readonly", "readonly");      //Case Number should never change on this page
        }
        private void getCase(string caseNumber)
        {
            DbCommon clsCommon = new DbCommon();
            string SQL = "SELECT * FROM[CASE_INFO] INNER JOIN[PROPERTY_INFO] ON[CASE_INFO].Property_ID = [PROPERTY_INFO].Property_ID Where[CASE_INFO].Case_Num ='" + caseNumber + "'";

            var dt = clsCommon.TestDBConnection(SQL);

            if (dt.Rows.Count > 0)
            {
                string SQL2 = "SELECT * FROM[INSPECTOR_INFO] Where[INSPECTOR_INFO].Inspector_ID ='" + dt.Rows[0]["Inspector_ID"].ToString() + "'";

                var dtInspector = clsCommon.TestDBConnection(SQL2);

                txtCaseNum.Text = dt.Rows[0]["Case_Num"].ToString();
                txtPropAddr.Text = dt.Rows[0]["Property_StreetNumber"].ToString() + " " + dt.Rows[0]["Property_StreetName"].ToString() + " " + dt.Rows[0]["Property_Zip"].ToString();
                txtApplicant.Text = dt.Rows[0]["Applicant_Name"].ToString();
                txtInspector.Text = dtInspector.Rows[0]["Inspector_FName"].ToString() + " " + dtInspector.Rows[0]["Inspector_LName"].ToString();
                txtInspectDate.Text = Convert.ToDateTime(dt.Rows[0]["Inspection_Date"]).ToString();
                txtInspType.Text = dt.Rows[0]["Inspection_Type"].ToString();
                txtNumOfUnit.Text = dt.Rows[0]["NumberOfUnits"].ToString();
                txtDwellInfo.Text = dt.Rows[0]["Dwelling_info"].ToString();
                txtInspectorNotes.Text = dt.Rows[0]["Inspector_Notes"].ToString();
                txtInspectSig.Text = dt.Rows[0]["Inspector_Signature"].ToString();
                txtCertIssueDate.Text = Convert.ToDateTime(dt.Rows[0]["Cert_IssueDate"]).ToString();
            }
        }

        protected void btnPreviousPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CaseMain.aspx?CaseNumber=" + txtCaseNum.Text);
        }
        protected void txtPropAdd_TextChanged(object sender, EventArgs e)
        {

        }
    }
}