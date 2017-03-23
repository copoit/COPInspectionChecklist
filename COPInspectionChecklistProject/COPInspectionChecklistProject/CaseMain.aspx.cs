using System;
using System.Web.UI;
using COPInspectionChecklistProject.Common;

namespace COPInspectionChecklistProject
{
    public partial class CaseMain : Page
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
                txtPropAdd.Text = dt.Rows[0]["Property_StreetNumber"].ToString() + " " + dt.Rows[0]["Property_StreetName"].ToString() + " " + dt.Rows[0]["Property_Zip"].ToString();
                txtRespParty.Text = dt.Rows[0]["Applicant_Name"].ToString();
                txtMailAdd.Text = dt.Rows[0]["Mailing_StreetNumber"].ToString() + " " + dt.Rows[0]["Mailing_StreetName"].ToString() + " " + dt.Rows[0]["Mailing_Zip"].ToString();
                txtAppEmail.Text = dt.Rows[0]["Applicant_Email"].ToString();
                txtAppPhone.Text = dt.Rows[0]["Applicant_Phone"].ToString();
                txtOccDwell.Text = dt.Rows[0]["Dwelling_info"].ToString();
                txtNumUnits.Text = dt.Rows[0]["NumberOfUnits"].ToString();
                txtOwnerName.Text = dt.Rows[0]["Property_Owner_Name"].ToString();
                txtOwnerPhone.Text = dt.Rows[0]["Property_Owner_Phone"].ToString();
                txtSidewalk.Text = dt.Rows[0]["Sidewalk_Fee"].ToString();
                txtInspector.Text = dtInspector.Rows[0]["Inspector_FName"].ToString() + " " + dtInspector.Rows[0]["Inspector_LName"].ToString();
                txtInspectEmail.Text = dtInspector.Rows[0]["Inspector_Email"].ToString();
                if (Convert.ToDateTime(dt.Rows[0]["Inspection_Date"]) != null)
                    txtInspectDate.Text = Convert.ToDateTime(dt.Rows[0]["Inspection_Date"]).ToString();
                else txtInspectDate.Text = "No Date Set";
                if (Convert.ToDateTime(dt.Rows[0]["ReInspection_Date"]) != null)
                    txtReinspectDate.Text = Convert.ToDateTime(dt.Rows[0]["ReInspection_Date"]).ToString();
                else txtReinspectDate.Text = "No Date Set";
            }
        }
        public string CaseNumber
        {
            get { return txtCaseNum.Text; }
        }
        #region buttons
        protected void btnInspectionChecklist_Click(object sender, EventArgs e)
        {
            Session["CaseNumber"] = CaseNumber;
            Response.Redirect("InspectionChecklist.aspx?CaseNumber=" + CaseNumber);
        }
        protected void btnCertificateInspection_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CertInspection.aspx?CaseNumber=" + txtCaseNum.Text);
        }
        protected void btnReinspectionNotice_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ReinspectNotice.aspx?CaseNumber=" + txtCaseNum.Text);
        }
        protected void btnNoticeNonCompliance_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/NoticeNonCompliance.aspx?CaseNumber=" + txtCaseNum.Text);
        }
        protected void btnInspectionMain_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/InspectionMain.aspx?CaseNumber=" + txtCaseNum.Text);
        }
    }
    #endregion
}