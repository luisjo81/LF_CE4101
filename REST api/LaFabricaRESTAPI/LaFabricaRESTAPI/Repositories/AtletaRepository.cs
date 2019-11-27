using LaFabricaRESTAPI.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace LaFabricaRESTAPI.Repositories
{
    public class AtletaRepository
    {
        public static bool createAtleta(Atleta atleta)
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



        public static bool activacionAtleta(Atleta atleta)
        {
            var connectionString = Globals.ConnectionString;

            var query = "EXEC usp_ActivacionAtleta @carne = '@Carne', @estado= '@Estado'";

            query = query.Replace("@Carne", atleta.Carne)
                         .Replace("@Estado", atleta.Estado.ToString());
                         

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



        public static Atleta getAtleta(string email)
        {

            SqlDataReader reader = null;
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = Globals.ConnectionString;

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.CommandType = CommandType.Text;

            var query = "EXEC usp_GetInfoAtleta @email= '@Email'";

            query = query.Replace("@Email", email);

            sqlCmd.CommandText = query;

            sqlCmd.Connection = connection;
            connection.Open();
            reader = sqlCmd.ExecuteReader();
            Atleta atleta = null;
            while (reader.Read())
            {
                atleta = new Atleta();
                atleta.Nombre = reader.GetValue(0).ToString();
                atleta.Apellido1 = reader.GetValue(1).ToString();
                atleta.Apellido2 = reader.GetValue(2).ToString();
                atleta.Email1 = reader.GetValue(3).ToString();
                atleta.Email2 = reader.GetValue(4).ToString();
                atleta.FechaNacimiento = reader.GetValue(5).ToString();
                atleta.FechaIngreso = reader.GetValue(6).ToString();
                atleta.Carne = reader.GetValue(7).ToString();
                atleta.Telefono = reader.GetValue(8).ToString();
                atleta.TipoUsuario = Convert.ToInt32(reader.GetValue(9));
                atleta.Estado = Convert.ToInt32(reader.GetValue(10));
                atleta.Altura = Convert.ToInt32(reader.GetValue(11));
                atleta.Peso = Convert.ToInt32(reader.GetValue(12));
                atleta.NombrePais = reader.GetValue(13).ToString();
                atleta.NombreRegion = reader.GetValue(14).ToString();
                atleta.NombreUniversidad = reader.GetValue(15).ToString();
                atleta.NombreDeporte = reader.GetValue(16).ToString();
                atleta.NombrePosicion1 = reader.GetValue(17).ToString();
                atleta.NombrePosicion2 = reader.GetValue(18).ToString();



            }
            connection.Close();
            return atleta;
        }



        public static Entrenamiento getInfoEntrenamiento(string email)
        {

            SqlDataReader reader = null;
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = Globals.ConnectionString;

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.CommandType = CommandType.Text;

            var query = "EXEC usp_GetInfoAtletaEntrenamientos @email= '@Email'";

            query = query.Replace("@Email", email);

            sqlCmd.CommandText = query;

            sqlCmd.Connection = connection;
            connection.Open();
            reader = sqlCmd.ExecuteReader();
            Entrenamiento Entrenamiento = null;
            while (reader.Read())
            {
                Entrenamiento = new Entrenamiento();

                Entrenamiento.Email = reader.GetValue(0).ToString(); 
                Entrenamiento.NumEntrenamientos = Convert.ToInt32(reader.GetValue(1));
                Entrenamiento.PromedioEntrenamientos = Convert.ToInt32(reader.GetValue(2));
                Entrenamiento.PromTDistanciaCorta = reader.GetValue(3).ToString();
                Entrenamiento.PromTDistanciaLarga = reader.GetValue(4).ToString();
                Entrenamiento.MejorTiempoDistanciaLarga = reader.GetValue(5).ToString();
                Entrenamiento.MejorTiempoDistanciaCorta = reader.GetValue(6).ToString();
                Entrenamiento.PromedioSalto = Convert.ToInt32(reader.GetValue(7));
                Entrenamiento.MejorSalto = Convert.ToInt32(reader.GetValue(8));
                Entrenamiento.PruebaPace = reader.GetValue(9).ToString();
                Entrenamiento.PruebaHR = Convert.ToInt32(reader.GetValue(10));
                Entrenamiento.NotaXSport = Convert.ToInt32(reader.GetValue(11));


            }
            connection.Close();
            return Entrenamiento;
        }



        public static Partido getInfoPartido(string email)
        {

            SqlDataReader reader = null;
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = Globals.ConnectionString;

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.CommandType = CommandType.Text;

            var query = "EXEC usp_GetInfoAtletaPartidos @email= '@Email'";

            query = query.Replace("@Email", email);

            sqlCmd.CommandText = query;

            sqlCmd.Connection = connection;
            connection.Open();
            reader = sqlCmd.ExecuteReader();
            Partido partido = null;
            while (reader.Read())
            {
                partido = new Partido();

                partido.Email = reader.GetValue(0).ToString(); 
                partido.NumPartidos = Convert.ToInt32(reader.GetValue(1));
                partido.PromedioCalifPartidos = Convert.ToInt32(reader.GetValue(2));
                partido.TotalJuegos = Convert.ToInt32(reader.GetValue(3));
                partido.TotalJuegosGanados = Convert.ToInt32(reader.GetValue(4));
                partido.TotalJuegosPerdidos = Convert.ToInt32(reader.GetValue(5));
                partido.TotalJuegosEmpatados = Convert.ToInt32(reader.GetValue(6));
                partido.TotalGoles = Convert.ToInt32(reader.GetValue(7));
                partido.TotalAsistencias = Convert.ToInt32(reader.GetValue(8));
                partido.TotalBalonesRecuperados = Convert.ToInt32(reader.GetValue(9));
                partido.BalonesRecupPorPartido = Convert.ToInt32(reader.GetValue(10));
                partido.TotalPases = Convert.ToInt32(reader.GetValue(11));
                partido.PorcentPasesExitosos = Convert.ToInt32(reader.GetValue(12));
                partido.TotalCentros = Convert.ToInt32(reader.GetValue(13));
                partido.PorcentCentrosExitosos = Convert.ToInt32(reader.GetValue(14));
                partido.TarjetasAmarillas = Convert.ToInt32(reader.GetValue(15));
                partido.TarjetasRojas = Convert.ToInt32(reader.GetValue(16));
                partido.PenalesDetenidos = Convert.ToInt32(reader.GetValue(17));
                partido.PenalesSalvados = Convert.ToInt32(reader.GetValue(18));
                partido.PorcentRematesSalvados = Convert.ToInt32(reader.GetValue(19));
                



            }
            connection.Close();
            return partido;
        }


        /*
        public static Atleta getAtleta(string carne)
        {

            SqlDataReader reader = null;
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = "Data Source=.;Initial Catalog=TECAirlines;Integrated Security=SSPI";

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.CommandType = CommandType.Text;

            var query = "SELECT * FROM atleta WHERE Carne='@Carne'";

            query = query.Replace("@Nombre", carne);

            sqlCmd.CommandText = query;

            sqlCmd.Connection = connection;
            connection.Open();
            reader = sqlCmd.ExecuteReader();
            Atleta atleta = null;
            while (reader.Read())
            {
                atleta = new Atleta();
                atleta.Nombre = reader.GetValue(0).ToString();
                atleta.Apellido1 = reader.GetValue(1).ToString();
                atleta.Apellido2 = reader.GetValue(2).ToString();
                atleta.Email1 = reader.GetValue(3).ToString();
                atleta.Email2 = reader.GetValue(4).ToString();
                atleta.Carne = reader.GetValue(5).ToString();
                atleta.Pais = reader.GetValue(6).ToString();
                atleta.Region = reader.GetValue(7).ToString();
                atleta.FechaNacimiento = reader.GetValue(8).ToString();
                atleta.FechaIngreso = reader.GetValue(9).ToString();
                atleta.Universidad = reader.GetValue(10).ToString();
                atleta.Deporte = reader.GetValue(11).ToString();
                atleta.PosicionP = reader.GetValue(12).ToString();
                atleta.PosicionS = reader.GetValue(13).ToString();
                atleta.Telefono = reader.GetValue(14).ToString();
                atleta.Password = reader.GetValue(15).ToString();
                atleta.Estado = reader.GetValue(16).ToString();
                atleta.Altura = reader.GetValue(17).ToString();
                atleta.Peso = reader.GetValue(18).ToString();

            }
            connection.Close();
            return atleta;
        }

        */

        /*
                public static List<Atleta> getAllAtletas()
                {

                    SqlDataReader reader = null;
                    SqlConnection connection = new SqlConnection();
                    connection.ConnectionString = "Data Source=.;Initial Catalog=TECAirlines;Integrated Security=SSPI";

                    SqlCommand sqlCmd = new SqlCommand();
                    sqlCmd.CommandType = CommandType.Text;

                    var query = "SELECT * FROM atleta ";



                    sqlCmd.CommandText = query;

                    sqlCmd.Connection = connection;
                    connection.Open();
                    reader = sqlCmd.ExecuteReader();
                    List<Atleta> listaatletas = new List<Atleta>();

                    while (reader.Read())
                    {
                        Atleta atleta = null;
                        atleta = new Atleta();
                        atleta.Nombre = reader.GetValue(0).ToString();
                        atleta.Apellido1 = reader.GetValue(1).ToString();
                        atleta.Apellido2 = reader.GetValue(2).ToString();
                        atleta.Email1 = reader.GetValue(3).ToString();
                        atleta.Email2 = reader.GetValue(4).ToString();
                        atleta.Carne = reader.GetValue(5).ToString();
                        atleta.Pais = reader.GetValue(6).ToString();
                        atleta.Region = reader.GetValue(7).ToString();
                        atleta.FechaNacimiento = reader.GetValue(8).ToString();
                        atleta.FechaIngreso = reader.GetValue(9).ToString();
                        atleta.Universidad = reader.GetValue(10).ToString();
                        atleta.Deporte = reader.GetValue(11).ToString();
                        atleta.PosicionP = reader.GetValue(12).ToString();
                        atleta.PosicionS = reader.GetValue(13).ToString();
                        atleta.Telefono = reader.GetValue(14).ToString();
                        atleta.Password = reader.GetValue(15).ToString();
                        atleta.Estado = reader.GetValue(16).ToString();
                        atleta.Altura = reader.GetValue(17).ToString();
                        atleta.Peso = reader.GetValue(18).ToString();

                        listaatletas.Add(atleta);
                    }
                    connection.Close();
                    return listaatletas;
                }
                */

        /*public static bool editAtleta(Atleta atleta)
        {
            var connectionString = "Data Source=.;Initial Catalog=LaFabricaDB;Integrated Security=SSPI";

            var query = "UPDATE Atleta SET Nombre='@Nombre', Apellido1='@Apellido1', Apellido2='@Apellido2', Email2='@Email2', Carne='@Carne', Pais='@Pais', Region='@Region'," 
                       +" FechaNacimiento='@FechaNacimiento', Universidad='@Universidad', Deporte='@Deporte', PosicionP='@PosicionP', PosicionS='@PosicionS', Telefono='@Telefono',"
                       +" Password='@Password', Altura= '@Altura', Peso='@Peso') WHERE Carne='@CarneUpd'";
                        

            query = query.Replace("@Nombre", atleta.Nombre)
                         .Replace("@Apellido1", atleta.Apellido1)
                         .Replace("@Apellido2", atleta.Apellido2)
                         .Replace("@Email2", atleta.Email2)
                         .Replace("@Carne", atleta.Carne)
                         .Replace("@Pais", atleta.Pais)
                         .Replace("@Region", atleta.Region)
                         .Replace("@FechaNacimiento", atleta.FechaNacimiento)
                         .Replace("@Universidad", atleta.Universidad)
                         .Replace("@Deporte", atleta.Deporte)
                         .Replace("@PosicionP", atleta.PosicionP)
                         .Replace("@PosicionS", atleta.PosicionS)
                         .Replace("@Telefono", atleta.Telefono)
                         .Replace("@Password", atleta.Password)
                         .Replace("@Altura", atleta.Altura)
                         .Replace("@Peso", atleta.Peso)
                         .Replace("@CarneUpd", atleta.CarneUpd); 


                    




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

        }*/


    }
}