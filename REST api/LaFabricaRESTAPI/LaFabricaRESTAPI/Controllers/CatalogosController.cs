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
    public class CatalogosController : ApiController
    {
        
        // GET: getPaises
        [HttpGet]
        [Route("GetPaises")]
        public IEnumerable<Pais> getPaises()
        {
            return CatalogosRepository.getPaises();
        }

        // GET: getDeportes
        [HttpGet]
        [Route("GetDeportes")]
        public IEnumerable<Deporte> GetDeportes()
        {
            return CatalogosRepository.getDeportes();
        }


        // GET: getRegiones
        [HttpGet]
        [Route("GetRegiones/{pais}")]
        public IEnumerable<Region> Get(string pais)
        {
            return CatalogosRepository.getRegiones(pais);
        }


        // GET: getUniversidades
        [HttpGet]
        [Route("GetUniversidades/{pais}")]
        public IEnumerable<Universidad> getUniversidades(string pais)
        {
            return CatalogosRepository.getUniversidades(pais);
        }


        // GET: getPaises
        [HttpGet]
        [Route("GetPosiciones/{deporte}")]
        public IEnumerable<Posicion> getPosiciones(string deporte)
        {
            return CatalogosRepository.getPosiciones(deporte);
        }



        



    }
}
