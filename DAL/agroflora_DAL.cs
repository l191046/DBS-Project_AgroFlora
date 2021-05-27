using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.Management;

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
			}
			finally
			{
				con.Close();
			}

			return result;
		}
		public bool search_customer(String username)
		{
			bool result = false;

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
				if (Convert.ToInt32(command.Parameters["@found"].Value) == 1)
				{
					result = true;
				}
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
		public bool search_NTN(String inputNTN)
		{
			bool result = false;
			
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
				if (Convert.ToInt32(command.Parameters["@found"].Value) == 1)
				{
					result = true;
				}


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
		public bool search_retailer(String username)
		{
			bool result = false;
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
				if (Convert.ToInt32(command.Parameters["@found"].Value) == 1)
				{

					result = true;

				}

			}
			catch (SqlException e)
			{
				Console.WriteLine("SQL Error: " + e.Message.ToString());
			}

			finally
			{
				con.Close();
			}


			return result;
		}

		//HOME PAGE
		public DataSet show_products()
		{
			DataSet resultSet = new DataSet();
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand command;

			try
			{
				command = new SqlCommand("SELECT * FROM Product", con);
				command.CommandType = CommandType.Text;
				using (SqlDataAdapter da = new SqlDataAdapter(command))
				{
					da.Fill(resultSet);
				}
			}
			catch (SqlException ex)
			{
				Console.WriteLine("SQL ERROR:" + ex.Message.ToString());
			}
			finally
			{
				con.Close();
			}

			return resultSet;
		}
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
			}
			finally
			{
				con.Close();
			}

			return found;
		}
		public int customer_signin(String username, String password, ref DataTable DT)
		{
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
			}
			finally
			{
				con.Close();
			}

			return found;
		}
		public int retailer_signin(String username, String password, ref DataTable DT)
		{
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
			}
			finally
			{
				con.Close();
			}

			return found;
		}

		//SIGN UP PAGES
		public bool customer_signup(string username, string password, string fname, string lname, string email, string address, string dob, string contact)
		{
			bool success = false;
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

				success = true;
			}
			catch (SqlException ex)
			{
				Console.WriteLine("SQL Error: " + ex.Message.ToString());
			}
			finally
			{
				con.Close();
			}

			return success;
		}
		public bool retailer_signup(string Username, string Password, string Name, string Email, string Address, string bankAccount, string Contact, string NTN)
		{
			bool success = false;
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

				success = true;
			}
			catch (SqlException sq)
			{
				Console.WriteLine("SQL ERROR: " + sq.Message.ToString());

			}
			finally
			{
				con.Close();
			}


			return success;

		}
	}
}