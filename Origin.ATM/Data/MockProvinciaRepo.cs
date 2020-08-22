using Origin.ATM.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Origin.ATM.Data
{
    public class MockProvinciaRepo : IProvinciaRepo
    {
        public Provincia GetProvincia(int id)
        {
            return new Provincia { id = 0, nombre = "Buenos Aires", activo = true };
        }

        public IEnumerable<Provincia> ListarProvincias()
        {
            var provincias = new List<Provincia> {

                new Provincia { id = 0, nombre = "Buenos Aires", activo = true },
            new Provincia { id = 0, nombre = "Buenos Aires", activo = true },
            new Provincia { id = 0, nombre = "Buenos Aires", activo = true }
        };

            return provincias;
        }
    }
}
