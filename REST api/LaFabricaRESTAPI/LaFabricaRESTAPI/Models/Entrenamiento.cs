using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LaFabricaRESTAPI.Models
{
    public class Entrenamiento
    {
        public string Email { get; set; }

        public int NumEntrenamientos { get; set; }
    
        public int PromedioEntrenamientos { get; set; }
      
        public string PromTDistanciaCorta { get; set; }
   
        public string PromTDistanciaLarga { get; set; }
       
        public string MejorTiempoDistanciaLarga { get; set; }
    
        public string MejorTiempoDistanciaCorta { get; set; }
        
        public int PromedioSalto { get; set; }
        
        public int MejorSalto { get; set; }
     
        public string PruebaPace { get; set; }
        
        public int PruebaHR { get; set; }
     
        public int NotaXSport { get; set; }

    }
}