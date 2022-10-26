using System.Net.Sockets;

namespace ApiAcademyApp.DAO
{
    public class Conexion
    {
        //Esta clase crea la ruta de conexion con la base de datos, sin esta ruta el programa no funcionaría ya que
        //no nos podríamos conectar con la base de datos.
        //public static string rutaConexion = "Data Source=.\\SQLEXPRESS;Initial Catalog=AcademyApp;Persist Security Info=True;User ID=sa; Trusted_Connection = True";
        public static string rutaConexion = "workstation id = AcademyApp.mssql.somee.com; packet size = 4096; user id = XnJaca_SQLLogin_1; pwd=8l3lbnx1y9;data source = AcademyApp.mssql.somee.com; persist security info=False;initial catalog = AcademyApp";
    }
}
