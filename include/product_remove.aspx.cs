using System;
using System.Data;
using Agroflora.DAL;
using System.Web.UI.WebControls;

namespace Agroflora
{
	public partial class product_remove : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			string username = Session["admin"] as string;
			if (username == null)
			{
				Response.Redirect("error.aspx");
			}
			
			load_current_products();
			load_removed_products();
		}

		protected void load_current_products()
		{
			DataTable dt = new DataTable();
			agroflora_DAL objDAL = new agroflora_DAL();
			int rows = objDAL.get_current_products(ref dt);

			if(rows == -1)
			{
				Response.Redirect("error.aspx");
			}
			else if (rows == 0)
			{
				h3_current.Visible = false;
				grid_current.Visible = false;
				h3_no_current.Visible = true;
			}
			else
			{
				h3_no_current.Visible = false;
				grid_current.DataSource = dt;
				grid_current.DataBind();
			}
		}

		protected void load_removed_products()
		{
			DataTable dt = new DataTable();
			agroflora_DAL objDAL = new agroflora_DAL();
			int rows = objDAL.get_removed_products(ref dt);

			if (rows == -1)
			{
				Response.Redirect("error.aspx");
			}
			else if (rows == 0)
			{
				hr_removed.Visible = false;
				h3_removed.Visible = false;
				grid_removed.Visible = false;
			}
			else
			{
				grid_removed.DataSource = dt;
				grid_removed.DataBind();
			}
		}

		protected void grid_products_RowCommand(object sender, GridViewCommandEventArgs e)
		{
			if(e.CommandName == "remove")
			{
				int product_id = Convert.ToInt32(e.CommandArgument);
				agroflora_DAL objDAL = new agroflora_DAL();
				if (objDAL.remove_product(product_id) == -1)
				{
					Response.Redirect("error.aspx");
				}
				else
				{
					Response.Redirect("product_remove.aspx");
				}
			}
			else if(e.CommandName == "restore")
			{
				int product_id = Convert.ToInt32(e.CommandArgument);
				agroflora_DAL objDAL = new agroflora_DAL();
				if (objDAL.restore_product(product_id) == -1)
				{
					Response.Redirect("error.aspx");
				}
				else
				{
					Response.Redirect("product_remove.aspx");
				}
			}
		}
	}
}