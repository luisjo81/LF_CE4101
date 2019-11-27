using LaFabricaRESTAPI.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace LaFabricaRESTAPI.Repositories
{
    public class CatalogosRepository
    {

        public static List<Deporte> getDeportes()
        {

            SqlDataReader reader = null;
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = Globals.ConnectionString;

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.CommandType = CommandType.Text;

            var query = "EXEC usp_GetDeportes";

            


            sqlCmd.CommandText = query;

            sqlCmd.Connection = connection;
            connection.Open();
            reader = sqlCmd.ExecuteReader();
            List<Deporte> listaDeportes = new List<Deporte>();

            while (reader.Read())
            {
                Deporte deporte = null;
                deporte = new Deporte();
                deporte.Nombre = reader.GetValue(0).ToString();
                deporte.ID = Convert.ToInt32(reader.GetValue(1));

                listaDeportes.Add(deporte);
            }
            connection.Close();
            return listaDeportes;
        }





        public static List<Pais> getPaises()
        {

            SqlDataReader reader = null;
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = Globals.ConnectionString;

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.CommandType = CommandType.Text;

            var query = "EXEC usp_GetPaises";



            sqlCmd.CommandText = query;

            sqlCmd.Connection = connection;
            connection.Open();
            reader = sqlCmd.ExecuteReader();
            List<Pais> listaPaises = new List<Pais>();

            while (reader.Read())
            {
                Pais pais = null;
                pais = new Pais();
                pais.Nombre = reader.GetValue(0).ToString();
                pais.ID = Convert.ToInt32(reader.GetValue(1));
                
                listaPaises.Add(pais);
            }
            connection.Close();
            return listaPaises;
        }




        public static List<Posicion> getPosiciones(string deporte)
        {

            SqlDataReader reader = null;
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = Globals.ConnectionString;

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.CommandType = CommandType.Text;

            var query = "EXEC usp_GetPosiciones @deporte = '@Deporte'";

            query = query.Replace("@Deporte", deporte);

            sqlCmd.CommandText = query;

            sqlCmd.Connection = connection;
            connection.Open();
            reader = sqlCmd.ExecuteReader();
            List<Posicion> listaPosiciones = new List<Posicion>();

            while (reader.Read())
            {
                Posicion posicion = null;
                posicion = new Posicion();
                posicion.Nombre = reader.GetValue(0).ToString();
                posicion.Deporte = reader.GetValue(1).ToString();
                posicion.ID = Convert.ToInt32(reader.GetValue(2));

                listaPosiciones.Add(posicion);
            }
            connection.Close();
            return listaPosiciones;
        }

        public static List<Region> getRegiones(string pais)
        {

            SqlDataReader reader = null;
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = Globals.ConnectionString;

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.CommandType = CommandType.Text;

            var query = "EXEC usp_GetRegiones @pais = '@Pais'";

            query = query.Replace("@Pais", pais);

            sqlCmd.CommandText = query;

            sqlCmd.Connection = connection;
            connection.Open();
            reader = sqlCmd.ExecuteReader();
            List<Region> listaRegiones = new List<Region>();

            while (reader.Read())
            {
                Region region = null;
                region = new Region();
                region.Nombre = reader.GetValue(0).ToString();
                region.Pais = reader.GetValue(1).ToString();
                region.ID = Convert.ToInt32(reader.GetValue(2));

                listaRegiones.Add(region);
            }
            connection.Close();
            return listaRegiones;
        }


        public static List<Universidad> getUniversidades(string pais)
        {

            SqlDataReader reader = null;
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = Globals.ConnectionString;

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.CommandType = CommandType.Text;

            var query = "EXEC usp_GetUniversidades @pais = '@Pais'";

            query = query.Replace("@Pais", pais);

            sqlCmd.CommandText = query;

            sqlCmd.Connection = connection;
            connection.Open();
            reader = sqlCmd.ExecuteReader();
            List<Universidad> listaUniversidades = new List<Universidad>();

            while (reader.Read())
            {
                Universidad universidad = null;
                universidad = new Universidad();
                universidad.Nombre = reader.GetValue(0).ToString();
                universidad.ID = Convert.ToInt32(reader.GetValue(1));
                universidad.Pais = reader.GetValue(2).ToString();

                listaUniversidades.Add(universidad);
            }
            connection.Close();
            return listaUniversidades;
        }

    }
}