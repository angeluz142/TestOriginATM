using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Threading.Tasks;

namespace Origin.ATM.Utilidades
{
    public class Seguridad
    {

        public static string EncriptarPassword(string cadena)
        {
			try
			{
				var salt = BCrypt.Net.BCrypt.GenerateSalt();

				var encripted = BCrypt.Net.BCrypt.HashPassword(cadena, salt);

				return encripted;
			}
			catch (Exception ex)
			{
				throw;
			}
        }

		public static bool CheckString(string inString,string str)
		{
			try
			{
				var result = BCrypt.Net.BCrypt.Verify(inString, str);			

				return result;
			}
			catch (Exception ex)
			{
				throw;
			}
		}

	}
}
