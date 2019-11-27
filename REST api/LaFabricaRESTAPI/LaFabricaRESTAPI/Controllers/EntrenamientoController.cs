using LaFabricaRESTAPI.Models;
using LaFabricaRESTAPI.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace LaFabricaRESTAPI.Controllers
{
    public class EntrenamientoController : ApiController
    {

        // POST: ResultadosEntrenamiento
        [HttpPost]
        [Route("ResultadosEntrenamiento")]
        public bool ResultadosEntrenamiento(Atleta atleta)
        {
            return EntrenamientoRepository.ResultadosEntrenamiento(atleta);
        }


    }
}
