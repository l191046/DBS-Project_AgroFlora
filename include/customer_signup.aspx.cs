using System;
using System.Data;
using Agroflora.DAL;

namespace Agroflora
{
	public partial class customer_signup : System.Web.UI.Page
	{	
		protected void Page_Load(object sender, EventArgs e)
		{

		}
		protected void btn_submit_click(object sender, EventArgs e)
		{
			agroflora_DAL objDAL = new agroflora_DAL();

			//get input from webform
			

			string username = txt_username.Text;
			string password = txt_password.Text;
			string fname = txt_fname.Text;
			string lname = txt_lname.Text;
			string email = txt_email.Text;
			string address = txt_address.Text;
			string dob = txt_dob.Text;
			string contact = txt_contact.Text;

			int username_taken = objDAL.search_customer(username);
			switch (username_taken)
			{
				case -1:
					Response.Redirect("error.aspx");
					return;
				case 1:
					//username was already found in system
					Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "error_username_taken()", true);
					return;
				case 0:
					//username not found in system
					if (objDAL.customer_signup(username, password, fname, lname, email, address, dob, contact) == -1)
					{
						Response.Redirect("error.aspx");
						return;
					}
					else
					{
						Response.Redirect("customer_signin.aspx");
					}
					break;
			}
		}
	}
}