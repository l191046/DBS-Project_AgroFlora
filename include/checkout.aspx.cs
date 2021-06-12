using System;
using System.Web.UI.WebControls;
using Agroflora.DAL;
using System.Collections;
using System.Data;


namespace Agroflora
{
	public partial class checkout : System.Web.UI.Page
	{
		protected int customerID;
		protected void Page_Load(object sender, EventArgs e)
		{
			load_profile();
			load_cart();
		}

		protected void insertInDB(object sender, EventArgs e)
		{
			agroflora_DAL objDAL = new agroflora_DAL();
			string username = Session["customer"] as string;

			int pType = Int32.Parse(drop_payment.SelectedValue);

			ArrayList cartItems = new ArrayList();
			ArrayList cartQuantity = new ArrayList();
			cartItems = (ArrayList)Session["item"];
			cartQuantity = (ArrayList)Session["quantity"];

			if(cartItems == null)
			{
				return;
			}
			for (int i = 0; i < cartItems.Count; i++)
			{
				int tCount = objDAL.get_table_count("Purchase") + 1;
				int purchaseID = tCount;
				int Item = (int)cartItems[i];
				int Quantity = (int)cartQuantity[i];

				int currentStock = objDAL.get_stock(Item);
				int newStock = currentStock - Quantity;
				if (newStock >= 0)
				{
					objDAL.update_stock(Item, newStock);
					objDAL.add_purchase(purchaseID, customerID, Item, Quantity, pType);
				}
			}

			cartQuantity.Clear();
			cartItems.Clear();
			Session["item"] = cartItems;
			Session["quantity"] = cartQuantity;

			Response.Redirect("home_user.aspx");
		}

		protected void grid_cart_rowCommand(object sender, GridViewCommandEventArgs e)
		{
			if (e.CommandName == "remove")
			{
				int product_id = Convert.ToInt32(e.CommandArgument);
				ArrayList cartItems = new ArrayList();
				ArrayList cartQuantity = new ArrayList();
				cartItems = (ArrayList)Session["item"];
				cartQuantity = (ArrayList)Session["quantity"];

				ArrayList newItems = new ArrayList();
				ArrayList newQuantity = new ArrayList();

				for (int i = 0; i < cartItems.Count; i++)
				{
					int Item = (int)cartItems[i];
					int Quantity = (int)cartQuantity[i];

					if (Item != product_id)
					{
						newItems.Add(Item);
						newQuantity.Add(Quantity);
					}

				}

				Session["item"] = newItems;
				Session["quantity"] = newQuantity;


				Response.Redirect("checkout.aspx");

			}

		}

		void load_cart()
		{
			agroflora_DAL objDal = new agroflora_DAL();


			ArrayList cartItems = new ArrayList();
			ArrayList cartQuantity = new ArrayList();
			cartItems = (ArrayList)Session["item"];
			cartQuantity = (ArrayList)Session["quantity"];

			if(cartItems == null)
			{
				cartItems = new ArrayList();
				Session["item"] = cartItems;
				cartQuantity = new ArrayList();
				Session["quantity"] = cartQuantity;
			}

			DataRow workRow;
			DataTable dt = new DataTable();
			DataTable temp = new DataTable();
			dt.Columns.Add("ProductID");
			dt.Columns.Add("Quantity");
			dt.Columns.Add("Name");
			dt.Columns.Add("Price");
			int total = 0;
			for (int i = 0; i < cartItems.Count; i++)
			{
				workRow = dt.NewRow();
				int Item = (int)cartItems[i];
				int Quantity = (int)cartQuantity[i];



				int x = objDal.get_product(Item, ref temp);
				string Name = temp.Rows[0]["Name"].ToString();
				string Price = temp.Rows[0]["Price"].ToString();

				total += Int32.Parse(Price) * Quantity;

				workRow["Name"] = Name;
				workRow["Price"] = Price;



				workRow["ProductID"] = Item;
				workRow["Quantity"] = Quantity;
				dt.Rows.Add(workRow);
			}
			grid_products.DataSource = dt;
			grid_products.DataBind();

			t_bill.Text = "Total Bill = " + total.ToString();

			if(cartItems.Count == 0)
			{
				btn_submit.Visible = false;
			}
		}

		void load_profile()
		{
			string username = Session["customer"] as string;
			if (username == null)
			{
				username = "default";
				Session["customer"] = username;
			}
			if (username != null)
			{
				agroflora_DAL objDAL = new agroflora_DAL();
				DataTable dt = new DataTable();
				int result = objDAL.get_customer(username, ref dt);

				if (result == -1)
				{
					Response.Redirect("error.aspx");
				}
				else
				{
					customerID = Convert.ToInt32(dt.Rows[0]["CustomerID"].ToString());
					td_fname.InnerText = dt.Rows[0]["Fname"].ToString();
					td_lname.InnerText = dt.Rows[0]["Lname"].ToString();
					td_email.InnerText = dt.Rows[0]["email"].ToString();
					td_address.InnerText = dt.Rows[0]["address"].ToString();

					td_contact.InnerText = dt.Rows[0]["contact"].ToString();
				}
			}

		}
	}
}