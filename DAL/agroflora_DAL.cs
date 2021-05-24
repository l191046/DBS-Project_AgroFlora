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
		public int customer_signup(string fname, string lname, string username, string email, string password, string address, string dob, ref DataTable DT)
		{
			int success = 0;
			int alreadyexists = 0;
			DataSet resultSet = new DataSet();
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand command;
			try
			{
				command = new SqlCommand("customer_signup", con);
				command.CommandType = CommandType.StoredProcedure;
				//establish parameters
				command.Parameters.Add("@fname", SqlDbType.VarChar, 20);
				command.Parameters.Add("@lname", SqlDbType.VarChar, 20);
				command.Parameters.Add("@username", SqlDbType.VarChar, 20);
				command.Parameters.Add("@email", SqlDbType.VarChar, 30);
				command.Parameters.Add("@password", SqlDbType.VarChar, 20);
				command.Parameters.Add("@address", SqlDbType.VarChar, 50);
				command.Parameters.Add("@dob", SqlDbType.Date);
				command.Parameters.Add("@alreadyexists", SqlDbType.Int).Direction = ParameterDirection.Output;
				//set parameters
				command.Parameters["@fname"].Value = fname;
				command.Parameters["@lname"].Value = lname;
				command.Parameters["@username"].Value = username;
				command.Parameters["@email"].Value = email;
				command.Parameters["@password"].Value = password;
				command.Parameters["@address"].Value = address;
				command.Parameters["@dob"].Value = dob;
				command.ExecuteNonQuery();
				//get output
				alreadyexists = Convert.ToInt32(command.Parameters["@alreadyexists"].Value);
				int shortpassword = 0;
				int length = password.Length;
				if(length<8)
				{
					shortpassword = 1;
				}

				if ((alreadyexists == 0) && (shortpassword==0 ))
				{
					using (SqlDataAdapter da = new SqlDataAdapter(command))
					{
						da.Fill(resultSet);
					}
					DT = resultSet.Tables[0];
					success = 1;
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

			return success;
		}
	}
}