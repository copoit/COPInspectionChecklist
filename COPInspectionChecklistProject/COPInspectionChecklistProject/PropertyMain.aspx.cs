using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COPInspectionChecklistProject
{
    public partial class PropertyMain : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void getCaseByCaseNumber(string caseNumber)
        {
            Case caseNo = new Case();
            string cs = ConfigurationManager.ConnectionStrings["Data Source=teamdbserver.database.windows.net;Initial Catalog=OITDB;Persist Security Info=False;User ID=DBAdmin;Password=Mon#2017;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(cs))
            {

                {

                    string sql1 = "SELECT CASE_NUM From [CASE_INFO] Where CASE_NUM is " + caseNumber;
                    SqlCommand cmd = new SqlCommand(sql1, conn);
                    conn.Open();
                    SqlDataReader rdr1 = cmd.ExecuteReader();
                    if (rdr1.Read())
                    {
                        caseNo.caseNumber = rdr1["Case_Num"].ToString();
                         caseNo.property_ID = Convert.ToInt32(rdr1["[Property_ID]"]);
                    }
                    string sql3 = "SELECT PROPERTY_ID From [PROPERTY_INFO] Where PROPERTY_ID is " + caseNo.property_ID;
                    cmd = new SqlCommand(sql3, conn);
                    SqlDataReader rdr3 = cmd.ExecuteReader();
                    if (rdr3.Read())
                    {

                    }
                }
            }
        }
        protected void btnInspectionMain_Click(object sender, EventArgs e)
        {
            Response.Redirect("InspectionMain.aspx");
        }

        protected void btnViewCases_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewCases.aspx");
        }
    }
}