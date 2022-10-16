namespace ApiAcademyApp.Models
{
    public class Curso
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public string Description { get; set; }
        public int Homeworks { get; set; }
        public int Exams { get; set; }
        public int Assignments { get; set; }
        public int FinalGrade { get; set; }
        public int IdProfesor { get; set; }

    }
}
