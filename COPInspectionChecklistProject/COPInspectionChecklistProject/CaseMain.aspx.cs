using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;
using COPInspectionChecklistProject.Common;

namespace COPInspectionChecklistProject
  {
    
     public partial class CaseMain : Page {
          Case newCase = new Case();
         protected void Page_Load(object sender, EventArgs e)
         {
            try
              {
                  //if page loads with a current case (from page InspectionMain or CaseList), run this code
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

            if (dt.Rows.Count > 0) {

                string SQL2 = "SELECT * FROM[INSPECTOR_INFO] Where[INSPECTOR_INFO].Inspector_ID ='" + dt.Rows[0]["Inspector_ID"].ToString() + "'";

                var dtInspector = clsCommon.TestDBConnection(SQL2);
                               
                txtCaseNum.Text = dt.Rows[0]["Case_Num"].ToString();
                txtPropAdd.Text = dt.Rows[0]["Property_StreetNumber"].ToString() + " " + dt.Rows[0]["Property_StreetName"].ToString() + " " + dt.Rows[0]["Property_Zip"].ToString();
                txtRespParty.Text = dt.Rows[0]["Applicant_Name"].ToString();
                txtMailAdd.Text = dt.Rows[0]["Mailing_StreetNumber"].ToString() + " " + dt.Rows[0]["Mailing_StreetName"].ToString() + " " + dt.Rows[0]["Mailing_Zip"].ToString(); 
                txtEmail.Text = dt.Rows[0]["Applicant_Email"].ToString(); 
                txtAppPhone.Text = dt.Rows[0]["Applicant_Phone"].ToString();
                txtOccDwell.Text = dt.Rows[0]["Dwelling_info"].ToString();
                txtNumUnits.Text = dt.Rows[0]["NumberOfUnits"].ToString();
                txtOwnerName.Text = dt.Rows[0]["Property_Owner_Name"].ToString();
                txtOwnerPhone.Text = dt.Rows[0]["Property_Owner_Phone"].ToString();
                txtSidewalk.Text = dt.Rows[0]["Sidewalk_Fee"].ToString();
                txtInspector.Text = dtInspector.Rows[0]["Inspector_FName"].ToString() + " " + dtInspector.Rows[0]["Inspector_LName"].ToString();
                txtInspectEmail.Text = dtInspector.Rows[0]["Inspector_Email"].ToString();
                txtInspectDate.Text = Convert.ToDateTime(dt.Rows[0]["Inspection_Date"]).ToString();
                txtReinspectDate.Text = Convert.ToDateTime(dt.Rows[0]["ReInspection_Date"]).ToString();
            }
        }

    /*
            private void getCaseByCaseNumber(string caseNumber) {
                Case caseNo = new Case();          
                string cs = ConfigurationManager.ConnectionStrings["Data Source=teamdbserver.database.windows.net;Initial Catalog=OITDB;Persist Security Info=False;User ID=DBAdmin;Password=Mon#2017;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(cs))
                {

                    //string sql1 = "SELECT CASE_NUM From [CASE_INFO] Where CASE_NUM is " + caseNumber;
                    string sql1 = "SELECT * FROM[CASE_INFO] INNER JOIN[PROPERTY_INFO] ON[CASE_INFO].Property_ID = [PROPERTY_INFO].Property_ID Where[CASE_INFO].Case_Num ='" + caseNumber + "'";

                    SqlCommand cmd = new SqlCommand(sql1, conn);
                    conn.Open();
                    SqlDataReader rdr1 = cmd.ExecuteReader();
                        if(rdr1.Read())
                        {
                            caseNo.caseNumber = rdr1["Case_Num"].ToString();
                            caseNo.inspectionDate = Convert.ToDateTime(rdr1["Inspection_Date"]);
                            caseNo.reinspectionDate = Convert.ToDateTime(rdr1["ReInspection_Date"]);
                            caseNo.inspector_ID = Convert.ToInt32(rdr1["Inspector_ID"]);
                            caseNo.property_ID = Convert.ToInt32(rdr1["[Property_ID]"]);
                        }
                        string sql2 = "SELECT INSPECTOR_ID From [INSPECTOR_INFO] Where INSPECTOR_ID is " + caseNo.inspector_ID;
                        cmd = new SqlCommand(sql2, conn);
                    SqlDataReader rdr2 = cmd.ExecuteReader();
                    if (rdr2.Read())
                        {
                            caseNo.inspector = (string)rdr2["Inspector_FName"] + rdr2["Inspector_LName"];
                            caseNo.inspectorEmail = (string)rdr2["Inspector_Email"];
                    }
                    string sql3 = "SELECT PROPERTY_ID From [PROPERTY_INFO] Where PROPERTY_ID is " + caseNo.property_ID;
                        cmd = new SqlCommand(sql3, conn);
                        SqlDataReader rdr3 = cmd.ExecuteReader();
                        if (rdr3.Read())
                        {

                        }
                }
                    newCase = caseNo;
                }
                private void insertDataIntoTable() {
                    //loads data from newCase into datatable
                    txtCaseNum.Text = newCase.caseNumber;
                    txtPropAdd.Text = newCase.propertyAddress;
                    txtRespParty.Text = newCase.responsibleParty;
                    txtMailAdd.Text = newCase.mailingAddress;
                    txtEmail.Text = newCase.emailAddress;
                    txtAppPhone.Text = newCase.applicantPhone;
                    txtOccDwell.Text = newCase.occupantDwellInfo;
                    txtNumUnits.Text = newCase.numUnits.ToString();
                    txtOwnerName.Text = newCase.ownerName;
                    txtOwnerPhone.Text = newCase.ownerPhone;
                    txtSidewalk.Text = newCase.sidewalkFees.ToString();
                    txtInspector.Text = newCase.inspector;
                    txtInspectEmail.Text = newCase.inspectorEmail;
                    txtInspectDate.Text = newCase.inspectionDate.ToString();
                    txtReinspectDate.Text = newCase.reinspectionDate.ToString();
                }
            */
        public string CaseNumber
        {
            get { return newCase.caseNumber; }
        }
        #region buttons
        protected void btnSave_Click(object sender, EventArgs e)
        {
            /// <summary>
            /// Save button updates database for new Case with current attributes
            /// currently holds dummy info to save data to database
            /// </summary>
            /// <param name="sender"></param>
            /// <param name="e"></param>
        }
        protected void btnDelete_Click(object sender, EventArgs e) {
            /// <summary>
            /// Delete button removes selected CaseNumber from database
            /// currently holds dummy data to remove data from database
            /// </summary>
            /// <param name="sender"></param>
            /// <param name="e"></param>
        }
        protected void btnInspectionChecklist_Click(object sender, EventArgs e)
        {
            if (txtCaseNum.Text.Trim() != "")
            {
                SearchForCase(txtCaseNum.Text);
            }
        }
        private void SearchForCase(string Case) { 
            DbCommon clsCommon = new DbCommon();
            string SQL = "SELECT * FROM [CASE_INFO] where Case_Num = '" + Case + "'";
            var dt2 = clsCommon.TestDBConnection(SQL);

            if (dt2.Rows.Count > 0)
            {
                Session["CaseNumber"] = Case;
                Response.Redirect("InspectionChecklist.aspx?CaseNumber=" + Case);
            }
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