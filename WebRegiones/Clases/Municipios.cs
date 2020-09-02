using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace WebRegiones.Clases
{
    public class Municipios
    {
        public string strNombre = string.Empty;
        public string strMensaje = string.Empty;

        public string strConexion = string.Empty;

        SqlCommand cmd = null;
        SqlConnection conn = null;
        SqlParameter SqlParameter = null;
        SqlDataAdapter sqlDataAdapter = null;
        public GridView gvdMunicipios { get; set; }
        public DropDownList ddlRegiones { get; set; }
        public Municipios()
        {
            clsConexion objCon = new clsConexion();
            strConexion = objCon.strGetConnection();


        } 
        public void Consultar()
            {




                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPU_ConsultaMunicipios";
                conn = new SqlConnection(strConexion);
                cmd.Connection = conn;
                cmd.Connection.Open();
                gvdMunicipios.DataSource = cmd.ExecuteReader();
                gvdMunicipios.DataBind();
                cmd.Connection.Close();



            }

        public void LlenarComboRegiones()
        {
            DataTable dt = new DataTable();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SPU_ConsultaRegiones";
            conn = new SqlConnection(strConexion);
            //SqlDataAdapter da = new SqlDataAdapter(cmd);

            cmd.Connection = conn;
            //se carga en la variable da
          
            cmd.Connection.Open();
            
            ddlRegiones.DataSource = cmd.ExecuteReader();
            ddlRegiones.DataTextField = "RegionName";
            ddlRegiones.DataValueField = "IdRegion";
            ddlRegiones.DataBind();
            cmd.Connection.Close();

        }
    }
}