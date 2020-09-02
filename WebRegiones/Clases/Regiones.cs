using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.AccessControl;
using System.Web;
using System.Web.UI.WebControls;

namespace WebRegiones.Clases
{
    public class Regiones
    {
        public string strNombre = string.Empty;
        public string strMensaje = string.Empty;

        public string strConexion = string.Empty;

        SqlCommand cmd = null;
        SqlConnection conn = null;
        SqlParameter SqlParameter = null;
        SqlDataAdapter sqlDataAdapter = null;

        public GridView grdRegiones { get; set; }
        public Regiones()
        {
            clsConexion objCon = new clsConexion();
            strConexion = objCon.strGetConnection();
        }
        private bool validar()
        {
            if (strNombre != string.Empty)
            {
                return true;
            }
            return false;
        }
        public void Consultar()
        {
           
        
           
            
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPU_ConsultaRegiones";
                conn = new SqlConnection( strConexion);
                cmd.Connection = conn;
                cmd.Connection.Open();
                grdRegiones.DataSource = cmd.ExecuteReader();
                grdRegiones.DataBind();
                cmd.Connection.Close();
           


        }
        public string InsertarRegion()
        {
            try
            {
                if (!validar())
                {
                    strMensaje = "Debe ingresar un valor para la region";
                    return strMensaje;
                }
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPU_InsertarRegion";
                cmd.Parameters.Add(new SqlParameter("@Name", strNombre));

                SqlParameter = new SqlParameter();
                SqlParameter.ParameterName = "@MENSAJE";
                SqlParameter.SqlDbType = SqlDbType.VarChar;
                SqlParameter.Size = 100;
                SqlParameter.Direction = ParameterDirection.Output;

                cmd.Parameters.Add(SqlParameter);
                conn = new SqlConnection(strConexion);
                cmd.Connection = conn;
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                strMensaje = SqlParameter.Value.ToString();


                return strMensaje;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            //finally { cmd.Connection.Close(); }
            
        }
    }
}