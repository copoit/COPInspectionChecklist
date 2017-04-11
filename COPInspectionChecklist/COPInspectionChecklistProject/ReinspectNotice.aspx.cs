using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using COPInspectionChecklistProject.Common;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

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
                if (!IsPostBack)
                {
                    lblMessage.Text = "";
                    string caseNumber = Request.QueryString["CaseNumber"];
                    if (caseNumber != null)
                    {
                        caseNumber = caseNumber.Trim();
                        caseNumberParamter = caseNumber;
                        getCase(caseNumber);
                    }
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
                string SQL = "SELECT Property_StreetNumber,Property_StreetName,Property_Zip," +
                    "convert(nvarchar(10),Case_Date,101) as Case_Date,convert(nvarchar(10),Inspection_Date,101) as Inspection_Date ,convert(nvarchar(10),ReInspection_Date,101)as ReInspection_Date," +
                    " CAST(Citation_Charges AS numeric(10,2)) as Citation_Charges, Inspector_FName, Inspector_LName,Inspector_Phone, [CASE_INFO].Inspector_ID as inspectorID" +
                    " FROM[CASE_INFO] INNER JOIN[PROPERTY_INFO] ON[CASE_INFO].Property_ID = [PROPERTY_INFO].Property_ID" +
                    " left join[INSPECTOR_INFO] ON[CASE_INFO].Inspector_ID=[INSPECTOR_INFO].Inspector_ID" +
                    " Where[CASE_INFO].Case_Num ='" + caseNumber + "'";
                var dt = dbCommon.TestDBConnection(SQL);

                if (dt.Rows.Count > 0)
                {
                    txtReinspectionPropAdd.Text = dt.Rows[0]["Property_StreetNumber"].ToString() + " " + dt.Rows[0]["Property_StreetName"].ToString() + " " + dt.Rows[0]["Property_Zip"].ToString();
                    txtInspectionDate.Text = dt.Rows[0]["Inspection_Date"].ToString();
                    txtReinspectionDate.Text= dt.Rows[0]["ReInspection_Date"].ToString();
                    txtDate.Text= dt.Rows[0]["Case_Date"].ToString();
                    txtCitationAmount.Text = dt.Rows[0]["Citation_Charges"].ToString() ;
                    txtInspector.Text = dt.Rows[0]["Inspector_FName"].ToString() + " " + dt.Rows[0]["Inspector_LName"].ToString();
                    inspectorID.Value= dt.Rows[0]["inspectorID"].ToString(); 
                    //txtInspectorPhone.Text = dt.Rows[0]["Inspector_Phone"].ToString();
                    string phoneNumber = dt.Rows[0]["Inspector_Phone"].ToString();
                    if (phoneNumber.Length == 10)
                       txtInspectorPhone.Text=Convert.ToInt64(phoneNumber).ToString("(###)-###-####");
                    else
                       txtInspectorPhone.Text =  phoneNumber;
                    
                }


                }catch(Exception e){
                   throw e;
                }

        }

        private bool IsValidDateTimeTest(string dateTime)
        {
            string[] formats = { "mm/dd/yyyy" };
            DateTime parsedDateTime;
            return DateTime.TryParse(dateTime, out parsedDateTime);
        }
        private void saveReinspection(string caseNumber)
        {
            try
            {
                caseNumberParamter = caseNumber;
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBOIT"].ConnectionString);
                conn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;

                string reinspectionDate = txtReinspectionDate.Text;
                if (!IsValidDateTimeTest(reinspectionDate)) {
                    lblMessage.Text = "Please input/select valid reinspection date!";
                    throw new Exception();
                    
                }
                string citationAmt = txtCitationAmount.Text.Trim();
                double citationCharge;
          
                if (!Double.TryParse(citationAmt, out citationCharge)) {
                    lblMessage.Text = "Please input valid numeric citation charge!";
                    throw new Exception();
                }

                string inspectorId = inspectorID.Value;
               

                string updateStr = "Update CASE_INFO set ReInspection_Date=@reinspectionDate, Citation_Charges=@citationCharge, Inspector_ID=@inspectorId WHERE Case_Num='" + caseNumber + "'";
                cmd.CommandText = updateStr;
                cmd.Parameters.AddWithValue("@reinspectionDate", reinspectionDate);
                cmd.Parameters.AddWithValue("@citationCharge", citationAmt);
                //cmd.Parameters.AddWithValue("@Citation_Charges", citationCharge);
                cmd.Parameters.AddWithValue("@inspectorId", inspectorId);
                cmd.ExecuteNonQuery();
                conn.Close();
                lblMessage.Text = "Reinspection information was saved successfully!";
            }
            catch (Exception e)
            {
                lblMessage.Text = "Reinspection information saving failed!";
                throw e;
            }
        }
        protected void btnReinspectionSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (caseNumberParamter == "") {
                    caseNumberParamter = txtReinspectionCaseNum.Text;
                }
                saveReinspection(caseNumberParamter);
            }
            catch (Exception ex) {
                Console.WriteLine(ex.Message);
            }
        }
        
        protected void btnReinspectionCheckList_Click(object sender, EventArgs e)
        {
            if (caseNumberParamter == "")
            {
                caseNumberParamter = txtReinspectionCaseNum.Text;
            }
            Response.Redirect("InspectionChecklist.aspx?CaseNumber=" + caseNumberParamter); 
        }
        protected void btnReinspectionCaseMain_Click(object sender, EventArgs e)
        {
            if (caseNumberParamter == "")
            {
                caseNumberParamter = txtReinspectionCaseNum.Text;
            }
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