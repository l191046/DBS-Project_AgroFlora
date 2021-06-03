using System;
using System.Data;
using Agroflora.DAL;

namespace Agroflora
{
	public partial class customer_signin : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void btn_signin_click(object sender, EventArgs e)
		{
			agroflora_DAL objDAL = new agroflora_DAL();

			//get input from webform
			string username = txt_username.Text;
			string password = txt_password.Text;
			//search in dbs
			DataTable dt = new DataTable();
			int found = objDAL.customer_signin(username, password, ref dt);

			if (found > 0)
			{
				Response.Redirect("customer_profile.aspx");
			}
			else
			{
				Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "error_invalid_credentials()", true);
			}
		}
	}
}
