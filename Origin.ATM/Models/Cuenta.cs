using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Origin.ATM.Models
{
    public class Cuenta
    {
        [Key]
        public Int64 id { get; set; }
        [Required]
        public string numero { get; set; }
        public Int64 idTarjeta { get; set; }
        [Required]
        public Int16 idTipoCuenta { get; set; }
        [Required]
        public string fechaAlta { get; set; }
        public byte estado { get; set; }
        public decimal saldo { get; set; }

        [Required]
        public Int16 idTipo { get; set; }
        [Required]
        public Int16 idCliente { get; set; }
        public bool activo { get; set; }


        [ForeignKey("idTarjeta")]
        public Tarjeta Tarjeta { get; set; }

        [ForeignKey("idTipoCuenta")]
        public Tipo_Cuenta Tipo_Cuenta { get; set; }
    }
}
