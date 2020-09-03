using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using WebRegiones.Clases;
using System.EnterpriseServices;

namespace WebRegiones
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       

        private void Consultar()
        {
            
            Regiones objRegiones = new Regiones();
            objRegiones.grdRegiones = gvdRegiones;
            objRegiones.Consultar();
           // gvdRegiones.RowStyle.BackColor = System.Drawing.Color.;// "blue";
           
        }
        private void IngresarRegion()
        {
            Regiones objRegiones = new Regiones();
            objRegiones.strNombre = txtName.Value;
            lblMensaje.Text = objRegiones.InsertarRegion();


        }
        private bool ValidarCampos()
        {
            if (string.IsNullOrEmpty(txtName.Value))
            {
                lblMensaje.Text = "Debe Agregar un nombre para la region";
                return false;
            }
            if (string.IsNullOrEmpty(txtcodigo.Value))
            {
                lblMensaje.Text = "Debe ingresar un codigo de region para actualizar";
                return false;
            }
            return true;
        }
        private void Actualizar() 
        {
            if (!ValidarCampos())
            {
                return;
            }
            Regiones objRegiones = new Regiones();
            objRegiones.strNombre = txtName.Value;
           
            objRegiones.intIdRegion = Convert.ToInt32(txtcodigo.Value);
            lblMensaje.Text = objRegiones.ActualizarRegion();
            Consultar();
        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            Consultar();
        }
        protected void Registrar_Click(object sender, EventArgs e)
        {
            IngresarRegion();
        }
        protected void Actualizar_Click(object sender, EventArgs e)
        {
            Actualizar();
        }
    }
}