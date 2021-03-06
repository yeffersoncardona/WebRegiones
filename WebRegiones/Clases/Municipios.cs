﻿using System;
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
        public int intIdRegion { get; set; }
        public int intIdMunicipio { get; set; }

        public string strConexion = string.Empty;
        public bool blEstado { get; set; }


        SqlCommand cmd = null;
        SqlConnection conn = null;
        SqlParameter SqlParameter = null;
       
        public GridView gvdMunicipios { get; set; }
        public DropDownList ddlRegiones { get; set; }
        public Municipios()
        {
            clsConexion objCon = new clsConexion();
            strConexion = objCon.strGetConnection();


        } 
        public void Consultar()
            {




                cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPU_ConsultaMunicipios";
                conn = new SqlConnection(strConexion);
                cmd.Connection = conn;
                cmd.Connection.Open();
                gvdMunicipios.DataSource = cmd.ExecuteReader();
                gvdMunicipios.DataBind();
                cmd.Connection.Close();



            }

       
        private bool validar() 
        {
            if (strNombre == string.Empty)
            {
               
                return false;
            }

           

            
            return true;
        }
        public string IngresarMunicipio()
        {
            try
            {
                if (!validar())
                {
                    strMensaje = "Debe ingresar un nombre para el municipio";
                    return strMensaje;
                }
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPU_InsertarMunicipio";
                cmd.Parameters.Add(new SqlParameter("@Name", strNombre));
                cmd.Parameters.Add(new SqlParameter("@Estado", blEstado));

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

        }

        public string EliminarMunicipio()
        {
            try
            {
                
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPU_EliminarMunicipio";
                cmd.Parameters.Add(new SqlParameter("@idMunicipio", intIdMunicipio));
              

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
        }

        public string ActualizarMunicipio()
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPU_ActualizarMunicipio";
                cmd.Parameters.Add(new SqlParameter("@idMunicipio", intIdMunicipio));
                cmd.Parameters.Add(new SqlParameter("@Name", strNombre));            
                cmd.Parameters.Add(new SqlParameter("@Estado", blEstado));

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
            catch (Exception ex )
            {

                throw ex;
            }
        }
    }
}