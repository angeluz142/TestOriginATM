using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Origin.ATM.Data;
using Origin.ATM.Models;
using Origin.ATM.Utilidades;
using SQLitePCL;

namespace Origin.ATM.BL
{
    public class Acceso
    {
		private readonly AppDBContext _context;

		public Acceso(AppDBContext context)
		{
			_context = context;
		}
		//public static bool Autenticar(string nroTarjeta,string clave)
  //      {
		//	try
		//	{
		//		var tarjeta = await _con
		//	}
		//	catch (Exception ex)
		//	{

		//		throw;
		//	}
  //      }


    }
}
