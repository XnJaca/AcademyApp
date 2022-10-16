namespace ApiAcademyApp.DAO
{
    public class Conexion
    {
        //Esta clase crea la ruta de conexion con la base de datos, sin esta ruta el programa no funcionaría ya que
        //no nos podríamos conectar con la base de datos.
        public static string rutaConexion = "Data Source=localhost;Initial Catalog=AcademyApp;Persist Security Info=True;User ID=sa; Trusted_Connection = True";
    }
}
