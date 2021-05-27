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

		protected bool validate(string username, string password, string name, string email, string ntn, string bankAccount, string contact, string address)
		{
			//presence checks
			if (username == "")
			{
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please Enter a username')", true);
				return false;
			}
			else if (password == "")
			{
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please Enter a password')", true);
				return false;
			}
			else if (name == "")
			{
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please Enter a name')", true);
				return false;
			}
			else if (email == "")
			{
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please Enter an email')", true);
				return false;
			}
			else if (ntn == "")
			{
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please Enter a NTN')", true);
				return false;
			}
			else if (bankAccount == "")
			{
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please Enter a Bank Account Number')", true);
				return false;
			}
			else if (contact == "")
			{
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please Enter a contact number')", true);
				return false;
			}
			else if (address == "")
			{
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please Enter an address')", true);
				return false;
			}

			//format checks
			agroflora_DAL objDAL = new agroflora_DAL();
			if (objDAL.search_retailer(username))
			{
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Username taken!')", true);
				return false;
			}
			else if (ntn.Length != 13)
			{
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('NTN must be 13 characters')", true);
				return false;
			}
			else if (objDAL.search_NTN(ntn))
			{
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('NTN is already registered')", true);
				return false;
			}
			else if (password.Length < 8)
			{
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Password must be atleast 8 characters!')", true);
				return false;
			}
			else if (contact.Length != 11)
			{
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Contact must be 11 digits')", true);
				return false;
			}

			return true;
		}
		protected void btn_submit_click(object sender, EventArgs e)
		{

			agroflora_DAL objDal = new agroflora_DAL();

			//get input from webform
			string name = txt_name.Text;
			string username = txt_username.Text;
			string email = txt_email.Text;
			string password = txt_password.Text;
			string address = txt_address.Text;
			string ntn = txt_NTN.Text;
			string bankAccount = txt_BankAccount.Text;
			string contact = txt_contact.Text;

			//validate
			if(!validate(username, password, name, email, ntn, bankAccount, contact, address))
			{
				return;
			}

			bool success = objDal.retailer_signup(username, password, name, email, address, bankAccount, contact, ntn);


			if (success)
			{
				Response.Redirect("retailer_profile.aspx");
			}
			else
			{
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('ERROR: Server Side Issue')", true);
			}

		}
	}



}