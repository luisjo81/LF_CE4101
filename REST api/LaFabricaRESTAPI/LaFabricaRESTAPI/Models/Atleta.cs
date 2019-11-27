using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LaFabricaRESTAPI.Models
{
    public class Atleta
    {
        public string Nombre { get; set; }

        public string Apellido1 { get; set; }

        public string Apellido2 { get; set; }

        public string Email1 { get; set; }

        public string Email2 { get; set; }

        public string FechaNacimiento { get; set; }

        public string FechaIngreso { get; set; }

        public int Pais { get; set; }

        public int Region { get; set; }

        public string Carne { get; set; }

        public int Universidad { get; set; }

        public int Deporte { get; set; }

        public int PosicionP { get; set; }

        public int PosicionS { get; set; }

        public string Telefono { get; set; }

        public string Password { get; set; }

        public int TipoUsuario { get; set; }

        public int Estado { get; set; }

        public int Altura { get; set; }

        public int Peso { get; set; }

        public string NombrePais { get; set; }

        public string NombreRegion { get; set; }

        public string NombreUniversidad { get; set; }

        public string NombreDeporte { get; set; }

        public string NombrePosicion1 { get; set; }

        public string NombrePosicion2 { get; set; }


    }
}