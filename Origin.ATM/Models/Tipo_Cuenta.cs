using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Origin.ATM.Models
{
    public class Tipo_Cuenta
    {
        [Key]
        public Int16 id { get; set; }
        public string descripcion { get; set; }
        public bool activo { get; set; }
    }
}
