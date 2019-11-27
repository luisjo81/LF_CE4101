using LaFabricaRESTAPI.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace LaFabricaRESTAPI.Repositories
{
    public class ScoutRepository
    {
        public static bool addScout(Scout scout)
        {
            var connectionString = Globals.ConnectionString;

            var query = "EXEC usp_CreateScout @nombre = '@Nombre', @apellido1 = '@Apellido1', @apellido2 = '@Apellido2', @email = '@Email', @password = '@Password'";

            query = query.Replace("@Nombre", scout.Nombre)
                         .Replace("@Apellido1", scout.Apellido1)
                         .Replace("@Apellido2", scout.Apellido2)
                         .Replace("@Email", scout.Email)
                         .Replace("@Password", scout.Password);





            SqlConnection connection = new SqlConnection(connectionString);

            try
            {
                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);
                command.ExecuteNonQuery();
                command.Dispose();
                connection.Close();
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }


        public static bool activacionScout(Scout scout)
        {
            var connectionString = Globals.ConnectionString;

            var query = "EXEC usp_ActivacionScout @email = '@Email', @estado= '@Estado'";

            query = query.Replace("@Email", scout.Email)
                         .Replace("@Estado", scout.Estado.ToString());


            SqlConnection connection = new SqlConnection(connectionString);

            try
            {
                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);
                command.ExecuteNonQuery();
                command.Dispose();
                connection.Close();
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }



        public static Scout getScout(string email)
        {

            SqlDataReader reader = null;
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = Globals.ConnectionString;

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.CommandType = CommandType.Text;

            var query = "EXEC usp_GetInfoScout @email= '@Email'";

            query = query.Replace("@Email", email);

            sqlCmd.CommandText = query;

            sqlCmd.Connection = connection;
            connection.Open();
            reader = sqlCmd.ExecuteReader();
            Scout scout = null;
            while (reader.Read())
            {
                scout = new Scout();
                scout.Nombre = reader.GetValue(0).ToString();
                scout.Apellido1 = reader.GetValue(1).ToString();
                scout.Apellido2 = reader.GetValue(2).ToString();
                scout.Email = reader.GetValue(3).ToString();
                scout.FechaIngreso = reader.GetValue(4).ToString();
                scout.Password = reader.GetValue(5).ToString();
                scout.Estado = Convert.ToInt32(reader.GetValue(6));


            }
            connection.Close();
            return scout;
        }

    }
}