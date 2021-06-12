using System;
using System.Data;
using System.IO;
using Agroflora.DAL;

namespace Agroflora
{
	public partial class product_add : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void btn_submit_Click(object sender, EventArgs e)
		{
			agroflora_DAL objDAL = new agroflora_DAL();
			string retailer = Session["retailer"] as string;
			if(retailer == null)
			{
				retailer = "default";
				Session["retailer"] = retailer;
			}
			int retailerID = objDAL.get_retailerID(retailer);
			if(retailerID == -1)
			{
				Response.Redirect("error.aspx");
				return;
			}

			string name = txt_productname.Text;
			float price = float.Parse(txt_price.Text);
			int categoryID = drop_category.SelectedIndex;
			int stock = Int32.Parse(txt_stock.Text);
			string desc = txt_description.Text;
			string dateAdded = DateTime.Now.ToString();

			string file_name;
			string file_path;
			string folder_name;
			folder_name = Server.MapPath("./images/products/");
			//file_name = file_image.PostedFile.FileName;
			//file_name = Path.GetFileName(file_name);

			file_name = name + DateTime.Now.Ticks.ToString() + ".png";
			file_path = folder_name + file_name;
			string image = "images/products/" + file_name;

			if ( objDAL.add_product(retailerID, name, price, categoryID, stock, desc, dateAdded, image) == -1)
			{
				Response.Redirect("error.aspx");
			}
			else
			{
				if (file_image.Value != "")
				{
					
					// Create the folder if it does not exist.
					if (!Directory.Exists(folder_name))
					{
						Directory.CreateDirectory(folder_name);
					}
					// Save the uploaded file to the server.
					if (!File.Exists(file_path))
					{
						file_image.PostedFile.SaveAs(file_path);
					}
				}
				Response.Redirect("retailer_profile.aspx");
			}

		}
	}
}