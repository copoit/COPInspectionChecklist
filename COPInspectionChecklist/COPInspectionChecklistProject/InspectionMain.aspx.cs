using COPInspectionChecklistProject.Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COPInspectionChecklistProject
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Text = "";
        }

        protected void btnMain_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainMenu.aspx");
        }

        protected void btnCase_Click(object sender, EventArgs e)
       {
	gvProperties.DataSource = null;
	gvProperties.DataBind();

	if (txtCase.Text.Trim() != "")
	{
		SearchForCase(txtCase.Text);
	}
	else
	{
		lblError.Text = "Please enter a case number.";
	}
}

protected void btnAddProperty_Click(object sender, EventArgs e)
{
    Response.Redirect("PropertyAdd.aspx");
}

protected void btnProperty_Click(object sender, EventArgs e)
{
	if (txtStreetNum.Text.Trim() != "" || txtStreetName.Text.Trim() != "" || txtZip.Text.Trim() != "")
	{
		SearchForProperty(txtStreetNum.Text, txtStreetName.Text, txtZip.Text);
	}
	else
	{
		lblError.Text = "Please enter property search criteria.";
	}
      }
        

        private void SearchForCase(string Case)
        {
            DbCommon clsCommon = new DbCommon();
            string SQL = "SELECT * FROM [CASE_INFO] where Case_Num = '" + Case +"'";
            var dt2 = clsCommon.TestDBConnection(SQL);

            if (dt2.Rows.Count > 0)
            {
                Session["CaseNumber"] = Case;
                Response.Redirect("CaseMain.aspx?CaseNumber=" + Case);
            }
            else
            {
                lblError.Text = "No Case found.  Please enter a full case number.";
            }

        }

        private void SearchForProperty(string StreetNum, string StreetName, string Zip)
        {
            DbCommon clsCommon = new DbCommon();

            string SQL = "SELECT * FROM [PROPERTY_INFO] WHERE 1 = 1 "
                            + (StreetNum != "" ? string.Format("AND Property_StreetNumber LIKE '%{0}%' ", StreetNum) : "")
                            + (StreetName != "" ? string.Format("AND Property_StreetName LIKE '%{0}%' ", StreetName) : "")
                            + (Zip != "" ? string.Format("AND Property_Zip LIKE '%{0}%' ", Zip) : "");

            //string SQL = "SELECT Property_ID FROM [PROPERTY_INFO] where Property_StreetNumber = '" + StreetNum + "' AND Property_StreetName = '" + StreetName.ToUpper() + "' AND Property_Zip = '" + Zip + "'";
            var dt2 = clsCommon.TestDBConnection(SQL);

            if (dt2.Rows.Count == 1)
            {
                Session["PropertyID"] = dt2.Rows[0]["Property_ID"];
                Response.Redirect("PropertyMain.aspx?PropertyID=" + dt2.Rows[0]["Property_ID"]);
            }
            else if (dt2.Rows.Count > 1)
            {
                gvProperties.DataSource = dt2;
                gvProperties.DataBind();
            }
            else
            {
                gvProperties.DataSource = null;
                gvProperties.DataBind();

                lblError.Text = "No Property found.  Please enter a Street Number, Street Name, and Zip.";
            }

        }
    }
}
