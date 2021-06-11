using System;
using Agroflora.DAL;
using System.Data;

namespace Agroflora
{
	public partial class customer_profile : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			load_profile();
			load_history();
		}

		public void load_profile()
		{
			string username = Session["customer"] as string;
			if (username != null)
			{
				agroflora_DAL objDAL = new agroflora_DAL();
				DataTable dt = new DataTable();

				if(objDAL.get_customer(username, ref dt) == -1)
				{
					Response.Redirect("error.aspx");
				}
				else
				{
					td_uname.InnerText = dt.Rows[0]["UserName"].ToString();
					td_fname.InnerText = dt.Rows[0]["Fname"].ToString();
					td_lname.InnerText = dt.Rows[0]["Lname"].ToString();
					td_email.InnerText = dt.Rows[0]["email"].ToString();
					td_address.InnerText = dt.Rows[0]["address"].ToString();
					td_dob.InnerText = dt.Rows[0]["dob"].ToString();
					td_contact.InnerText = dt.Rows[0]["contact"].ToString();
					td_creditcard.InnerText = dt.Rows[0]["creditcard"].ToString();
				}
			}
		}

		public void load_history()
		{
			string username = Session["customer"] as string;
			if (username != null)
			{
				agroflora_DAL objDAL = new agroflora_DAL();
				DataTable dt = new DataTable();
				if (objDAL.purchase_history(username, ref dt) == -1)
				{
					Response.Redirect("error.aspx");
				}
				else
				{
					grid_history.DataSource = dt;
					grid_history.DataBind();
				}
			}
		}
	}
}