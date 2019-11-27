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
    public class EntrenadorController : ApiController
    {

       
        [HttpPost]
        [Route("CreateEntrenador")]
        public bool Post(Entrenador entrenador)
        {
            return EntrenadorRepository.createEntrenador(entrenador);
        }

        // POST: activacionEntrenador
        [HttpPost]
        [Route("activacionEntrenador")]
        public bool ActivacionEntrenador(Entrenador entrenador)
        {
            return EntrenadorRepository.activacionEntrenador(entrenador);
        }


        // GET: getEntrenador
        [HttpGet]
        [Route("GetEntrenador/{email}")]
        public Entrenador GetEntrenador(string email)
        {
            return EntrenadorRepository.getEntrenador(email);
        }


    }
}
