using ApiAcademyApp.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
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

        public static dynamic Save(Usuario oUsuario, out string message, out int register)
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
                cmd.Parameters.Add("Registrado", SqlDbType.Bit).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("Mensaje", SqlDbType.VarChar, 500).Direction = ParameterDirection.Output;

                oConexion.Open();
                cmd.ExecuteNonQuery();

                register = Convert.ToInt32(cmd.Parameters["Registrado"].Value);
                message = cmd.Parameters["Mensaje"].Value.ToString();
                try
                {
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

        public static void Login(Usuario user, out string mensaje, out int idGenerado)
        {
            using (SqlConnection cn = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("PA_ValidarUsuario", cn);
                cmd.Parameters.AddWithValue("Email", user.Email);
                cmd.Parameters.AddWithValue("Contrasenna", user.Password);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("Mensaje", SqlDbType.VarChar, 100).Direction = ParameterDirection.Output;

                cn.Open();
                cmd.ExecuteNonQuery();

                idGenerado = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                mensaje = cmd.Parameters["Mensaje"].Value.ToString();
            }
        }

        public static dynamic Edit(Usuario oUsuario)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                try
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


                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                    return new
                    {
                        success = true,
                        message = "Usuario editado correctamente :)",
                        result = oUsuario
                    };
                }
                catch (Exception ex)
                {
                    return new
                    {
                        success = false,
                        message = "Error al editar el usuario: " + ex.Message,
                        result = oUsuario,
                    };
                }
            }
        }

        public static dynamic GetAll()
        {
            List<Usuario> oListaUsuario = null;
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
                             oListaUsuario = new List<Usuario>();
                            oListaUsuario.Add(new Usuario()
                            {
                                Id = Convert.ToInt32(dr["Id"]),
                                Name = dr["Nombre"].ToString(),
                                LastName = dr["Apellido_1"].ToString(),
                                SecondLastName = dr["Apellido_2"].ToString(),
                                Email = dr["Email"].ToString(),
                                Phone = Convert.ToInt32(dr["Telefono"]),
                                Password = dr["Contrasenna"].ToString(),
                            });
                        }

                    }

                    //return new JsonResult(oListaUsuario);
                    return new
                    {
                        //success = true,
                        //message = "Lista de todos los usuarios: ",

                        result = oListaUsuario,
                        //result = new JsonResult(oListaUsuario),

                    };
                }
                catch (Exception ex)
                {
                    return new
                    {
                        success = false,
                        message = "Error al obtener los usuarios: " + ex.Message,
                        result = oListaUsuario,
                    };
                }
            }
        }

        public static dynamic GetById(int idUsuario)
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
                                Id = Convert.ToInt32(dr["Id"]),
                                Name = dr["Nombre"].ToString(),
                                LastName = dr["Apellido_1"].ToString(),
                                SecondLastName = dr["Apellido_2"].ToString(),
                                Email = dr["Email"].ToString(),
                                Phone = Convert.ToInt32(dr["Telefono"]),
                                Password = dr["Contrasenna"].ToString(),
                            };
                        }

                    }
                    return new
                    {
                        //success = true,
                        //message = "Usuario obtenido correctamente :)",
                        result = oUsuario,
                    };
                }
                catch (Exception ex)
                {
                    return new
                    {
                        success = false,
                        message = "Error al obtener el usuario: " + ex.Message,
                        result = oUsuario,
                    };
                }
            }
        }

        public static dynamic Delete(Usuario usu)
        {

            try
            {
                using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
                {
                    SqlCommand cmd = new SqlCommand("PA_EliminarUsuario", oConexion);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ID", usu.Id);

                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                }
                return new
                {
                    success = true,
                    message = "Usuario eliminado correctamente :)",
                    result = "El usuario fue eliminado no hay acceso a sus datos"
                };
            }
            catch (Exception ex)
            {
                return new
                {
                    success = false,
                    message = "Error al eliminar el usuario: " + ex.Message,
                    result = "El usuario no se pudo eliminar"
                };
            }
        }
        }
    }

