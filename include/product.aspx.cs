using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Agroflora.DAL;
using System.Collections;


namespace Agroflora
{
	public partial class product : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			load_product();
			load_ratings();
		}


		protected void load_product()
		{

			int productID;
			if (Request.QueryString["PID"] == null)
			{
				productID = 1;
			}
			else
			{
				productID = Int32.Parse(Request.QueryString["PID"]);
			}

			DataTable DT = new DataTable();
			agroflora_DAL objDAL = new agroflora_DAL();

			int getProduct = objDAL.get_product(productID, ref DT);
			if (getProduct == -1)
			{
				Response.Redirect("error.aspx");
			}
			else
			{
				img_product.Attributes.Add("src", DT.Rows[0]["Image"].ToString());
				td_name.InnerHtml = DT.Rows[0]["Name"].ToString();
				td_category.InnerHtml = DT.Rows[0]["Category"].ToString();
				td_price.InnerHtml = DT.Rows[0]["Price"].ToString();
				td_desc.InnerHtml = DT.Rows[0]["Description"].ToString();
				int stock = Int32.Parse(DT.Rows[0]["Stock"].ToString());
				td_quantity.InnerHtml = stock.ToString();
				if (stock == 0)
				{
					td_stock.InnerHtml = "OUT OF STOCK";
				}
			}

		}

		public void load_ratings()
		{
			int productID;
			if (Request.QueryString["PID"] == null)
			{
				productID = 1;
			}
			else
			{
				productID = Int32.Parse(Request.QueryString["PID"]);
			}

			agroflora_DAL objDAL = new agroflora_DAL();
			DataTable dt = new DataTable();
			if (objDAL.get_rating(productID, ref dt) == -1)
			{
				Response.Redirect("error.aspx");
			}
			else
			{
				rep_ratings.DataSource = dt;
				rep_ratings.DataBind();
			}
		}
	}
}