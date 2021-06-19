using System;
using System.Data;
using Agroflora.DAL;

namespace Agroflora
{
	public partial class customer_edit : System.Web.UI.Page
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
			}
			if (!IsPostBack)
			{
				load_customer();
			}
		}

		protected void load_customer()
		{
			string username = Session["customer"] as string;
			DataTable dt = new DataTable();
			agroflora_DAL objDAL = new agroflora_DAL();

			if (objDAL.get_customer(username, ref dt) == -1)
			{
				Response.Redirect("error.aspx");
			}
			else
			{
				txt_uname.Text = dt.Rows[0]["UserName"].ToString();
				txt_fname.Text = dt.Rows[0]["Fname"].ToString();
				txt_lname.Text = dt.Rows[0]["Lname"].ToString();
				txt_email.Text = dt.Rows[0]["Email"].ToString();
				txt_address.Text = dt.Rows[0]["Address"].ToString();
				string dates = dt.Rows[0]["DOB"].ToString();
				DateTime date;
				DateTime.TryParse(dates, out date);
				txt_dob.Text = date.ToString("yyyy-MM-dd");
				txt_contact.Text = dt.Rows[0]["Contact"].ToString();
			}
		}

		protected void btn_save_Click(object sender, EventArgs e)
		{
			agroflora_DAL objDAL = new agroflora_DAL();
			string uname = Session["customer"] as string;
			string fname = txt_fname.Text;
			string lname = txt_lname.Text;
			string email = txt_email.Text;
			string address = txt_address.Text;
			string dob = txt_dob.Text;
			string contact = txt_contact.Text;

			if (objDAL.edit_customer(uname, fname, lname, email, address, dob, contact) == -1)
			{
				Response.Redirect("error.aspx");
			}
			else
			{
				Response.Redirect("customer_profile.aspx");
			}
		}
	}
}