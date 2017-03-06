using System;
using System.Collections.Generic;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace COPInspectionChecklistProject
{
    /// <summary>
    /// Summary description for CaseNumberService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class CaseNumberService : System.Web.Services.WebService {

        [WebMethod]
        public void GetCaseNumbers()
        {
            string cs = ConfigurationManager.ConnectionStrings["CoPOIT"].ConnectionString;
            List<Case> caseNumbers = new List<Case>();
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spGetCaseNumbers", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Case caseNo = new Case();
                    caseNo.caseNumber = rdr["CaseNumber"].ToString();
                    caseNo.propertyAddress = rdr["PropertyAddress"].ToString();
                    caseNo.responsibleParty = rdr["ResponsibleParty"].ToString();
                    caseNo.mailingAddress = rdr["MailingAddress"].ToString();
                    caseNo.emailAddress = rdr["EmailAddress"].ToString();
                    caseNo.applicantPhone = rdr["ApplicantPhone"].ToString();
                    caseNo.occupantDwellInfo = rdr["OccupantDwellInfo"].ToString();
                    caseNo.numUnits = Convert.ToInt32(rdr["NumberUnits"]);
                    caseNo.ownerName = rdr["OwnerName"].ToString();
                    caseNo.ownerPhone = rdr["OwnerPhone"].ToString();
                    caseNo.sidewalkFees = Convert.ToBoolean(rdr["SidewalkFees"]);
                    caseNo.inspector = rdr["InspectorName"].ToString();
                    caseNo.inspectorEmail = rdr["InspectorEmail"].ToString();
                    caseNo.inspectionDate = Convert.ToDateTime(rdr["InspectionDate"]);
                    caseNo.reinspectionDate = Convert.ToDateTime(rdr["ReinspectionDate"]);
                    caseNumbers.Add(caseNo);
                }
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(caseNumbers));
        }
    }
}
