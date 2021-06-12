using System;
using System.Data;
using System.Data.SqlClient;
namespace Agroflora.DAL
{
	public class agroflora_DAL
	{
		private static readonly string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["sqlcon1"].ConnectionString;

		//UTILITY
		public int get_table_count(String table)
		{
			int result = -1;
			DataSet resultSet = new DataSet();
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand command;

			try
			{
				command = new SqlCommand("SELECT COUNT(*) AS [count] FROM " + table, con);
				command.CommandType = CommandType.Text;
				using (SqlDataAdapter da = new SqlDataAdapter(command))
				{
					da.Fill(resultSet);
				}
				result = Convert.ToInt32(resultSet.Tables[0].Rows[0]["count"]);
			}
			catch (SqlException ex)
			{
				Console.WriteLine("SQL Error: " + ex.Message.ToString());
				result = -1;
			}
			finally
			{
				con.Close();
			}

			return result;
		}
		public int search_customer(String username)
		{
			//return -1 if server error
			//return 0 if not found
			//return 1 if found
			int result = 0;

			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand command;

			try
			{
				command = new SqlCommand("search_customer", con);
				command.CommandType = CommandType.StoredProcedure;
				//establish parameters
				command.Parameters.Add("@username", SqlDbType.VarChar, 20);
				command.Parameters.Add("@found", SqlDbType.Int).Direction = ParameterDirection.Output;
				//set parameters
				command.Parameters["@username"].Value = username;

				command.ExecuteNonQuery();

				result = Convert.ToInt32(command.Parameters["@found"].Value);
			}
			catch (SqlException ex)
			{
				Console.WriteLine("SQL Error: " + ex.Message.ToString());
			}
			finally
			{
				con.Close();
			}
			return result;
		}
		public int search_NTN(String inputNTN)
		{
			//return -1 if server issue
			//return 0 if not found
			//return 1 if found
			int result = 0;
			
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand command;
			try
			{
				command = new SqlCommand("search_NTN", con);
				command.CommandType = CommandType.StoredProcedure;
				command.Parameters.Add("@NTN", SqlDbType.Char, 13);
				command.Parameters.Add("@found", SqlDbType.Int).Direction = ParameterDirection.Output;

				command.Parameters["@NTN"].Value = inputNTN;

				command.ExecuteNonQuery();

				result = Convert.ToInt32(command.Parameters["@found"].Value);

			}
			catch (SqlException ex)
			{
				Console.WriteLine("SQL Error: " + ex.Message.ToString());
				result = -1;
			}
			finally
			{
				con.Close();
			}

			return result;

		}
		public int search_retailer(String username)
		{
			//return -1 if server error
			//return 0 if not found
			//return 1 if found
			int result = 0;
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand command;
			try
			{
				command = new SqlCommand("search_retailer", con);
				command.CommandType = CommandType.StoredProcedure;

				command.Parameters.Add("@username", SqlDbType.VarChar, 20);
				command.Parameters.Add("@found", SqlDbType.Int).Direction = ParameterDirection.Output;

				command.Parameters["@username"].Value = username;
				command.ExecuteNonQuery();

				result = Convert.ToInt32(command.Parameters["@found"].Value);

			}
			catch (SqlException e)
			{
				Console.WriteLine("SQL Error: " + e.Message.ToString());
				result = -1;
			}

			finally
			{
				con.Close();
			}


			return result;
		}

		//HOME PAGE
		public DataSet get_popular_products()
		{
			DataSet resultSet = new DataSet();
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand command;

			try
			{
				command = new SqlCommand("get_popular_products", con);
				command.CommandType = CommandType.StoredProcedure;
				command.ExecuteNonQuery();
				using (SqlDataAdapter da = new SqlDataAdapter(command))
				{
					da.Fill(resultSet);
				}
			}
			catch (SqlException ex)
			{
				Console.WriteLine("SQL ERROR: " + ex.Message.ToString());
			}
			finally
			{
				con.Close();
			}

			return resultSet;
		}
		public DataSet get_new_products()
		{
			DataSet resultSet = new DataSet();
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand command;

			try
			{
				command = new SqlCommand("get_new_products", con);
				command.CommandType = CommandType.StoredProcedure;
				command.ExecuteNonQuery();
				using (SqlDataAdapter da = new SqlDataAdapter(command))
				{
					da.Fill(resultSet);
				}
			}
			catch (SqlException ex)
			{
				Console.WriteLine("SQL ERRO: " + ex.Message.ToString());
			}
			finally
			{
				con.Close();
			}

			return resultSet;
		}

