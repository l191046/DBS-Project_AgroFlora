using System;
using System.Data;
using System.Drawing;
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
			string fname = txt_fname.Text;
			string lname = txt_password.Text;
			string username = txt_username.Text;
			string email = txt_email.Text;
			string password = txt_password.Text;
			string address = txt_address.Text;
			string dob = txt_dob.Text;
			
			//search in dbs
			DataTable dt = new DataTable();
			int sucess = objDAL.customer_signup(fname, lname,username,email,password,address,dob, ref dt);

			if (sucess == 0)
			{
				Response.Redirect("customer_profile.aspx");
			}
			else 
			{
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid Username or Password')", true);
			}
		}
	}
}
