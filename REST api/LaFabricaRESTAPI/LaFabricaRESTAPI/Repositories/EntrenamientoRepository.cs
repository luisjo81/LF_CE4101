using LaFabricaRESTAPI.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace LaFabricaRESTAPI.Repositories
{
    public class EntrenamientoRepository
    {


        public static bool ResultadosEntrenamiento(Atleta atleta)
        {
            var connectionString = Globals.ConnectionString;

            var query = "EXEC usp_CreateAtleta @nombre = '@Nombre', @apellido1= '@Apellido1', @apellido2 ='@Apellido2', @email1 ='@Email1', @email2  ='@Email2', "
                        + " @fechaNacimiento ='@FechaNacimiento', @pais= @Pais, @region= @Region, @carne= '@Carne', @universidad = @Universidad, @deporte= @Deporte, @posicionP= @PosicionP, "
                        + " @posicionS= @PosicionS, @telefono= '@Telefono', @password= '@Password', @altura= @Altura, @peso= @Peso ";

            query = query.Replace("@Nombre", atleta.Nombre)
                         .Replace("@Apellido1", atleta.Apellido1)
                         .Replace("@Apellido2", atleta.Apellido2)
                         .Replace("@Email1", atleta.Email1)
                         .Replace("@Email2", atleta.Email2)
                         .Replace("@Carne", atleta.Carne)
                         .Replace("@Pais", atleta.Pais.ToString())
                         .Replace("@Region", atleta.Region.ToString())
                         .Replace("@FechaNacimiento", atleta.FechaNacimiento)
                         .Replace("@FechaIngreso", atleta.FechaIngreso)
                         .Replace("@Universidad", atleta.Universidad.ToString())
                         .Replace("@Deporte", atleta.Deporte.ToString())
                         .Replace("@PosicionP", atleta.PosicionP.ToString())
                         .Replace("@PosicionS", atleta.PosicionS.ToString())
                         .Replace("@Telefono", atleta.Telefono)
                         .Replace("@Password", atleta.Password)
                         .Replace("@Estado", atleta.Estado.ToString())
                         .Replace("@Altura", atleta.Altura.ToString())
                         .Replace("@Peso", atleta.Peso.ToString());

            


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

    }
}