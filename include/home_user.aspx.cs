using System;
using System.Data;
using Agroflora.DAL;

namespace Agroflora
{
	public partial class home_user : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			load_new_products();
			load_popular_products();
		}

		public void load_new_products()
		{
			agroflora_DAL objDAL = new agroflora_DAL();
			DataSet ds = objDAL.get_new_products();

			DateTime add_date;
			String datetime;

			//load product1
			label_newproduct1.Text = ds.Tables[0].Rows[0]["Name"].ToString();
			img_newproduct1.Attributes.Add("src", ds.Tables[0].Rows[0]["Image"].ToString());
			hyper_newproduct1.Attributes.Add("href", "product_user.aspx" + "?PID=" + ds.Tables[0].Rows[0]["ProductID"]);
			datetime = ds.Tables[0].Rows[0]["DateAdded"].ToString();
			DateTime.TryParse(datetime, out add_date);
			label_newproductdate1.Text = "Added " + ((DateTime.Now - add_date).Days).ToString() + " days ago";
			//load product2
			label_newproduct2.Text = ds.Tables[0].Rows[1]["Name"].ToString();
			img_newproduct2.Attributes.Add("src", ds.Tables[0].Rows[1]["Image"].ToString());
			hyper_newproduct2.Attributes.Add("href", "product_user.aspx" + "?PID=" + ds.Tables[0].Rows[1]["ProductID"]);
			datetime = ds.Tables[0].Rows[1]["DateAdded"].ToString();
			DateTime.TryParse(datetime, out add_date);
			label_newproductdate2.Text = "Added " + ((DateTime.Now - add_date).Days).ToString() + " days ago";
			//load product3
			label_newproduct3.Text = ds.Tables[0].Rows[2]["Name"].ToString();
			img_newproduct3.Attributes.Add("src", ds.Tables[0].Rows[2]["Image"].ToString());
			hyper_newproduct3.Attributes.Add("href", "product_user.aspx" + "?PID=" + ds.Tables[0].Rows[2]["ProductID"]);
			datetime = ds.Tables[0].Rows[2]["DateAdded"].ToString();
			DateTime.TryParse(datetime, out add_date);
			label_newproductdate3.Text = "Added " + ((DateTime.Now - add_date).Days).ToString() + " days ago";

		}
		public void load_popular_products()
		{
			agroflora_DAL objDAL = new agroflora_DAL();
			DataSet ds = objDAL.get_popular_products();

			DateTime add_date;
			String datetime;

			//load product1
			label_popproduct1.Text = ds.Tables[0].Rows[0]["Name"].ToString();
			img_popproduct1.Attributes.Add("src", ds.Tables[0].Rows[0]["Image"].ToString());
			hyper_popproduct1.Attributes.Add("href", "product_user.aspx" + "?PID=" + ds.Tables[0].Rows[0]["ProductID"]);
			datetime = ds.Tables[0].Rows[0]["DateAdded"].ToString();
			DateTime.TryParse(datetime, out add_date);
			label_popproductdate1.Text = "Added " + ((DateTime.Now - add_date).Days).ToString() + " days ago";
			//load product2
			label_popproduct2.Text = ds.Tables[0].Rows[1]["Name"].ToString();
			img_popproduct2.Attributes.Add("src", ds.Tables[0].Rows[1]["Image"].ToString());
			hyper_popproduct2.Attributes.Add("href", "product_user.aspx" + "?PID=" + ds.Tables[0].Rows[1]["ProductID"]);
			datetime = ds.Tables[0].Rows[1]["DateAdded"].ToString();
			DateTime.TryParse(datetime, out add_date);
			label_popproductdate2.Text = "Added " + ((DateTime.Now - add_date).Days).ToString() + " days ago";
			//load product3
			label_popproduct3.Text = ds.Tables[0].Rows[2]["Name"].ToString();
			img_popproduct3.Attributes.Add("src", ds.Tables[0].Rows[2]["Image"].ToString());
			hyper_popproduct3.Attributes.Add("href", "product_user.aspx" + "?PID=" + ds.Tables[0].Rows[2]["ProductID"]);
			datetime = ds.Tables[0].Rows[2]["DateAdded"].ToString();
			DateTime.TryParse(datetime, out add_date);
			label_popproductdate3.Text = "Added " + ((DateTime.Now - add_date).Days).ToString() + " days ago";
		}
	}
}