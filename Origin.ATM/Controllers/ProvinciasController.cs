using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Origin.ATM.Data;
using Origin.ATM.Models;

namespace Origin.ATM.Controllers
{
    public class ProvinciasController : Controller
    {

        private readonly MockProvinciaRepo _reporsitory = new MockProvinciaRepo();


        //public IActionResult <IEnumerable<Provincia>> Index()
        //{
        //    return View();
        //}
    }
}