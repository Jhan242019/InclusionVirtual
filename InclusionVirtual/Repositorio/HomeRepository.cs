using Castle.Core.Configuration;
using InclusionVirtual.Maps;
using InclusionVirtual.Models;
using InclusionVirtual.Models.Class;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using Microsoft.Extensions.Configuration;
using IConfiguration = Microsoft.Extensions.Configuration.IConfiguration;
using Microsoft.EntityFrameworkCore;

namespace InclusionVirtual.Repositorio
{
    public interface IHomeRepository
    {
        List<Usuario> GetProfesores();
        List<Curso> GetCursos();
        List<Curso> GetCursosCategorias(int idCategoria);
        List<Categoria> GetCategorias();
        Categoria ObtenerCategoria(int idCategoria);
        List<ComentarioCurso> GetComentarios();
    }
    public class HomeRepository : IHomeRepository
    {
        private readonly IncVirtual_Context context;
        public HomeRepository(IncVirtual_Context context)
        {
            this.context = context;
        }
        public List<Curso> GetCursos()
        {
            var cursos = context.Cursos.
                 Include(o => o.Docente).
                 Include(o => o.Categoria).
                 Include(o => o.Modulos).
                 ToList();
            return cursos;
        }
        public List<Curso> GetCursosCategorias(int idCategoria)
        {
            return context.Cursos.
                Where(o => o.IdCategoria == idCategoria).
                Include(o => o.Categoria).
                Include(o => o.Docente).
                ToList();
        }
        public List<Usuario> GetProfesores()
        {
            var profe = context.Usuarios.
                Where(o => o.IdRol.Equals(2))
                .ToList();
            return profe;
        }

        public List<Categoria> GetCategorias()
        {
            var categorias = context.Categorias.
                ToList();
            return categorias;
        }

        public List<ComentarioCurso> GetComentarios()
        {
            var comentarios = context.ComentarioCursos.
                Include(o => o.Usuario).
                ToList();
            return comentarios;
        }

        public Categoria ObtenerCategoria(int idCategoria)
        {
            var ObteCat = context.Categorias.Include(o => o.Nombre).ToList();
            return ObteCat.FirstOrDefault();
        }
    }
}
