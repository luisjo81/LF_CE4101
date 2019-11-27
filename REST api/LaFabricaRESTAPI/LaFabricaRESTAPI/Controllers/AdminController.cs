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
    public class AdminController : ApiController
    {

        [HttpPost]
        [Route("CreateAdmin")]
        public bool Post(Administrador admin)
        {
            return AdminRepository.createAdmin(admin);
        }


        // POST: activacionAdmin
        [HttpPost]
        [Route("activacionAdmin")]
        public bool ActivacionAtleta(Administrador admin)
        {
            return AdminRepository.activacionAdmin(admin);
        }

        // GET: getAdmin
        [HttpGet]
        [Route("GetAdmin/{email}")]
        public Administrador Get(string email)
        {
            return AdminRepository.getAdmin(email);
        }
        
    }
}
