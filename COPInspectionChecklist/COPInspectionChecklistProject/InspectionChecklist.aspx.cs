using System;
using System.Web.UI;
using COPInspectionChecklistProject.Common;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Web;

namespace COPInspectionChecklistProject
{
    public partial class InspectionChecklist : Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBOIT"].ConnectionString);
        public Case newCase = new Case();
        bool hasReinspectDate = false;
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
                        BindGrid(caseNumber);
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
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
                txtInspectType.Text = dt.Rows[0]["Inspection_Type"].ToString();
                txtInspectionStatus.Text = dt.Rows[0]["Inspection_Status"].ToString();
                txtInspectName.Text = dtInspector.Rows[0]["Inspector_FName"].ToString() + " " + dtInspector.Rows[0]["Inspector_LName"].ToString();
                txtInspectEmail.Text = dtInspector.Rows[0]["Inspector_Email"].ToString();
                txtSign.Text = dt.Rows[0]["Inspector_Signature"].ToString();
                txtInspectionStatus.Text = dt.Rows[0]["Inspection_Status"].ToString();
                txtPrint.Text = txtSign.Text;
                txtProp.Text = txtPropAdd.Text;
                //convert bool value to Text:Yes or No                
                if (Convert.ToBoolean(dt.Rows[0]["Sidewalk_Fee"]))
                    txtSidewalk.Text = "YES";
                else
                    txtSidewalk.Text = "NO";
                //set Certification issue date, if null set to empty string
                if (dt.Rows[0]["Cert_IssueDate"] == null || dt.Rows[0]["Cert_IssueDate"].ToString() == "" )
                    txtDate.Text = string.Empty;
                else
                    txtDate.Text = Convert.ToDateTime(dt.Rows[0]["Cert_IssueDate"]).ToString();
                //set Inspection date, if null set to empty string. set inspectionStatus
                if (dt.Rows[0]["Inspection_Date"] == null || dt.Rows[0]["Inspection_Date"].ToString() == "")
                {
                    txtInspectDate.Text = string.Empty;
                    txtInspectionStatus.Text = InspectionStatus.Not_Scheduled.ToString();
                }
                else
                {
                    txtInspectDate.Text = Convert.ToDateTime(dt.Rows[0]["Inspection_Date"]).ToString();
                    txtInspectionStatus.Text = InspectionStatus.Scheduled.ToString();
                }
                //set Reinspection date, if null set to empty string.set inspectionStatus
                if (dt.Rows[0]["ReInspection_Date"] == null || dt.Rows[0]["ReInspection_Date"].ToString() == string.Empty)
                    hasReinspectDate = false;
                else
                {
                    newCase.reinspectionDate = Convert.ToDateTime(dt.Rows[0]["ReInspection_Date"]);
                    hasReinspectDate = true;
                }
            }
        }
        //Search database for Violation table with CaseNumber
        private void retrieveViolationsByCaseNumber(string caseNumber)
        {
            //loads gridview with basic elements
            DbCommon clsCommon = new DbCommon();
            string SQL = "Select S.Section_ID, S.Section_Name, D.SubSection_ID, D.SubSection_Desc, D.SubSection_Code, D.SubSection_Minor as Expr2, D.SubSection_Major as Expr1, D.SubSection_Notes as Expr3 From CL_SectionDetail as D Right Join CL_Section as S On S.Section_ID = D.Section_ID Order by S.SectionSeq_ID, SubSectionSeq_ID";
            var dt = clsCommon.TestDBConnection(SQL);
            InspectionGrid.DataSource = dt;
            InspectionGrid.DataBind();
            cBNoViolations.Checked = true;
            //updates gridview with records from violation table referenced by caseNumber
            SQL = "SELECT * FROM[VIOLATIONS] Where[VIOLATIONS].Case_Num ='" + caseNumber + "'";
            var dt1 = clsCommon.TestDBConnection(SQL);
            if (dt1.Rows.Count > 0)
            {
                string SQL1 = "Select V.SubSection_ID, V.SubSection_Major AS Major, V.SubSection_Minor AS Minor, V.SubSection_Notes AS Notes FROM Violations as V Where V.Case_Num = '" + caseNumber + "'";
                var dt2 = clsCommon.TestDBConnection(SQL1);
                foreach (GridViewRow row in InspectionGrid.Rows)
                {
                    string subSectionID = ((Label)InspectionGrid.Rows[row.RowIndex].Cells[1].FindControl("lblSubSection_ID")).Text;
                    for (int i = 0; i < dt2.Rows.Count; i++)
                    {
                        if (subSectionID == dt2.Rows[i]["SubSection_ID"].ToString())
                        {
                            CheckBox cmajor = (CheckBox)InspectionGrid.Rows[row.RowIndex].Cells[5].FindControl("cbMajor");
                            cmajor.Checked = Convert.ToBoolean(dt2.Rows[i]["Major"].ToString());
                            CheckBox minor = (CheckBox)InspectionGrid.Rows[row.RowIndex].Cells[6].FindControl("cbMinor");
                            minor.Checked = Convert.ToBoolean(dt2.Rows[i]["Minor"]);
                            TextBox notes = ((TextBox)InspectionGrid.Rows[row.RowIndex].Cells[7].FindControl("txbNotes"));
                            notes.Text = dt2.Rows[i]["Notes"].ToString();
                        }
                    }
                }
            }
            //updates section headings to remove duplicate headings
            string lastHeading="";
            foreach(GridViewRow row in InspectionGrid.Rows) {
                if (row.RowIndex > 0)
                {
                    Label prevHeading = ((Label)InspectionGrid.Rows[row.RowIndex - 1].Cells[2].FindControl("lblHeading"));
                    Label curHeading = ((Label)InspectionGrid.Rows[row.RowIndex].Cells[2].FindControl("lblHeading"));
                    Label curSection = ((Label)InspectionGrid.Rows[row.RowIndex].Cells[0].FindControl("lblSection_ID"));
                    if (prevHeading.Text == curHeading.Text || curHeading.Text == lastHeading)
                    {
                        curHeading.Text = string.Empty;
                        curSection.Text = string.Empty;
                        if(prevHeading.Text != string.Empty)
                            lastHeading = prevHeading.Text;
                    }
                }
            }
            DisableSubHeadings();
            CheckForViolations();
            UpdateInspectionStatus();
        }
        //check for Major/Minor violation in table & set appropriate checkboxes
        private void CheckForViolations()
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
            DisplayForms();
        }
        //update Violation record
        private void UpdateViolationRecord(string caseNumber)
        {
            DbCommon clsCommon = new DbCommon();
            string SQL = "DELETE FROM [VIOLATIONS] Where [VIOLATIONS].Case_Num ='" + caseNumber + "'";
            var dt1 = clsCommon.TestDBConnection(SQL);
            //check to see if there is an existing Violations case
            try
            {
                conn.Open();
                foreach (GridViewRow row in InspectionGrid.Rows)
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = conn;
                    string subSectionID = ((Label)InspectionGrid.Rows[row.RowIndex].Cells[1].FindControl("lblSubSection_ID")).Text;
                    string notes = ((TextBox)row.FindControl("txbNotes")).Text;
                    bool bMajor = ((CheckBox)row.FindControl("cbMajor")).Checked;
                    bool bMinor = ((CheckBox)row.FindControl("cbMinor")).Checked;
                    if (!bMajor && !bMinor && (notes == " " || notes == string.Empty))
                        continue;
                    string updateStr = "Insert into Violations (Case_Num, SubSection_ID, SubSection_Notes, SubSection_Major, SubSection_Minor) values " +
                        "(@CaseNumber, @SubSection_ID, @Notes,@Major, @Minor)";
                    cmd.CommandText = updateStr;
                    cmd.Parameters.AddWithValue("@CaseNumber", caseNumber);
                    cmd.Parameters.AddWithValue("@SubSection_ID", subSectionID);
                    cmd.Parameters.AddWithValue("@Notes", notes);
                    cmd.Parameters.Add("@Major", SqlDbType.Bit).Value = bMajor;
                    cmd.Parameters.Add("@Minor", SqlDbType.Bit).Value = bMinor;
                    cmd.ExecuteNonQuery();
                }
                //close the database connection
                conn.Close();
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }
        //Updates Case_Info with Inspector Signature, Inspection Status, & Certification Date
        private void UpdateCertification(string caseNumber)
        {
            txtDate.Text = DateTime.Now.ToString();
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            DateTime inspectTxt = DateTime.Parse(txtDate.Text);
            cmd.Parameters.AddWithValue("@InspSig", txtSign.Text);
            cmd.Parameters.AddWithValue("@InspectionStatus", txtInspectionStatus.Text);
            cmd.Parameters.Add("@CertIssueDate", SqlDbType.DateTime).Value = inspectTxt;
            string updateStr = "Update Case_Info set Inspector_Signature=@InspSig, Cert_IssueDate=@CertIssueDate, Inspection_Status=@InspectionStatus WHERE Case_Num='" + caseNumber + "'";
            cmd.CommandText = updateStr;
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        //Updates InspectionStatus, dependent upon Violations & Schedule Dates
        private void UpdateInspectionStatus()
        {
            if (txtInspectDate.Text == string.Empty)
                txtInspectionStatus.Text = InspectionStatus.Not_Scheduled.ToString();
            else if ( cBNoViolations.Checked )
                txtInspectionStatus.Text = InspectionStatus.Completed.ToString();
            else if ( !cBNoViolations.Checked )
                txtInspectionStatus.Text = InspectionStatus.Failed.ToString();
            if ( txtInspectionStatus.Text == InspectionStatus.Failed.ToString() && hasReinspectDate)            
                txtInspectionStatus.Text = InspectionStatus.Pending_Reinspection.ToString();                  
        }
        //updates Main headings to turn Major/Minor/Notes section to unavailable
        protected void DisableSubHeadings()
        {
            foreach (GridViewRow row in InspectionGrid.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    Label desc = ((Label)InspectionGrid.Rows[row.RowIndex].Cells[3].FindControl("lblDescription"));
                    if (desc.Text == string.Empty || desc.Text == null)
                    {
                        CheckBox cmajor = (CheckBox)InspectionGrid.Rows[row.RowIndex].Cells[5].FindControl("cbMajor");
                        cmajor.Visible = false;
                        CheckBox cminor = (CheckBox)InspectionGrid.Rows[row.RowIndex].Cells[6].FindControl("cbMinor");
                        cminor.Visible = false;
                        TextBox notes = ((TextBox)InspectionGrid.Rows[row.RowIndex].Cells[7].FindControl("txbNotes"));
                        notes.Visible = false;
                    }
                }
            }
        }
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
                btnMail.Visible = false;
            }
            else if (!cBNoViolations.Checked)
            {
                btnCertificateInspection.Visible = false;
                btnReinspectionNotice.Visible = true;
                btnNoticeNonCompliance.Visible = true;
                btnMail.Visible = true;
            }
        }      
       private void EmailInspection(string caseNumber)
{
	DbCommon clsCommon = new DbCommon();
	string SQL = "SELECT DISTINCT "
					+ "CASE_INFO.Case_Num, "
					+ "PROPERTY_INFO.Applicant_Email, "
					+ "INSPECTOR_INFO.Inspector_Email, "
					+ "VIOLATIONS.SubSection_ID, "
					+ "VIOLATIONS.SubSection_Major, "
					+ "VIOLATIONS.SubSection_Minor, "
					+ "VIOLATIONS.SubSection_Notes, "
					+ "CL_SectionDetail.SubSectionSeq_ID, "
					+ "CL_SectionDetail.SubSection_Desc, "
					+ "CL_SectionDetail.Section_ID "
					+ "FROM CASE_INFO "
					+ "INNER JOIN PROPERTY_INFO ON CASE_INFO.Property_ID = PROPERTY_INFO.Property_ID "
					+ "INNER JOIN INSPECTOR_INFO ON CASE_INFO.Inspector_ID = INSPECTOR_INFO.Inspector_ID "
					+ "INNER JOIN VIOLATIONS ON CASE_INFO.Case_Num = VIOLATIONS.Case_Num "
					+ "INNER JOIN CL_SectionDetail  ON CL_SectionDetail.SubSection_ID = VIOLATIONS.SubSection_ID "
					+ "WHERE CASE_INFO.Case_Num = '" + caseNumber + "' "
					+ "ORDER BY CL_SectionDetail.SubSectionSeq_ID";
	var dt = clsCommon.TestDBConnection(SQL);

	if (dt.Rows.Count > 0)
	{
		string to = "";
		string body = "";

		var headings = "Section\tViolation\tMajor/Minor\tNotes";
		foreach (DataRow dr in dt.Rows)
		{
			to = dr["Applicant_Email"].ToString() + ";" + dr["Inspector_Email"].ToString();

			var list = new System.Collections.Generic.List<string>();
			var major = Convert.ToBoolean(dr["SubSection_Major"]);
			if (major) list.Add("Major");
			var minor = Convert.ToBoolean(dr["SubSection_Minor"]);
			if (minor) list.Add("Minor");

			var notes = dr["SubSection_Notes"].ToString();

			body += string.Format("{0}\t{1}\t{2}\t{3}\n",
							dr["Section_ID"].ToString(),
							dr["SubSection_Desc"].ToString(),                                    
							string.Join("/", list.ToArray()),
							notes
							);
		}

		var subject = string.Format("Inspection Violations for Case Number: {0}", caseNumber);
		body = string.Format("Case Number: {0}\nProperty Address: {1}\n\n\n", caseNumber, txtPropAdd.Text) +
				string.Format("{0}\n{1}", headings, body);

		string url = string.Format("mailto:{0}?subject={1}&body={2}", to, Server.UrlPathEncode(subject), Server.UrlPathEncode(body));
		string script = string.Format("parent.location='{0}'", url);
		ScriptManager.RegisterStartupScript(this, GetType(), "mailto", script, true);
	}
}
       private void BindGrid(string caseNumber)
       {
           DbCommon clsCommon = new DbCommon();
           string constr = ConfigurationManager.ConnectionStrings["DBOIT"].ConnectionString;
           using (SqlConnection con = new SqlConnection(constr))
           {
               using (SqlCommand cmd = new SqlCommand())
               {
                   cmd.CommandText = "select Image_ID, Image_Name FROM [INSPECTION_IMAGES] Where[INSPECTION_IMAGES].Case_Num ='" + caseNumber + "'";
                   // cmd.CommandText = "DELETE * FROM [INSPECTION_IMAGES] Where[INSPECTION_IMAGES].Case_Num ='" + caseNumber + "'";
                   cmd.Connection = con;
                   con.Open();
                   ImageGridView.DataSource = cmd.ExecuteReader();
                   ImageGridView.DataBind();
                   con.Close();
               }
           }
       }
       private void StartUpLoad(string caseNumber)
       {

           //get the file name of the posted image  
           string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
           string contentType = FileUpload1.PostedFile.ContentType;
           using (Stream fs = FileUpload1.PostedFile.InputStream)
           {
               using (BinaryReader br = new BinaryReader(fs))
               {
                   byte[] bytes = br.ReadBytes((Int32)fs.Length);

                   DbCommon clsCommon = new DbCommon();
                   {
                       string query = "insert into INSPECTION_IMAGES values (@Case_num, @Image_Name, @Picture)";
                       using (SqlCommand cmd = new SqlCommand(query))
                       {
                           cmd.Connection = conn;
                           cmd.Parameters.AddWithValue("@Case_num", caseNumber);
                           cmd.Parameters.AddWithValue("@Image_Name", filename);
                           cmd.Parameters.AddWithValue("@Picture", bytes);
                           conn.Open();
                           cmd.ExecuteNonQuery();
                           conn.Close();
                           BindGrid(caseNumber);
                       }
                   }
               }
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
            UpdateInspectionStatus();
            UpdateCertification(txtCaseNum.Text);
            UpdateViolationRecord(txtCaseNum.Text);
            Response.Redirect("InspectionChecklist.aspx?CaseNumber=" + txtCaseNum.Text);
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
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            DbCommon clsCommon = new DbCommon();
            string SQL = "SELECT * FROM[VIOLATIONS] Where[VIOLATIONS].Case_Num ='" + txtCaseNum.Text + "'";
            var dt1 = clsCommon.TestDBConnection(SQL);
            //check to see if there is an existing Violations case
            if (dt1.Rows.Count > 0)
            {
                StartUpLoad(txtCaseNum.Text);
            }
        }
        #endregion
        protected void DownloadFile(object sender, EventArgs e)
        {
            int id = int.Parse((sender as LinkButton).CommandArgument);
            byte[] bytes;
            string fileName, contentType;
            DbCommon clsCommon = new DbCommon();
            string constr = ConfigurationManager.ConnectionStrings["DBOIT"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select Image_Name, Case_Num, Picture FROM [INSPECTION_IMAGES] Where[INSPECTION_IMAGES].Image_ID ='" + id + "'";
                    cmd.Parameters.AddWithValue("@Image_ID", id);
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        sdr.Read();
                        bytes = (byte[])sdr["Picture"];
                        contentType = sdr["Case_Num"].ToString();
                        fileName = sdr["Image_Name"].ToString();
                    }
                    con.Close();
                }
            }
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = contentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.End();
        }
        protected void RemoveFile(object sender, EventArgs e)
        {
            DbCommon clsCommon = new DbCommon();
            string SQL = "SELECT * FROM[VIOLATIONS] Where[VIOLATIONS].Case_Num ='" + txtCaseNum.Text + "'";
            var dt1 = clsCommon.TestDBConnection(SQL);
            //check to see if there is an existing Violations case
            if (dt1.Rows.Count > 0)
            {
                int id = int.Parse((sender as LinkButton).CommandArgument);
                string constr = ConfigurationManager.ConnectionStrings["DBOIT"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        // cmd.CommandText = "select Image_ID, Image_Name FROM [INSPECTION_IMAGES] Where[INSPECTION_IMAGES].Case_Num ='" + caseNumber + "'";
                        cmd.CommandText = "DELETE FROM [INSPECTION_IMAGES] Where[INSPECTION_IMAGES].Image_ID ='" + id + "'";
                        cmd.Parameters.AddWithValue("@Image_ID", id);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        // ImageGridView.DataSource = cmd.ExecuteReader();
                        // ImageGridView.DataBind();
                        con.Close();
                        BindGrid(txtCaseNum.Text);

                    }
                }
            }
        }
        protected void ImageGridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }  
    }
}
