using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace COPInspectionChecklistProject
{
    public partial class CaseMain : Page {
        public string caseNumber;
        protected void Page_Load(object sender, EventArgs e)
        {
            caseNumber = Request.QueryString["CaseNumber"];
            Case caseNo = getCaseByCaseNumber(caseNumber);
            insertData(caseNo);
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {

        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {

        }
        public Case getCaseByCaseNumber(string caseNumber)
        {
            Case caseNo = new Case();
            string cs = ConfigurationManager.ConnectionStrings["CoPOIT"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spGetCaseByCaseNumber", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter parameter = new SqlParameter("@CaseNumber", caseNumber);
                cmd.Parameters.Add(parameter);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
            }
            return caseNo;
        }
        public void insertData(Case newCase) {
            //txtCaseNum = newCase.caseNumber;
            //txtpropertyAddress = propAdd;
            //txtresponsibleParty = resParty; ;
            //txtmailingAddress = mail;
            //txtemail = email;
            //txtapplicantPhone = appPhone;
            //txtoccupantDwellInfo = dwell;
            //txtnumUnits = units;
            //txtownerName = owner;
            //txtownerPhone = ownPhone;
            //txtsidewalkFees = fees;
            //txtinspector = inspect;
            //txtinspectorEmail = inspectPhone;
            //txtinspectionDate = insDate;
            //txtreinspectionDate = reinsDate;
        }
        /* Loaded from Inspection  Main
        protected void btnSearchCase_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CaseMain.aspx.CaseNumber" + txtCaseNumber.Text;
        }
        */
        /* Loaded from Case List
        protected void btnSearchCase_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CaseMain.aspx.CaseNumber" + txtCaseNumber.Text;
        }
        */
        public void deleteData(string name)
        {

        }
        protected void btnInspectionChecklist_Click(object sender, EventArgs e)
        {
            Response.Redirect("InspectionChecklist.aspx");
        }
        protected void btnCertificateInspection_Click(object sender, EventArgs e)
        {
            Response.Redirect("CertInspection.aspx");
        }
        protected void btnReinspectionNotice_Click(object sender, EventArgs e)
        {
            Response.Redirect("ReinspectNotice.aspx");
        }
        protected void btnNoticeNonCompliance_Click(object sender, EventArgs e)
        {
            Response.Redirect("NoticeNonCompliance.aspx");
        }
    }
}



