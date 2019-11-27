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
    public class LoginController : ApiController
    {
        // GET: GetLogin/email
        [HttpGet]
        [Route("GetLogin/{email}")]
        public IEnumerable<Login> Get(string email)
        {
            yield return LoginRepository.getLogin(email);
        }

   

        
    }
}
