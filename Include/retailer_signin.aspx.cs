using System;
using System.Data;
using Agroflora.DAL;

namespace Agroflora
{
	public partial class retailer_signin : System.Web.UI.Page
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
			int found = objDAL.retailer_signin(username, password, ref dt);

			switch (found)
			{
				case -1:
					Response.Redirect("error.aspx");
					break;
				case 0:
					//Use javascrip to show invalid credentials messge
					Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "error_invalid_credentials()", true);
					break;
				case 1:
					Session["customer"] = null;
					Session["admin"] = null;
					Session["retailer"] = username;
					Response.Redirect("retailer_profile.aspx");
					break;
			}
		}
	}
}