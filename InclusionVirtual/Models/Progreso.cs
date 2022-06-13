using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InclusionVirtual.Models
{
    public class Progreso
    {
        public int Id { get; set; }
        public int IdCurso { get; set; }
        public int IdUser { get; set; }
        public bool progress { get; set; }
        public int IdClase { get; set; }
    }
}
