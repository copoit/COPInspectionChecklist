using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;

namespace COPInspectionChecklistProject
{
    public partial class CaseMain : Page {
        Case newCase = new Case();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //if page loads with a current case (from page InspectionMain or CaseList), run this code
                if (Request.QueryString["CaseNumber"] != null)
                {
                    string caseNumber = Request.QueryString["CaseNumber"];
                    getCaseByCaseNumber(caseNumber);
                    insertDataIntoTable();
                }
                //else load as a blank page with a generated caseNumber(from btnNewCase on CaseList page)
                //generated number can be from a scheduled inspection or retrieved as an incremented item
                //from the dbo.CASE_INFO
                txtCaseNum.Text = newCase.caseNumber;
            }  catch (Exception ee)
            {
                throw ee;
            }
        }
        /// <summary>
        /// Save button updates database for new Case with current attributes
        /// currently holds dummy info to save data to database
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e) {
            //SqlDataAdapter ada = new SqlDataAdapter("Insert into CaseMain('" + txtCaseNum + "'.'" + txtPropAdd + "','" + txtRespParty
            //        + "','" + txtMailAdd + "','" + txtEmail + "','" + txtAppPhone + "','" + txtOccDwell + "','" + txtNumUnits + "','" + txtOwnerName
            //        + "','" + txtOwnerPhone + "','" + txtSidewalk + "','" + txtInspector + "','" + txtInspectEmail + "','" + txtInspectDate + "','"
            //        + txtReinspectDate + ")", conn);
            //DataSet ds = new DataSet();
            //ada.Fill(ds);
        }
        /// <summary>
        /// Delete button removes selected CaseNumber from database
        /// currently holds dummy data to remove data from database
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnDelete_Click(object sender, EventArgs e) {
        //    using (SqlConnection con = new SqlConnection(conn))
        //    {
        //        SqlCommand cmd = new SqlCommand("Delete from tblCaseMain where caseNumber = @CaseNumber", con);
        //        cmd.CommandType = CommandType.StoredProcedure;

            //        SqlParameter parameter = new SqlParameter("@CaseNumber", caseNumber);
            //        cmd.Parameters.Add(parameter);
            //        con.Open();
            //        cmd.ExecuteNonQuery();
            //    }
        }
        protected void btnInspectionChecklist_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/InspectionChecklist.aspx?CaseNumber=" + Server.UrlEncode(CaseNumber));
        }
        protected void btnCertificateInspection_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CertInspection.aspx?CaseNumber=" + Server.UrlEncode(CaseNumber));
        }
        protected void btnReinspectionNotice_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ReinspectNotice.aspx?CaseNumber=" + Server.UrlEncode(CaseNumber));
        }
        protected void btnNoticeNonCompliance_Click(object sender, EventArgs e)
        {
            Response.Redirect("NoticeNonCompliance.aspx");
        }
        #endregion
    }
}