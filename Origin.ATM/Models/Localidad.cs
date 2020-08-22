using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Origin.ATM.Models
{
    public class Localidad
    {
        [Key]
        public Int16 id { get; set; }
        public string nombre { get; set; }
        public Int16 idProvincia { get; set; }
        public bool activo { get; set; }
        [ForeignKey("idProvincia")]
        public Provincia provincia { get; set; }

    }
}
