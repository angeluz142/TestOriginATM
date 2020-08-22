using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Origin.ATM.Models
{
    public class Cliente
    {
        [Key]
        public Int64 id { get; set; }
        [Required]
        public string dni { get; set; }
        [Required]
        public string nombre { get; set; }
        [Required]
        public string apellido { get; set; }
        [Required]
        public string direccion { get; set; }
        [Required]
        public Int16 idLocalidad { get; set; }
        [Required]
        public string telFijo { get; set; }
        public string telMovil { get; set; }
        public DateTime fechaAlta { get; set; }
        public bool activo { get; set; }
        

        [ForeignKey("idLocalidad")]
        public Localidad localidad { get; set; }
    }
}
