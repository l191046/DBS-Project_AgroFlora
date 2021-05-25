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

		public bool customer_search(String username)
		{
			bool result = false;

			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand command;

			try
			{
				command = new SqlCommand("customer_search", con);
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
		
		//SIGN UP PAGES
		public int customer_signup(string username, string password, string fname, string lname, string email, string address, string dob)
		{
			int success = 0;
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
				//set parameters
				command.Parameters["@customerID"].Value = get_table_count("customer") + 1;
				command.Parameters["@username"].Value = username;
				command.Parameters["@password"].Value = password;
				command.Parameters["@fname"].Value = fname;
				command.Parameters["@lname"].Value = lname;
				command.Parameters["@email"].Value = email;
				command.Parameters["@address"].Value = address;
				command.Parameters["@dob"].Value = dob;
				command.ExecuteNonQuery();

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
	}
}