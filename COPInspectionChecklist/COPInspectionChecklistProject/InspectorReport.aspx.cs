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
    public partial class InspectorReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    lblMessage.Text = "";
                    getInspectorList();
                }
            }catch(Exception ex)
            {
                Console.Write(ex.Message);
            }

        }

        private void retrieveCaseByInspectorId(String InspectorID)
        {
            DbCommon clsCommon = new DbCommon();
            
            DataTable dataTable = new DataTable();
            DataSet caseListDataSet = new DataSet();
            try
            {

                //retrieve all cases by property Id
                string SQL = "SELECT CASE_INFO.Case_Num,CASE_INFO.Inspection_Date, CASE_INFO.ReInspection_Date,CASE_INFO.Inspection_Status," +
                    " CASE_INFO.Inspection_Type,INSPECTOR_INFO.Inspector_FName+' '+INSPECTOR_INFO.Inspector_LName as Inspector " +
                    "  FROM CASE_INFO left join INSPECTOR_INFO ON CASE_INFO.Inspector_ID=INSPECTOR_INFO.Inspector_ID  Where CASE_INFO.Inspector_ID ='" + InspectorID + "'";

                var caseListDT = clsCommon.TestDBConnection(SQL);
                if (caseListDT.Rows.Count > 0)
                {
                    lblMessage.Text = "";
                    dataTable = caseListDT;
                }
                else
                {
                    lblMessage.Text = "There is no case assigned to the selected inspector!";
                }
                
                caseListDataSet.Tables.Add(dataTable);
                CaseListGridView.DataSource = caseListDataSet.Tables[0];
                CaseListGridView.DataBind();


            }
            catch (Exception e)
            {
                throw e;
            }

            // return caseList;
        }

        private void getInspectorList()
        {
            string CS = ConfigurationManager.ConnectionStrings["DBOIT"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("Select Inspector_ID, Inspector_FName +' '+Inspector_LName as InspectorName from Inspector_Info", conn);
                conn.Open();
                ddlInspector.DataSource = cmd.ExecuteReader();
                ddlInspector.DataBind();
                conn.Close();
            }
        }

        protected void ddlInspector_SelectedIndexChanged(object sender, EventArgs e)
        {
            string inspectorId = ddlInspector.SelectedValue;
            retrieveCaseByInspectorId(inspectorId);
        }
        protected void btnInspectorReportPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ReportsMain.aspx");
        }
    }

    
}