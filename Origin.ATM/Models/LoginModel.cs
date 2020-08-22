using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Origin.ATM.Models
{
    public class LoginModel
    {
        [Required]
        public string tarjeta { get; set; }
        [Required]
        public string clave { get; set; }

    }
}