		//SIGN IN PAGES
		public int admin_signin(String username, String password, ref DataTable DT)
		{
			//return -1 on server side issue
			//return 0 if not found
			//return 1 if found
			int found = 0;
			DataSet resultSet = new DataSet();
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand command;

			try
			{
				command = new SqlCommand("admin_signin", con);
				command.CommandType = CommandType.StoredProcedure;
				//establish parameters
				command.Parameters.Add("@username", SqlDbType.VarChar, 20);
				command.Parameters.Add("@password", SqlDbType.VarChar, 20);
				command.Parameters.Add("@found", SqlDbType.Int).Direction = ParameterDirection.Output;
				//set parameters
				command.Parameters["@username"].Value = username;
				command.Parameters["@password"].Value = password;

				command.ExecuteNonQuery();
				//get output
				found = Convert.ToInt32(command.Parameters["@found"].Value);

				if (found == 1)
				{
					using (SqlDataAdapter da = new SqlDataAdapter(command))
					{
						da.Fill(resultSet);
					}
					DT = resultSet.Tables[0];
				}

			}
			catch (SqlException ex)
			{
				Console.WriteLine("SQL Error: " + ex.Message.ToString());
				found = -1;
			}
			finally
			{
				con.Close();
			}

			return found;
		}
		public int customer_signin(String username, String password, ref DataTable DT)
		{
			//return -1 on server side issue
			//return 0 if not found
			//return 1 if found
			int found = 0;
			DataSet resultSet = new DataSet();
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand command;

			try
			{
				command = new SqlCommand("customer_signin", con);
				command.CommandType = CommandType.StoredProcedure;
				//establish parameters
				command.Parameters.Add("@username", SqlDbType.VarChar, 20);
				command.Parameters.Add("@password", SqlDbType.VarChar, 20);
				command.Parameters.Add("@found", SqlDbType.Int).Direction = ParameterDirection.Output;
				//set parameters
				command.Parameters["@username"].Value = username;
				command.Parameters["@password"].Value = password;

				command.ExecuteNonQuery();
				//get output
				found = Convert.ToInt32(command.Parameters["@found"].Value);

				if (found == 1)
				{
					using (SqlDataAdapter da = new SqlDataAdapter(command))
					{
						da.Fill(resultSet);
					}
					DT = resultSet.Tables[0];
				}
			}
			catch (SqlException ex)
			{
				Console.WriteLine("SQL Error: " + ex.Message.ToString());
				found = -1;
			}
			finally
			{
				con.Close();
			}

			return found;
		}
		public int retailer_signin(String username, String password, ref DataTable DT)
		{
			//return -1 on server side issue
			//return 0 if not found
			//return 1 if found
			int found = 0;
			DataSet resultSet = new DataSet();
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand command;

			try
			{
				command = new SqlCommand("retailer_signin", con);
				command.CommandType = CommandType.StoredProcedure;
				//establish parameters
				command.Parameters.Add("@username", SqlDbType.VarChar, 20);
				command.Parameters.Add("@password", SqlDbType.VarChar, 20);
				command.Parameters.Add("@found", SqlDbType.Int).Direction = ParameterDirection.Output;
				//set parameters
				command.Parameters["@username"].Value = username;
				command.Parameters["@password"].Value = password;

				command.ExecuteNonQuery();
				//get output
				found = Convert.ToInt32(command.Parameters["@found"].Value);

				if (found == 1)
				{
					using (SqlDataAdapter da = new SqlDataAdapter(command))
					{
						da.Fill(resultSet);
					}
					DT = resultSet.Tables[0];
				}
			}
			catch (SqlException ex)
			{
				Console.WriteLine("SQL Error: " + ex.Message.ToString());
				found = -1;
			}
			finally
			{
				con.Close();
			}

			return found;
		}

