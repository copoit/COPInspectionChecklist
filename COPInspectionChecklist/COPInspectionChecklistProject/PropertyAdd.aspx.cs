using COPInspectionChecklistProject.Common;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COPInspectionChecklistProject
{
    public partial class PropertyAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void CreateNewProperty()
        {
           if (txtStreetName.Text == string.Empty || txtStreetNum.Text == string.Empty || txtZip.Text == string.Empty)
                {
                    lblPropertyMessage.Text = "Invalid Address";
                    
                }
                else
                {
                    DbCommon clsCommon = new DbCommon();
                    string Sql = "Select * FROM PROPERTY_INFO where Property_StreetNumber = '" + txtStreetNum.Text + "' AND Property_StreetName = '" + txtStreetName.Text + "' AND Property_Zip = '" + txtZip.Text + "'";
                    var dt = clsCommon.TestDBConnection(Sql);
                    if (dt.Rows.Count > 0)
                    {
                        lblPropertyMessage.Text = "That Address is already in use. Choose another!";
                    }
                    else
                    {
                        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBOIT"].ConnectionString);
                        conn.Open();
                        SqlCommand cmd = new SqlCommand();
                        cmd.Connection = conn;
                        string SQL = "INSERT into PROPERTY_INFO (Property_ID, Property_StreetNumber, Property_StreetName, Property_Zip, Property_Owner_Name, Property_Owner_Phone, Applicant_Name, Applicant_Phone, Applicant_Email, Mailing_StreetNumber, Mailing_StreetName, Mailing_Zip, Dwelling_Info, NumberOfUnits, Sidewalk_Fee)" +
                            " Values (@PropertyID, @StreetNum, @StreetName, @Zip, @OwnName, @OwnPhone, @AppName, @AppPhone, @AppEmail, @MailNum, @MailName, @MailZip, @Dwell, @NumUnits, @Sidewalk)";
                        cmd.CommandText = SQL;
                        cmd.Parameters.AddWithValue("@PropertyID", "P" + txtStreetNum.Text);
                        cmd.Parameters.AddWithValue("@StreetNum", txtStreetNum.Text);
                        cmd.Parameters.AddWithValue("@StreetName", txtStreetName.Text);
                        cmd.Parameters.AddWithValue("@Zip", txtZip.Text);
                        cmd.Parameters.AddWithValue("@OwnName", txtOwnerName.Text);
                        cmd.Parameters.AddWithValue("@OwnPhone", txtOwnerPhone.Text);
                        cmd.Parameters.AddWithValue("@AppName", txtOwnerName.Text);
                        cmd.Parameters.AddWithValue("@AppPhone", txtAppPhone.Text);
                        cmd.Parameters.AddWithValue("@AppEmail", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@MailNum", txtMailNum.Text);
                        cmd.Parameters.AddWithValue("@MailName", txtMailName.Text);
                        cmd.Parameters.AddWithValue("@MailZip", txtMailZip.Text);
                        cmd.Parameters.AddWithValue("@Dwell", txtOccDwell.Text);

                        if (txtNumUnits.Text == "")
                        {
                            cmd.Parameters.AddWithValue("@NumUnits", "0");
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@NumUnits", txtNumUnits.Text);
                        }
                        
                        cmd.Parameters.AddWithValue("@Sidewalk", ddlsidewalk.SelectedValue);
                        
                        cmd.ExecuteNonQuery();
                        conn.Close();

                    Response.Redirect("InspectionMain.aspx");

                }


                }

                            
           
        }


        protected void btnInspectionMain_Click(object sender, EventArgs e)
        {
            Response.Redirect("InspectionMain.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            CreateNewProperty();

          
        }
    }
}