using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Origin.ATM.Models
{
    public class Provincia
    {
        [Key]
        public Int16 id { get; set; }
        public string nombre { get; set; }
        public bool activo { get; set; }
    }
}
