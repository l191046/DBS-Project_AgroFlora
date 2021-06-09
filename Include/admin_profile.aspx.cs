using System;
using Agroflora.DAL;
using System.Data;

namespace Agroflora
{
	public partial class admin_profile : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			load_profile();
		}

		public void load_profile()
		{
			string username = Session["admin"] as string;
			try
			{
				if (username != null)
				{
					agroflora_DAL objDAL = new agroflora_DAL();
					DataSet ds = objDAL.get_admin(username);

					td_uname.InnerText = ds.Tables[0].Rows[0]["UserName"].ToString();
					td_fname.InnerText = ds.Tables[0].Rows[0]["Fname"].ToString();
					td_lname.InnerText = ds.Tables[0].Rows[0]["Lname"].ToString();
					td_email.InnerText = ds.Tables[0].Rows[0]["Email"].ToString();
					td_cnic.InnerText = ds.Tables[0].Rows[0]["CNIC"].ToString();
				}
			}
			catch (Exception e)
			{
				Console.WriteLine("Error : " + e.ToString());

			}
		}
	}
}