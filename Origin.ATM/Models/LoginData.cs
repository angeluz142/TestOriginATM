using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Origin.ATM.Models
{
    public class LoginData
    {
        public string cardHash { get; set; }
        public decimal disponible { get; set; }
        public string racd { get; set; }
        public Int64 car { get; set; }
    }
}
