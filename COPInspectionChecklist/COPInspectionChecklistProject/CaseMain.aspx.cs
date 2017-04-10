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
        Case newCase = new Case();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBOIT"].ConnectionString);

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
                txtMailAdd.Text = dt.Rows[0]["Mailing_StreetNumber"].ToString() + " " + dt.Rows[0]["Mailing_StreetName"].ToString() + " " + dt.Rows[0]["Mailing_Zip"].ToString();
                txtRespParty.Text = dt.Rows[0]["Applicant_Name"].ToString();
                txtAppEmail.Text = dt.Rows[0]["Applicant_Email"].ToString();
                txtAppPhone.Text = dt.Rows[0]["Applicant_Phone"].ToString();
                txtOccDwell.Text = dt.Rows[0]["Dwelling_info"].ToString();
                txtNumUnits.Text = dt.Rows[0]["NumberOfUnits"].ToString();
                txtOwnerName.Text = dt.Rows[0]["Property_Owner_Name"].ToString();
                txtOwnerPhone.Text = dt.Rows[0]["Property_Owner_Phone"].ToString();
                if ( Convert.ToBoolean(dt.Rows[0]["Sidewalk_Fee"]))
                    txtSidewalk.Text = "YES";
                else
                    txtSidewalk.Text = "NO";
                txtInspector.Text = dtInspector.Rows[0]["Inspector_FName"].ToString() + " " + dtInspector.Rows[0]["Inspector_LName"].ToString();
                txtInspectEmail.Text = dtInspector.Rows[0]["Inspector_Email"].ToString();
                if (dt.Rows[0]["Inspection_Date"] == null)
                    txtInspectDate.Text = " ";
                else
                    txtInspectDate.Text = Convert.ToDateTime(dt.Rows[0]["Inspection_Date"]).ToString();
                if (dt.Rows[0]["ReInspection_Date"] == null)
                    txtReinspectDate.Text = " ";
                else
                    txtReinspectDate.Text = Convert.ToDateTime(dt.Rows[0]["ReInspection_Date"]).ToString();
            }
        }
        private void UpdateCaseByCaseNumber(string caseNumber)
        {
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
                string updateCase = "Update Case_Info set Inspection_Date=@InspectDate ReInspection_Date=@ReinspectDate WHERE Case_Num='" + caseNumber + "'";
                cmd.CommandText = updateCase;
                cmd.Parameters.Add("@InspectDate", SqlDbType.DateTime).Value = txtInspectDate.Text;
                cmd.Parameters.Add("@ReinspectDate", SqlDbType.DateTime).Value = txtReinspectDate.Text;
                cmd.ExecuteNonQuery();

                //Updating Inspector_Info record
                string[] myName = txtInspector.Text.Split(' ');
                string inspectorFName = myName[0];
                string inspectorLName = myName[1];
                string updateInspector = "Update Inspector_Info set " +
                    "Inspector_FName=@InspectorFName "+
                    "Inspector_LName=@InspectorLName " +
                    "Inspector_Email=@InspectorEmail " +
                    "where Inspector_ID='" + dt1.Rows[0]["Inspector_ID"] + "'";
                cmd.CommandText = updateInspector;
                cmd.Parameters.AddWithValue("@InspectorFName",inspectorFName);
                cmd.Parameters.AddWithValue("@InspectorLName", inspectorLName);
                cmd.Parameters.AddWithValue("@InspectorEmail", txtInspectEmail.Text);
                cmd.ExecuteNonQuery();
                conn.Close();
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
            UpdateCaseByCaseNumber(txtCaseNum.Text);
        }
    }
    #endregion
}

/*
                //Updating the Property_Info record
                string[] myPropAdd = txtPropAdd.Text.Split(' ');
                string propertyStreetNumber = myPropAdd[0];
                string propertyStreetName =myPropAdd[1];
                string propertyZip =myPropAdd[2];
                string[] myMailAdd = txtMailAdd.Text.Split(' ');
                string mailStreetNumber =myMailAdd[0];
                string mailStreetName =myMailAdd[1];
                string mailZip =myMailAdd[2];
                string updateProperty = "Update Property_Info set "+
                        "Property_StreetNumber=@PropStreetNumber "+
                        "Property_StreetName=@PropStreetName "+
                        "Property_Zip=@PropZip "+
                        "Property_Owner_Name=@OwnerName "+
                        "Property_Owner_Phone=@OwnerPhone "+
                        "Applicant_Name=@ApplicantName "+
                        "Applicant_Phone=@ApplicantPhone "+
                        "Applicant_Email=@ApplicantEmail "+
                        "Mailing_StreetNumber=@MailStreetNumber "+
                        "Mailing_StreetName=@MailStreetName "+
                        "Mailing_Zip=@MailZip "+
                        "DwellingInfo=@DwellInfo "+
                        "NumberOfUnits=@NumUnits "+
                        "Sidewalk_Fee=@SidewalkFee "+
                        "where Property_ID='"+dt1.Rows[0]["Property_ID"]+"'";
                cmd.CommandText = updateProperty;
                cmd.Parameters.AddWithValue("@PropStreetNumber", propertyStreetNumber);
                cmd.Parameters.AddWithValue("@PropStreetName", propertyStreetName);
                cmd.Parameters.AddWithValue("@PropZip", propertyZip);
                cmd.Parameters.AddWithValue("@OwnerName", txtOwnerName.Text);
                cmd.Parameters.AddWithValue("@OwnerPhone", txtOwnerPhone.Text);
                cmd.Parameters.AddWithValue("@ApplicantName", txtRespParty.Text);
                cmd.Parameters.AddWithValue("@ApplicantPhone", txtAppPhone.Text);
                cmd.Parameters.AddWithValue("@ApplicantEmail", txtAppEmail.Text);
                cmd.Parameters.AddWithValue("@MailStreetNumber", mailStreetNumber);
                cmd.Parameters.AddWithValue("@MailStreetName", mailStreetName);
                cmd.Parameters.AddWithValue("@MailZip", mailZip);
                cmd.Parameters.AddWithValue("@DwellInfo", txtOccDwell.Text);
                cmd.Parameters.AddWithValue("@NumUnits", txtNumUnits.Text);
                cmd.Parameters.Add("@SidewalkFee", SqlDbType.Bit).Value = txtSidewalk;
                cmd.ExecuteNonQuery(); 
 */
