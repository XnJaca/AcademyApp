using CapaDatos;

using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class BLLUsuario
    {
        private DALUsuarios oDalUsuario = new DALUsuarios();




        public void Guardar(Usuario user, out string Mensaje, out bool registrado)
        {
            Mensaje = String.Empty;
            registrado = false;

            if (string.IsNullOrEmpty(user.Correo) || string.IsNullOrWhiteSpace(user.Correo))
            {
                Mensaje = "El correo no puede ser vacío";
            }
            else if (string.IsNullOrEmpty(user.Clave) || string.IsNullOrWhiteSpace(user.Clave))
            {
                Mensaje = "La clave no puede ser vacía";
            }
            else if (string.IsNullOrEmpty(user.ConfirmarClave) || string.IsNullOrWhiteSpace(user.ConfirmarClave))
            {
                Mensaje = "Tiene que confirmar la contraseña";
            }
            if (user.Clave == user.ConfirmarClave)
            {

                user.Clave = Util.ConvetirSha256(user.Clave);
            }
            else
            {
                Mensaje = "Contraseñas no coinciden";
            }

            

            if (string.IsNullOrEmpty(Mensaje))
            {
                oDalUsuario.Guardar(user, out Mensaje, out registrado);

            }
            //else
            //{
            //    return 0;
            //}



        }

        public void Login(Usuario user, out string Mensaje, out int idGenerado)
        {
            Mensaje = String.Empty;
            idGenerado = 0;

            if (string.IsNullOrEmpty(user.Correo) || string.IsNullOrWhiteSpace(user.Correo))
            {
                Mensaje = "El correo no puede ser vacío";
            }
            else if (string.IsNullOrEmpty(user.Clave) || string.IsNullOrWhiteSpace(user.Clave))
            {
                Mensaje = "La clave no puede ser vacía";
            }



            if (string.IsNullOrEmpty(Mensaje))
            {
                user.Clave = Util.ConvetirSha256(user.Clave);
                oDalUsuario.Login(user,out Mensaje,out idGenerado);

            }
            //else
            //{
            //    return 0;
            //}



        }


    }
}
