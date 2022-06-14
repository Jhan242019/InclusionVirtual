using Castle.Core.Configuration;
using InclusionVirtual.Maps;
using InclusionVirtual.Models;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using IConfiguration = Microsoft.Extensions.Configuration.IConfiguration;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;

namespace InclusionVirtual.Repositorio
{
    public interface IAdminRepo
    {
        List<Categoria> GetCategorias();
        List<Roles> GetRoles();
        List<Usuario> GetUsuarios();
        List<Usuario> GetUsuariosRol(int idRol);
        List<Usuario> GetUsuariosIdNo(int id);
        Usuario GetUsuarioId(int idUser);
        void SaveUser(Usuario usuario);
        void UpdateUser(Usuario usuario);
        void DeleteUser(Usuario usuario);
        List<Curso> GetCursos(int idCategoria);
        Curso GetCurso(int idCurso);
        void SaveCurso(Curso curso, IFormFile image);
        void UpdateCurso(Curso curso, IFormFile image);
        void DeleteCurso(Curso curso);
        void SaveCategoria(Categoria categoria);
        List<Cesta> GetCompras();
        void AceptaCompra(int idCompra);
    }
    public class AdminRepo : IAdminRepo
    {
        private IncVirtual_Context context;
        private IConfiguration configuration;
        public readonly IWebHostEnvironment hosting;

        public AdminRepo(IncVirtual_Context context, IConfiguration configuration, IWebHostEnvironment hosting)
        {
            this.context = context;
            this.configuration = configuration;
            this.hosting = hosting;
        }

        public Curso GetCurso(int idCurso)
        {
            return context.Cursos.Where(o => o.Id == idCurso).FirstOrDefault();
        }

        public void DeleteCurso(Curso curso)
        {
            context.Cursos.Remove(curso);
            context.SaveChanges();
        }

        public void DeleteUser(Usuario usuario)
        {
            context.Usuarios.Remove(usuario);
            context.SaveChanges();
        }

        public List<Categoria> GetCategorias()
        {
            return context.Categorias.ToList();
        }

        public List<Curso> GetCursos(int idCategoria)
        {
            return context.Cursos.
                Where(o => o.IdCategoria == idCategoria).
                Include(o => o.Categoria).
                Include(o => o.Docente).
                ToList();
        }

        public List<Roles> GetRoles()
        {
            return context.Roles.ToList();
        }

        public Usuario GetUsuarioId(int idUser)
        {
            return context.Usuarios.Where(o => o.Id == idUser).FirstOrDefault();
        }

        public List<Usuario> GetUsuarios()
        {
            return context.Usuarios.ToList();
        }

        public List<Usuario> GetUsuariosIdNo(int id)
        {
            return context.Usuarios.Where(o => o.Id != id).ToList();
        }

        public List<Usuario> GetUsuariosRol(int idRol)
        {
            return context.Usuarios.
                    Where(o => o.IdRol == idRol).
                    Include(o => o.Roles).
                    ToList();
        }

        public void SaveCurso(Curso curso, IFormFile image)
        {
            if (image != null)
                curso.Imagen = SaveFile(image);
            else
                curso.Imagen = "/proyecto/logo.png";
            context.Cursos.Add(curso);
            context.SaveChanges();
        }

        public void SaveUser(Usuario usuario)
        {
            usuario.Imagen = "/proyecto/userperfil4.png";
            usuario.Password = CreateHash(usuario.Password);
            context.Usuarios.Add(usuario);
            context.SaveChanges();
        }

        public void UpdateCurso(Curso curso, IFormFile image)
        {
            if (image != null)
                curso.Imagen = SaveFile(image);
            context.Cursos.Update(curso);
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

        public void UpdateUser(Usuario usuario)
        {
            context.Usuarios.Update(usuario);
            context.SaveChanges();
        }
        protected string CreateHash(string input)
        {
            input += configuration.GetValue<string>("Token");
            var sha = SHA512.Create();
            var bytes = Encoding.Default.GetBytes(input);
            var hash = sha.ComputeHash(bytes);
            return Convert.ToBase64String(hash);
        }

        public void SaveCategoria(Categoria categoria)
        {
            context.Categorias.Add(categoria);
            context.SaveChanges();
        }

        public List<Cesta> GetCompras()
        {
            return context.Cestas
                .Where(o => !o.Pagado)
                .Include(o => o.Cursos)
                .Include(o => o.Cursos.Docente)
                .Include(o => o.Usuarios)
                .ToList();
        }

        public void AceptaCompra(int idCompra)
        {
            var comprado = context.Cestas
                .Where(o => o.Id == idCompra)
                .FirstOrDefault();
            comprado.Pagado = true;
            context.Cestas.Update(comprado);
            context.SaveChanges();

            var modulos = context.Modulos
                .Where(o => o.IdCurso == comprado.IdCurso)
                .ToList();

            foreach (var item in modulos)
            {
                var clase = context.Clases
                    .Where(o => o.IdModulo == item.Id)
                    .ToList();
                foreach (var item2 in clase)
                {
                    var progresito = new Progreso();
                    progresito.IdUser = comprado.IdUser;
                    progresito.IdCurso = comprado.IdCurso;
                    progresito.IdClase = item2.Id;
                    progresito.progress = false;
                    context.Progresos.Add(progresito);
                    context.SaveChanges();
                }
            }
        }
    }
}
