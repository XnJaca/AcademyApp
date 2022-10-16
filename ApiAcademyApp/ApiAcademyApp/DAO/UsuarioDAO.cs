using ApiAcademyApp.Models;
using System.Data;
using System.Data.SqlClient;

namespace ApiAcademyApp.DAO
{
    public class UsuarioDAO
    {
        //Esta clase basicamente se encarga de la obtencion, modificacion u eliminacion de datos en la base de
        //datos, cada uno de los metodos hace uso de un PROCEDIMIENTO ALMACENADO, previamente diseñado en la base de
        //datos para así unicamenete tener que enviar los parametros u recibir la información haciendo uso unico del
        //procedimiento almacenado.

        public static dynamic Save(Usuario oUsuario)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("PA_InsertarUsuario", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ID", oUsuario.Id);
                cmd.Parameters.AddWithValue("@Nombre", oUsuario.Name);
                cmd.Parameters.AddWithValue("@Apellido_1", oUsuario.LastName);
                cmd.Parameters.AddWithValue("@Apellido_2", oUsuario.SecondLastName);
                cmd.Parameters.AddWithValue("@Telefono", oUsuario.Phone);
                cmd.Parameters.AddWithValue("@Email", oUsuario.Email);
                cmd.Parameters.AddWithValue("@Contrasenna", oUsuario.Password);

                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                    return new
                    {
                        success = true,
                        message = "Usuario registrado correctamente :)",
                        result = oUsuario,
                    };
                }
                catch (Exception ex)
                {
                    return new
                    {
                        success = false,
                        message = "Error al guardar el usuario: " + ex.Message,
                        result = oUsuario,
                    };
                }
            }
        }

        public static dynamic Edit(Usuario oUsuario)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("PA_ModificarUsuario", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ID", oUsuario.Id);
                cmd.Parameters.AddWithValue("@Nombre", oUsuario.Name);
                cmd.Parameters.AddWithValue("@Apellido_1", oUsuario.LastName);
                cmd.Parameters.AddWithValue("@Apellido_2", oUsuario.SecondLastName);
                cmd.Parameters.AddWithValue("@Telefono", oUsuario.Phone);
                cmd.Parameters.AddWithValue("@Email", oUsuario.Email);
                cmd.Parameters.AddWithValue("@Contrasenna", oUsuario.Password);

                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                    return new
                    {
                        success = true,
                        message = "Se produjo un error al intentar guardar el usuario.",
                        result = oUsuario
                    };
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }

        public static List<Usuario> GetAll()
        {
            List<Usuario> oListaUsuario = new List<Usuario>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("PA_SeleccionarUsuarios", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            oListaUsuario.Add(new Usuario()
                            {
                                Id = Convert.ToInt32(dr["ID"]),
                                Name = dr["Nombre"].ToString(),
                                LastName = dr["Apellido_1"].ToString(),
                                SecondLastName = dr["Apellido_2"].ToString(),
                                Email = dr["Email"].ToString(),
                                Phone = Convert.ToInt32(dr["Telefono"]),
                                Password = dr["Contrasenna"].ToString(),
                            });
                        }

                    }



                    return oListaUsuario;
                }
                catch (Exception ex)
                {
                    return oListaUsuario;
                }
            }
        }

        public static Usuario GetById(int idUsuario)
        {
            Usuario oUsuario = null;
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("PA_SeleccionarUsuarioPorID", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ID", idUsuario);

                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            oUsuario = new Usuario()
                            {
                                Id = Convert.ToInt32(dr["ID"]),
                                Name = dr["Nombre"].ToString(),
                                LastName = dr["Apellido_1"].ToString(),
                                SecondLastName = dr["Apellido_2"].ToString(),
                                Email = dr["Email"].ToString(),
                                Phone = Convert.ToInt32(dr["Telefono"]),
                                Password = dr["Contrasenna"].ToString(),
                            };
                        }

                    }

                    return oUsuario;
                }
                catch (Exception ex)
                {
                    return oUsuario;
                }
            }
        }

        public static dynamic Delete(int id)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("PA_EliminarUsuario", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ID", id);

                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }
    }
}
