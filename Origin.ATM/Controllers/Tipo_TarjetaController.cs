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
    public class Tipo_TarjetaController : Controller
    {
        private readonly AppDBContext _context;

        public Tipo_TarjetaController(AppDBContext context)
        {
            _context = context;
        }

        // GET: Tipo_Tarjeta
        public async Task<IActionResult> Index()
        {
            return View(await _context.Tipo_Tarjeta.ToListAsync());
        }

        // GET: Tipo_Tarjeta/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var tipo_Tarjeta = await _context.Tipo_Tarjeta
                .FirstOrDefaultAsync(m => m.id == id);
            if (tipo_Tarjeta == null)
            {
                return NotFound();
            }

            return View(tipo_Tarjeta);
        }

        // GET: Tipo_Tarjeta/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Tipo_Tarjeta/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("id,descripcion,activo")] Tipo_Tarjeta tipo_Tarjeta)
        {
            if (ModelState.IsValid)
            {
                _context.Add(tipo_Tarjeta);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(tipo_Tarjeta);
        }

        // GET: Tipo_Tarjeta/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var tipo_Tarjeta = await _context.Tipo_Tarjeta.FindAsync(id);
            if (tipo_Tarjeta == null)
            {
                return NotFound();
            }
            return View(tipo_Tarjeta);
        }

        // POST: Tipo_Tarjeta/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("id,descripcion,activo")] Tipo_Tarjeta tipo_Tarjeta)
        {
            if (id != tipo_Tarjeta.id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(tipo_Tarjeta);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!Tipo_TarjetaExists(tipo_Tarjeta.id))
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
            return View(tipo_Tarjeta);
        }

        // GET: Tipo_Tarjeta/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var tipo_Tarjeta = await _context.Tipo_Tarjeta
                .FirstOrDefaultAsync(m => m.id == id);
            if (tipo_Tarjeta == null)
            {
                return NotFound();
            }

            return View(tipo_Tarjeta);
        }

        // POST: Tipo_Tarjeta/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var tipo_Tarjeta = await _context.Tipo_Tarjeta.FindAsync(id);
            _context.Tipo_Tarjeta.Remove(tipo_Tarjeta);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool Tipo_TarjetaExists(int id)
        {
            return _context.Tipo_Tarjeta.Any(e => e.id == id);
        }
    }
}
