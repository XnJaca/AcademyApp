﻿using ApiAcademyApp.DAO;
using ApiAcademyApp.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Microsoft.SqlServer.Server;
using Newtonsoft.Json;
using System.Runtime.CompilerServices;

namespace ApiAcademyApp.Controllers
{
    //Route es la ruta a la cual tendremos que llamar para llegar al API
    [Route("api/[controller]")]
    [ApiController]
    public class UsuarioController : ControllerBase
    {

        //IMPORTANTE: Todos los metodos hacen uso de un token el cual en la teoría solo debemos saber los desarrolladores
        //debido a que este token se usa para validar que no cualquier persona pueda modificar los datos en la base de 
        //datos, este token funciona de manera sencilla, unicamente se pide que se envie como parametro en los headers de
        //la consulta del API para asi ser validado, en caso de que coincida hará la modificación de la base de datos necesaria
        //en caso de que no, retornará un mensaje indicando que el token es incorrecto. Es probable que el token pueda recibir
        //mejoras en cuanto a su seguridad, pero es importante recordar que esto es para la prueba del proyecto.

        //IMPORTANTE 2: TODOS LOS METODOS SON DE TIPO DYNAMIC, ESTO SIGNIFICA QUE EL METODO PODRÁ RETORNAR CUALQUIER TIPO DE
        //VALOR SIN DAR FALLO, ESTO PARA ASÍ PODER RETORNAR SI ES NECESARIO YA SEA UN USUARIO U ALGO MENSAJE INDICANDO UN ERROR.

        //HttpGet es el protocolo mediante el cual se pasaran o recibiran los datos del API
        //Este puede variar con HttpPost
        [HttpGet]
        [Route("getAll")]
        //Este método llama al metodo "Listar" de la clase UsuarioDAO el cual va a revisar la base de datos
        //y retorna todos los usuarios que existan.
        public dynamic GetAll()
        {
         string token = Request.Headers.Where(x => x.Key == "Authorization").FirstOrDefault().Value;

                if (token != "123456" )
                {
                    dynamic obj = new
                    {
                        success = true,
                        message = "token incorrecto",
                        result = "empty"
                    };
                return new JsonResult(obj);
            }
            else
            {
                dynamic query = UsuarioDAO.GetAll();
                if (query.result == null)
                {
                    dynamic obj = new
                    {
                        success = true,
                        message = "No existen usuarios registrados",
                        result = "empty"
                    };
                    return new JsonResult(obj);
                }
                else
                {
                    return new JsonResult(query);
                }
            }
        }

        
        [HttpGet]
        [Route("getById")]
        //Este método llama al metodo "obtener" de la clase UsuarioDAO al cual se le envia el id
        //que se recibió como parametro y este lo inserta en la base de datos.
        public dynamic GetById(int id)
        {
            string token = Request.Headers.Where(x => x.Key == "Authorization").FirstOrDefault().Value;

            if (token != "123456")
            {
                return new
                {
                    success = false,
                    message = "token incorrecto",
                    result = "empty"
                };
            }
            else
            {
                dynamic query = UsuarioDAO.GetById(id);
                Usuario oUsu = (Usuario)query.result;
                if (oUsu == null)
                {
                    dynamic obj = new
                    {
                        success = false,
                        message = "No existen usuarios con ese id",
                        result = "empty"
                    };
                    return new JsonResult(obj);
                }
                else
                {
                    return new JsonResult(query);
                }
            }
            
        }


        [HttpPost]
        [Route("save")]
        ////Este metodo llama al metodo "Registrar" de la clase UsuarioDAO e inserta un nuevo usuario
        public dynamic Save(Usuario usuario)
        {
            string token = Request.Headers.Where(x => x.Key == "Authorization").FirstOrDefault().Value;

            if (token != "123456")
            {
                return new
                {
                    success = true,
                    message = "Token incorrecto",
                    result = "empty"
                };
            }
            else
            {
                dynamic query = UsuarioDAO.Save(usuario, out string message, out int register);
                return new
                {
                    success = query.success,
                    message = query.message,
                    result = query.result,
                    register = register,
                    messageOut = message
                };
                
            }
        }


        [HttpPost]
        [Route("delete")]
        //Este metodo llama al metodo "eliminar" de la clase UsuarioDAO y valga la redundancia elimina el usuario
        public dynamic Delete(Usuario usu)
        {
            //Este token se crea con el fin de que no cualquiera pueda afectar los datos
            //Esto debido a que al ser un API es accesible muy sencillamente, por ello
            //se pide un token, para que solo puedan afectar los datos las personas
            //conocedoras de este.
            //Ademas este token debe ir en todos los metodos, esto al ser una prueba
            //no se realizo en todos por comodidad.
           string token = Request.Headers.Where(x => x.Key == "Authorization").FirstOrDefault().Value;

            if (token != "123456" )
            {
                return new
                {
                    success = true,
                    message = "token incorrecto",
                    result = "empty"
                };
            }
            else
            {
                dynamic query = UsuarioDAO.Delete(usu);
                return query;
            }

        }


        [HttpPost]
        [Route("edit")]
        //Este metodo recibe como parametro un usuario, del cual usaremos el id para llamar al metodo "modificar"
        //de la clase UsuarioDAO y asi modificar los datos de dicho usuario
        public dynamic Edit(Usuario usuario)
        {
            string token = Request.Headers.Where(x => x.Key == "Authorization").FirstOrDefault().Value;

            if (token != "123456")
            {
                return new
                {
                    success = true,
                    message = "token incorrecto",
                    result = "empty"
                };
            }
            else
            {
                dynamic query = UsuarioDAO.Edit(usuario);
                return query;
            }
        }

        [HttpPost]
        [Route("login")]
        ////Este metodo llama al metodo "Registrar" de la clase UsuarioDAO e inserta un nuevo usuario
        public dynamic Login(Usuario usuario)
        {
            int idGenerado;
            string mensaje;
            string token = Request.Headers.Where(x => x.Key == "Authorization").FirstOrDefault().Value;

            if (token != "123456")
            {
                return new
                {
                    success = false,
                    message = "token incorrecto",
                    result = "empty"
                };
            }
            else
            {
                UsuarioDAO.Login(usuario, out mensaje, out idGenerado);
                return new
                {
                    success = true,
                    message = mensaje,
                    result = idGenerado
                };

            }
        }
    }
}
