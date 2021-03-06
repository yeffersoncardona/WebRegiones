﻿using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebRegiones.Clases
{
    public class Regiones
    {
        public string strNombre = string.Empty;
        public string strMensaje = string.Empty;
        public int intIdRegion { get; set; }

        public int intIdMunicipio { get; set; }
        public string strConexion = string.Empty;

        SqlCommand cmd = null;
        SqlConnection conn = null;
        SqlParameter SqlParameter = null;


        public GridView grdRegiones { get; set; }
        public DropDownList ddlMunicipios { get; set; }
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




            cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SPU_ConsultaRegiones";
            conn = new SqlConnection(strConexion);
            cmd.Connection = conn;
            cmd.Connection.Open();
            grdRegiones.DataSource = cmd.ExecuteReader();
            grdRegiones.DataBind();
            cmd.Connection.Close();



        }
        public void LlenarComboMunicipios()
        {
            DataTable dt = new DataTable();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SPU_ConsultarComboMunicipios";
            conn = new SqlConnection(strConexion);


            cmd.Connection = conn;


            cmd.Connection.Open();

            ddlMunicipios.DataSource = cmd.ExecuteReader();
            ddlMunicipios.DataTextField = "Municipio";
            ddlMunicipios.DataValueField = "Codigo";
            ddlMunicipios.DataBind();
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
                cmd.Parameters.Add(new SqlParameter("@IdMunicipio", intIdMunicipio));


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
        public string ActualizarRegion()
        {
            try
            {
                if (!validar())
                {
                    strMensaje = "Debe ingresar un valor para la region";
                    return strMensaje;
                }
                cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPU_ActualizarRegion";
                cmd.Parameters.Add(new SqlParameter("@idRegion", intIdRegion));
                cmd.Parameters.Add(new SqlParameter("@Name", strNombre));
                cmd.Parameters.Add(new SqlParameter("@IdMunicipio", intIdMunicipio));
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
        public string EliminarRegion()
        {
            try
            {
                cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPU_EliminarRegion";
                cmd.Parameters.Add(new SqlParameter("@idRegion", intIdRegion));

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
            catch (Exception e)
            {

                throw e;
            }
        }
    }
}