		//SIGN UP PAGES
		public int customer_signup(string username, string password, string fname, string lname, string email, string address, string dob, string contact)
		{
			//return -1 on server issue
			//return 1 otherwise
			int result = -1;
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand command;
			try
			{
				command = new SqlCommand("customer_signup", con);
				command.CommandType = CommandType.StoredProcedure;
				//establish parameters
				command.Parameters.Add("@username", SqlDbType.VarChar, 20);
				command.Parameters.Add("@password", SqlDbType.VarChar, 20);
				command.Parameters.Add("@customerID", SqlDbType.Int);
				command.Parameters.Add("@fname", SqlDbType.VarChar, 20);
				command.Parameters.Add("@lname", SqlDbType.VarChar, 20);
				command.Parameters.Add("@email", SqlDbType.VarChar, 30);
				command.Parameters.Add("@address", SqlDbType.VarChar, 50);
				command.Parameters.Add("@dob", SqlDbType.Date);
				command.Parameters.Add("@contact", SqlDbType.Char, 11);
				//set parameters
				command.Parameters["@customerID"].Value = get_table_count("customer") + 1;
				command.Parameters["@username"].Value = username;
				command.Parameters["@password"].Value = password;
				command.Parameters["@fname"].Value = fname;
				command.Parameters["@lname"].Value = lname;
				command.Parameters["@email"].Value = email;
				command.Parameters["@address"].Value = address;
				command.Parameters["@dob"].Value = dob;
				command.Parameters["@contact"].Value = contact;
				
				command.ExecuteNonQuery();

				result = 1;
			}
			catch (SqlException ex)
			{
				Console.WriteLine("SQL Error: " + ex.Message.ToString());
				result = -1;
			}
			finally
			{
				con.Close();
			}

			return result;
		}
		public int retailer_signup(string Username, string Password, string Name, string Email, string Address, string bankAccount, string Contact, string NTN)
		{
			int result = -1;
			DataSet resultSet = new DataSet();
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand command;
			try
			{
				command = new SqlCommand("retailer_signup", con);
				command.CommandType = CommandType.StoredProcedure;
				//establish parameters
				command.Parameters.Add("@username", SqlDbType.VarChar, 20);
				command.Parameters.Add("@password", SqlDbType.VarChar, 20);
				command.Parameters.Add("@name", SqlDbType.VarChar, 20);
				command.Parameters.Add("@email", SqlDbType.VarChar, 30);
				command.Parameters.Add("@address", SqlDbType.VarChar, 50);
				command.Parameters.Add("@bankAccount", SqlDbType.VarChar, 20);
				command.Parameters.Add("@contact", SqlDbType.Char, 11);
				command.Parameters.Add("@NTN", SqlDbType.Char, 13);
				command.Parameters.Add("@ID", SqlDbType.Int);
				//set parameters
				command.Parameters["@username"].Value = Username;
				command.Parameters["@password"].Value = Password;
				command.Parameters["@name"].Value = Name;
				command.Parameters["@email"].Value = Email;
				command.Parameters["@address"].Value = Address;
				command.Parameters["@bankAccount"].Value = bankAccount;
				command.Parameters["@contact"].Value = Contact;
				command.Parameters["@NTN"].Value = NTN;
				command.Parameters["@ID"].Value = get_table_count("retailer") + 1;

				command.ExecuteNonQuery();

				result = 1;
			}
			catch (SqlException sq)
			{
				Console.WriteLine("SQL ERROR: " + sq.Message.ToString());
				result = -1;
			}
			finally
			{
				con.Close();
			}


			return result;

		}

