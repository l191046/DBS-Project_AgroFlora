using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

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
	}
}