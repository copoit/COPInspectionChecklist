using System;
using System.Web.UI;
using COPInspectionChecklistProject.Common;
using System.Data.SqlClient;
using System.Configuration;

namespace COPInspectionChecklistProject
{
    public partial class InspectionChecklist : Page
    {
        public Case newCase;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["CaseNumber"] != null)
            {
                string caseNumber = Request.QueryString["CaseNumber"];
                retrieveCaseByCaseNumber(caseNumber);
                retrieveViolationsByCaseNumber(caseNumber);
            }
        }
        private void retrieveCaseByCaseNumber(string caseNumber)
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
                txtMailAdd.Text = dt.Rows[0]["Mailing_StreetNumber"].ToString() + " " + dt.Rows[0]["Mailing_StreetName"].ToString() + " " + dt.Rows[0]["Mailing_Zip"].ToString();
                txtAppEmail.Text = dt.Rows[0]["Applicant_Email"].ToString();
                txtAppPhone.Text = dt.Rows[0]["Applicant_Phone"].ToString();
                txtDwellInfo.Text = dt.Rows[0]["Dwelling_info"].ToString();
                txtNumUnit.Text = dt.Rows[0]["NumberOfUnits"].ToString();
                txtApplicant.Text = dt.Rows[0]["Property_Owner_Name"].ToString();
                txtOwnerPhone.Text = dt.Rows[0]["Property_Owner_Phone"].ToString();
                txtSidewalk.Text = dt.Rows[0]["Sidewalk_Fee"].ToString();
                txtInspectType.Text = dt.Rows[0]["Inspection_Type"].ToString();
                txtInspectName.Text = dtInspector.Rows[0]["Inspector_FName"].ToString() + " " + dtInspector.Rows[0]["Inspector_LName"].ToString();
                txtInspectEmail.Text = dtInspector.Rows[0]["Inspector_Email"].ToString();
                txtInspectDate.Text = Convert.ToDateTime(dt.Rows[0]["Inspection_Date"]).ToString();
            }
            txtCaseNum.Attributes.Add("readonly", "readonly");      //Case Number should not be adjusted here
        }
        //Serve database for Violation table with CaseNumber
        private void retrieveViolationsByCaseNumber(string caseNumber)
        {
            DbCommon clsCommon = new DbCommon();
            string SQL = "SELECT * FROM[VIOLATIONS] Where[VIOLATIONS].Case_Num ='" + caseNumber + "'";
            var dt1 = clsCommon.TestDBConnection(SQL);
            //check to see if there is an existing Violations case
            if (dt1.Rows.Count > 0)
            {
                string SQL1 = "SELECT CL_Section.Section_Name, CL_SectionDetail.SubSection_Desc, VIOLATION.SubSection_Minor AS Expr1, VIOLATIONS.SubSection_Major AS Expr2, CL_SectionDetail.SubSection_Code, VIOLATIONS.SubSection_Notes AS Expr3, CL_SectionDetail.Section_ID FROM CL_Section" +
                        " INNER JOIN CL_SectionDetail ON CL_Section.Section_ID = CL_SectionDetail.Section_ID LEFT OUTER JOIN CL_SectionDetail ON CL_SectionDetail.SubSection_ID = VIOLATIONS.SubSection_ID Where VIOLATIONS.Case_Num = '" + caseNumber + "' ORDER BY CL_Section.SectionSeq_ID";

                var dt2 = clsCommon.TestDBConnection(SQL1);
                InspectionGrid.DataSource = dt2;
                InspectionGrid.DataBind();
                caseLoaded.Text = "Case ID is: " + caseNumber;
            }
            else
            //There is no existing Violation case, need to build Violations table at database
            {
                string SQL1 = "SELECT CL_Section.Section_Name as Heading, CL_SectionDetail.SubSection_Desc as Description, CL_SectionDetail.SubSection_Minor AS Expr1, CL_SectionDetail.SubSection_Major AS Expr2, CL_SectionDetail.SubSection_Code as [Building Code], CL_SectionDetail.SubSection_Notes AS Expr3, CL_Section.Section_ID [AS Section ID] " +
                    " FROM CL_Section LEFT JOIN CL_SectionDetail ON CL_Section.Section_ID = CL_SectionDetail.Section_ID ORDER BY CL_Section.SectionSeq_ID";
                var dt2 = clsCommon.TestDBConnection(SQL1);
                InspectionGrid.DataSource = dt2;
                InspectionGrid.DataBind();
                caseLoaded.Text = "No case loaded";
                CreateViolationTable(caseNumber);
            }
        }
        //creating a Violation record
        private void CreateViolationTable(string caseNumber)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection())
                {
                    conn.ConnectionString = ConfigurationManager.ConnectionStrings["DBOIT"].ConnectionString;
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = conn;
                        conn.Open();
                        string SQL;
                        for (int i = 0; i < InspectionGrid.Rows.Count; i++)
                        {
                            SQL = "Insert into Violations (Case_Num, SubSection_ID, SubSection_Notes, SubSection_Major, SubSection_Minor) Values " +
                                "( '" + caseNumber + "', '" + InspectionGrid.Rows[i].Cells[0].Text + "', '" + InspectionGrid.Rows[i].Cells[6].Text +
                                "', " + InspectionGrid.Rows[i].Cells[4].Text + ", " + InspectionGrid.Rows[i].Cells[5].Text + " )";
                            cmd.CommandText = SQL;
                            cmd.ExecuteNonQuery();
                        }
                    }
                }
            }
            catch (Exception e)
            {
                //throw e;
            }
        }
        //updating a Violation record
        protected void updateNewViolations(string caseNumber)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection())
                {
                    conn.ConnectionString = ConfigurationManager.ConnectionStrings["DBOIT"].ConnectionString;
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = conn;
                        conn.Open();
                        string SQL;
                        for (int i = 0; i < InspectionGrid.Rows.Count; i++)
                        {
                            SQL = "Update Violations Set SubSection_Notes=" + InspectionGrid.Rows[i].Cells[6].Text + ", SubSection_Major=" + InspectionGrid.Rows[i].Cells[4].Text + ", SubSection_Minor=" + InspectionGrid.Rows[i].Cells[5].Text +
                                    " Where caseNumber='" + caseNumber + "' and SubSection_ID='" + InspectionGrid.Rows[i].Cells[0].Text + "'";
                            cmd.CommandText = SQL;
                            cmd.ExecuteNonQuery();
                        }
                    }
                }
            }
            catch (Exception e)
            {
                //throw e;
            }
        }
        private void DisplayForms()
        {
            if (cBNoViolations.Checked)
            {
                btnCertificateInspection.Visible = true;
                btnReinspectionNotice.Visible = false;
                btnNoticeNonCompliance.Visible = false;

            }
            else if (!cBNoViolations.Checked)
            {
                btnCertificateInspection.Visible = false;
                btnReinspectionNotice.Visible = true;
                btnNoticeNonCompliance.Visible = true;

            }
        }

        #region Buttons
        protected void cBMajor_CheckedChanged(object sender, EventArgs e)
        {
            //major violation noted 
            if (cBMajor.Checked)
            {
                cBNoViolations.Checked = false;
                cBNoMajor.Checked = false;
            }
            DisplayForms();
        }
        protected void cBMinor_CheckedChanged(object sender, EventArgs e)
        {
            //minor violation noted 
            if (cBMinor.Checked)
            {
                cBNoMinor.Checked = false;
                cBNoViolations.Checked = false;
            }
            DisplayForms();
        }
        protected void cBNoMajor_CheckedChanged(object sender, EventArgs e)
        {
            //no major violations 
            if (cBNoMajor.Checked)
            {
                cBMajor.Checked = false;
                cBNoViolations.Checked = false;
            }
            if (cBNoMajor.Checked && cBNoMinor.Checked)
            {
                cBNoViolations.Checked = true;
                cBNoMinor.Checked = false;
                cBNoMajor.Checked = false;
            }
            DisplayForms();
        }
        protected void cBNoMinor_CheckedChanged(object sender, EventArgs e)
        {
            //no minor violations 
            if (cBNoMinor.Checked)
            {
                cBMinor.Checked = false;
                cBNoViolations.Checked = false;
            }
            if (cBNoMajor.Checked && cBNoMinor.Checked)
            {
                cBNoViolations.Checked = true;
                cBNoMinor.Checked = false;
                cBNoMajor.Checked = false;
            }
            DisplayForms();
        }
        protected void cBNoViolations_CheckedChanged(object sender, EventArgs e)
        {
            if (cBNoViolations.Checked)
            {
                cBMajor.Checked = false;
                cBMinor.Checked = false;
                cBNoMajor.Checked = false;
                cBNoMinor.Checked = false;
            }
            DisplayForms();
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            //save data to database
        }
        protected void btnCaseMain_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CaseMain.aspx?CaseNumber=" + txtCaseNum.Text);
        }
        protected void btnSendMail_Click(object sender, EventArgs e)
        {
            string email = "owneremail@abc.com";
            ClientScript.RegisterStartupScript(this.GetType(), "mailto", "parent.location='mailto:" + email + "'", true);
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
        #endregion
    }
}