		//PROFILE PAGES
		public int get_customer(string username, ref DataTable DT)
		{
			int result = -1;
			DataSet resultSet = new DataSet();
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			try
			{
				SqlCommand command;
				command = new SqlCommand("get_customer", con);
				command.CommandType = CommandType.StoredProcedure;

				command.Parameters.Add("@username", SqlDbType.VarChar, 20);
				command.Parameters["@username"].Value = username;
				command.ExecuteNonQuery();

				using (SqlDataAdapter da = new SqlDataAdapter(command))
				{
					da.Fill(resultSet);
				}
				DT = resultSet.Tables[0];
				result = 1;
			}
			catch (SqlException e)
			{
				Console.WriteLine("SQL ERROR : " + e.Message.ToString());
				result = -1;
			}
			finally
			{
				con.Close();
			}

			return result;
		}
		public int get_admin(string username, ref DataTable DT)
		{
			int result = -1;
			DataSet resultSet = new DataSet();
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			try
			{
				SqlCommand command;
				command = new SqlCommand("get_admin", con);
				command.CommandType = CommandType.StoredProcedure;

				command.Parameters.Add("@username", SqlDbType.VarChar, 20);
				command.Parameters["@username"].Value = username;
				command.ExecuteNonQuery();

				using (SqlDataAdapter da = new SqlDataAdapter(command))
				{
					da.Fill(resultSet);
				}
				DT = resultSet.Tables[0];
				result = 1;
			}
			catch (SqlException e)
			{
				Console.WriteLine("SQL ERROR : " + e.Message.ToString());
				result = -1;
			}
			finally
			{
				con.Close();
			}

			return result;
		}
		public int get_retailer(string username, ref DataTable DT)
		{
			int result = -1;
			DataSet resultSet = new DataSet();
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			try
			{
				SqlCommand command;
				command = new SqlCommand("get_retailer", con);
				command.CommandType = CommandType.StoredProcedure;

				command.Parameters.Add("@username", SqlDbType.VarChar, 20);
				command.Parameters["@username"].Value = username;
				command.ExecuteNonQuery();

				using (SqlDataAdapter da = new SqlDataAdapter(command))
				{
					da.Fill(resultSet);
				}
				DT = resultSet.Tables[0];
				result = 1;
			}
			catch (SqlException e)
			{
				Console.WriteLine("SQL ERROR : " + e.Message.ToString());
				result = -1;
			}
			finally
			{
				con.Close();
			}

			return result;
		}
		public int get_retailerID(string username)
		{
			int result = -1;
			DataSet resultSet = new DataSet();
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			try
			{
				SqlCommand command;
				command = new SqlCommand("get_retailerID", con);
				command.CommandType = CommandType.StoredProcedure;

				command.Parameters.Add("@username", SqlDbType.VarChar, 20);
				command.Parameters["@username"].Value = username;
				command.ExecuteNonQuery();

				using (SqlDataAdapter da = new SqlDataAdapter(command))
				{
					da.Fill(resultSet);
				}
				result = Convert.ToInt32(resultSet.Tables[0].Rows[0]["retailerID"]);
			}
			catch (SqlException e)
			{
				Console.WriteLine("SQL ERROR : " + e.Message.ToString());
				result = -1;
			}
			finally
			{
				con.Close();
			}

			return result;
		}
		public int purchase_history(string username, ref DataTable DT)
		{
			int result = -1;
			DataSet resultSet = new DataSet();
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			try
			{
				SqlCommand command;
				command = new SqlCommand("purchase_history", con);
				command.CommandType = CommandType.StoredProcedure;

				command.Parameters.Add("@username", SqlDbType.VarChar, 20);
				command.Parameters["@username"].Value = username;
				command.ExecuteNonQuery();

				using (SqlDataAdapter da = new SqlDataAdapter(command))
				{
					da.Fill(resultSet);
				}
				DT = resultSet.Tables[0];
				result = 1;
			}
			catch (SqlException e)
			{
				Console.WriteLine("SQL ERROR : " + e.Message.ToString());
				result = -1;
			}
			finally
			{
				con.Close();
			}

			return result;
		}
		public int add_product(int retailerID, string name, float price, int categoryID, int stock, string description, string dateAdded, string image)
		{
			int result = -1;
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand command;
			try
			{
				command = new SqlCommand("add_product", con);
				command.CommandType = CommandType.StoredProcedure;
				//establish parameters
				command.Parameters.Add("@productID", SqlDbType.Int);
				command.Parameters.Add("@retailerID", SqlDbType.Int);
				command.Parameters.Add("@name", SqlDbType.VarChar, 40);
				command.Parameters.Add("@price", SqlDbType.Float);
				command.Parameters.Add("@categoryID", SqlDbType.Int);
				command.Parameters.Add("@stock", SqlDbType.Int);
				command.Parameters.Add("@desc", SqlDbType.VarChar, 300);
				command.Parameters.Add("@dateAdded", SqlDbType.Date);
				command.Parameters.Add("@image", SqlDbType.VarChar, 200);
				//set parameters
				command.Parameters["@productID"].Value = get_table_count("Product") + 1;
				command.Parameters["@retailerID"].Value = retailerID;
				command.Parameters["@name"].Value = name;
				command.Parameters["@price"].Value = price;
				command.Parameters["@categoryID"].Value = categoryID;
				command.Parameters["@stock"].Value = stock;
				command.Parameters["@desc"].Value = description;
				command.Parameters["@dateAdded"].Value = dateAdded;
				command.Parameters["@image"].Value = image;

				command.ExecuteNonQuery();
				result = 1;
			}
			catch (SqlException e)
			{
				Console.WriteLine("SQL ERROR : " + e.Message.ToString());
				result = -1;
			}
			finally
			{
				con.Close();
			}


			return result;
		}
		public int product_history(string username, ref DataTable DT)
		{
			int result = -1;
			DataSet resultSet = new DataSet();
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand command;
			try
			{
				command = new SqlCommand("product_history", con);
				command.CommandType = CommandType.StoredProcedure;
				//establish parameters
				command.Parameters.Add("@username", SqlDbType.VarChar, 20);
				//set parameters
				command.Parameters["@username"].Value = username;

				command.ExecuteNonQuery();
				using (SqlDataAdapter da = new SqlDataAdapter(command))
				{
					da.Fill(resultSet);
				}
				DT = resultSet.Tables[0];
				result = 1;
			}
			catch (SqlException ex)
			{
				Console.WriteLine("SQL ERROR : " + ex.Message.ToString());
				result = -1;
			}
			finally
			{
				con.Close();
			}

			return result;
		}
		public int sale_history(string username, ref DataTable DT)
		{
			int result = -1;
			DataSet resultSet = new DataSet();
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand command;
			try
			{
				command = new SqlCommand("sale_history", con);
				command.CommandType = CommandType.StoredProcedure;
				//establish parameters
				command.Parameters.Add("@username", SqlDbType.VarChar, 20);
				//set parameters
				command.Parameters["@username"].Value = username;

				command.ExecuteNonQuery();
				using (SqlDataAdapter da = new SqlDataAdapter(command))
				{
					da.Fill(resultSet);
				}
				DT = resultSet.Tables[0];
				result = 1;
			}
			catch (SqlException ex)
			{
				Console.WriteLine("SQL ERROR : " + ex.Message.ToString());
				result = -1;
			}
			finally
			{
				con.Close();
			}

			return result;
		}

