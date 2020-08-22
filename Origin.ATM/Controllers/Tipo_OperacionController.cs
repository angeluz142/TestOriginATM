using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using Origin.ATM.Data;
using Origin.ATM.Models;
using Origin.ATM.Utilidades;

namespace Origin.ATM.Controllers
{
    public class Tipo_OperacionController : Controller
    {
        private readonly AppDBContext _context;

        public Tipo_OperacionController(AppDBContext context)
        {
            _context = context;
        }

        // GET: Tipo_Operacion
        public IActionResult Index()
        {
            return View();
        }

        // GET: Tipo_Operacion/Details/5
        public async Task<IActionResult> Details(short? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var tipo_Operacion = await _context.Tipo_Operacion
                .FirstOrDefaultAsync(m => m.id == id);
            if (tipo_Operacion == null)
            {
                return NotFound();
            }

            return View(tipo_Operacion);
        }

        public IActionResult Retiro()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Retirar()
        {
            decimal monto;

            decimal.TryParse(HttpContext.Request.Form["UserName"], out monto);

            var result = RealizarRetiro(monto);

            return View("Resultado", result);
        }

       
        public IActionResult Create()
        {
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("id,descripcion,activo")] Tipo_Operacion tipo_Operacion)
        {
            if (ModelState.IsValid)
            {
                _context.Add(tipo_Operacion);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(tipo_Operacion);
        }


        public async Task<IActionResult> Edit(short? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var tipo_Operacion = await _context.Tipo_Operacion.FindAsync(id);
            if (tipo_Operacion == null)
            {
                return NotFound();
            }
            return View(tipo_Operacion);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(short id, [Bind("id,descripcion,activo")] Tipo_Operacion tipo_Operacion)
        {
            if (id != tipo_Operacion.id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(tipo_Operacion);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!Tipo_OperacionExists(tipo_Operacion.id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(tipo_Operacion);
        }


        public async Task<IActionResult> Delete(short? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var tipo_Operacion = await _context.Tipo_Operacion
                .FirstOrDefaultAsync(m => m.id == id);
            if (tipo_Operacion == null)
            {
                return NotFound();
            }

            return View(tipo_Operacion);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(short id)
        {
            var tipo_Operacion = await _context.Tipo_Operacion.FindAsync(id);
            _context.Tipo_Operacion.Remove(tipo_Operacion);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool Tipo_OperacionExists(short id)
        {
            return _context.Tipo_Operacion.Any(e => e.id == id);
        }

        private ValidationResult RealizarRetiro(decimal monto)
        {
            var estado = new ValidationResult();
            try
            {
                string msj = null;
                bool resp = false;
                decimal saldo = 0;
                

                LoginData lData = TempData.Get<LoginData>("tempData");  //JsonConvert.DeserializeObject< JsonConvert.DeserializeObject<List<LoginData>>(TempData["tempData"]);

                var tarjeta = _context.Tarjeta.Find(lData.car);

                // Si es una tarjeta de debito debe buscar en la cuenta el disponible
                if (tarjeta.idTipo == 1)
                {
                    var cuenta = _context.Cuenta.Where(x => x.idTarjeta == tarjeta.id).FirstOrDefault();
                    if (cuenta.saldo >= monto)
                    {
                        saldo = tarjeta.saldo - monto;

                        cuenta.saldo = cuenta.saldo - monto;
                        _context.Cuenta.Update(cuenta);
                        _context.SaveChanges();

                        resp = true;
                        msj = $"Operacion exitosa, su saldo disponible es: {saldo}";
                    }
                    else
                    {
                        msj = "No posee fondos suficientes";
                    }
                }
                // En caso que sea de credito ubica su propio saldo
                else
                {
                    if (tarjeta.saldo >= monto)
                    {
                        saldo = tarjeta.saldo - monto;
                        tarjeta.saldo = tarjeta.saldo - monto;
                        _context.SaveChanges();

                        resp = true;
                        msj = $"Operacion exitosa, su saldo disponible es: {saldo}";
                    }
                    else
                    {
                        msj = "No posee fondos suficientes";
                    }
                }

                estado.valido = resp;
                estado.mensaje = msj;

                

            }
            catch (Exception ex)
            {
                estado.valido = false;
                estado.mensaje = ex.Message;
            }

            return estado;
        }
    }
}
