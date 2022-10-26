using System.Text.Json.Serialization;

namespace ApiAcademyApp.Models
{
    public class Usuario
    {
        //Esta clase basicamente es la encargada de tener exactamente los mismos datos que la base de datos para
        //así tener un manejo más fácil al hacer la conexion y tratar los datos de manera más sencilla.
        [JsonPropertyName("Id")]
        public int Id { get; set; }
        [JsonPropertyName("Name")]
        public string Name { get; set; }
        [JsonPropertyName("LastName")]
        public string LastName { get; set; }
        [JsonPropertyName("SecondLastName")]
        public string SecondLastName { get; set; }
        [JsonPropertyName("Phone")]
        public int Phone { get; set; }
        [JsonPropertyName("Email")]
        public string Email { get; set; }
        [JsonPropertyName("Password")]
        public string Password { get; set; }
    }
}
