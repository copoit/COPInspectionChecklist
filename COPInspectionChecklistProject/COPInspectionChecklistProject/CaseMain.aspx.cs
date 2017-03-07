using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace COPInspectionChecklistProject
{
    public partial class CaseMain : Page
    {
        public string caseNumber;
        string conn = ConfigurationManager.ConnectionStrings["OITDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["CaseNumber"] != null)
            {
                caseNumber = Request.QueryString["CaseNumber"];
                Case caseNo = getCaseByCaseNumber(caseNumber);
                insertData(caseNo);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            SqlDataAdapter ada = new SqlDataAdapter("Insert into CaseMain('" + txtCaseNum + "'.'" + txtPropAdd + "','" + txtRespParty
                    + "','" + txtMailAdd + "','" + txtEmail + "','" + txtAppPhone + "','" + txtOccDwell + "','" + txtNumUnits + "','" + txtOwnerName
                    + "','" + txtOwnerPhone + "','" + txtSidewalk + "','" + txtInspector + "','" + txtInspectEmail + "','" + txtInspectDate + "','"
                    + txtReinspectDate + ")", conn);
            DataSet ds = new DataSet();
            ada.Fill(ds);
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(conn))
            {
                SqlCommand cmd = new SqlCommand("Delete from tblCaseMain where caseNumber = @CaseNumber", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter parameter = new SqlParameter("@CaseNumber", caseNumber);
                cmd.Parameters.Add(parameter);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
        public Case getCaseByCaseNumber(string caseNumber)
        {
            Case caseNo = new Case();
            using (SqlConnection con = new SqlConnection(conn))
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
        public void insertData(Case newCase)
        {
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