﻿using InclusionVirtual.Models;
using InclusionVirtual.Repositorio;
using InclusionVirtual.Servicios;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace InclusionVirtual.Controllers
{
    [Authorize]
    public class AdminController : Controller
    {
        private readonly IClaimService claim;
        private readonly IAdminRepo context;
        public readonly IWebHostEnvironment hosting;

        public AdminController(IAdminRepo context, IClaimService claim, IWebHostEnvironment hosting)
        {
            this.context = context;
            this.claim = claim;
            this.hosting = hosting;
        }

        [HttpGet]
        public IActionResult Usuarios(int idRol)
        {
            ViewBag.Categorias = context.GetCategorias();
            claim.SetHttpContext(HttpContext);
            var user = context.GetUsuarioId(claim.GetLoggedUser().Id);
            ViewBag.User = user.IdRol;
            if (claim.GetLoggedUser().IdRol == 1)
            {
                var usuario = context.GetUsuariosRol(idRol);
                if (idRol == 2)
                    ViewBag.Nombre = "Docentes";
                else if (idRol == 3)
                    ViewBag.Nombre = "Estudiantes";
                else
                    return RedirectToAction("Error", "Curso");
                return View("Usuarios", usuario);
            }
            else
                return RedirectToAction("Error", "Curso");
        }

        [HttpGet]
        public IActionResult CrearUsuarios()
        {
            ViewBag.Categorias = context.GetCategorias();
            ViewBag.Roles = context.GetRoles();
            claim.SetHttpContext(HttpContext);
            var user = context.GetUsuarioId(claim.GetLoggedUser().Id);
            ViewBag.User = user.IdRol;
            if (claim.GetLoggedUser().IdRol == 1)
            {
                return View("CrearUsuarios", new Usuario());
            }
            else
                return RedirectToAction("Error", "Curso");
        }

        [HttpPost]
        public IActionResult CrearUsuarios(Usuario usuario, string passwordConf)
        {
            ViewBag.Categorias = context.GetCategorias();
            ViewBag.Roles = context.GetRoles();
            claim.SetHttpContext(HttpContext);
            var user = context.GetUsuarioId(claim.GetLoggedUser().Id);
            ViewBag.User = user.IdRol;
            if (claim.GetLoggedUser().IdRol == 1)
            {
                if (usuario.Password != passwordConf)
                    ModelState.AddModelError("Password", "Las contraseñas no coinciden");
                var usuarios = context.GetUsuarios();
                foreach (var item in usuarios)
                {
                    if (item.Correo == usuario.Correo)
                        ModelState.AddModelError("Correo", "Este correo ya se encuentra registrado");
                    if (item.Username == usuario.Username)
                        ModelState.AddModelError("Username", "Este usuario ya existe, intenta otro");
                }

                if (ModelState.IsValid)
                {
                    context.SaveUser(usuario);
                    return RedirectToAction("Tablero", "Ajustes");
                }
                return View(usuario);
            }
            else
                return RedirectToAction("Error", "Curso");
        }

        [HttpGet]
        public IActionResult EditarUsuario(int idUser)
        {
            ViewBag.Categorias = context.GetCategorias();
            ViewBag.Roles = context.GetRoles();
            claim.SetHttpContext(HttpContext);
            var user = context.GetUsuarioId(claim.GetLoggedUser().Id);
            ViewBag.User = user.IdRol;
            if (claim.GetLoggedUser().IdRol == 1)
            {
                var usuarios = context.GetUsuarioId(idUser);
                if (usuarios != null)
                    return View("EditarUsuario", usuarios);
                return RedirectToAction("Error", "Curso");
            }
            else
                return RedirectToAction("Error", "Curso");
        }

        [HttpPost]
        public IActionResult EditarUsuario(Usuario usuario)
        {
            ViewBag.Categorias = context.GetCategorias();
            ViewBag.Roles = context.GetRoles();
            claim.SetHttpContext(HttpContext);
            var user = context.GetUsuarioId(claim.GetLoggedUser().Id);
            ViewBag.User = user.IdRol;
            if (claim.GetLoggedUser().IdRol == 1)
            {
                var usuarios = context.GetUsuariosIdNo(usuario.Id);
                foreach (var item in usuarios)
                {
                    if (item.Correo == usuario.Correo)
                        ModelState.AddModelError("Correo", "Este correo ya se encuentra registrado");
                    if (item.Username == usuario.Username)
                        ModelState.AddModelError("Username", "Este usuario ya existe, intenta otro");
                }

                if (ModelState.IsValid)
                {
                    context.UpdateUser(usuario);
                    return RedirectToAction("Tablero", "Ajustes");
                }
                return View(usuario);
            }
            else
                return RedirectToAction("Error", "Curso");
        }

        [HttpGet]
        public IActionResult EliminarUsuario(int idUsuario)
        {
            ViewBag.Categorias = context.GetCategorias();
            claim.SetHttpContext(HttpContext);
            var user = context.GetUsuarioId(claim.GetLoggedUser().Id);
            ViewBag.User = user.IdRol;
            if (claim.GetLoggedUser().IdRol == 1)
            {
                var usuarios = context.GetUsuarioId(idUsuario);
                if (usuarios != null)
                {
                    context.DeleteUser(usuarios);
                    return RedirectToAction("Tablero", "Ajustes");
                }
                return RedirectToAction("Error", "Curso");
            }
            else
                return RedirectToAction("Error", "Curso");
        }

        [HttpGet]
        public IActionResult Cursos(int idCategoria)
        {
            ViewBag.Categorias = context.GetCategorias();
            claim.SetHttpContext(HttpContext);
            var user = context.GetUsuarioId(claim.GetLoggedUser().Id);
            ViewBag.User = user.IdRol;
            if (claim.GetLoggedUser().IdRol == 1)
            {
                var cursos = context.GetCursos(idCategoria);

                foreach (var item in ViewBag.Categorias)
                {
                    if (idCategoria == item.Id)
                        ViewBag.Nombre = item.Nombre;
                }
                if (ViewBag.Nombre == null)
                    return RedirectToAction("Error", "Curso");
                return View("Cursos", cursos);
            }
            else
                return RedirectToAction("Error", "Curso");
        }

        [HttpGet]
        public IActionResult CrearCursos()
        {
            ViewBag.Categorias = context.GetCategorias();
            claim.SetHttpContext(HttpContext);
            var user = context.GetUsuarioId(claim.GetLoggedUser().Id);
            ViewBag.User = user.IdRol;
            if (claim.GetLoggedUser().IdRol == 1)
            {
                ViewBag.Docentes = context.GetUsuariosRol(2);
                return View("CrearCursos", new Curso());
            }
            else
                return RedirectToAction("Error", "Curso");
        }

        [HttpPost]
        public IActionResult CrearCursos(Curso curso, IFormFile image)
        {
            ViewBag.Categorias = context.GetCategorias();
            claim.SetHttpContext(HttpContext);
            var user = context.GetUsuarioId(claim.GetLoggedUser().Id);
            ViewBag.User = user.IdRol;
            if (claim.GetLoggedUser().IdRol == 1)
            {
                if (ModelState.IsValid)
                {
                    context.SaveCurso(curso, image);
                    return RedirectToAction("Tablero", "Ajustes");
                }
                ViewBag.Docentes = context.GetUsuariosRol(2);
                return View(curso);
            }
            else
                return RedirectToAction("Error", "Curso");
        }

        [HttpGet]
        public IActionResult EditarCurso(int idCurso)
        {
            claim.SetHttpContext(HttpContext);
            var user = context.GetUsuarioId(claim.GetLoggedUser().Id);
            ViewBag.User = user.IdRol;
            if (claim.GetLoggedUser().IdRol == 1)
            {
                ViewBag.Docentes = context.GetUsuariosRol(2);
                ViewBag.Categorias = context.GetCategorias();
                var curso = context.GetCurso(idCurso);
                if (curso != null)
                    return View("EditarCurso", curso);
                return RedirectToAction("Error", "Curso");
            }
            else
                return RedirectToAction("Error", "Curso");
        }

        [HttpPost]
        public IActionResult EditarCurso(Curso curso, IFormFile image)
        {
            claim.SetHttpContext(HttpContext);
            var user = context.GetUsuarioId(claim.GetLoggedUser().Id);
            ViewBag.User = user.IdRol;
            if (claim.GetLoggedUser().IdRol == 1)
            {
                ViewBag.Docentes = context.GetUsuariosRol(2);
                ViewBag.Categorias = context.GetCategorias();
                if (ModelState.IsValid)
                {
                    context.UpdateCurso(curso, image);
                    return RedirectToAction("Tablero", "Ajustes");
                }
                return View(curso);
            }
            else
                return RedirectToAction("Error", "Curso");
        }

        [HttpGet]
        public IActionResult EliminarCurso(int idCurso)
        {
            ViewBag.Categorias = context.GetCategorias();
            claim.SetHttpContext(HttpContext);
            var user = context.GetUsuarioId(claim.GetLoggedUser().Id);
            ViewBag.User = user.IdRol;
            if (claim.GetLoggedUser().IdRol == 1)
            {
                var cursos = context.GetCurso(idCurso);
                if (cursos != null)
                {
                    context.DeleteCurso(cursos);
                    return RedirectToAction("Tablero", "Ajustes");
                }
                return RedirectToAction("Error", "Curso");
            }
            else
                return RedirectToAction("Error", "Curso");
        }

        [HttpGet]
        public IActionResult Categorias()
        {
            ViewBag.Categorias = context.GetCategorias();
            claim.SetHttpContext(HttpContext);
            var user = context.GetUsuarioId(claim.GetLoggedUser().Id);
            ViewBag.User = user.IdRol;
            if (claim.GetLoggedUser().IdRol == 1)
            {
                return View("Categorias");
            }
            else
                return RedirectToAction("Error", "Curso");
        }

        [HttpPost]
        public IActionResult Categorias(Categoria categoria)
        {
            ViewBag.Categorias = context.GetCategorias();
            claim.SetHttpContext(HttpContext);
            var user = context.GetUsuarioId(claim.GetLoggedUser().Id);
            ViewBag.User = user.IdRol;
            if (claim.GetLoggedUser().IdRol == 1)
            {
                context.SaveCategoria(categoria);
                return View();
            }
            else
                return RedirectToAction("Error", "Curso");
        }

        [HttpGet]
        public IActionResult Compras()
        {
            claim.SetHttpContext(HttpContext);
            var user = context.GetUsuarioId(claim.GetLoggedUser().Id);
            ViewBag.User = user.IdRol;
            ViewBag.Categorias = context.GetCategorias();
            claim.SetHttpContext(HttpContext);
            if (claim.GetLoggedUser().IdRol == 1)
            {
                var compras = context.GetCompras();
                return View("Compras", compras);
            }
            else
                return RedirectToAction("Error", "Home");
        }

        [HttpGet]
        public void Comprado(int idCompra)
        {
            ViewBag.Categorias = context.GetCategorias();
            claim.SetHttpContext(HttpContext);
            if (claim.GetLoggedUser().IdRol == 1)
            {
                context.AceptaCompra(idCompra);
            }
        }
    }
}
