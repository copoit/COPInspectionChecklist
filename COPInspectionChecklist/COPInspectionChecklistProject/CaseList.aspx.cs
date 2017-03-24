using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using COPInspectionChecklistProject.Common;


namespace COPInspectionChecklistProject
{
    public partial class CaseList : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e)
        {
            //retrieve cases based on property id
            if (Request.QueryString["PropertyID"] != null)
            {
                string propertyId = Request.QueryString["PropertyID"];
                retrieveCaseByPropertyId(propertyId);
            }

            txtPropAdd.Attributes.Add("readonly", "readonly");

        }


        private void retrieveCaseByPropertyId(String propertyID) {
            DbCommon clsCommon = new DbCommon();
            ArrayList caseList = new ArrayList();
            DataTable dataTable=new DataTable();
            DataSet caseListDataSet = new DataSet();
            try
            {
                //set hidden field value for propertyid
                txtPropertyId.Value = propertyID;

                //retrieve the property information to display to the address box.
                string propertyInfoQuery = "select Property_StreetNumber,  Property_StreetName,Property_Zip from PROPERTY_INFO where Property_ID ='" + propertyID + "'";

                var dt = clsCommon.TestDBConnection(propertyInfoQuery);
                if (dt.Rows.Count>0) {
                    //assign the value the target property address box
                    txtPropAdd.Text = dt.Rows[0]["Property_StreetNumber"].ToString() + " " + dt.Rows[0]["Property_StreetName"].ToString() + " " + dt.Rows[0]["Property_Zip"].ToString();
                }


                //retrieve all cases by property Id
                string SQL = "SELECT CASE_INFO.Case_Num,CASE_INFO.Inspection_Date, CASE_INFO.ReInspection_Date,CASE_INFO.Inspection_Status," +
                    " CASE_INFO.Inspection_Type,INSPECTOR_INFO.Inspector_FName+' '+INSPECTOR_INFO.Inspector_LName as Inspector " +
                    "  FROM CASE_INFO left join INSPECTOR_INFO ON CASE_INFO.Inspector_ID=INSPECTOR_INFO.Inspector_ID  Where CASE_INFO.Property_ID ='" + propertyID + "'";

                var caseListDT = clsCommon.TestDBConnection(SQL);
                if (caseListDT.Rows.Count > 0) {
                    dataTable = caseListDT;
                }

                /*
                SqlDataReader dataReader = clsCommon.getDBDataReader(SQL);
                */
                /*
                while (dataReader.Read()) {
                    //assemble all record into a data table object, and present it in grid view 
                    DataRow dataRow= dataTable.NewRow();
                    dataRow["Case_Num"] = dataReader["Case_Num"].ToString();
                    dataRow["Inspection_Date"] = dataReader["Inspection_Date"].ToString();
                    dataRow["Inspection_Type"] = dataReader["Inspection_Type"].ToString();
                    string inspectorFName = dataReader["Inspector_FName"].ToString();
                    string inspectorLName = dataReader["Inspector_LName"].ToString();
                    dataRow["Inspector"] = inspectorFName + " " + inspectorLName;
                    dataRow["Inspection_Status"] = dataReader["Inspection_Status"].ToString();
                    dataTable.Rows.Add(dataRow);
                    /*
                    Case caseProperty = new Case();
                    caseProperty.caseNumber= dataReader["Case_Num"].ToString();
                    var inspectionDate = dataReader["Inspection_Date"].ToString();
                    if (inspectionDate != null)
                    {
                        caseProperty.inspectionDate = Convert.ToDateTime(inspectionDate);
                    }
                    caseProperty.inspectionType = dataReader["Inspection_Type"].ToString();
                    caseProperty.inspectionStatus = dataReader["Inspection_Status"].ToString();
                    
                    caseList.Add(caseProperty);
                    }*/

                
            
       
                caseListDataSet.Tables.Add(dataTable);
                CaseListGridView.DataSource = caseListDataSet.Tables[0];
                CaseListGridView.DataBind();

            }
            catch (Exception e) {
                throw e;
            }

           // return caseList;
        }

        protected void btnNewCase_Click(Object sender, EventArgs e)
        {
            Response.Redirect("CaseMain.aspx");
        }
       
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("PropertyMain.aspx?PropertyID="+txtPropertyId.Value);
        }
    }
}