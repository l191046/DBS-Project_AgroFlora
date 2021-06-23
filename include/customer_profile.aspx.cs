using System;
using System.Web.UI.WebControls;
using Agroflora.DAL;
using System.Collections;
using System.Data;

namespace Agroflora
{
	public partial class customer_profile : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			string username = Session["customer"] as string;
			if (username == null)
			{
				//REPLACE WITH ERROR PAGE
				Response.Redirect("error.aspx");
				//username = "default";
				//Session["customer"] = username;

				//ArrayList cartItems = new ArrayList();
				//ArrayList cartQuantity = new ArrayList();
				//Session["item"] = cartItems;
				//Session["quantity"] = cartQuantity;
			}
			load_profile();
			load_history();
			load_unrated();
		}
		public void load_profile()
		{
			string username = Session["customer"] as string;
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
				string dob = dt.Rows[0]["dob"].ToString();
				DateTime date;
				DateTime.TryParse(dob, out date);
				td_dob.InnerText = date.ToString("yyyy-MM-dd");
				td_contact.InnerText = dt.Rows[0]["contact"].ToString();
			}
		}
		public void load_history()
		{
			string username = Session["customer"] as string;
			agroflora_DAL objDAL = new agroflora_DAL();
			DataTable dt = new DataTable();
			if (objDAL.purchase_history(username, ref dt) == -1)
			{
				Response.Redirect("error.aspx");
			}
			else
			{
				if (dt.Rows.Count > 0)
				{
					grid_history.DataSource = dt;
					grid_history.DataBind();
				}
				else
				{
					hr_purchases.Visible = false;
					h1_purchases.Visible = false;
					grid_history.Visible = false;
				}
			}
		}

		protected void grid_rating_rowCommand(object sender, GridViewCommandEventArgs e)
		{
			string ProductID = e.CommandArgument.ToString();
			Response.Redirect("rate_product.aspx?PID=" + ProductID);
		}

		public void load_unrated()
		{
			string username = Session["customer"] as string;
			agroflora_DAL objDAL = new agroflora_DAL();
			DataTable dt = new DataTable();
			int rows = objDAL.unrated_products(username, ref dt);
			if (rows == -1)
			{
				Response.Redirect("error.aspx");
			}
			else if (rows > 0)
			{
				grid_unrated.DataSource = dt;
				grid_unrated.DataBind();
			}
			else
			{
				hr_unrated.Visible = false;
				h1_unrated.Visible = false;
				grid_unrated.Visible = false;
			}
		}
	}
}