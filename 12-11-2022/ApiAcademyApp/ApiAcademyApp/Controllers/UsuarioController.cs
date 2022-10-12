using ApiAcademyApp.DAO;
using ApiAcademyApp.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;

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
        [Route("listar")]
        //Este método llama al metodo "Listar" de la clase UsuarioDAO el cual va a revisar la base de datos
        //y retorna todos los usuarios que existan.
        public dynamic listarUsuarios()
        {
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
                    return UsuarioDAO.Listar();
                }
        }

        
        [HttpPost]
        [Route("listarxId")]
        //Este método llama al metodo "obtener" de la clase UsuarioDAO al cual se le envia el id
        //que se recibió como parametro y este lo inserta en la base de datos.
        public dynamic listarXId(int id)
        {
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
                Usuario oUsu = UsuarioDAO.Obtener(id);
                if (oUsu == null)
                {
                    return new
                    {
                        success = true,
                        message = "No existe ningun usuario con ese ID",
                        result = "empty"
                    };
                }
                else
                {
                    return oUsu;
                }
            }
        }


        [HttpPost]
        [Route("guardar")]
        ////Este metodo llama al metodo "Registrar" de la clase UsuarioDAO e inserta un nuevo usuario
        public dynamic save(Usuario usuario)
        {
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
                return UsuarioDAO.Registrar(usuario);
            }
        }


        [HttpPost]
        [Route("eliminar")]
        //Este metodo llama al metodo "eliminar" de la clase UsuarioDAO y valga la redundancia elimina el usuario
        public dynamic eliminarUsuario(Usuario usu)
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
                return UsuarioDAO.Eliminar(usu.Id);
            }

        }


        [HttpPost]
        [Route("editar")]
        //Este metodo recibe como parametro un usuario, del cual usaremos el id para llamar al metodo "modificar"
        //de la clase UsuarioDAO y asi modificar los datos de dicho usuario
        public dynamic edit(Usuario usuario)
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
                return UsuarioDAO.Modificar(usuario);
            }
        }


    }
}
