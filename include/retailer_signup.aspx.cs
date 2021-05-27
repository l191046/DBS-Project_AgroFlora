using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Data;
using System.Drawing;
using Agroflora.DAL;


namespace Agroflora
{
	public partial class retailer_signup : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			

		}

		protected void btn_submit_click(object sender, EventArgs e) {

			agroflora_DAL objDal = new agroflora_DAL();
			string Name = txt_name.Text;
			string Username = txt_username.Text;
			string Email = txt_email.Text;
			string Password = txt_password.Text;
			string Address = txt_address.Text;
			string NTN = txt_NTN.Text;
			string BankAccount = txt_BankAccount.Text;
			string Contact = txt_contact.Text;

			if (objDal.checkNTN(NTN)) {
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('NTN is already taken')", true);
				return;
			}

			if (objDal.retailer_search(Username) == true) {
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Username is already taken')", true);
				return;
			}

			if (Password.Length < 8) {
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Password must be atleast 8 characters')", true);
				return;
			}

			if (NTN.Length != 13) {
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('NTN must be 13 characters')", true);
				return;
			}

			if (Contact.Length != 11)
			{
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Contact must be 11 characters')", true);
				return;
			}

			DataTable dt = new DataTable();
			objDal.retailer_signup(Username, Password, Name, Email, Address, BankAccount, Contact, NTN, ref dt);


			if (objDal.retailer_search(Username))
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