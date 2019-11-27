using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LaFabricaRESTAPI.Models
{
    public class ResultadosPartido
    {
        public string Email { get; set; }

        public int CalificacionPartido { get; set; }

        public int JuegoGanado { get; set; }

        public int JuegoPerdido { get; set; }

        public int JuegoEmpatado { get; set; }

        public int Goles { get; set; }

        public int Asistencias { get; set; }

        public int BalonRecuperado { get; set; }

        public int BalonRecPartido { get; set; }

        public int PasesPerdidos { get; set; }

        public int CentrosPerdidos { get; set; }

        public int RematesSalvados { get; set; }

        public int RematesPerdidos { get; set; }

        public int PasesExitosos { get; set; }

        public int CentrosExitosos { get; set; }

        public int TarjetasAmarillas { get; set; }

        public int TarjetasRojas { get; set; }

        public int PenalesDetenidos { get; set; }

        public int PenalesSalvados { get; set; }
    }
}