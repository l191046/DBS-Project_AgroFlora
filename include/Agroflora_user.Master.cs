using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Agroflora
{
	public partial class Agroflora_user : System.Web.UI.MasterPage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (Session["customer"] == null)
			{
				hyper_checkout.Visible = false;
			}

			if (Session["admin"] != null)
			{
				hyper_profile.Attributes.Add("href", "admin_profile.aspx");
			}
			else if (Session["retailer"] != null)
			{
				hyper_profile.Attributes.Add("href", "retailer_profile.aspx");
			}
			else if (Session["customer"] != null)
			{
				hyper_profile.Attributes.Add("href", "customer_profile.aspx");
			}
		}

		protected void btn_search_Click(object sender, EventArgs e)
		{
			string search = txt_search.Text;
			Response.Redirect("search_user.aspx?SEARCH=" + search);
		}
	}
}