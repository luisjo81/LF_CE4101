using LaFabricaRESTAPI.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace LaFabricaRESTAPI.Repositories
{
    public class AdminRepository
    {

        public static bool createAdmin(Administrador admin)
        {
            var connectionString = Globals.ConnectionString;

            var query = "EXEC usp_CreateAdmin @nombre = '@Nombre', @apellido1 = '@Apellido1', @apellido2 = '@Apellido2', @email = '@Email', @password = '@Password'";

            query = query.Replace("@Nombre", admin.Nombre)
                         .Replace("@Apellido1", admin.Apellido1)
                         .Replace("@Apellido2", admin.Apellido2)
                         .Replace("@Email", admin.Email)
                         .Replace("@Password", admin.Password);





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


        public static bool activacionAdmin(Administrador admin)
        {
            var connectionString = Globals.ConnectionString;

            var query = "EXEC usp_ActivacionAdmin @email = '@Email', @estado= '@Estado'";

            query = query.Replace("@Email", admin.Email)
                         .Replace("@Estado", admin.Estado.ToString());


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



        public static Administrador getAdmin(string email)
        {

            SqlDataReader reader = null;
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = Globals.ConnectionString;

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.CommandType = CommandType.Text;

            var query = "EXEC usp_GetInfoAdministrador @email= '@Email'";

            query = query.Replace("@Email", email);

            sqlCmd.CommandText = query;

            sqlCmd.Connection = connection;
            connection.Open();
            reader = sqlCmd.ExecuteReader();
            Administrador admin = null;
            while (reader.Read())
            {
                admin = new Administrador();
                admin.Nombre = reader.GetValue(0).ToString();
                admin.Apellido1 = reader.GetValue(1).ToString();
                admin.Apellido2 = reader.GetValue(2).ToString();
                admin.Email = reader.GetValue(3).ToString();
                admin.FechaIngreso = reader.GetValue(4).ToString();
                admin.Password = reader.GetValue(5).ToString();
                admin.Estado = Convert.ToInt32(reader.GetValue(6));


            }
            connection.Close();
            return admin;
        }


    }
}