		//EDIT PAGES
		public int edit_admin(string username, string fname, string lname, string email, string cnic)
		{
			int result = -1;
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand command;
			try
			{
				command = new SqlCommand("edit_admin", con);
				command.CommandType = CommandType.StoredProcedure;
				//establish parameters
				command.Parameters.Add("@uname", SqlDbType.VarChar, 20);
				command.Parameters.Add("@fname", SqlDbType.VarChar, 20);
				command.Parameters.Add("@lname", SqlDbType.VarChar, 20);
				command.Parameters.Add("@email", SqlDbType.VarChar, 30);
				command.Parameters.Add("@cnic", SqlDbType.Char, 13);
				//set parameters
				command.Parameters["@uname"].Value = username;
				command.Parameters["@fname"].Value = fname;
				command.Parameters["@lname"].Value = lname;
				command.Parameters["@email"].Value = email;
				command.Parameters["@cnic"].Value = cnic;

				command.ExecuteNonQuery();
				result = 1;
			}
			catch (SqlException e)
			{
				Console.WriteLine("SQL ERROR : " + e.Message.ToString());
				result = -1;
			}
			finally
			{
				con.Close();
			}

			return result;
		}
		public int edit_customer(string username, string fname, string lname, string email, string address, string dob, string contact, string creditcard)
		{
			int result = -1;
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand command;
			try
			{
				command = new SqlCommand("edit_customer", con);
				command.CommandType = CommandType.StoredProcedure;
				//establish parameters
				command.Parameters.Add("@uname", SqlDbType.VarChar, 20);
				command.Parameters.Add("@fname", SqlDbType.VarChar, 20);
				command.Parameters.Add("@lname", SqlDbType.VarChar, 20);
				command.Parameters.Add("@email", SqlDbType.VarChar, 30);
				command.Parameters.Add("@address", SqlDbType.VarChar, 50);
				command.Parameters.Add("@dob", SqlDbType.Date);
				command.Parameters.Add("@contact", SqlDbType.Char, 11);
				command.Parameters.Add("@creditcard", SqlDbType.Char, 16);
				//set parameters
				command.Parameters["@uname"].Value = username;
				command.Parameters["@fname"].Value = fname;
				command.Parameters["@lname"].Value = lname;
				command.Parameters["@email"].Value = email;
				command.Parameters["@address"].Value = address;
				command.Parameters["@dob"].Value = dob;
				command.Parameters["@contact"].Value = contact;
				command.Parameters["@creditcard"].Value = creditcard;

				command.ExecuteNonQuery();
				result = 1;
			}
			catch (SqlException e)
			{
				Console.WriteLine("SQL ERROR : " + e.Message.ToString());
				result = -1;
			}
			finally
			{
				con.Close();
			}

			return result;
		}
		public int edit_retailer(string username, string name, string email, string address, string ntn, string contact, string bankaccount)
		{
			int result = -1;
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand command;
			try
			{
				command = new SqlCommand("edit_retailer", con);
				command.CommandType = CommandType.StoredProcedure;
				//establish parameters
				command.Parameters.Add("@uname", SqlDbType.VarChar, 20);
				command.Parameters.Add("@name", SqlDbType.VarChar, 20);
				command.Parameters.Add("@email", SqlDbType.VarChar, 30);
				command.Parameters.Add("@address", SqlDbType.VarChar, 50);
				command.Parameters.Add("@ntn", SqlDbType.Char, 13);
				command.Parameters.Add("@contact", SqlDbType.Char, 11);
				command.Parameters.Add("@bankaccount", SqlDbType.Char, 16);
				//set parameters
				command.Parameters["@uname"].Value = username;
				command.Parameters["@fname"].Value = name;
				command.Parameters["@email"].Value = email;
				command.Parameters["@address"].Value = address;
				command.Parameters["@ntn"].Value = ntn;
				command.Parameters["@contact"].Value = contact;
				command.Parameters["@bankaccount"].Value = bankaccount;

				command.ExecuteNonQuery();
				result = 1;
			}
			catch (SqlException e)
			{
				Console.WriteLine("SQL ERROR : " + e.Message.ToString());
				result = -1;
			}
			finally
			{
				con.Close();
			}

			return result;
		}

