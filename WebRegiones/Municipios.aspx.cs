using System;
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
        public int intIdRegion { get; set; }
        public string strMunicipio { get; set; }
        public string strMensaje { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {


        }

       
        private void Consultar()
        {

            Clases.Municipios objMunicipios = new Clases.Municipios();
            objMunicipios.gvdMunicipios = gvdMunicipios;
            objMunicipios.Consultar();
           

        }

      
        private void IngresarMunicipio()
        {
            //intIdRegion = Convert.ToInt32(ddlRegiones.SelectedValue);
            strMunicipio = txtName.Value.Trim();

            Clases.Municipios objMunicipios = new Clases.Municipios();
            objMunicipios.blEstado = cbxEstado.Checked;
            //objMunicipios.intIdRegion = intIdRegion;
            objMunicipios.strNombre = strMunicipio;
            strMensaje = objMunicipios.IngresarMunicipio();
            lblMensaje.Text = strMensaje;
        }
        private void Eliminar()
        {
            Clases.Municipios objMunicipios = new Clases.Municipios();
            if (string.IsNullOrEmpty( txtcodigo.Value) )
            {
                lblMensaje.Text = "Debes ingresar el codigo del municipio a eliminar";
                return;
            }
            objMunicipios.intIdMunicipio = Convert.ToInt32(txtcodigo.Value);
            lblMensaje.Text = objMunicipios.EliminarMunicipio();

        }
        public void Actualizar() 
        {
            //intIdRegion = Convert.ToInt32(ddlRegiones.SelectedValue);
            Clases.Municipios objMunicipios = new Clases.Municipios();
            if (string.IsNullOrEmpty(txtName.Value))
            {
                lblMensaje.Text = "Debes ingresar un nombre del municipio a actualizar";
                return;
            }
            if (string.IsNullOrEmpty(txtcodigo.Value))
            {
                lblMensaje.Text = "Debes ingresar el codigo del municipio a actualizar";
                return;
            }
            objMunicipios.intIdMunicipio = Convert.ToInt32(txtcodigo.Value);
            objMunicipios.strNombre = txtName.Value;
            objMunicipios.blEstado = cbxEstado.Checked;
            lblMensaje.Text = objMunicipios.ActualizarMunicipio();
        }
        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            Consultar();
        }
        protected void Registrar_Click(object sender, EventArgs e)
        {
            IngresarMunicipio();
            Consultar();
        }
        protected void Eliminar_Click(object sender, EventArgs e)
        {
            Eliminar();
            Consultar();

        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            Actualizar();
            Consultar();
        }


    }
}