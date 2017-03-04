using System;
using System.Web.UI;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace COPInspectionChecklistProject
{
    public partial class CaseMain : Page {
        protected Case activeCase;
         
        public void ConnectDB() {
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["CoPOIT"].ConnectionString);
            con.Open();
            if(con.State == System.Data.ConnectionState.Open)
            {
                DisplayMessage(this, "Connection to database successful");
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

        protected void btnSave_Click(object sender, EventArgs e)
        {

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

        }

        public void newCase()
        {
            activeCase = new Case();
        }

        public void loadCase()
        {
            activeCase.caseNumber = "";
        }
    }
}