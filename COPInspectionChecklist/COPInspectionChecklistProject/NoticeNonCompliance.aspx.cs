using System;
using COPInspectionChecklistProject.Common;

namespace COPInspectionChecklistProject
{
    public partial class NoticeNonCompliance : System.Web.UI.Page
    {
        String caseNumberParamter = "";
        protected void Page_Load(object sender, EventArgs e)
        {
           

            //catch all potential exception or error and print the message to the console instead of web page.
            try
            {
                string caseNumber = Request.QueryString["CaseNumber"];
                if (caseNumber != null)
                {
                    caseNumber = caseNumber.Trim();
                    caseNumberParamter = caseNumber;
                    getCase(caseNumber);
                }
            }
            catch (Exception exceptionE)
            {
                Console.Write(exceptionE.Message);
            }
        }
        private void getCase(String caseNumber)
        {
            try
            {
                txtNonComplianceCaseNum.Text = caseNumber;
                DbCommon dbCommon = new DbCommon();
                string SQL = "SELECT Property_StreetNumber,Property_StreetName,Property_Zip," +
                    "convert(nvarchar(10),Inspection_Date,101) as Inspection_Date ,convert(nvarchar(10),Case_Date,101) as Case_Date, " +
                    "Inspector_FName, Inspector_LName,Inspector_Phone" +
                    " FROM[CASE_INFO] INNER JOIN[PROPERTY_INFO] ON[CASE_INFO].Property_ID = [PROPERTY_INFO].Property_ID" +
                    " left join[INSPECTOR_INFO] ON[CASE_INFO].Inspector_ID=[INSPECTOR_INFO].Inspector_ID" +
                    " Where[CASE_INFO].Case_Num ='" + caseNumber + "'";
                var dt = dbCommon.TestDBConnection(SQL);

                if (dt.Rows.Count > 0)
                {
                    txtNonCompliancePropAdd.Text = dt.Rows[0]["Property_StreetNumber"].ToString() + " " + dt.Rows[0]["Property_StreetName"].ToString() + " " + dt.Rows[0]["Property_Zip"].ToString();
                    txtInspectionDate.Text = dt.Rows[0]["Inspection_Date"].ToString();
                    txtDate.Text = dt.Rows[0]["Case_Date"].ToString();
                    txtInspector.Text = dt.Rows[0]["Inspector_FName"].ToString() + " " + dt.Rows[0]["Inspector_LName"].ToString();
                    string phoneNumber= dt.Rows[0]["Inspector_Phone"].ToString();
                    if (phoneNumber.Length == 10)
                        txtInspectorPhone.Text = Convert.ToInt64(phoneNumber).ToString("(###)-###-####");
                    else
                        txtInspectorPhone.Text = phoneNumber;
                    txtInspectorPhone2.Text = txtInspectorPhone.Text;//copy txtInspectorPhone value to txtInspectorPhone2
                    //txtInspectorPhone.Text = String.Format("{0:(###) ###-####}", phoneNumber); 
                    //
                }


            }
            catch (Exception e)
            {
                throw e;
            }

        }
        protected void btnNonComplianceSave_Click(object sender, EventArgs e)
        {

        }
        
        protected void btnNonComplianceCheckList_Click(object sender, EventArgs e)
        {
            Response.Redirect("InspectionChecklist.aspx?CaseNumber=" + caseNumberParamter);
        }
        protected void btnNonComplianceCaseMain_Click(object sender, EventArgs e)
        {
            Session["CaseNumber"] = caseNumberParamter;
            Response.Redirect("CaseMain.aspx?CaseNumber=" + caseNumberParamter);
        }
        protected void btnNonComplianceMainMenaul_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}