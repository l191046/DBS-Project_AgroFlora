using System;
using System.Web.UI.WebControls;
using Agroflora.DAL;
using System.Collections;
using System.Data;

namespace Agroflora
{
    public partial class rate_product : System.Web.UI.Page
    {
        protected string username;
        protected int productID;
        protected void Page_Load(object sender, EventArgs e)
        {
            username = Session["customer"] as string;
            productID = Convert.ToInt32(Request.QueryString["PID"]);
            if (username == null || productID == 0)
			{
                //REPLACE WITH ERROR PAGE
                Response.Redirect("error.aspx");
                //username = "default";
                //Session["customer"] = username;
                //ArrayList cartItems = new ArrayList();
                //ArrayList cartQuantity = new ArrayList();
                //Session["item"] = cartItems;
                //Session["quantity"] = cartQuantity;
                //productID = 1;
            }

            td_uname.InnerHtml = username;
            agroflora_DAL objDAL = new agroflora_DAL();
            DataTable dt = new DataTable();
            if (objDAL.get_product(productID, ref dt) == -1)
			{
                Response.Redirect("error.aspx");
			}
            td_pname.InnerHtml = dt.Rows[0]["Name"].ToString();
        }

        protected void input_rating(object sender, EventArgs e)
        {
            agroflora_DAL objDAL = new agroflora_DAL();
            DataTable dt = new DataTable();
            if (objDAL.get_customer(username, ref dt) == -1)
			{
                Response.Redirect("error.aspx");
			}
            int customerID = Convert.ToInt32(dt.Rows[0]["CustomerID"].ToString());
            int rating = drop_rating.SelectedIndex;
            string review = txt_review.Text;

            if (objDAL.rate_product(customerID, productID, rating, review) == -1)
            {
                Response.Redirect("error.aspx");
            }

            Response.Redirect("customer_profile.aspx");
        }
    }
}