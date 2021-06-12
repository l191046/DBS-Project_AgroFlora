using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Agroflora.DAL;
using System.Collections;
using System.Data;

namespace Agroflora
{
	public partial class unrated_products : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

			load_unrated();



		}

		protected void grid_rating_rowCommand(object sender, GridViewCommandEventArgs e)
		{
			string ProductID = e.CommandArgument.ToString();
			Response.Redirect("rate_product.aspx?PID=" + ProductID);
		}

		public void load_unrated()
		{
			string username = Session["customer"] as string;
			if (username != null)
			{
				agroflora_DAL objDAL = new agroflora_DAL();
				DataTable dt = new DataTable();
				if (objDAL.unrated_products(username, ref dt) == -1)
				{
					Response.Redirect("error.aspx");
				}
				else
				{
					grid_rating.DataSource = dt;
					grid_rating.DataBind();
				}
			}
		}

	}

}