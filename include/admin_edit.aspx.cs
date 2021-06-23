using System;
using System.Data;
using Agroflora.DAL;

namespace Agroflora
{
	public partial class admin_edit : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			string username = Session["admin"] as string;
			if (username == null)
			{
				//REPLACE WITH ERROR PAGE
				Response.Redirect("error.aspx");
				//username = "default";
				//Session["admin"] = username;
			}
			if (!IsPostBack)
			{
				load_admin();
			}
		}

		protected void load_admin()
		{
			string username = Session["admin"] as string;
			DataTable dt = new DataTable();
			agroflora_DAL objDAL = new agroflora_DAL();

			if (objDAL.get_admin(username, ref dt) == -1)
			{
				Response.Redirect("error.aspx");
			}
			else
			{
				txt_fname.Text = dt.Rows[0]["Fname"].ToString();
				txt_lname.Text = dt.Rows[0]["Lname"].ToString();
				txt_uname.Text = dt.Rows[0]["UserName"].ToString();
				txt_email.Text = dt.Rows[0]["Email"].ToString();
				txt_cnic.Text = dt.Rows[0]["CNIC"].ToString();
			}
		}

		protected void btn_save_Click(object sender, EventArgs e)
		{
			agroflora_DAL objDAL = new agroflora_DAL();
			string uname = Session["admin"] as string;
			string fname = txt_fname.Text;
			string lname = txt_lname.Text;
			string email = txt_email.Text;
			string cnic = txt_cnic.Text;
			if (objDAL.edit_admin(uname, fname, lname, email, cnic) == -1)
			{
				Response.Redirect("error.aspx");
			}
			else
			{
				Response.Redirect("admin_profile.aspx");
			}
		}
	}
}