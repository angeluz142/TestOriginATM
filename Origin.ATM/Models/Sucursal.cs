using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Origin.ATM.Models
{
    public class Sucursal
    {
        [Key]
        public Int16 id { get; set; }
        [Required]
        public string nombre { get; set; }
        [Required]
        public string direccion { get; set; }
        [Required]
        public Int16 idLocalidad { get; set; }
        public bool activo { get; set; }



        [ForeignKey("idLocalidad")]
        public Localidad localidad { get; set; }
    }
}
