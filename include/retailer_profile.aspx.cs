using System;
using System.Data;
using Agroflora.DAL;

namespace Agroflora
{
	public partial class retailer_profile : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			load_profile();
		}
		public void load_profile()
		{
			string username = Session["retailer"] as string;
			try
			{
				if (username != null)
				{
					agroflora_DAL objDAL = new agroflora_DAL();
					DataSet ds = objDAL.get_retailer(username);

					td_uname.InnerText = ds.Tables[0].Rows[0]["UserName"].ToString();
					td_name.InnerText = ds.Tables[0].Rows[0]["Name"].ToString();
					td_email.InnerText = ds.Tables[0].Rows[0]["Email"].ToString();
					td_address.InnerText = ds.Tables[0].Rows[0]["Address"].ToString();
					td_ntn.InnerText = ds.Tables[0].Rows[0]["NTN"].ToString();
					td_contact.InnerText = ds.Tables[0].Rows[0]["Contact"].ToString();
					td_bankaccount.InnerText = ds.Tables[0].Rows[0]["BankAccount"].ToString();

				}
			}
			catch (Exception e)
			{
				Console.WriteLine("Error : " + e.ToString());

			}
		}
	}
}