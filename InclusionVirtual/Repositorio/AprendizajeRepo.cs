using InclusionVirtual.Maps;
using InclusionVirtual.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InclusionVirtual.Repositorio
{
    public interface IAprendizajeRepo
    {
        List<Categoria> GetCategorias();
    }
    public class AprendizajeRepo : IAprendizajeRepo
    {
        private readonly IncVirtual_Context context;
        public AprendizajeRepo(IncVirtual_Context context)
        {
            this.context = context;
        }

        public List<Categoria> GetCategorias()
        {
            return context.Categorias.ToList();
        }
    }
}
