using COPInspectionChecklistProject.Common;
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
           if (Request.QueryString["PropertyID"] != null)
            {
                string PropertyID = Request.QueryString["PropertyID"];
                getProperty(PropertyID);
            }

        }

        private void getProperty(string PropertyID)
        {
            //set hidden field value for propertyid, added by Chaode He 3/16/2017
            txtPropertyId.Value = PropertyID;
            //end

            DbCommon clsCommon = new DbCommon();
            string SQL = "SELECT * FROM[PROPERTY_INFO] Where[PROPERTY_INFO].Property_ID ='" + PropertyID + "'";

            var dt = clsCommon.TestDBConnection(SQL);

            if (dt.Rows.Count > 0)
            {                               
                txtPropAdd.Text = dt.Rows[0]["Property_StreetNumber"].ToString() + " " + dt.Rows[0]["Property_StreetName"].ToString() + " " + dt.Rows[0]["Property_Zip"].ToString();
                txtRespParty.Text = dt.Rows[0]["Applicant_Name"].ToString();
                txtMailAdd.Text = dt.Rows[0]["Mailing_StreetNumber"].ToString() + " " + dt.Rows[0]["Mailing_StreetName"].ToString() + " " + dt.Rows[0]["Mailing_Zip"].ToString();
                txtEmail.Text = dt.Rows[0]["Applicant_Email"].ToString();
                txtAppPhone.Text = dt.Rows[0]["Applicant_Phone"].ToString();
                txtOccDwell.Text = dt.Rows[0]["Dwelling_info"].ToString();
                txtNumUnits.Text = dt.Rows[0]["NumberOfUnits"].ToString();
                txtOwnerName.Text = dt.Rows[0]["Property_Owner_Name"].ToString();
                txtOwnerPhone.Text = dt.Rows[0]["Property_Owner_Phone"].ToString();
                txtSidewalk.Text = dt.Rows[0]["Sidewalk_Fee"].ToString();
               
            }

        }


        protected void btnInspectionMain_Click(object sender, EventArgs e)
        {
            Response.Redirect("InspectionMain.aspx");
        }

        protected void btnViewCases_Click(object sender, EventArgs e)
        {
            Response.Redirect("CaseList.aspx?PropertyID="+ txtPropertyId.Value);
        }
    }
}
