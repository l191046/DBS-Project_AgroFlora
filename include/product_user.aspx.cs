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
	public partial class product_user : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			string username = Session["customer"] as string;
			if (username == null)
			{
				//REPLACE WITH ERROR PAGE
				//Response.Redirect("error.aspx");
				username = "default";
				Session["customer"] = username;

				ArrayList cartItems = new ArrayList();
				ArrayList cartQuantity = new ArrayList();
				Session["item"] = cartItems;
				Session["quantity"] = cartQuantity;
			}
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
				if (stock > 0)
				{
					vld_stock.MaximumValue = stock.ToString();
				}
				else
				{
					td_stock.InnerHtml = "OUT OF STOCK";
					vld_stock.MaximumValue = "0";
					vld_stock.MinimumValue = "0";
					quantity.Visible = false;
					btn_proceed.Visible = false;
					tr_purchaseAmount.Visible = false;
				}
			}

		}

		protected void add_onClick(object sender, EventArgs e)
		{

			agroflora_DAL objDal = new agroflora_DAL();
			ArrayList cartItems = new ArrayList();
			ArrayList cartQuantity = new ArrayList();
			cartItems = (ArrayList)Session["item"];
			cartQuantity = (ArrayList)Session["quantity"];

			if (Request.QueryString["PID"] == null)
			{
				return;
			}

			int ProductID = Int32.Parse(Request.QueryString["PID"]);


			int q = Int32.Parse(quantity.Text);

			cartItems.Add(ProductID);
			cartQuantity.Add(q);

			Session["item"] = cartItems;
			Session["quantity"] = cartQuantity;

			Response.Redirect("catalogue_user.aspx");

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