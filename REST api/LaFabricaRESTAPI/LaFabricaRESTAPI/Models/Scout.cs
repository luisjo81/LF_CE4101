using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LaFabricaRESTAPI.Models
{
    public class Scout
    {

        public string Email { get; set; }

        public string Nombre { get; set; }

        public string Apellido1 { get; set; }

        public string Apellido2 { get; set; }

        public string FechaIngreso { get; set; }

        public string Password { get; set; }

        public int Estado { get; set; }

    }
}