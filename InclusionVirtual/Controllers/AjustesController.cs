using Castle.Core.Configuration;
using InclusionVirtual.Models;
using InclusionVirtual.Repositorio;
using InclusionVirtual.Servicios;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using Microsoft.Extensions.Configuration;
using IConfiguration = Microsoft.Extensions.Configuration.IConfiguration;
using Microsoft.AspNetCore.Authorization;

namespace InclusionVirtual.Controllers
{
    [Authorize]
    public class AjustesController : Controller
    {
        private IClaimService claim;
        private IAjustesRepo context;
        private IConfiguration configuration;

        public AjustesController(IAjustesRepo context, IClaimService claim, IConfiguration configuration)
        {
            this.context = context;
            this.claim = claim;
            this.configuration = configuration;
        }

        [HttpGet]
        public IActionResult Index()
        {
            claim.SetHttpContext(HttpContext);
            var user = context.GetUsuario(claim.GetLoggedUser().Id);
            ViewBag.User = user.IdRol;
            ViewBag.Categorias = context.GetCategorias();
            return View("Index", user);
        }


        [HttpGet]
        public IActionResult Tablero()
        {
            claim.SetHttpContext(HttpContext);
            var user = context.GetUsuario(claim.GetLoggedUser().Id);
            ViewBag.User = user.IdRol;
            ViewBag.Categorias = context.GetCategorias();
            ViewBag.Cursos = context.GetCursos().Count();
            ViewBag.Admins = context.GetUsuariosC(1).Count();
            ViewBag.Profesores = context.GetUsuariosC(2).Count();
            ViewBag.Estudiantes = context.GetUsuariosC(3).Count();
            return View("Tablero", user);
        }

        [HttpPost]
        public IActionResult Editar(Usuario usuario, IFormFile image)
        {
            claim.SetHttpContext(HttpContext);
            var user = context.GetUsuario(claim.GetLoggedUser().Id);
            ViewBag.User = user.IdRol;
            ViewBag.Categorias = context.GetCategorias();
            user.Nombres = usuario.Nombres;
            user.Apellidos = usuario.Apellidos;
            user.Celular = usuario.Celular;
            user.Biografia = usuario.Biografia;
            user.Username = usuario.Username;
            user.Correo = usuario.Correo;
            user.Twitter = usuario.Twitter;
            user.Facebook = usuario.Facebook;
            user.LinkedIn = usuario.LinkedIn;
            user.YouTube = usuario.YouTube;
            user.Instagram = usuario.Instagram;
            user.Titulo = usuario.Titulo;

            if (ModelState.IsValid)
            {
                context.UpdateUser(user, image);
                return RedirectToAction("Tablero","Ajustes");
            }
            return View("Index", user);
        }

        protected string CreateHash(string input)
        {
            input += configuration.GetValue<string>("Token");
            var sha = SHA512.Create();
            var bytes = Encoding.Default.GetBytes(input);
            var hash = sha.ComputeHash(bytes);
            return Convert.ToBase64String(hash);
        }
    }
}
