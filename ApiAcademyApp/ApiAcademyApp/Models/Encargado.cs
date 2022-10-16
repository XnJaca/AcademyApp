namespace ApiAcademyApp.Models
{
    public class Encargado
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string LastName { get; set; }
        public string SecondLastName { get; set; }
        public int Phone { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public int IdEstudiantesCargo { get; set; }
    }
}
