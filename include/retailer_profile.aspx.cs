using System;
using System.Data;
using Agroflora.DAL;

namespace Agroflora
{
	public partial class retailer_profile : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			string username = Session["retailer"] as string;
			if (username == null)
			{
				//REPLACE WITH ERROR PAGE
				//Response.Redirect("error.aspx");
				username = "default";
				Session["retailer"] = username;
			}
			load_profile();
			load_products();
			load_sales();
		}
		public void load_profile()
		{
			string username = Session["retailer"] as string;
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
			}		
		}

		public void load_products()
		{
			string username = Session["retailer"] as string;
			agroflora_DAL objDAL = new agroflora_DAL();
			DataTable dt = new DataTable();
			int rows = objDAL.product_history(username, ref dt);
			if (rows == -1)
			{
				Response.Redirect("error.aspx");
			}
			else if (rows > 0)
			{
				grid_products.DataSource = dt;
				grid_products.DataBind();
			}
			else
			{
				hr_products.Visible = false;
				h1_products.Visible = false;
				grid_products.Visible = false;
			}
		}

		public void load_sales()
		{
			string username = Session["retailer"] as string;
			agroflora_DAL objDAL = new agroflora_DAL();
			DataTable dt = new DataTable();
			if (objDAL.sale_history(username, ref dt) == -1)
			{
				Response.Redirect("error.aspx");
			}
			else
			{
				if(dt.Rows.Count > 0)
				{
					grid_sales.DataSource = dt;
					grid_sales.DataBind();
				}
				else
				{
					hr_sales.Visible = false;
					h1_sales.Visible = false;
					grid_sales.Visible = false;
				}
			}
		}

	}
}