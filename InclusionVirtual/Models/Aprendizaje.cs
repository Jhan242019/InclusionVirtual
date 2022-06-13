using System.ComponentModel.DataAnnotations;

namespace InclusionVirtual.Models
{
    public class Aprendizaje
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "Este campo es obligatorio")]
        public int IdCurso { get; set; }
        [Required(ErrorMessage = "Este campo es obligatorio")]
        public string Descripcion { get; set; }
    }
}
