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

		protected bool validate(string username, string password, string fname, string lname, string email, string address, string dob, string contact)
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
			else if (fname == "")
			{
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please Enter a first name')", true);
				return false;
			}
			else if (lname == "")
			{
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please Enter a last name')", true);
				return false;
			}
			else if (email == "")
			{
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please Enter an email')", true);
				return false;
			}
			else if (address == "")
			{
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please Enter an address')", true);
				return false;
			}
			else if (dob == "")
			{
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please Enter a data of birth')", true);
				return false;
			}

			//format checks
			agroflora_DAL objDAL = new agroflora_DAL();
			if (objDAL.search_customer(username))
			{
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Username taken!')", true);
				return false;
			}
			else if (password.Length < 8)
			{
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Password must be atleast 8 characters!')", true);
				return false;
			}
			else if (contact.Length!=0 && contact.Length!=11)
			{
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Contact must be 11 characters')", true);
				return false;
			}
			
			return true;
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

			//validate
			if (!validate(username, password, fname, lname, email, address, dob, contact))
			{
				return;
			}

			bool success = objDAL.customer_signup(username, password, fname, lname, email, address, dob, contact);

			if (success)
			{
				Response.Redirect("customer_profile.aspx");
			}
			else
			{
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('ERROR: Server Side Issue')", true);
			}
		}
	}
}