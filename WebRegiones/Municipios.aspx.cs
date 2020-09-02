﻿using System;
using System.Collections.Generic;
using System.Data;
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
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                LlenarCombo();
            }

        }

       
        private void Consultar()
        {

            Clases.Municipios objMunicipios = new Clases.Municipios();
            objMunicipios.gvdMunicipios = gvdMunicipios;
            objMunicipios.Consultar();
            // gvdRegiones.RowStyle.BackColor = System.Drawing.Color.;// "blue";

        }

        public bool LlenarCombo()
        {
            Clases.Municipios objMunicipios = new Clases.Municipios();
            objMunicipios.ddlRegiones = ddlRegiones;
            objMunicipios.LlenarComboRegiones();
            
            return true;
        }
        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            Consultar();
        }
        protected void Registrar_Click(object sender, EventArgs e)
        {
           // IngresarRegion();
        }

    }
}