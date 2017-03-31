﻿using System;
using System.Web.UI;
using COPInspectionChecklistProject.Common;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.DynamicData;

namespace COPInspectionChecklistProject
{
    public partial class InspectionChecklist : Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBOIT"].ConnectionString);
        public Case newCase;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
                catch (Exception e)
                {
                    Console.WriteLine(e.Message);
                }
            }
        }
        //retrieve a InspectionCase based upon CaseNumber
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
            if (dt1.Rows.Count > 0)
            {
                string SQL1 = "SELECT D.Section_ID, S.Section_Name, D.SubSection_ID , D.SubSection_Desc, D.SubSection_Code, V.SubSection_Minor AS Expr2, V.SubSection_Major AS Expr1, V.SubSection_Notes AS Expr3 FROM CL_SectionDetail as D RIGHT JOIN CL_Section as S ON S.Section_ID = D.Section_ID LEFT JOIN Violations as V ON D.SubSection_ID = V.SubSection_ID Where V.Case_Num = '" + caseNumber + "' ORDER BY S.SectionSeq_ID";
                var dt2 = clsCommon.TestDBConnection(SQL1);
                InspectionGrid.DataSource = dt2;
                InspectionGrid.DataBind();
                caseLoaded.Text = "Case ID is: " + caseNumber;
            }
            else
            //There is no existing Violation case, need to build Violations table at database
            {
                string SQL1 = "Select D.Section_ID, S.Section_Name, D.SubSection_ID, D.SubSection_Desc, D.SubSection_Code, D.SubSection_Minor as Expr2, D.SubSection_Major as Expr1, D.SubSection_Notes as Expr3 From CL_SectionDetail as D Right Join CL_Section as S On S.Section_ID = D.Section_ID Order by S.SectionSeq_ID";
                var dt2 = clsCommon.TestDBConnection(SQL1);
                InspectionGrid.DataSource = dt2;
                InspectionGrid.DataBind();
                CreateViolation(caseNumber);
            }
            CheckForViolations();
        }
        //creating a Violation record when none exists for current caseNumber
        private void CreateViolation(string caseNumber)
        {
            DbCommon clsCommon = new DbCommon();
            string sql = "Select * from CL_SectionDetail";
            DataTable dt1 = clsCommon.TestDBConnection(sql);
            if (dt1.Rows.Count > 0)
            {
                for (int i = 0; i < dt1.Rows.Count; i++)
                {
                    string subSectionID = dt1.Rows[i]["SubSection_ID"].ToString();
                    SqlCommand cmd = new SqlCommand();
                    conn.Open();
                    cmd.Connection = conn;
                    cmd.CommandText = "Insert into Violations (Case_Num, SubSection_ID, SubSection_Notes, SubSection_Major, SubSection_Minor) values (@Case_Num, @SubSection_ID, ' ', 0, 0)";
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@Case_Num", caseNumber);
                    cmd.Parameters.AddWithValue("@SubSection_ID", subSectionID);
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
            caseLoaded.Text = "Case created. Case ID is: " + caseNumber;
            CheckForViolations();
        }
        private void CheckForViolations()
        {
            try
            {
                bool bMajor = false, bMinor = false;
                foreach (GridViewRow row in InspectionGrid.Rows)
                {
                    CheckBox major = (CheckBox)InspectionGrid.Rows[row.RowIndex].Cells[5].FindControl("cbMajor");
                    CheckBox minor = (CheckBox)InspectionGrid.Rows[row.RowIndex].Cells[6].FindControl("cbMinor");
                    if (major.Checked) bMajor = true;
                    if (minor.Checked) bMinor = true;
                }
                if (bMajor)
                    cBMajor.Checked = true;
                else if (!bMajor)
                    cBMajor.Checked = false;
                if (bMinor)
                    cBMinor.Checked = true;
                else if (!bMinor)
                    cBMinor.Checked = false;
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
            DisplayForms();
        }
        //update Violation record
        private void UpdateViolations(string caseNumber)
        {
            conn.Open();
            try
            {
                foreach (GridViewRow row in InspectionGrid.Rows)
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = conn;
                    string subSectionID = ((Label)InspectionGrid.Rows[row.RowIndex].Cells[1].FindControl("lblSubSection_ID")).Text;                    
                    string notes = ((TextBox)row.FindControl("txbNotes")).Text;                    
                    bool bMajor = ((CheckBox)row.FindControl("cbMajor")).Checked;
                    bool bMinor = ((CheckBox)row.FindControl("cbMinor")).Checked;
                    string updateStr = "Update Violations set SubSection_Major=@Major, SubSection_Minor=@Minor, SubSection_Notes='" + notes + "' WHERE Case_Num='" + caseNumber + "' and SubSection_ID='" + subSectionID +"'";
                    cmd.CommandText = updateStr;
                    cmd.Parameters.Add("@Major", SqlDbType.Bit).Value = bMajor;
                    cmd.Parameters.Add("@Minor", SqlDbType.Bit).Value = bMinor;
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
            //close the database connection
            conn.Close();
        }
        //private void UpdateViolations(string caseNumber)
        //{
        //    conn.Open();
        //    try
        //    {
        //        foreach (GridViewRow row in InspectionGrid.Rows)
        //        {
        //            SqlCommand cmd = new SqlCommand();
        //            cmd.Connection = conn;
        //            //first delete the existing row from database where casenumber and subsection_id match query
        //            string subSectionID = ((Label)InspectionGrid.Rows[row.RowIndex].Cells[1].FindControl("lblSubSection_ID")).Text;
        //            cmd.Parameters.AddWithValue("@SubSection_ID", subSectionID);
        //            cmd.CommandText = "Delete from Violations where SubSection_ID = @SubSection_ID and Case_Num='" + caseNumber + "'";
        //            cmd.CommandType = CommandType.Text;
        //            cmd.ExecuteNonQuery();
        //            //secondly insert new field back into database with corresponding fields
        //            string notes = ((TextBox)InspectionGrid.Rows[row.RowIndex].Cells[7].FindControl("txbNotes")).Text;
        //            CheckBox major = (CheckBox)InspectionGrid.Rows[row.RowIndex].Cells[5].FindControl("cbMajor");
        //            CheckBox minor = (CheckBox)InspectionGrid.Rows[row.RowIndex].Cells[6].FindControl("cbMinor");
        //            bool bMajor = major.Checked;
        //            bool bMinor = minor.Checked;

        //            cmd.CommandText = "insert into VIOLATIONS (Case_Num, SubSection_ID, SubSection_Notes, SubSection_Major, SubSection_Minor) values (@Case_Num, @SubSection_ID, '" + notes + "' ," + bMajor + " , " + bMinor + " )";
        //            cmd.Parameters.AddWithValue("@Case_Num", caseNumber);
        //            cmd.Parameters.AddWithValue("@Notes", notes.Trim());
        //            cmd.Parameters.Add("@Major", SqlDbType.Bit).Value = bMajor;
        //            cmd.Parameters.Add("@Minor", SqlDbType.Bit).Value = bMinor;
        //            cmd.ExecuteNonQuery();
        //        }
        //    }
        //    catch (Exception e)
        //    {
        //        Console.WriteLine(e.Message);
        //    }
        //    //close the database connection
        //    conn.Close();
        //    CheckForViolations();
        //}
        private void DisplayForms()
        {
            if (cBMajor.Checked)
                cBNoMajor.Checked = false;
            else
                cBNoMajor.Checked = true;
            if (cBMinor.Checked)
                cBNoMinor.Checked = false;
            else
                cBNoMinor.Checked = true;
            if (cBNoMajor.Checked && cBNoMinor.Checked)
            {
                cBNoMajor.Checked = false;
                cBNoMinor.Checked = false;
                cBNoViolations.Checked = true;
            }
            else
                cBNoViolations.Checked = false;
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
        private void EmailInspection(string caseNumber)
        {
            DbCommon clsCommon = new DbCommon();
            string SQL = "SELECT DISTINCT CASE_INFO.Case_Num, PROPERTY_INFO.Applicant_Email, INSPECTOR_INFO.Inspector_Email, VIOLATIONS.SubSection_ID, VIOLATIONS.SubSection_Notes "
                            + "FROM CASE_INFO INNER JOIN "
                            + "PROPERTY_INFO ON CASE_INFO.Property_ID = PROPERTY_INFO.Property_ID INNER JOIN "
                            + "INSPECTOR_INFO ON CASE_INFO.Inspector_ID = INSPECTOR_INFO.Inspector_ID INNER JOIN "
                            + "VIOLATIONS ON CASE_INFO.Case_Num = VIOLATIONS.Case_Num "
                            + "WHERE CASE_INFO.Case_Num = '" + caseNumber + "'";
            var dt = clsCommon.TestDBConnection(SQL);

            if (dt.Rows.Count > 0)
            {
                string to = "";
                string body = "";

                foreach (DataRow dr in dt.Rows)
                {
                    to = dr["Applicant_Email"].ToString() + ";" + dr["Inspector_Email"].ToString();
                    if (dr["SubSection_Notes"].ToString() != null)
                        body += string.Format("{0}\t{1}\n", dr["SubSection_ID"].ToString(), dr["SubSection_Notes"].ToString());
                }

                string url = string.Format("mailto:{0}?subject={1}&body={2}", to, Server.UrlPathEncode("Inspection Violations"), Server.UrlPathEncode(body));
                string script = string.Format("parent.location='{0}'", url);
                ScriptManager.RegisterStartupScript(this, GetType(), "mailto", script, true);
            }
        }
        #region Checkboxes
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
            //no violations noted 
            if (cBNoViolations.Checked)
            {
                cBMajor.Checked = false;
                cBMinor.Checked = false;
                cBNoMajor.Checked = false;
                cBNoMinor.Checked = false;
            }
            DisplayForms();
        }
        #endregion
        #region Buttons
        protected void btnSave_Click(object sender, EventArgs e)
        {
            CheckForViolations();
            UpdateViolations(txtCaseNum.Text);
        }
        protected void btnCaseMain_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CaseMain.aspx?CaseNumber=" + txtCaseNum.Text);
        }
        protected void btnMail_Click(object sender, EventArgs e)
        {
            EmailInspection(txtCaseNum.Text);
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