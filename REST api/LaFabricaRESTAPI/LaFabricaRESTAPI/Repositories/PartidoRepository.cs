using LaFabricaRESTAPI.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace LaFabricaRESTAPI.Repositories
{
    public class PartidoRepository
    {

        public static bool ResultadosPartido(ResultadosPartido resultados)
        {
            var connectionString = Globals.ConnectionString;

            var query = "EXEC usp_ResultadosDeJuego @email = 'Email', @calificacionPartido = CalificacionPartido, @juegoGanado = JuegoGanado, @juegoPerdido =JuegoPerdido, @juegoEmpatado =JuegoEmpatado, @goles = Goles, @asistencias = Asistencias, "
                                                 + " @balonRecuperado = BalonRecuperado, @balonesRecPartido = BalonesRecPartido, @pasesPerdidos = PasesPerdidos, @pasesExitosos = PasesExitosos, @centrosPerdidos = CentrosPerdidos, @centrosExitosos = CentrosExitosos, "
                                                 + " @tarjetasAmarillas = TarjetasAmarillas, @tarjetasRojas = TarjetasRojas, @penalesDetenidos = PenalesDetenidos, @penalesSalvados = PenalesSalvados, @rematesSalvados = RematesSalvados, @rematesPerdidos = RematesPerdidos ";




            query = query.Replace("Email", resultados.Email)
                         .Replace("CalificacionPartido", resultados.CalificacionPartido.ToString())
                         .Replace("JuegoGanado", resultados.JuegoGanado.ToString())
                         .Replace("JuegoPerdido", resultados.JuegoPerdido.ToString())
                         .Replace("JuegoEmpatado", resultados.JuegoEmpatado.ToString())
                         .Replace("Goles", resultados.Goles.ToString())
                         .Replace("Asistencias", resultados.Asistencias.ToString())
                         .Replace("BalonRecuperado", resultados.BalonRecuperado.ToString())
                         .Replace("BalonesRecPartido", resultados.BalonRecPartido.ToString())
                         .Replace("PasesPerdidos", resultados.PasesPerdidos.ToString())
                         .Replace("PasesExitosos", resultados.PasesExitosos.ToString())
                         .Replace("CentrosPerdidos", resultados.CentrosPerdidos.ToString())
                         .Replace("CentrosExitosos", resultados.CentrosExitosos.ToString())
                         .Replace("TarjetasAmarillas", resultados.TarjetasAmarillas.ToString())
                         .Replace("TarjetasRojas", resultados.TarjetasRojas.ToString())
                         .Replace("PenalesDetenidos", resultados.PenalesDetenidos.ToString())
                         .Replace("PenalesSalvados", resultados.PenalesSalvados.ToString())
                         .Replace("RematesSalvados", resultados.RematesSalvados.ToString())
                         .Replace("RematesPerdidos", resultados.RematesPerdidos.ToString());




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