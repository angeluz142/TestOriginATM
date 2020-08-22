using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Origin.ATM.Models
{
    public class Operacion
    {
        [Key]
        public Int64 id { get; set; }
        public Int16 idTipoOperacion { get; set; }
        public Int64 idTarjeta { get; set; }
        public Int16 idAtm { get; set; }
        public DateTime fechaOperacion { get; set; }
        public decimal monto { get; set; }


        [ForeignKey("idTipoOperacion")]
        public Tipo_Operacion Tipo_Operacion { get; set; }

        [ForeignKey("idTarjeta")]
        public Tarjeta Tarjeta { get; set; }

        [ForeignKey("idAtm")]
        public Cajero Cajero { get; set; }
    }
}