		//CATALOGUE
		public int get_products_category(string category, ref DataTable DT)
		{
			int result = -1;
			DataSet resultSet = new DataSet();
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand command;

			try
			{
				command = new SqlCommand("get_products_category", con);
				command.CommandType = CommandType.StoredProcedure;
				//estblish parameters
				command.Parameters.Add("@category", SqlDbType.VarChar, 30);
				//set parameters
				command.Parameters["@category"].Value = category;

				command.ExecuteNonQuery();
				//get output
				using (SqlDataAdapter da = new SqlDataAdapter(command))
				{
					da.Fill(resultSet);
				}
				DT = resultSet.Tables[0];
				result = 1;
			}
			catch (SqlException ex)
			{
				Console.WriteLine("SQL Error: " + ex.Message.ToString());
				result = -1;
			}
			finally
			{
				con.Close();
			}


			return result;
		}
		public int get_product(int productID, ref DataTable DT)
		{
			int result = -1;
			DataSet resultSet = new DataSet();
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand command;
			try
			{
				command = new SqlCommand("get_product", con);
				command.CommandType = CommandType.StoredProcedure;
				//establish parameters
				command.Parameters.Add("@productID", SqlDbType.Int);
				//set parameters
				command.Parameters["@productID"].Value = productID;

				command.ExecuteNonQuery();
				//get output
				using (SqlDataAdapter da = new SqlDataAdapter(command))
				{
					da.Fill(resultSet);
				}
				DT = resultSet.Tables[0];
				result = 1;
			}
			catch (SqlException ex){
				Console.WriteLine("SQL Error: " + ex.Message.ToString());
				result = -1;
			}
			finally
			{
				con.Close();
			}

			return result;
		}
		public int search_product(string product, ref DataTable DT)
		{
			int result = -1;
			DataSet resultSet = new DataSet();
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand command;
			try
			{
				command = new SqlCommand("search_product", con);
				command.CommandType = CommandType.StoredProcedure;
				//establish parameters
				command.Parameters.Add("@product", SqlDbType.VarChar, 50);
				//set parameters
				command.Parameters["@product"].Value = product;

				command.ExecuteNonQuery();
				//get output
				using (SqlDataAdapter da = new SqlDataAdapter(command))
				{
					da.Fill(resultSet);
				}
				DT = resultSet.Tables[0];
				result = 1;
			}
			catch (SqlException ex)
			{
				Console.WriteLine("SQL Error: " + ex.Message.ToString());
				result = -1;
			}
			finally
			{
				con.Close();
			}

			return result;
		}

