using System;
using System.Web.UI;
using COPInspectionChecklistProject.Common;
using System.Collections;
using System.Data;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Specialized;
using System.Text;

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
        }
        private void retrieveViolationsByCaseNumber(string caseNum)
        {
            DbCommon clsCommon = new DbCommon();
            string SQL = "SELECT * FROM[VIOLATIONS] Where[VIOLATIONS].Case_Num ='" + caseNum + "'";
            var dt1 = clsCommon.TestDBConnection(SQL);
            //check to see if there is an existing Violations case
            if(dt1.Rows.Count >0 )
            {
                string SQL1 = "SELECT CL_Section.Section_Name, CL_SectionDetail.SubSection_Desc, VIOLATION.SubSection_Minor AS Expr1, VIOLATIONS.SubSection_Major AS Expr2, CL_SectionDetail.SubSection_Code, VIOLATIONS.SubSection_Notes AS Expr3, CL_SectionDetail.Section_ID FROM CL_Section" +
                        " INNER JOIN CL_SectionDetail ON CL_Section.Section_ID = CL_SectionDetail.Section_ID LEFT OUTER JOIN CL_SectionDetail ON CL_SectionDetail.SubSection_ID = VIOLATIONS.SubSection_ID Where VIOLATIONS.Case_Num = " + caseNum;

                var dt2 = clsCommon.TestDBConnection(SQL1);
                InspectionGrid.DataSource = dt2;
                InspectionGrid.DataBind();
                caseLoaded.Text = "Case ID is: " + caseNum;                 
            }
            else                    
            //There is no existing Violation case, need to build Violations table at database
            {
                string SQL1 = "SELECT CL_Section.Section_Name, CL_SectionDetail.SubSection_Desc, CL_SectionDetail.SubSection_Minor AS Expr1, CL_SectionDetail.SubSection_Major AS Expr2, CL_SectionDetail.SubSection_Code, CL_SectionDetail.SubSection_Notes AS Expr3, CL_SectionDetail.Section_ID FROM CL_Section INNER JOIN CL_SectionDetail ON CL_Section.Section_ID = CL_SectionDetail.Section_ID";
                var dt2 = clsCommon.TestDBConnection(SQL1);
                InspectionGrid.DataSource = dt2;
                InspectionGrid.DataBind();
                caseLoaded.Text = "No case loaded";
                //SaveViolationTable(caseNum);
            }
        }
        //private void SaveViolationTable(string caseNumber)
        //{
        //    using (SqlConnection conn = new SqlConnection())
        //    {
        //        conn.ConnectionString = ConfigurationManager.ConnectionStrings["DBOIT"].ConnectionString;
        //        foreach (GridViewRow row in InspectionGrid.Rows)
        //        {                   
        //            SqlCommand cmd = new SqlCommand();
        //            conn.Open();
        //            cmd.Connection = conn;
        //            cmd.CommandText = "spInsert_New_Violation_Table";
        //            cmd.CommandType = CommandType.StoredProcedure;

        //            string subSection_ID = (((Label)row.FindControl("lblSubSection_ID")).Text);
        //            string major = (((CheckBox)row.FindControl("cbMajor")).Text);
        //            string minor = (((CheckBox)row.FindControl("cbMinor")).Text);
        //            string notes = (((TextBox)row.FindControl("txtNotes")).Text);

        //            cmd.Parameters.AddWithValue("@CaseNumber", caseNumber);
        //            cmd.Parameters.AddWithValue("@SubSection_ID", subSection_ID);
        //            cmd.Parameters.AddWithValue("@Major", major);
        //            cmd.Parameters.AddWithValue("@Minor", minor);
        //            cmd.Parameters.AddWithValue("@Notes", notes);
        //            cmd.ExecuteNonQuery();
        //            caseLoaded.Text = "Case: " + newCase.caseNumber + " has been saved loaded to database";
        //        }
        //            conn.Close();
        //    }
        //}
        //test code for saving a violation record
        private void SaveViolationTable(string caseNumber)
        {
            string SQL;
                using (SqlConnection conn = new SqlConnection())
                {
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["DBOIT"].ConnectionString;
                using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = conn;
                        conn.Open();
                        for(int i=0;i < InspectionGrid.Rows.Count; i++)
                        {
                            SQL = @"Insert into Violations Values ( "
                                + caseNumber + ", "
                                + InspectionGrid.Rows[i].Cells[0].Text + ", "
                                + InspectionGrid.Rows[i].Cells[4].Text + ", "
                                + InspectionGrid.Rows[i].Cells[5].Text + ", "
                                + InspectionGrid.Rows[i].Cells[6].Text + ");";
                            cmd.CommandText = SQL;
                            cmd.ExecuteNonQuery();
                        }
                    }
                }
            }
        //Test code updating a Violation record
        protected void updateNewViolations()
        {
            int rowIndex = 0;
            StringCollection sc = new StringCollection();
            if (ViewState["CurrentTable"] != null)
            {
                DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
                if (dtCurrentTable.Rows.Count > 0)
                {
                    for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                    {
                        Label lbl1 = (Label)InspectionGrid.Rows[rowIndex].Cells[0].FindControl("lblSubSection_ID");
                        CheckBox box1 = (CheckBox)InspectionGrid.Rows[rowIndex].Cells[4].FindControl("cbMajor");
                        CheckBox box2 = (CheckBox)InspectionGrid.Rows[rowIndex].Cells[5].FindControl("cbMinor");
                        TextBox box3 = (TextBox)InspectionGrid.Rows[rowIndex].Cells[6].FindControl("txtNotes");

                        sc.Add(lbl1.Text + ","+ box1.Text + "," + box2.Text + "," + box3.Text);
                        rowIndex++;
                    }
                    InsertRecords(sc);
                }
            }
        }
        //Test code for building a new violation record
        private void InsertRecords(StringCollection sc)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["DBOIT"].ConnectionString;
            StringBuilder sb = new StringBuilder(string.Empty);
            string[] splitItems = null;
            foreach (string item in sc)
            {

                const string sqlStatement = "INSERT INTO Violations (Case_Num, SubSection_ID, Major, Minor, Notes) VALUES";
                if (item.Contains(","))
                {
                    splitItems = item.Split(",".ToCharArray());
                    sb.AppendFormat("{0}('{1}','{2}','{3}','{4}'); ", sqlStatement, splitItems[0], splitItems[1], splitItems[2], splitItems[3]);
                }
            }
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sb.ToString(), conn);
                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                string msg = "Insert Error:";
                msg += ex.Message;
                throw new Exception(msg);
            }
            finally
            {
                conn.Close();
            }
        }
        private void DisplayForms()
        {
            if (cBNoViolations.Checked)
            {
                btnCertificateInspection.Visible = true;
                btnReinspectionNotice.Visible = false;
                btnNoticeNonCompliance.Visible = false;
                btnSendMail.Visible = false;
            }
            else if (!cBNoViolations.Checked)
            {
                btnCertificateInspection.Visible = false;
                btnReinspectionNotice.Visible = true;
                btnNoticeNonCompliance.Visible = true;
                btnSendMail.Visible = true;
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
            if(cBNoMajor.Checked && cBNoMinor.Checked)
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
