using Microsoft.EntityFrameworkCore;
using Origin.ATM.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Origin.ATM.Data
{
    public class AppDBContext : DbContext
    {
        public AppDBContext(DbContextOptions<AppDBContext> options) : base(options)
        {
        }

        public DbSet<Tipo_Tarjeta> Tipo_Tarjeta { get; set; }
        public DbSet<Tipo_Operacion> Tipo_Operacion { get; set; }
        public DbSet<Provincia> Provincia { get; set; }
        public DbSet<Localidad> Localidad { get; set; }
        public DbSet<Cliente> Cliente { get; set; }
        public DbSet<Sucursal> Sucursal { get; set; }   
        public DbSet<Cajero> Cajero { get; set; }
        public DbSet<Tipo_Cuenta> Tipo_Cuenta { get; set; }
        public DbSet<Tarjeta> Tarjeta { get; set; }
        public DbSet<Cuenta> Cuenta { get; set; }
        public DbSet<Operacion> Operacion { get; set; }
    }
}
