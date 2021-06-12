using System;
using System.Data;
using Agroflora.DAL;

namespace Agroflora
{
	public partial class retailer_profile : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			load_profile();
			load_products();
			load_sales();
		}
		public void load_profile()
		{
			string username = Session["retailer"] as string;
			if (username == null)
			{
				username = "default";
				Session["retailer"] = username;
			}
			if (username != null)
			{
				agroflora_DAL objDAL = new agroflora_DAL();
				DataTable dt = new DataTable();
				if (objDAL.get_retailer(username, ref dt) == -1)
				{
					Response.Redirect("error.aspx");
				}
				else
				{
					td_uname.InnerText = dt.Rows[0]["UserName"].ToString();
					td_name.InnerText = dt.Rows[0]["Name"].ToString();
					td_email.InnerText = dt.Rows[0]["Email"].ToString();
					td_address.InnerText = dt.Rows[0]["Address"].ToString();
					td_ntn.InnerText = dt.Rows[0]["NTN"].ToString();
					td_contact.InnerText = dt.Rows[0]["Contact"].ToString();
					td_bankaccount.InnerText = dt.Rows[0]["BankAccount"].ToString();
				}

			}
		}

		public void load_products()
		{
			string username = Session["retailer"] as string;
			if (username != null)
			{
				agroflora_DAL objDAL = new agroflora_DAL();
				DataTable dt = new DataTable();
				if (objDAL.product_history(username, ref dt) == -1)
				{
					Response.Redirect("error.aspx");
				}
				else
				{
					grid_products.DataSource = dt;
					grid_products.DataBind();
				}
			}
		}

		public void load_sales()
		{
			string username = Session["retailer"] as string;
			if (username != null)
			{
				agroflora_DAL objDAL = new agroflora_DAL();
				DataTable dt = new DataTable();
				if (objDAL.sale_history(username, ref dt) == -1)
				{
					Response.Redirect("error.aspx");
				}
				else
				{
					grid_sales.DataSource = dt;
					grid_sales.DataBind();
				}
			}
		}

	}
}