using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using COPInspectionChecklistProject.Common;

namespace COPInspectionChecklistProject
{
    public partial class ReinspectNotice : System.Web.UI.Page
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
            catch (Exception exceptionE) {
                Console.Write(exceptionE.Message);
            }


        }

        private void getCase(String caseNumber) {
            try {
                txtReinspectionCaseNum.Text = caseNumber;
                DbCommon dbCommon = new DbCommon();
                string SQL = "SELECT convert(nvarchar(10),Case_Date,101) as Case_Date ,cast(Citation_Charges as decimal(10,2)) as Citation_Charges," +
                    " Property_StreetNumber,Property_StreetName,Property_Zip," +
                    "convert(nvarchar(10),Inspection_Date,101) as Inspection_Date ,convert(nvarchar(10),ReInspection_Date,101)as ReInspection_Date, Inspector_FName, Inspector_LName" +
                    " FROM[CASE_INFO] INNER JOIN[PROPERTY_INFO] ON[CASE_INFO].Property_ID = [PROPERTY_INFO].Property_ID" +
                    " left join[INSPECTOR_INFO] ON[CASE_INFO].Inspector_ID=[INSPECTOR_INFO].Inspector_ID" +
                    " Where[CASE_INFO].Case_Num ='" + caseNumber + "'";
                var dt = dbCommon.TestDBConnection(SQL);

                if (dt.Rows.Count > 0)
                {
                    txtDate.Text= dt.Rows[0]["Case_Date"].ToString();
                    txtReinspectionPropAdd.Text = dt.Rows[0]["Property_StreetNumber"].ToString() + " " + dt.Rows[0]["Property_StreetName"].ToString() + " " + dt.Rows[0]["Property_Zip"].ToString();
                    txtInspectionDate.Text = dt.Rows[0]["Inspection_Date"].ToString();
                    txtReinspectionDate.Text= dt.Rows[0]["ReInspection_Date"].ToString();
                    txtCitationAmount.Text = dt.Rows[0]["Citation_Charges"].ToString(); //temparorily, it is left blank
                    txtInspector.Text = dt.Rows[0]["Inspector_FName"].ToString() + " " + dt.Rows[0]["Inspector_LName"].ToString();
                 }


                }catch(Exception e){
                   throw e;
                }

        }

        protected void btnReinspectionSave_Click(object sender, EventArgs e)
        {
            
        }
        protected void btnReinspectionCancel_Click(object sender, EventArgs e)
        {

        }
        protected void btnReinspectionCheckList_Click(object sender, EventArgs e)
        {
            Response.Redirect("InspectionChecklist.aspx?CaseNumber=" + caseNumberParamter); 
        }
        protected void btnReinspectionCaseMain_Click(object sender, EventArgs e)
        {
            Session["CaseNumber"] = caseNumberParamter;
            Response.Redirect("CaseMain.aspx?CaseNumber=" + caseNumberParamter);
        }
        protected void btnReinspectionMainMenaul_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
        /*protected void calReinspectionDate_SelectionChanged(object sender, EventArgs e)
        {
            txtReinspectionDate.Text = calReinspectionDate.SelectedDate.ToString();
        }
        */
        
    }
}