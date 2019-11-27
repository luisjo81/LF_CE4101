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
    public class AtletaController : ApiController
    {
        /*
        // GET: api/Atleta/
        [HttpGet]
        [Route("GetAtleta")]
        public IEnumerable<string> Get()
        {
            yield return "hey";
        }

        // GET: api/Atleta/5
        [HttpGet]
        [Route("GetAtleta/{id}")]
        public string Get(int id)
        {
            return "value";
        }
        */

        // POST: createAtleta
        [HttpPost]
        [Route("createAtleta")]
        public bool CreateAtleta(Atleta atleta)
        {
            return AtletaRepository.createAtleta(atleta);
        }

        // POST: activacionAtleta
        [HttpPost]
        [Route("activacionAtleta")]
        public bool ActivacionAtleta(Atleta atleta)
        {
            return AtletaRepository.activacionAtleta(atleta);
        }


        // GET: GetInfoAtleta
        [HttpGet]
        [Route("GetInfoAtleta/{email}")]
        public Atleta GetInfoAtleta(string email)
        {
            return AtletaRepository.getAtleta(email);
        }

        // GET: GetInfoEntrenamiento
        [HttpGet]
        [Route("GetInfoEntrenamiento/{email}")]
        public Entrenamiento GetInfoEntrenamiento(string email)
        {
            return AtletaRepository.getInfoEntrenamiento(email);
        }

        // GET: GetInfoPartido
        [HttpGet]
        [Route("GetInfoPartido/{email}")]
        public Partido GetInfoPartido(string email)
        {
            return AtletaRepository.getInfoPartido(email);
        }

        /*
        // PUT: api/Atleta/5
        [HttpPut]
        [Route("editAtleta")]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Atleta/5
        [HttpDelete]
        [Route("deleteAtleta")]
        public void Delete(int id)
        {
        }
        */
    }
}
