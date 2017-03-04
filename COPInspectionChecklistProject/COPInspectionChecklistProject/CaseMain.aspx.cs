using System;
using System.Web.UI;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace COPInspectionChecklistProject
{
    public partial class CaseMain : Page {
        protected Case activeCase;
         
        public void ConnectDB() {
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["CoPOITConnectionString"].ConnectionString);
            con.Open();
            if(con.State == System.Data.ConnectionState.Open)
            {
                //DisplayMessage(this, "Connection to database successful"); //displays message on successfull db connection
            }
        }
        public static void DisplayMessage(Control page, string msg)
        {
            string myScript = string.Format("alert('{0}')", msg);
            ScriptManager.RegisterStartupScript(page, page.GetType(), "Myscript", myScript, true);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            ConnectDB();
        }
        public void newCase()
        {
            activeCase = new Case();
        }
        public void loadCase()
        {
            activeCase.caseNumber = "";
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {

        }
        protected void btnDelete_Click(object sender, EventArgs e)
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