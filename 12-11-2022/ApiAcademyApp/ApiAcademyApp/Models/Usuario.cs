namespace ApiAcademyApp.Models
{
    public class Usuario
    {
        //Esta clase basicamente es la encargada de tener exactamente los mismos datos que la base de datos para
        //así tener un manejo más fácil al hacer la conexion y tratar los datos de manera más sencilla.
        public int Id { get; set; } 
        public string Nombre { get; set; }
        public string Apellido1 { get; set; }
        public string Apellido2 { get; set; }
        public int Telefono { get; set; }
        public string Correo { get; set; }
        public string Password { get; set; }
    }
}
