using InclusionVirtual.Maps;
using InclusionVirtual.Models;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace InclusionVirtual.Repositorio
{
    public interface IAjustesRepo
    {
        List<Usuario> GetUsuarios(int idUser);
        Usuario GetUsuario(int idUser);
        void UpdateUser(Usuario usuario, IFormFile image);
        List<Categoria> GetCategorias();
        List<Curso> GetCursos();
        List<Usuario> GetUsuariosC(int idUser);

    }
    public class AjustesRepo : IAjustesRepo
    {
        private readonly IncVirtual_Context context;
        public readonly IWebHostEnvironment hosting;

        public AjustesRepo(IncVirtual_Context context, IWebHostEnvironment hosting)
        {
            this.context = context;
            this.hosting = hosting;
        }

        public List<Usuario> GetUsuarios(int idUser)
        {
            return context.Usuarios.Where(o => o.Id != idUser).ToList();
        }

        public List<Usuario> GetUsuariosC(int idUser)
        {
            return context.Usuarios.Where(o => o.IdRol == idUser).ToList();
        }

        public Usuario GetUsuario(int idUser)
        {
            return context.Usuarios.Where(o => o.Id == idUser).FirstOrDefault();
        }

        public void UpdateUser(Usuario usuario, IFormFile image)
        {
            if (image != null)
                usuario.Imagen = SaveFile(image);
            context.Usuarios.Update(usuario);
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

        public List<Categoria> GetCategorias()
        {
            return context.Categorias.ToList();
        }
        public List<Curso> GetCursos()
        {
            return context.Cursos.ToList();
        }
    }
}
