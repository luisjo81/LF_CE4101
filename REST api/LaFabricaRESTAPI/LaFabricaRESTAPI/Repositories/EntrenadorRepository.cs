using LaFabricaRESTAPI.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace LaFabricaRESTAPI.Repositories
{
    public class EntrenadorRepository
    {


        public static bool createEntrenador(Entrenador entrenador)
        {
            var connectionString = Globals.ConnectionString;

            var query = "EXEC usp_CreateEntrenador @nombre = '@Nombre', @apellido1 ='@Apellido1', @apellido2 = '@Apellido2', @email = '@Email', @password = '@Password', @pais = @Pais, @universidad = @Universidad";

            query = query.Replace("@Nombre", entrenador.Nombre)
                         .Replace("@Apellido1", entrenador.Apellido1)
                         .Replace("@Apellido2", entrenador.Apellido2)
                         .Replace("@Email", entrenador.Email)
                         .Replace("@Password", entrenador.Password)
                         .Replace("@Pais", entrenador.Pais.ToString())
                         .Replace("@Universidad", entrenador.Universidad.ToString());





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


        public static bool activacionEntrenador(Entrenador entrenador)
        {
            var connectionString = Globals.ConnectionString;

            var query = "EXEC usp_ActivacionEntrenador @email = '@Email', @estado= '@Estado'";

            query = query.Replace("@Email", entrenador.Email)
                         .Replace("@Estado", entrenador.Estado.ToString());


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


        public static Entrenador getEntrenador(string email)
        {

            SqlDataReader reader = null;
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = Globals.ConnectionString;

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.CommandType = CommandType.Text;

            var query = "EXEC usp_GetInfoEntrenador @email= '@Email'";

            query = query.Replace("@Email", email);

            sqlCmd.CommandText = query;

            sqlCmd.Connection = connection;
            connection.Open();
            reader = sqlCmd.ExecuteReader();
            Entrenador entrenador = null;
            while (reader.Read())
            {
                entrenador = new Entrenador();
                entrenador.Nombre = reader.GetValue(0).ToString();
                entrenador.Apellido1 = reader.GetValue(1).ToString();
                entrenador.Apellido2 = reader.GetValue(2).ToString();
                entrenador.Email = reader.GetValue(3).ToString();
                entrenador.FechaIngreso = reader.GetValue(4).ToString();
                entrenador.Estado = Convert.ToInt32(reader.GetValue(5));
                entrenador.Password = reader.GetValue(6).ToString();
                entrenador.NombrePais = reader.GetValue(10).ToString();
                entrenador.NombreUniversidad = reader.GetValue(11).ToString();




            }
            connection.Close();
            return entrenador;
        }



    }
}