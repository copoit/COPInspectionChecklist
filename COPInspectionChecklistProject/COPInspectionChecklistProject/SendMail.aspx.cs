using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Web;
using System.Web.Mail;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace EMailSample
{
	public class SendMail : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label lblHeader;
		protected System.Web.UI.WebControls.TextBox txtSender;
		protected System.Web.UI.WebControls.TextBox txtReceiver;
		protected System.Web.UI.WebControls.TextBox txtSubject;
		protected System.Web.UI.WebControls.RadioButtonList rblMailFormat;
		protected System.Web.UI.WebControls.TextBox txtBody;
		protected System.Web.UI.WebControls.Button btnSend;
		protected System.Web.UI.WebControls.TextBox txtCc;
		protected System.Web.UI.HtmlControls.HtmlInputFile inpAttachment1;
		protected System.Web.UI.HtmlControls.HtmlInputFile inpAttachment2;
		protected System.Web.UI.HtmlControls.HtmlInputFile inpAttachment3;
		protected System.Web.UI.WebControls.Label lblMessage;
		protected System.Web.UI.WebControls.TextBox txtBcc;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			lblMessage.Text = "";
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
				/* Create a new blank MailMessage */
				MailMessage mailMessage = new MailMessage ();
		
				mailMessage.From = txtSender.Text;
				mailMessage.To = txtReceiver.Text;
				mailMessage.Cc = txtCc.Text;
				mailMessage.Bcc = txtBcc.Text;
				mailMessage.Subject = txtSubject.Text;
				mailMessage.Body = txtBody.Text;

				/* Set the properties of the MailMessage to the
				   values on the form  */
				if (rblMailFormat.SelectedItem.Text == "Text")
					mailMessage.BodyFormat = MailFormat.Text;
				else
					mailMessage.BodyFormat = MailFormat.Html;
				
				/* We use the following variables to keep track of
				   attachments and after we can delete them */				   
				string attach1 = null;
				string attach2 = null;
				string attach3 = null;

				/*strFileName has a attachment file name for 
				  attachment process. */
				string strFileName = null;

				/* Bigining of Attachment1 process   & 
				   Check the first open file dialog for a attachment */
				if (inpAttachment1.PostedFile != null)
				{
					/* Get a reference to PostedFile object */
					HttpPostedFile attFile = inpAttachment1.PostedFile;
					/* Get size of the file */
					int attachFileLength = attFile.ContentLength; 
					/* Make sure the size of the file is > 0  */
					if (attachFileLength > 0)
					{
						/* Get the file name */
						strFileName = Path.GetFileName(inpAttachment1.PostedFile.FileName);
						/* Save the file on the server */
						inpAttachment1.PostedFile.SaveAs(Server.MapPath(strFileName));
						/* Create the email attachment with the uploaded file */
						MailAttachment attach = new MailAttachment(Server.MapPath(strFileName));
						/* Attach the newly created email attachment */
						mailMessage.Attachments.Add(attach);
						/* Store the attach filename so we can delete it later */
						attach1 = strFileName;
					}
				}
				/* Attachment-2 Repeat previous step */
				if (inpAttachment2.PostedFile != null)
				{
					HttpPostedFile attFile = inpAttachment2.PostedFile;
					int attachFileLength = attFile.ContentLength; 
					if (attachFileLength > 0)
					{
						strFileName = Path.GetFileName(inpAttachment2.PostedFile.FileName);
						inpAttachment2.PostedFile.SaveAs(Server.MapPath(strFileName));
						MailAttachment attach = new MailAttachment(Server.MapPath(strFileName));
						mailMessage.Attachments.Add(attach);
						attach2 = strFileName;
					}
				}
				/* Attachment-3 Repeat previous steps  */
				if (inpAttachment3.PostedFile != null)
				{
					HttpPostedFile attFile = inpAttachment3.PostedFile;
					int attachFileLength = attFile.ContentLength; 
					if (attachFileLength > 0)
					{
						strFileName = Path.GetFileName(inpAttachment3.PostedFile.FileName);
						inpAttachment3.PostedFile.SaveAs(Server.MapPath(strFileName));
						MailAttachment attach = new MailAttachment(Server.MapPath(strFileName));
						mailMessage.Attachments.Add(attach);
						attach3 = strFileName;
					}
				}
            
				/* Set the SMTP server and send the email with attachment */

				// SmtpMail.SmtpServer = "127.0.0.1";
				SmtpMail.SmtpServer.Insert(0,"127.0.0.1");
								
				SmtpMail.Send (mailMessage);

				/* Delete the attachements if any */
				if (attach1 != null)
					File.Delete(Server.MapPath(attach1));
				if (attach2 != null)
					File.Delete(Server.MapPath(attach2));
				if (attach3 != null)
					File.Delete(Server.MapPath(attach3));	

				/* clear the controls */
				txtSender.Text = "";
				txtReceiver.Text = "";
				txtCc.Text = "";
				txtBcc.Text = "";
				txtSubject.Text = "";
				txtBody.Text = "";

				/* Dispaly a confirmation message to the user. */
				lblMessage.Visible = true;
				lblMessage.ForeColor = Color.Black;
				lblMessage.Text = "Message sent.";
			}
			catch(Exception ex)
			{
				/* Print a message informing the 
				user about the exception that was risen */
				lblMessage.Visible = true;
				lblMessage.ForeColor = Color.Red;
				lblMessage.Text = ex.ToString();
			}
		
		}
	}
}
