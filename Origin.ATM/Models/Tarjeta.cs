using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Origin.ATM.Models
{
    public class Tarjeta
    {
        [Key]
        public Int64 id { get; set; }
        [Required]
        public string nro { get; set; }
        [Required]
        public string clave { get; set; }
        [Required]
        public DateTime fechaAlta { get; set; }
        [Required]
        public DateTime fechaVencimiento { get; set; }
        public byte estado { get; set; }
        public byte intentosClave { get; set; }
        public decimal saldo { get; set; }

        [Required]
        public Int16 idTipo { get; set; }
        [Required]
        public Int64 idCliente { get; set; }        
        public bool activo { get; set; }


        [ForeignKey("idTipo")]
        public Tipo_Tarjeta Tipo_Tarjeta { get; set; }

        [ForeignKey("idCliente")]
        public Cliente Cliente { get; set; }

    }
}
