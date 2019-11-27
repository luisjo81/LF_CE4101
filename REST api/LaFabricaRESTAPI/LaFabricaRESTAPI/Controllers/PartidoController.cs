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
    public class PartidoController : ApiController
    {

        // POST: ResultadosPartido
        [HttpPost]
        [Route("ResultadosPartido")]
        public bool ResultadosPartido(ResultadosPartido resultado)
        {
            return PartidoRepository.ResultadosPartido(resultado);
        }



    }
}
