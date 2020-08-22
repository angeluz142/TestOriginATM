using Origin.ATM.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Origin.ATM.Data
{
    public interface IProvinciaRepo
    {
        IEnumerable<Provincia> ListarProvincias();
        Provincia GetProvincia(int id);
    }
}
