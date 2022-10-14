using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using Entities;


using System.Data.SqlClient;
using System.Data;
using BLL;

namespace PRUEBAS_LOGIN.Controllers
{
    public class AccesoController : Controller
    {

       



        // GET: Acceso
        public ActionResult Login()
        {
            return View();
        }


        public ActionResult Registrar()
        {
            return View();
        }


        [HttpPost]
        public ActionResult Registrar(Usuario oUsuario)
        {
            bool registrado;
            string mensaje;

            BLLUsuario logica = new BLLUsuario();
            logica.Guardar(oUsuario, out mensaje, out registrado);
            //if (!String.IsNullOrEmpty(mensaje))
            //{

            //    ViewData["Mensaje"] = mensaje;
            //    return View();
            //}
         

            ViewData["Mensaje"] = mensaje;

            if (registrado)
            {
                return RedirectToAction("Login", "Acceso");
            }
            else {
                return View();
            }

        }

        [HttpPost]
        public ActionResult Login(Usuario oUsuario)
        {
            string mensaje = String.Empty;
            int idGenerado = 0;

            BLLUsuario logica = new BLLUsuario();
            logica.Login(oUsuario,out mensaje,out idGenerado);

            if (idGenerado != 0)
            {

                Session["usuario"] = oUsuario;
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewData["Mensaje"] = mensaje;
                return View();
            }


        }






    }
}