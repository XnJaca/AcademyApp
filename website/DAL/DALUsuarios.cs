using Entities;
using System;
using System.Data;
using System.Data.SqlClient;

namespace CapaDatos
{
    public class DALUsuarios
    {
        public void Guardar(Usuario user, out string mensaje, out bool registrado)
        {
            using (SqlConnection cn = new SqlConnection(Conexion.cn))
            {
                SqlCommand cmd = new SqlCommand("sp_RegistrarUsuario", cn);
                cmd.Parameters.AddWithValue("Correo", user.Correo);
                cmd.Parameters.AddWithValue("Clave", user.Clave);
                cmd.Parameters.Add("Registrado", SqlDbType.Bit).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("Mensaje", SqlDbType.VarChar, 500).Direction = ParameterDirection.Output;
                cmd.CommandType = CommandType.StoredProcedure;

                cn.Open();

                cmd.ExecuteNonQuery();

                registrado = Convert.ToBoolean(cmd.Parameters["Registrado"].Value);
                mensaje = cmd.Parameters["Mensaje"].Value.ToString();
            }
        }

        public void Login(Usuario user, out string mensaje, out int idGenerado)
        {
            using (SqlConnection cn = new SqlConnection(Conexion.cn))
            {
                SqlCommand cmd = new SqlCommand("sp_ValidarUsuario", cn);
                cmd.Parameters.AddWithValue("Correo", user.Correo);
                cmd.Parameters.AddWithValue("Clave", user.Clave);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("Mensaje", SqlDbType.VarChar, 100).Direction = ParameterDirection.Output;

                cn.Open();
                cmd.ExecuteNonQuery();

                idGenerado = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                mensaje = cmd.Parameters["Mensaje"].Value.ToString();
            }
        }
    }
}
