using System;
using System.Data;
using Agroflora.DAL;

namespace Agroflora
{
	public partial class catalogue : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			load_products();
		}

		protected void load_products()
		{
			String category = Request.QueryString["Category"];
			if(category == null)
			{
				category = "Plant";
			}
			DataTable DT = new DataTable();
			agroflora_DAL objDAL = new agroflora_DAL();

			int getProducts = objDAL.get_products_category(category, ref DT);
			if (getProducts == -1)
			{
				Response.Redirect("error.aspx");
			}
			else
			{
				repeater_products.DataSource = DT;
				repeater_products.DataBind();
				h1_category.InnerHtml = category + "s";
			}
		}
		protected void link_products()
		{

		}
	}
}