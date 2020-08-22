using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using Origin.ATM.Data;
using Origin.ATM.Models;
using Origin.ATM.Utilidades;

namespace Origin.ATM.Controllers
{
    public class HomeController : Controller
    {
        private readonly AppDBContext _context;

        public HomeController(AppDBContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Login([Bind("tarjeta,clave")] LoginModel login)
        {
            if (ModelState.IsValid)
            {
                var check = CheckTarjeta(login);

                if (check.valido)
                {
                   
                    //TempData["card"] = 
                    return RedirectToAction("Index", "TipoOperacion");
                }
                else
                {
                    return View();
                }
            }
            else
            {
                return View();
            }
        }

        private ValidationResult CheckTarjeta(LoginModel login) {
            try
            {
                var tarjetas = _context.Tarjeta.ToList();
                var estado = new ValidationResult();

                foreach (var tarjeta in tarjetas)
                {
                    if (Seguridad.CheckString(login.tarjeta, tarjeta.nro))
                    {
                        if (Seguridad.CheckString(login.clave, tarjeta.clave))
                        {
                            estado.valido = true;

                            var data = new LoginData();
                            data.racd = tarjeta.nro;
                            data.cardHash = Guid.NewGuid().ToString();
                            data.car = tarjeta.id;

                            TempData.Put("tempData", data);

                            //TempData["tempData"] = JsonConvert.SerializeObject(data);
                        }
                        else
                        {
                            estado.valido = false;
                            estado.mensaje = "Clave incorrecta.";
                        }
                    }
                    else
                    {
                        estado.valido = false;
                        estado.mensaje = "La tarjeta no se encuentra registrada.";
                    }
                }               

                return estado;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
