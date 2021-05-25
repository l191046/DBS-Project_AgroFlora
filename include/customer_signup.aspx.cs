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

			//validate
			//username validation
			if (objDAL.customer_search(username))
			{
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Username Taken')", true);
				return;
			}
			//password validation
			else if (password.Length < 8)
			{
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Password must be atleast 8 characters')", true);
				return;
			}

			DataTable dt = new DataTable();
			objDAL.customer_signup(username, password, fname, lname, email, address, dob);

			if (objDAL.customer_search(username))
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
