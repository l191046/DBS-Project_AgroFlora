using System;
using System.Data;
using Agroflora.DAL;

namespace Agroflora
{
	public partial class retailer_edit : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			string username = Session["retailer"] as string;
			if (username == null)
			{
				//REPLACE WITH ERROR PAGE
				Response.Redirect("error.aspx");
				//username = "default";
				//Session["retailer"] = username;
			}
			if (!IsPostBack)
			{
				load_retailer();
			}
		}

		protected void load_retailer()
		{
			string username = Session["retailer"] as string;

			DataTable dt = new DataTable();
			agroflora_DAL objDAL = new agroflora_DAL();

			if (objDAL.get_retailer(username, ref dt) == -1)
			{
				Response.Redirect("error.aspx");
			}
			else
			{
				txt_uname.Text = dt.Rows[0]["UserName"].ToString();
				txt_name.Text = dt.Rows[0]["Name"].ToString();
				txt_email.Text = dt.Rows[0]["Email"].ToString();
				txt_address.Text = dt.Rows[0]["Address"].ToString();
				txt_ntn.Text = dt.Rows[0]["NTN"].ToString();
				txt_contact.Text = dt.Rows[0]["Contact"].ToString();
			}
		}

		protected void btn_save_Click(object sender, EventArgs e)
		{
			agroflora_DAL objDAL = new agroflora_DAL();
			string uname = Session["retailer"] as string;
			string name = txt_name.Text;
			string email = txt_email.Text;
			string address = txt_address.Text;
			string ntn = txt_ntn.Text;
			string contact = txt_contact.Text;

			if (objDAL.edit_retailer(uname, name, email, address, ntn, contact) == -1)
			{
				Response.Redirect("error.aspx");
			}
			else
			{
				Response.Redirect("retailer_profile.aspx");
			}
		}
	}
}