using System;
using System.Collections;
using System.ComponentModel;
using System.Configuration;
using System.Drawing;
using System.Data;
using System.IO;
using System.Web;
using System.Web.Mail;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;


namespace COPInspectionChecklistProject
{
    /// <summary>
    /// Summary description for SendMail.
    /// </summary>
    public partial class SendMail : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.RadioButtonList rblMailFormat;
        protected System.Web.UI.WebControls.Button btnSend;
        protected System.Web.UI.HtmlControls.HtmlInputFile ofdAttachment1;
        protected System.Web.UI.HtmlControls.HtmlInputFile ofdAttachment2;
        protected System.Web.UI.HtmlControls.HtmlInputFile ofdAttachment3;
        protected System.Web.UI.WebControls.TextBox txtSender;
        protected System.Web.UI.WebControls.TextBox txtReceiver;
        protected System.Web.UI.WebControls.TextBox txtSubject;
        protected System.Web.UI.WebControls.TextBox txtBody;
        protected System.Web.UI.WebControls.Label lblMessage;
        protected string strFileName;

        private void Page_Load(object sender, System.EventArgs e)
        {
            // Put user code to initialize the page here

        }


        #region Web Form Designer generated code
        override protected void OnInit(EventArgs e)
        {
            //
            // CODEGEN: This call is required by the ASP.NET Web Form Designer.
            //
            InitializeComponent();
            base.OnInit(e);
        }

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.btnSend.Click += new System.EventHandler(this.btnSend_Click);
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion

        private void btnSend_Click(object sender, System.EventArgs e)
        {
            try
            {
                // Create a new blank MailMessage
                MailMessage email = new MailMessage();


                // Set the properties of the MailMessage to the
                // values on the form
                if (rblMailFormat.SelectedItem.Text == "text")
                    email.BodyFormat = MailFormat.Text;
                else
                    email.BodyFormat = MailFormat.Html;
                email.From = txtSender.Text;
                email.To = txtReceiver.Text;
                email.Subject = txtSubject.Text;
                email.Body = txtBody.Text;
                
              
            // Set the SMTP server and send the email
                SmtpMail.SmtpServer = "localhost";
                SmtpMail.Send(email);

                

                // Reset the form
                txtSender.Text = "";
                txtReceiver.Text = "";
                txtSubject.Text = "";
                txtBody.Text = "";

                // Dispaly a friendly message telling the user
                // his email has been sent
                lblMessage.Visible = true;
                lblMessage.ForeColor = Color.Black;
                lblMessage.Text = "Your email has been sent";
            }
            catch (Exception ex)
            {
                // Print a much less friendly message informing the 
                // user about the exception that was risen
                lblMessage.Visible = true;
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = ex.ToString();
            }

        }

    }
}
