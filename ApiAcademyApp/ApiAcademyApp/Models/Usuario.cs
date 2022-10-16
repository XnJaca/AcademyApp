namespace ApiAcademyApp.Models
{
    public class Usuario
    {
        //Esta clase basicamente es la encargada de tener exactamente los mismos datos que la base de datos para
        //así tener un manejo más fácil al hacer la conexion y tratar los datos de manera más sencilla.
        public int Id { get; set; } 
        public string Name { get; set; }
        public string LastName { get; set; }
        public string SecondLastName { get; set; }
        public int Phone { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
    }
}