		//SPECIALIZED FUNCTIONS
		public int get_current_products(ref DataTable DT)
		{
			int result = -1;
			DataSet resultSet = new DataSet();
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand command;
			try
			{
				command = new SqlCommand("get_current_products", con);
				command.CommandType = CommandType.StoredProcedure;

				command.ExecuteNonQuery();
				using (SqlDataAdapter da = new SqlDataAdapter(command))
				{
					da.Fill(resultSet);
				}
				DT = resultSet.Tables[0];
				result = DT.Rows.Count;
			}
			catch (SqlException ex)
			{
				Console.WriteLine("SQL Error: " + ex.Message.ToString());
				result = -1;
			}
			finally
			{
				con.Close();
			}


			return result;
		}
		public int get_removed_products(ref DataTable DT)
		{
			int result = -1;
			DataSet resultSet = new DataSet();
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand command;
			try
			{
				command = new SqlCommand("get_removed_products", con);
				command.CommandType = CommandType.StoredProcedure;

				command.ExecuteNonQuery();
				using (SqlDataAdapter da = new SqlDataAdapter(command))
				{
					da.Fill(resultSet);
				}
				DT = resultSet.Tables[0];
				result = DT.Rows.Count;
			}
			catch (SqlException ex)
			{
				Console.WriteLine("SQL Error: " + ex.Message.ToString());
				result = -1;
			}
			finally
			{
				con.Close();
			}


			return result;
		}
		public int remove_product(int productID)
		{
			int result = -1;
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand command;
			try
			{
				command = new SqlCommand("remove_product", con);
				command.CommandType = CommandType.StoredProcedure;
				//establish parameters
				command.Parameters.Add("@productID", SqlDbType.Int);
				//set parameters
				command.Parameters["@productID"].Value = productID;

				command.ExecuteNonQuery();
				result = 1;
			}
			catch (SqlException ex)
			{
				Console.WriteLine("SQL Error: " + ex.Message.ToString());
				result = -1;
			}
			finally
			{
				con.Close();
			}

			return result;
		}
		public int restore_product(int productID)
		{
			int result = -1;
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand command;
			try
			{
				command = new SqlCommand("restore_product", con);
				command.CommandType = CommandType.StoredProcedure;
				//establish parameters
				command.Parameters.Add("@productID", SqlDbType.Int);
				//set parameters
				command.Parameters["@productID"].Value = productID;

				command.ExecuteNonQuery();
				result = 1;
			}
			catch (SqlException ex)
			{
				Console.WriteLine("SQL Error: " + ex.Message.ToString());
				result = -1;
			}
			finally
			{
				con.Close();
			}

			return result;
		}

