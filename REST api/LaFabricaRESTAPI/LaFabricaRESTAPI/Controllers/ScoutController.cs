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
    public class ScoutController : ApiController
    {



        // POST: api/Scout
        [HttpPost]
        [Route("CreateScout")]
        public bool Post(Scout scout)
        {
            return ScoutRepository.addScout(scout);
        }

        // POST: activacionScout
        [HttpPost]
        [Route("activacionScout")]
        public bool ActivacionEntrenador(Scout scout)
        {
            return ScoutRepository.activacionScout(scout);
        }

        // GET: getScout
        [HttpGet]
        [Route("GetScout/{email}")]
        public Scout GetScout(string email)
        {
            return ScoutRepository.getScout(email);
        }

    }
}
