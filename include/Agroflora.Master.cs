using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Agroflora
{
	public partial class Agroflora : System.Web.UI.MasterPage
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void btn_search_Click(object sender, EventArgs e)
		{
			string search = txt_search.Text;
			Response.Redirect("search.aspx?SEARCH=" + search);
		}
	}
}