		public int add_purchase(int PurchaseID, int CustomerID, int ProductID, int Quantity, int PaymentType)
		{
			int result = -1;
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand command;
			try
			{
				command = new SqlCommand("add_purchase", con);
				command.CommandType = CommandType.StoredProcedure;
				command.Parameters.Add("@PurchaseID", SqlDbType.Int);
				command.Parameters.Add("@CustomerID", SqlDbType.Int);
				command.Parameters.Add("@ProductID", SqlDbType.Int);
				command.Parameters.Add("@Quantity", SqlDbType.Int);
				command.Parameters.Add("@Date", SqlDbType.DateTime);
				command.Parameters.Add("@PaymentType", SqlDbType.Int);


				command.Parameters["@PurchaseID"].Value = PurchaseID;
				command.Parameters["@CustomerID"].Value = CustomerID;
				command.Parameters["@ProductID"].Value = ProductID;
				command.Parameters["@Quantity"].Value = Quantity;
				command.Parameters["@Date"].Value = DateTime.Now;
				command.Parameters["@PaymentType"].Value = PaymentType;

				command.ExecuteNonQuery();
				result = 1;
			}
			catch (SqlException e)
			{
				Console.WriteLine("SQL ERROR: " + e.Message.ToString());
				result = -1;
			}
			finally
			{
				con.Close();
			}
			return result;

		}
		public int get_stock(int ProductID)
		{

			int result = -1;
			DataSet resultSet = new DataSet();
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand command;
			try
			{
				command = new SqlCommand("get_stock", con);
				command.CommandType = CommandType.StoredProcedure;

				command.Parameters.Add("@ProductID", SqlDbType.Int);
				command.Parameters["@ProductID"].Value = ProductID;

				command.Parameters.Add("@ret", SqlDbType.Int).Direction = ParameterDirection.Output;

				command.ExecuteNonQuery();

				result = Convert.ToInt32(command.Parameters["@ret"].Value);

			}
			catch (SqlException e)
			{
				Console.WriteLine("SQL ERROR: " + e.Message.ToString());
				result = -1;
			}
			finally
			{
				con.Close();
			}
			return result;


		}
		public int update_stock(int ProductID, int val)
		{

			int result = -1;
			DataSet resultSet = new DataSet();
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand command;
			try
			{
				command = new SqlCommand("update_stock", con);
				command.CommandType = CommandType.StoredProcedure;

				command.Parameters.Add("@ProductID", SqlDbType.Int);
				command.Parameters["@ProductID"].Value = ProductID;

				command.Parameters.Add("@val", SqlDbType.Int);
				command.Parameters["@val"].Value = val;

				command.ExecuteNonQuery();

				result = 1;
			}
			catch (SqlException e)
			{
				Console.WriteLine("SQL ERROR: " + e.Message.ToString());
				result = -1;
			}
			finally
			{
				con.Close();
			}
			return result;
		}

		//Ratings
		public int get_rating(int productID, ref DataTable DT)
		{
			int result = -1;
			DataSet resultSet = new DataSet();
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand command;
			try
			{
				command = new SqlCommand("get_ratings", con);
				command.CommandType = CommandType.StoredProcedure;
				//establish parameters
				command.Parameters.Add("@productID", SqlDbType.Int);
				//set parameters
				command.Parameters["@productID"].Value = productID;

				command.ExecuteNonQuery();
				using (SqlDataAdapter da = new SqlDataAdapter(command))
				{
					da.Fill(resultSet);
				}
				DT = resultSet.Tables[0];
				result = 1;
			}
			catch (SqlException ex)
			{
				Console.WriteLine("SQL ERROR : " + ex.Message.ToString());
				result = -1;
			}
			finally
			{
				con.Close();
			}

			return result;
		}

	}
}