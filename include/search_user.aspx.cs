using System;
using System.Data;
using Agroflora.DAL;

namespace Agroflora
{
	public partial class search_user : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			load_products();
		}

		protected void load_products()
		{
			string search = Request.QueryString["SEARCH"];
			agroflora_DAL objDAL = new agroflora_DAL();
			DataTable dt = new DataTable();

			if (objDAL.search_product('%' + search + '%', ref dt) == -1)
			{
				Response.Redirect("error.aspx");
			}
			else
			{
				if (dt.Rows.Count > 0)
				{
					h3_search.InnerHtml = "Search results for: \"" + search + "\"";
					repeater_products.DataSource = dt;
					repeater_products.DataBind();
				}
				else
				{
					h3_search.InnerHtml = "No results for: \"" + search + "\"";
				}
			}
		}
	}
}