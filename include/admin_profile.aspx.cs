using System;
using Agroflora.DAL;
using System.Data;

namespace Agroflora
{
	public partial class admin_profile : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			load_profile();
		}

		public void load_profile()
		{
			string username = Session["admin"] as string;
			if (username == null)
			{
				username = "default";
				Session["admin"] = username;
			}
			if (username != null)
			{
				agroflora_DAL objDAL = new agroflora_DAL();
				DataTable dt = new DataTable();
				if(objDAL.get_admin(username, ref dt) == -1)
				{
					Response.Redirect("error.aspx");
				}
				else
				{
					td_uname.InnerText = dt.Rows[0]["UserName"].ToString();
					td_fname.InnerText = dt.Rows[0]["Fname"].ToString();
					td_lname.InnerText = dt.Rows[0]["Lname"].ToString();
					td_email.InnerText = dt.Rows[0]["Email"].ToString();
					td_cnic.InnerText = dt.Rows[0]["CNIC"].ToString();
				}
			}
		}
	}
}