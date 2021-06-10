using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Agroflora.DAL;
using System.Data;
using System.Data.SqlClient;

namespace Agroflora
{
	public partial class customer_profile : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			load_profile();
			load_history();
		}

		public void load_profile()
		{
			string username = Session["customer"] as string;
			try
			{
				if (username != null)
				{
					agroflora_DAL objDAL = new agroflora_DAL();
					DataSet ds = objDAL.get_customer(username);

					td_uname.InnerText = ds.Tables[0].Rows[0]["UserName"].ToString();
					td_fname.InnerText = ds.Tables[0].Rows[0]["Fname"].ToString();
					td_lname.InnerText = ds.Tables[0].Rows[0]["Lname"].ToString();
					td_email.InnerText = ds.Tables[0].Rows[0]["email"].ToString();
					td_address.InnerText = ds.Tables[0].Rows[0]["address"].ToString();
					td_dob.InnerText = ds.Tables[0].Rows[0]["dob"].ToString();
					td_contact.InnerText = ds.Tables[0].Rows[0]["contact"].ToString();
					td_creditcard.InnerText = ds.Tables[0].Rows[0]["creditcard"].ToString();
				}
			}
			catch (Exception e)
			{
				Console.WriteLine("Error : " + e.ToString());

			}
		}

		public void load_history()
		{
			string username = Session["customer"] as string;
			agroflora_DAL objDAL = new agroflora_DAL();
			DataSet ds = objDAL.purchase_history(username);
			if (ds.Tables.Count != 0)
			{
				grid_history.DataSource = ds;
				grid_history.DataBind();
			}


		}
	}
}