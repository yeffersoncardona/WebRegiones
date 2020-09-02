using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

namespace WebRegiones.Clases
{
    public class clsConexion
    {
        public string strGetConnection()
        {
            return ConfigurationManager.ConnectionStrings ["connDB"].ToString();
        }
    }
}