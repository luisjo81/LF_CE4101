using LaFabricaRESTAPI.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace LaFabricaRESTAPI.Repositories
{
    public class LoginRepository
    {
       

        public static Login getLogin(string email)
        {

            SqlDataReader reader = null;
            SqlConnection connection = new SqlConnection();
            //connection.ConnectionString = "Data Source=.;Initial Catalog=LaFabricaDB;Integrated Security=SSPI";

            connection.ConnectionString = Globals.ConnectionString;

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.CommandType = CommandType.Text;

            var query = "EXEC usp_GetLogin @Email='@email';";

            query = query.Replace("@email", email);

            sqlCmd.CommandText = query;

            sqlCmd.Connection = connection;
            connection.Open();
            reader = sqlCmd.ExecuteReader();
            Login login = null;
            while (reader.Read())
            {
                login = new Login();
                login.Email = reader.GetValue(0).ToString();
                login.Password = reader.GetValue(1).ToString();
                login.TipoUsuario = Convert.ToInt32(reader.GetValue(2));
                login.Estado = Convert.ToInt32(reader.GetValue(3)); 


            }
            connection.Close();
            return login;
        }
        

    }
}