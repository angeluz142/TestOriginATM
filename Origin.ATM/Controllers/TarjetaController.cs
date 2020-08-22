using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Origin.ATM.Data;
using Origin.ATM.Models;

namespace Origin.ATM.Controllers
{
    public class TarjetaController : Controller
    {
        private readonly AppDBContext _context;

        public TarjetaController(AppDBContext context)
        {
            _context = context;
        }

        // GET: Tarjeta
        public async Task<IActionResult> Index()
        {
            var appDBContext = _context.Tarjeta.Include(t => t.Cliente).Include(t => t.Tipo_Tarjeta);
            return View(await appDBContext.ToListAsync());
        }

        // GET: Tarjeta/Details/5
        public async Task<IActionResult> Details(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var tarjeta = await _context.Tarjeta
                .Include(t => t.Cliente)
                .Include(t => t.Tipo_Tarjeta)
                .FirstOrDefaultAsync(m => m.id == id);
            if (tarjeta == null)
            {
                return NotFound();
            }

            return View(tarjeta);
        }

        // GET: Tarjeta/Create
        public IActionResult Create()
        {
            ViewData["idCliente"] = new SelectList(_context.Cliente, "id", "apellido");
            ViewData["idTipo"] = new SelectList(_context.Tipo_Tarjeta, "id", "id");
            return View();
        }

        // POST: Tarjeta/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("id,nro,clave,fechaAlta,fechaVencimiento,estado,intentosClave,saldo,idTipo,idCliente,activo")] Tarjeta tarjeta)
        {
            if (ModelState.IsValid)
            {
                _context.Add(tarjeta);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["idCliente"] = new SelectList(_context.Cliente, "id", "apellido", tarjeta.idCliente);
            ViewData["idTipo"] = new SelectList(_context.Tipo_Tarjeta, "id", "id", tarjeta.idTipo);
            return View(tarjeta);
        }

        // GET: Tarjeta/Edit/5
        public async Task<IActionResult> Edit(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var tarjeta = await _context.Tarjeta.FindAsync(id);
            if (tarjeta == null)
            {
                return NotFound();
            }
            ViewData["idCliente"] = new SelectList(_context.Cliente, "id", "apellido", tarjeta.idCliente);
            ViewData["idTipo"] = new SelectList(_context.Tipo_Tarjeta, "id", "id", tarjeta.idTipo);
            return View(tarjeta);
        }

        // POST: Tarjeta/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(long id, [Bind("id,nro,clave,fechaAlta,fechaVencimiento,estado,intentosClave,saldo,idTipo,idCliente,activo")] Tarjeta tarjeta)
        {
            if (id != tarjeta.id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(tarjeta);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!TarjetaExists(tarjeta.id))
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
            ViewData["idCliente"] = new SelectList(_context.Cliente, "id", "apellido", tarjeta.idCliente);
            ViewData["idTipo"] = new SelectList(_context.Tipo_Tarjeta, "id", "id", tarjeta.idTipo);
            return View(tarjeta);
        }

        // GET: Tarjeta/Delete/5
        public async Task<IActionResult> Delete(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var tarjeta = await _context.Tarjeta
                .Include(t => t.Cliente)
                .Include(t => t.Tipo_Tarjeta)
                .FirstOrDefaultAsync(m => m.id == id);
            if (tarjeta == null)
            {
                return NotFound();
            }

            return View(tarjeta);
        }

        // POST: Tarjeta/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(long id)
        {
            var tarjeta = await _context.Tarjeta.FindAsync(id);
            _context.Tarjeta.Remove(tarjeta);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool TarjetaExists(long id)
        {
            return _context.Tarjeta.Any(e => e.id == id);
        }
    }
}
