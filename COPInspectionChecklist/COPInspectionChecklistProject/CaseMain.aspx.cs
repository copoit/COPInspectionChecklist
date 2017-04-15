using System;
using System.Web.UI;
using COPInspectionChecklistProject.Common;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Data;

namespace COPInspectionChecklistProject
{
    public partial class CaseMain : Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBOIT"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    getInspectorList();
                    if (Request.QueryString["CaseNumber"] != null)
                    {
                        string caseNumber = Request.QueryString["CaseNumber"];
                        getCase(caseNumber);
                    }
                    else if (Request.QueryString["PropertyID"] != null)
                    {
                        string propertyID = Request.QueryString["PropertyID"];
                        getProperty(propertyID);                        
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }
        }
        private void getCase(string caseNumber)
        {
            DbCommon clsCommon = new DbCommon();
            string SQL = "SELECT * FROM[CASE_INFO] INNER JOIN[PROPERTY_INFO] ON[CASE_INFO].Property_ID = [PROPERTY_INFO].Property_ID Where[CASE_INFO].Case_Num ='" + caseNumber + "'";

            var dt = clsCommon.TestDBConnection(SQL);

            if (dt.Rows.Count > 0)
            {
                txtCaseNum.Text = dt.Rows[0]["Case_Num"].ToString();
                txtPropAdd.Text = dt.Rows[0]["Property_StreetNumber"].ToString() + " " + dt.Rows[0]["Property_StreetName"].ToString() + " " + dt.Rows[0]["Property_Zip"].ToString();
                txtMailAdd.Text = dt.Rows[0]["Mailing_StreetNumber"].ToString() + " " + dt.Rows[0]["Mailing_StreetName"].ToString() + " " + dt.Rows[0]["Mailing_Zip"].ToString();
                txtRespParty.Text = dt.Rows[0]["Applicant_Name"].ToString();
                txtAppEmail.Text = dt.Rows[0]["Applicant_Email"].ToString();
                txtAppPhone.Text = dt.Rows[0]["Applicant_Phone"].ToString();
                txtOccDwell.Text = dt.Rows[0]["Dwelling_info"].ToString();
                txtNumUnits.Text = dt.Rows[0]["NumberOfUnits"].ToString();
                txtOwnerName.Text = dt.Rows[0]["Property_Owner_Name"].ToString();
                txtOwnerPhone.Text = dt.Rows[0]["Property_Owner_Phone"].ToString();
                txtInspectionType.Text = dt.Rows[0]["Inspection_Type"].ToString();
                txtInspectionStatus.Text = dt.Rows[0]["Inspection_Status"].ToString();
                ddlInspector.SelectedValue =  dt.Rows[0]["Inspector_ID"].ToString();
                //set Certification issue date, if null set to empty string
                if (Convert.ToBoolean(dt.Rows[0]["Sidewalk_Fee"]))
                    txtSidewalk.Text = "YES";
                else
                    txtSidewalk.Text = "NO";
                setInspectorEmail(ddlInspector.SelectedValue);
                //set Inspection date, if null set to empty string. set inspectionStatus
                if (dt.Rows[0]["Inspection_Date"] == null || dt.Rows[0]["Inspection_Date"].ToString() == string.Empty)
                    txtInspectDate.Text = string.Empty;
                else
                    txtInspectDate.Text = Convert.ToDateTime(dt.Rows[0]["Inspection_Date"]).ToString();
                //set Reinspection date, if null set to empty string
                if (dt.Rows[0]["ReInspection_Date"] == null || dt.Rows[0]["ReInspection_Date"].ToString() == string.Empty)
                    txtReinspectDate.Text = string.Empty;
                else
                    txtReinspectDate.Text = Convert.ToDateTime(dt.Rows[0]["ReInspection_Date"]).ToString();                                
            }
        }
        private void getProperty(string propertyID)
        {
            DbCommon clsCommon = new DbCommon();
            string SQL = "Select * from[PROPERTY_INFO] Where PROPERTY_INFO.Property_ID='" + propertyID + "'";
            var dt = clsCommon.TestDBConnection(SQL);

            if (dt.Rows.Count > 0)
            {
                txtPropAdd.Text = dt.Rows[0]["Property_StreetNumber"].ToString() + " " + dt.Rows[0]["Property_StreetName"].ToString() + " " + dt.Rows[0]["Property_Zip"].ToString();
                txtMailAdd.Text = dt.Rows[0]["Mailing_StreetNumber"].ToString() + " " + dt.Rows[0]["Mailing_StreetName"].ToString() + " " + dt.Rows[0]["Mailing_Zip"].ToString();
                txtRespParty.Text = dt.Rows[0]["Applicant_Name"].ToString();
                txtAppEmail.Text = dt.Rows[0]["Applicant_Email"].ToString();
                txtAppPhone.Text = dt.Rows[0]["Applicant_Phone"].ToString();
                txtOccDwell.Text = dt.Rows[0]["Dwelling_info"].ToString();
                txtNumUnits.Text = dt.Rows[0]["NumberOfUnits"].ToString();
                txtOwnerName.Text = dt.Rows[0]["Property_Owner_Name"].ToString();
                txtOwnerPhone.Text = dt.Rows[0]["Property_Owner_Phone"].ToString();
                txtInspectionStatus.Text = InspectionStatus.Not_Scheduled.ToString();
                txtInspectionType.Text = "Occupancy Inspection";
                ddlInspector.SelectedValue = "INS00";
                setInspectorEmail(ddlInspector.SelectedValue);
                if (Convert.ToBoolean(dt.Rows[0]["Sidewalk_Fee"]))
                    txtSidewalk.Text = "YES";
                else
                    txtSidewalk.Text = "NO";
                txtCaseNum.Enabled = true;
                txtReinspectDate.Enabled = false;
                txtCaseNum.Text = "Enter new Case Number";
                txtPropID.Text = propertyID;
            }
        }
        private void getInspectorList()
        {
            string CS = ConfigurationManager.ConnectionStrings["DBOIT"].ConnectionString;
            using(SqlConnection conn = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("Select Inspector_ID, Inspector_FName +' '+Inspector_LName as InspectorName from Inspector_Info", conn);
                conn.Open();                
                ddlInspector.DataSource = cmd.ExecuteReader();
                ddlInspector.DataBind();                
                conn.Close();
            }      
        }
        private void setInspectorEmail(string inspectorID)
        {
            DbCommon clsCommon = new DbCommon();
            string SQL = "Select Inspector_Email from Inspector_Info where Inspector_Info.Inspector_ID='" + inspectorID + "'";
            var dt1 = clsCommon.TestDBConnection(SQL);
            txtInspectEmail.Text = dt1.Rows[0]["Inspector_Email"].ToString();
        }
        protected void ddlInspector_SelectedIndexChanged(object sender, EventArgs e)
        {
            setInspectorEmail(ddlInspector.SelectedValue);
        }
        private void UpdateCaseByCaseNumber(string caseNumber)
        {
            try
            {
                UpdateStatus();
                DbCommon clsCommon = new DbCommon();
                string SQL = "SELECT * FROM[CASE_INFO] Where[CASE_INFO].Case_Num ='" + caseNumber + "'";
                var dt1 = clsCommon.TestDBConnection(SQL);
                //check to see if there is an existing Case
                if (dt1.Rows.Count > 0)
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = conn;
                    //Updating the Case_Info record                
                    string updateCase = "Update Case_Info set Inspection_Date=@InspectDate, ReInspection_Date=@ReinspectDate, Inspector_ID=@InspectorID WHERE Case_Num='" + caseNumber + "'";
                    cmd.CommandText = updateCase;
                    cmd.Parameters.AddWithValue("@InspectorID", ddlInspector.SelectedValue);
                    if (txtInspectDate.Text == null || txtInspectDate.Text == "")
                        cmd.Parameters.AddWithValue("@InspectDate", DBNull.Value);
                    else
                        cmd.Parameters.Add("@InspectDate", SqlDbType.DateTime).Value = txtInspectDate.Text;
                    if (txtReinspectDate.Text == null || txtReinspectDate.Text == "")
                        cmd.Parameters.AddWithValue("@ReinspectDate", DBNull.Value);
                    else
                        cmd.Parameters.Add("@ReinspectDate", SqlDbType.DateTime).Value = txtReinspectDate.Text;
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    lblMessage.Text = "Case information updated successfully";
                }
                else
                    CreateNewCase(caseNumber);
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Case update failed!";
                throw ex;
            }
        }
        private void UpdateStatus()
        {
            if (txtInspectDate.Text == string.Empty)
                txtInspectionStatus.Text = InspectionStatus.Not_Scheduled.ToString();
            else if (txtInspectDate.Text != string.Empty && (txtInspectionStatus.Text != InspectionStatus.Failed.ToString() || txtInspectionStatus.Text != InspectionStatus.Pending_Reinspection.ToString() || txtInspectionStatus.Text != InspectionStatus.Completed.ToString()))
                txtInspectionStatus.Text = InspectionStatus.Scheduled.ToString();            
            if (txtInspectionStatus.Text == InspectionStatus.Failed.ToString() && txtReinspectDate.Text != string.Empty)
                txtInspectionStatus.Text = InspectionStatus.Pending_Reinspection.ToString();
        }
        private void CreateNewCase(string caseNumber)
        {
            try
            {
                UpdateStatus();
                if(txtCaseNum.Text == string.Empty || txtCaseNum.Text == "Enter new Case Number")
                {
                    lblCaseMessage.Text = "Invalid case number";
                    throw new Exception();
                }
                DbCommon clsCommon = new DbCommon();
                string Sql = "Select * from Case_Info where Case_Num = '" + txtCaseNum.Text + "'";
                var dt = clsCommon.TestDBConnection(Sql);
                if (dt.Rows.Count > 0)
                {
                    lblCaseMessage.Text = "That Case Number is already in use. Choose another!";
                    throw new Exception();
                }

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBOIT"].ConnectionString);
                conn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                string SQL = "INSERT into CASE_INFO (Case_Num, Case_Date, Inspector_ID, Property_ID, Inspection_Date, ReInspection_Date, Inspection_Type, Inspection_Status, Citation_Charges, Inspector_Notes, Inspector_Signature, Cert_IssueDate)" +
                    " Values (@CaseNumber, @CaseDate, @InspectorID, @PropertyID, @InspectionDate, @ReinspectionDate, @InspectionType, @InspectionStatus, @CitationCharges, @InspectorNotes, @InspectorSign, @CertDate)";
                cmd.CommandText = SQL;
                cmd.Parameters.AddWithValue("@CaseNumber", caseNumber);
                cmd.Parameters.AddWithValue("@CaseDate", DateTime.Today);
                cmd.Parameters.AddWithValue("@InspectorID", ddlInspector.SelectedValue);
                cmd.Parameters.AddWithValue("@PropertyID", txtPropID.Text);
                if (txtInspectDate.Text == null || txtInspectDate.Text == "")
                    cmd.Parameters.AddWithValue("@InspectionDate", DBNull.Value);
                else
                    cmd.Parameters.Add("@InspectionDate", SqlDbType.DateTime).Value = txtInspectDate.Text;
                if (txtReinspectDate.Text == null || txtReinspectDate.Text == "")
                    cmd.Parameters.AddWithValue("@ReinspectionDate", DBNull.Value);
                else
                    cmd.Parameters.Add("@ReinspectionDate", SqlDbType.DateTime).Value = txtReinspectDate.Text;
                cmd.Parameters.AddWithValue("@InspectionType", txtInspectionType.Text);
                cmd.Parameters.AddWithValue("@InspectionStatus", txtInspectionStatus.Text);
                cmd.Parameters.AddWithValue("@CitationCharges", 0);
                cmd.Parameters.AddWithValue("@InspectorNotes", DBNull.Value);
                cmd.Parameters.AddWithValue("@InspectorSign", DBNull.Value);
                cmd.Parameters.AddWithValue("@CertDate", DBNull.Value);
                cmd.ExecuteNonQuery();
                conn.Close();
                lblMessage.Text = "Case information updated successfully";
                txtCaseNum.Enabled = false;
            }
            catch(Exception ex)
            {
                lblMessage.Text = "Case information save failed!";
                throw ex;
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
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtCaseNum.Enabled == true)
                    CreateNewCase(txtCaseNum.Text);
                else
                    UpdateCaseByCaseNumber(txtCaseNum.Text);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
    #endregion
}