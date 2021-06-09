using System;
using System.Data;
using Agroflora.DAL;

namespace Agroflora
{
	public partial class retailer_signup : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{			

		}
		protected void btn_submit_click(object sender, EventArgs e)
		{

			agroflora_DAL objDAL = new agroflora_DAL();

			//get input from webform
			string name = txt_name.Text;
			string username = txt_username.Text;
			string email = txt_email.Text;
			string password = txt_password.Text;
			string address = txt_address.Text;
			string ntn = txt_NTN.Text;
			string bankAccount = txt_BankAccount.Text;
			string contact = txt_contact.Text;

			int username_taken = objDAL.search_retailer(username);
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
					if( objDAL.retailer_signup(username, password, name, email, address, bankAccount, contact, ntn) == -1)
					{
						Response.Redirect("error.aspx");
						return;
					}
					else
					{
						Response.Redirect("retailer_signin.aspx");
					}
					break;

			}
		}
	}



}