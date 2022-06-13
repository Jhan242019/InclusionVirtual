using InclusionVirtual.Maps;
using InclusionVirtual.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InclusionVirtual.Repositorio
{
    public interface ICursoRepo
    {
        List<Categoria> GetCategorias();
        List<Curso> GetCursos();
        List<Progreso> GetProgreso(int idCurso, int idUser);
        Curso GetCurso(int idCurso);
        Clases GetClases(int idClase);
        void SaveComentario(int idUsuario, int idCurso, string Comentario);
        Cesta GetCompra(int idUser, int idCurso);
        void AddProgreso(int iduser, int idCurso);
        string Pagado(int idUser, int idCurso);
        void SaveCesta(int idCurso, int idUser);
        void SaveGratuito(int idCurso, int idUser);
        void DeleteCesta(Cesta cursoUsuario);
        Usuario GetUsuarioId(int idUser);
    }
    public class CursoRepo : ICursoRepo
    {
        private readonly IncVirtual_Context context;
        public CursoRepo(IncVirtual_Context context)
        {
            this.context = context;
        }

        public List<Curso> GetCursos()
        {
            return context.Cursos.
                Include(o => o.Docente).
                Include(o => o.Categoria).
                ToList();
        }

        public Curso GetCurso(int idCurso)
        {
            context.Modulos.Include(o => o.Clases).ToList();
            context.Usuarios.ToList();
            return context.Cursos.
                Where(o => o.Id == idCurso).
                Include(o => o.Docente).
                Include(o => o.Aprendizajes).
                Include(o => o.Categoria).
                Include(o => o.Modulos).
                Include(o => o.Comentarios).
                Include(o => o.Requisitos).
                FirstOrDefault();
        }

        public void SaveComentario(int idUsuario, int idCurso, string Comentario)
        {
            ComentarioCurso comentario = new ComentarioCurso();
            comentario.IdCurso = idCurso;
            comentario.IdUsuario = idUsuario;
            comentario.Comentario = Comentario;
            context.Add(comentario);
            context.SaveChanges();
        }

        public Clases GetClases(int idClase)
        {
            return context.Clases.Where(o => o.Id == idClase).
                Include(o => o.Recursos).
                FirstOrDefault();
        }

        public void SaveCesta(int idCurso, int idUser)
        {
            Cesta compra = new Cesta
            {
                IdCurso = idCurso,
                IdUser = idUser,
                Pagado = false
            };
            context.Add(compra);
            context.SaveChanges();
        }


        public void DeleteCesta(Cesta cursoUsuario)
        {
            context.Remove(cursoUsuario);
            context.SaveChanges();
        }

        public void SaveGratuito(int idCurso, int idUser)
        {
            Cesta compra = new Cesta
            {
                IdCurso = idCurso,
                IdUser = idUser,
                Pagado = true
            };
            context.Add(compra);
            context.SaveChanges();

            var modulos = context.Modulos
                .Where(o => o.IdCurso == idCurso)
                .ToList();
            foreach (var item in modulos)
            {
                var clase = context.Clases
                    .Where(o => o.IdModulo == item.Id)
                    .ToList();
                foreach (var item2 in clase)
                {
                    var progresito = new Progreso();
                    progresito.IdUser = idUser;
                    progresito.IdCurso = idCurso;
                    progresito.IdClase = item2.Id;
                    progresito.progress = false;
                    context.Progresos.Add(progresito);
                    context.SaveChanges();
                }
            }
        }
        public Cesta GetCompra(int idUser, int idCurso)
        {
            return context.Cestas.Where(o => o.IdUser == idUser && o.IdCurso == idCurso).FirstOrDefault();
        }

        public string Pagado(int idUser, int idCurso)
        {
            var compra = GetCompra(idUser, idCurso);
            if (compra != null)
            {
                if (!compra.Pagado)
                    return "Cesta";
                else
                    return "Pagado";
            }
            else
                return "Nada";
        }

        public Usuario GetUsuarioId(int idUser)
        {
            return context.Usuarios.Where(o => o.Id == idUser).FirstOrDefault();
        }

        public void AddProgreso(int idUser, int idclase)
        {
            var progreso = context.Progresos.Where(o => o.IdUser == idUser && o.IdClase == idclase).FirstOrDefault();

            progreso.progress = true;
            context.Progresos.Update(progreso);
            context.SaveChanges();
        }
        
        public List<Progreso> GetProgreso(int idCurso, int idUser)
        {
            var progeso = context.Progresos.
                Where(o => o.IdCurso == idCurso && o.IdUser == idUser).
                ToList();
            return progeso;
        }

        public List<Categoria> GetCategorias()
        {
            return context.Categorias.ToList();
        }
    }
}
