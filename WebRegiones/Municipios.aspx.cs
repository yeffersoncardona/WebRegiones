using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebRegiones.Clases;

namespace WebRegiones
{
    public partial class Municipios : System.Web.UI.Page
    {
        public string strConexion { get; set; }
        SqlCommand cmd = null;
        SqlConnection conn = null;
        SqlParameter SqlParameter = null;
        SqlDataAdapter sqlDataAdapter = null;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public Municipios()
        {
            clsConexion objCon = new clsConexion();
            strConexion = objCon.strGetConnection();
        }

    }
}