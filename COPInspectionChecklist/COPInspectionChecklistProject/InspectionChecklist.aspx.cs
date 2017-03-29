using System;
using System.Web.UI;
using COPInspectionChecklistProject.Common;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Data;

namespace COPInspectionChecklistProject
{
    public partial class InspectionChecklist : Page
    {
        public Case newCase;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["CaseNumber"] != null)
                {
                    string caseNumber = Request.QueryString["CaseNumber"];
                    retrieveCaseByCaseNumber(caseNumber);
                    retrieveViolationsByCaseNumber(caseNumber);
                }
        }
            catch (Exception)
            {

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
        //Search database for Violation table with CaseNumber
        private void retrieveViolationsByCaseNumber(string caseNumber)
        {
            DbCommon clsCommon = new DbCommon();
            string SQL = "SELECT * FROM[VIOLATIONS] Where[VIOLATIONS].Case_Num ='" + caseNumber + "'";
            var dt1 = clsCommon.TestDBConnection(SQL);
            //check to see if there is an existing Violations case
            if (dt1.Rows.Count > 0) {
                string SQL1 = "SELECT S.Section_ID, S.Section_Name, D.SubSection_Desc, D.SubSection_Code, V.SubSection_Minor AS Expr1, V.SubSection_Major AS Expr2, V.SubSection_Notes AS Expr3 FROM CL_SectionDetail as D RIGHT JOIN CL_Section as S ON S.Section_ID = D.Section_ID LEFT OUTER JOIN CL_SectionDetail ON D.SubSection_ID = V.SubSection_ID Where V.Case_Num = '" + caseNumber + "' ORDER BY S.SectionSeq_ID";

                var dt2 = clsCommon.TestDBConnection(SQL1);
                InspectionGrid.DataSource = dt2;
                InspectionGrid.DataBind();
                caseLoaded.Text = "Case ID is: " + caseNumber;
            }
            else
            //There is no existing Violation case, need to build Violations table at database
            {
                string SQL1 = "Select S.Section_ID, S.Section_Name, D.SubSection_Desc, D.SubSection_Code, D.SubSection_Minor as Expr1, D.SubSection_Major as Expr2, D.SubSection_Notes as Expr3 From CL_SectionDetail as D Right Join CL_Section as S On S.Section_ID = D.Section_ID Order by S.SectionSeq_ID";
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
                foreach (GridViewRow row in InspectionGrid.Rows)
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBOIT"].ConnectionString);
                    SqlCommand cmd = new SqlCommand();
                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandText = "Insert into Violations (Case_Num,SubSection_ID,SubSection_Notes,SubSection_Major,SubSection_Minor) values (@Case_Num,@SubSection_ID,@Notes,@Major,@Minor)";
                    cmd.CommandType = CommandType.Text;
                    string subHeading = (((Label)row.FindControl("lblSubSection_ID")).Text);
                    CheckBox major = row.FindControl("cbMajor") as CheckBox;
                    CheckBox minor = row.FindControl("cbMinor") as CheckBox;
                    TextBox notes = (TextBox)row.FindControl("txtNotes");
                    cmd.Parameters.AddWithValue("@Case_Num", caseNumber);
                    cmd.Parameters.AddWithValue("@SubSection_ID", subHeading);
                    cmd.Parameters.Add("@Notes", SqlDbType.VarChar);
                    cmd.Parameters.Add("@Major", SqlDbType.Bit).Value = cBMajor.Checked ? 1 : 0;
                    cmd.Parameters.Add("@Minor", SqlDbType.Bit).Value = cBMinor.Checked ? 1 : 0;
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                caseLoaded.Text = "Case number: " + caseNumber + " added to database";
            }
            catch (Exception)
            {
                caseLoaded.Text = "Error creating Violation table";
            }
        }
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


//private void CreateViolationTable(string caseNumber)
//{
//    try
//    {
//        using (SqlConnection conn = new SqlConnection()) {
//            conn.ConnectionString = ConfigurationManager.ConnectionStrings["DBOIT"].ConnectionString;
//            using (SqlCommand cmd = new SqlCommand()) {
//                cmd.Connection = conn;
//                conn.Open();
//                string SQL, notes,subSectionID;
//                //for (int i = 0; i < InspectionGrid.Rows.Count; i++) {
//                //    notes = InspectionGrid.Rows[i].Cells[6].Text;
//                //    subSectionID = InspectionGrid.Rows[i].Cells[0].Text;
//                //    SQL = "Insert into Violations (Case_Num, SubSection_ID, SubSection_Notes, SubSection_Major, SubSection_Minor) Values ( '" + caseNumber + "', '" + subSectionID + "', '" + notes + "', 0,0)";
//                //    cmd.CommandText = SQL;
//                //    cmd.ExecuteNonQuery();
//                //}
//                foreach(GridViewRow row in InspectionGrid.Rows)
//                {
//                    notes =row.FindControl("txtNotes").ToString();
//                    subSectionID =row.FindControl("lblSubSection_ID").ToString();
//                    SQL= "Insert into Violations(Case_Num, SubSection_ID, SubSection_Notes, SubSection_Major, SubSection_Minor) Values('" + caseNumber + "', '" + subSectionID + "', '" + notes + "', 0, 0)";
//                    cmd.CommandText = SQL;
//                    cmd.ExecuteNonQuery();
//                }
//                conn.Close();
//            }
//        }
//        caseLoaded.Text += "Case number: " + caseNumber + " added to database";
//    }
//    catch (Exception)
//    {
//        caseLoaded.Text = "Error creating Violation table";
//    }
//}
//updating a Violation record