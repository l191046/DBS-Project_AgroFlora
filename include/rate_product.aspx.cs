using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Agroflora.DAL;
using System.Data;

namespace Agroflora
{
    public partial class rate_product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int ProductID = Convert.ToInt32(Request.QueryString["PID"]);
            agroflora_DAL objDAL = new agroflora_DAL();
            DataTable dt = new DataTable();
            if (objDAL.get_product(ProductID, ref dt) == -1)
            {
                Response.Redirect("error.aspx");
            }

            string username = Session["customer"] as string;

            DataTable dt2 = new DataTable();
            if (objDAL.get_customer(username, ref dt2) == -1)
            {
                Response.Redirect("error.aspx");
            }

            td_uname.InnerHtml = dt2.Rows[0]["UserName"].ToString();

            td_pname.InnerHtml = dt.Rows[0]["Name"].ToString();


        }

        protected void input_rating(object sender, EventArgs e)
        {
            agroflora_DAL objDAL = new agroflora_DAL();

            int rating = Convert.ToInt32(td_rating.Text);
            string review = td_review.InnerHtml.ToString();
            if (review == "")
            {
                review = null;
            }

            string username = td_uname.InnerHtml.ToString();

            int ProductID = Convert.ToInt32(Request.QueryString["PID"]);


            objDAL.rate_product(username, ProductID, rating, review);

            Response.Redirect("customer_profile.aspx");


        }
    }
}