using InclusionVirtual.Maps;
using InclusionVirtual.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InclusionVirtual.Repositorio
{
    public interface ICursoUsuarioRepo 
    {
        Usuario GetUsuario(int idUser);
        List<Cesta> GetCursosUsuario(int idUser);
        List<Categoria> GetCategorias();
        List<Curso> GetCursos();
        List<Cesta> GetCestas();
    }
    public class CursoUsuarioRepo : ICursoUsuarioRepo
    {
        private readonly IncVirtual_Context context;

        public CursoUsuarioRepo(IncVirtual_Context context) 
        {
            this.context = context;
        }

        public List<Categoria> GetCategorias()
        {
            return context.Categorias.ToList();
        }

        public List<Cesta> GetCestas()
        {
            return context.Cestas.ToList();
        }

        public List<Curso> GetCursos()
        {
            return context.Cursos.ToList();
        }

        public List<Cesta> GetCursosUsuario(int idUser)
        {
            return context.Cestas.
                Where(o => o.IdUser == idUser).
                Include(o => o.Cursos).
                ToList();
        }

        public Usuario GetUsuario(int idUser)
        {
            return context.Usuarios.Where(o => o.Id == idUser).FirstOrDefault(); ;
        }
    }

}
