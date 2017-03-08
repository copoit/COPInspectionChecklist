﻿using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;
using COPInspectionChecklistProject.Common;

namespace COPInspectionChecklistProject
{
    public partial class CaseMain : Page
    {
        Case newCase = new Case();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                DbCommon clsCommon = new DbCommon();
                //if page loads as current case, run this code
                if (Request.QueryString["CaseNumber"] != null)
                {
                    string caseNumber = Request.QueryString["CaseNumber"];
                    getCaseByCaseNumber(caseNumber);
                    insertData();
                }
                //else data is loaded as a blank page, with a generated caseNumber
                txtCaseNum.Text = newCase.caseNumber;
            } catch (Exception ee)
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
        private void getCaseByCaseNumber(string caseNumber)
        {
            Case caseNo = new Case();
            using (SqlConnection conn = new SqlConnection())
            {
                SqlCommand cmd = new SqlCommand("spGetCaseByCaseNumber", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter parameter = new SqlParameter("@CaseNumber", caseNumber);
                cmd.Parameters.Add(parameter);
                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
            }
            newCase = caseNo;
        }
        private void insertData()
        {
            txtCaseNum.Text = newCase.caseNumber;
            txtPropAdd.Text = newCase.propertyAddress;
            txtRespParty.Text = newCase.responsibleParty;
            txtMailAdd.Text = newCase.mailingAddress;
            txtEmail.Text = newCase.emailAddress;
            txtAppPhone.Text = newCase.applicantPhone;
            txtOccDwell.Text = newCase.occupantDwellInfo;
            txtNumUnits.Text = newCase.numUnits.ToString();
            txtOwnerName.Text = newCase.ownerName;
            txtOwnerPhone.Text = newCase.ownerPhone;
            txtSidewalk.Text = newCase.sidewalkFees.ToString();
            txtInspector.Text = newCase.inspector;
            txtInspectEmail.Text = newCase.inspectorEmail;
            txtInspectDate.Text = newCase.inspectionDate.ToString();
            txtReinspectDate.Text = newCase.reinspectionDate.ToString();
        }
        protected void btnInspectionChecklist_Click(object sender, EventArgs e)
        {
            Response.Redirect("InspectionChecklist.aspx");
        }
        protected void btnCertificateInspection_Click(object sender, EventArgs e)
        {
            Response.Redirect("CertInspection.aspx");
        }
        protected void btnReinspectionNotice_Click(object sender, EventArgs e)
        {
            Response.Redirect("ReinspectNotice.aspx");
        }
        protected void btnNoticeNonCompliance_Click(object sender, EventArgs e)
        {
            Response.Redirect("NoticeNonCompliance.aspx");
        }
    }
}