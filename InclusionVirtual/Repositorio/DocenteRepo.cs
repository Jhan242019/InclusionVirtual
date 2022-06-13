using InclusionVirtual.Maps;
using InclusionVirtual.Models;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace InclusionVirtual.Repositorio
{
    public interface IDocenteRepo
    {
        List<Usuario> GetProfesores();
        List<Categoria> GetCategorias();
        List<Curso> GetCursosCategoriaDocente(int idCategoria, int idUser);
        Curso GetCursoIdUsuario(int idCurso, int idDocente);
        void SaveCurso(Curso curso, int idUser, IFormFile image);
        void UpdateCurso(Curso curso, IFormFile image);
        void DeleteCurso(Curso curso);
        List<Curso> GetCursosProceso(int idUser);
        List<Aprendizaje> GetAprendizajes(int IdCurso);
        List<Modulo> GetModulos(int IdCurso);
        List<Clases> GetClases(int IdModulo);
        Modulo GetModulo(int IdModulo);
        Clases GetClase(int IdClases);
        void SaveAprendizaje(Aprendizaje aprendizaje);
        void SaveRequisitos(Requisitos requisitos);
        void SaveModulos(Modulo modulo);
        void UpdateModulos(Modulo modulo);
        void ActualizaCurso(int IdCurso, string Descripcion, string video);
        void UpdateClases(Clases clase);
        Usuario GetUsuario(int idUser);
        List<Curso> GetCursosDocente(int id);
    }
    public class DocenteRepo : IDocenteRepo
    {
        private readonly IncVirtual_Context context;
        public readonly IWebHostEnvironment hosting;

        public DocenteRepo(IncVirtual_Context context, IWebHostEnvironment hosting)
        {
            this.context = context;
            this.hosting = hosting;
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
            return context.Categorias.ToList();
        }

        public List<Curso> GetCursosCategoriaDocente(int idCategoria, int idUser)
        {
            return context.Cursos.
                    Where(o => o.IdCategoria == idCategoria && o.IdDocente == idUser).
                    Include(o => o.Categoria).
                    ToList();
        }

        public void SaveCurso(Curso curso, int idUser, IFormFile image)
        {
            if (image != null)
                curso.Imagen = SaveFile(image);
            else
                curso.Imagen = "/proyecto/logo.png";
            curso.IdDocente = idUser;
            context.Cursos.Add(curso);
            context.SaveChanges();

            Cesta compra = new Cesta
            {
                IdCurso = curso.Id,
                IdUser = curso.IdDocente,
                Pagado = true
            };
            context.Add(compra);
            context.SaveChanges();
        }

        public Curso GetCursoIdUsuario(int idCurso, int idDocente)
        {
            return context.Cursos.
                    Where(o => o.Id == idCurso && o.IdDocente == idDocente).
                    FirstOrDefault();
        }

        public void UpdateCurso(Curso curso, IFormFile image)
        {
            if (image != null)
                curso.Imagen = SaveFile(image);
            context.Cursos.Update(curso);
            context.SaveChanges();
        }

        public void DeleteCurso(Curso curso)
        {
            context.Cursos.Remove(curso);
            context.SaveChanges();
        }
        protected string SaveFile(IFormFile file)
        {
            string relativePath = "";

            if (file.Length > 0 && (file.ContentType == "image/jpeg" || file.ContentType == "image/png" || file.ContentType == "image/gif"))
            {
                relativePath = Path.Combine("FilesBD", file.FileName);
                var filePath = Path.Combine(hosting.WebRootPath, relativePath);
                var stream = new FileStream(filePath, FileMode.Create);
                file.CopyTo(stream);
                stream.Close();
            }

            return "/" + relativePath.Replace('\\', '/');
        }

        public List<Curso> GetCursosProceso(int idUser)
        {
            return context.Cursos.
                    Where(o => o.IdDocente == idUser).
                    Include(o => o.Categoria).
                    ToList();
        }

        public void SaveAprendizaje(Aprendizaje aprendizaje)
        {
            context.Aprendizajes.Add(aprendizaje);
            context.SaveChanges();
        }

        public List<Aprendizaje> GetAprendizajes(int IdCurso)
        {
            return context.Aprendizajes.Where(o => o.IdCurso == IdCurso).ToList();
        }

        public void ActualizaCurso(int IdCurso, string descripcion, string video)
        {
            var curso = context.Cursos.Where(o => o.Id == IdCurso).FirstOrDefault();
            curso.Descripcion = descripcion;
            curso.Video = video;
            context.Cursos.Update(curso);
            context.SaveChanges();
        }

        public void SaveModulos(Modulo modulo)
        {
            context.Modulos.Add(modulo);
            context.SaveChanges();

            var cesta = context.Cestas.Where(o => o.IdCurso == modulo.IdCurso && o.Pagado).ToList();
            if (cesta != null)
            {
                foreach (var item in cesta)
                {
                    var progress = new Progreso();
                    progress.IdCurso = modulo.IdCurso;
                    progress.progress = false;
                    progress.IdUser = item.IdUser;
                    foreach (var item2 in modulo.Clases)
                    {
                        var progres = context.Progresos.Where(o => o.IdCurso == modulo.IdCurso && o.IdUser == item.IdUser && o.IdClase == item2.Id).FirstOrDefault();
                        if (progres == null)
                        {
                            progress.IdClase = item2.Id;
                        }
                    }
                    context.Progresos.Add(progress);
                    context.SaveChanges();
                }
            }
        }

        public List<Modulo> GetModulos(int IdCurso)
        {
            return context.Modulos.Where(o => o.IdCurso == IdCurso).ToList();
        }

        public Modulo GetModulo(int IdModulo)
        {
            return context.Modulos.Where(o => o.Id == IdModulo).FirstOrDefault();
        }

        public void UpdateModulos(Modulo modulo)
        {
            context.Modulos.Update(modulo);
            context.SaveChanges();

            var cesta = context.Cestas.Where(o => o.IdCurso == modulo.IdCurso && o.Pagado).ToList();
            if (cesta != null)
            {
                foreach (var item in cesta)
                {
                    var progress = new Progreso();
                    progress.IdCurso = modulo.IdCurso;
                    progress.progress = false;
                    progress.IdUser = item.IdUser;
                    foreach (var item2 in modulo.Clases)
                    {
                        var progres = context.Progresos.Where(o => o.IdCurso == modulo.IdCurso && o.IdUser == item.IdUser && o.IdClase == item2.Id).FirstOrDefault();
                        if (progres == null)
                        {
                            progress.IdClase = item2.Id;
                        }
                    }
                    context.Progresos.Add(progress);
                    context.SaveChanges();
                }
            }
        }

        public List<Clases> GetClases(int IdModulo)
        {
            return context.Clases.Where(o => o.IdModulo == IdModulo).ToList();
        }

        public Clases GetClase(int IdClases)
        {
            return context.Clases.Where(o => o.Id == IdClases).
                Include(o => o.Recursos).
                FirstOrDefault();
        }

        public void UpdateClases(Clases clase)
        {
            context.Clases.Update(clase);
            context.SaveChanges();
        }

        public Usuario GetUsuario(int idUser)
        {
            return context.Usuarios.Where(o => o.Id == idUser).FirstOrDefault();
        }

        public void SaveRequisitos(Requisitos requisitos)
        {
            context.Requisitos.Add(requisitos);
            context.SaveChanges();
        }

        public List<Curso> GetCursosDocente(int id)
        {
            var cursos = context.Cursos
                .Where(o => o.IdDocente == id)
                .ToList();
            return cursos;
        }
    }
}
