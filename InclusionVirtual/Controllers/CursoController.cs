using InclusionVirtual.Models;
using InclusionVirtual.Repositorio;
using InclusionVirtual.Servicios;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using InclusionVirtual.Maps;

namespace InclusionVirtual.Controllers
{
    public class CursoController : Controller
    {
        private readonly ICursoRepo context;
        private readonly IClaimService claim;
        public CursoController(ICursoRepo context, IClaimService claim)
        {
            this.context = context;
            this.claim = claim;
        }

        [HttpGet]
        public IActionResult Cursos(string search)
        {
            ViewBag.Categorias = context.GetCategorias();
            ViewBag.Nombre = "Cursos";
            var cursos = context.GetCursos();

            ViewBag.Buscar = search;

            if (!string.IsNullOrEmpty(search))
            {
                cursos = cursos.Where(s => s.Docente.Nombres.Contains(search) || s.Docente.Apellidos.Contains(search) || s.Categoria.Nombre.Contains(search) || s.Nombre.Contains(search)).ToList();
                return View("Cursos", cursos);
            }
            return View("Cursos", cursos);
        }

        [HttpGet]
        public IActionResult Detalle(int idCurso)
        {
            ViewBag.Categorias = context.GetCategorias();
            claim.SetHttpContext(HttpContext);
            var curso = context.GetCurso(idCurso);
            if (curso != null)
            {
                if (User.Identity.IsAuthenticated)
                {
                    ViewBag.Cesta = context.Pagado(claim.GetLoggedUser().Id, idCurso);
                }
                ViewBag.Nombre = curso.Nombre;
                return View("Detalle", curso);
            }
            return RedirectToAction("Error", "Curso");
        }

        [Authorize]
        [HttpGet]
        public void Compras(int idCurso)
        {
            ViewBag.Categorias = context.GetCategorias();
            claim.SetHttpContext(HttpContext);
            var compras = context.GetCompra(claim.GetLoggedUser().Id, idCurso);
            var curso = context.GetCurso(idCurso);
            if (compras != null)
            {
                context.DeleteCesta(compras);
                ModelState.AddModelError("Existe", "Ya en cesta");
            }
            if (ModelState.IsValid)
                if (curso.Precio > 0)
                    context.SaveCesta(idCurso, claim.GetLoggedUser().Id);
                else
                    context.SaveGratuito(idCurso, claim.GetLoggedUser().Id);
        }

        [Authorize]
        [HttpPost]
        public IActionResult Comentario(int idCurso, string Comentario)
        {
            ViewBag.Categorias = context.GetCategorias();
            var curso = context.GetCurso(idCurso);
            if (User.Identity.IsAuthenticated)
            {
                claim.SetHttpContext(HttpContext);
                ViewBag.Cesta = context.Pagado(claim.GetLoggedUser().Id, idCurso);
                if (Comentario != null)
                {
                    context.SaveComentario(claim.GetLoggedUser().Id, idCurso, Comentario);
                }
            }
            ViewBag.Nombre = curso.Nombre;
            return View("Detalle", curso);
        }

        [Authorize]
        [HttpGet]
        public IActionResult Desarrollo(int idCurso)
        {
            ViewBag.Categorias = context.GetCategorias();
            var curso = context.GetCurso(idCurso);
            claim.SetHttpContext(HttpContext);

            if (curso != null)
            {
                ViewBag.Nombre = curso.Nombre;

                ViewBag.Progresos = context.GetProgreso(idCurso, claim.GetLoggedUser().Id);
                
                if (ViewBag.Progresos.Count != 0)
                {
                    var progreso = context.GetProgreso(idCurso, claim.GetLoggedUser().Id).Where(o => o.progress).ToList();
                    ViewBag.Progreso = (progreso.Count() * 100) / ViewBag.Progresos.Count;
                }
                else
                {
                    ViewBag.Nombre = curso.Nombre;
                }
                return View("Desarrollo", curso);
            }
            return RedirectToAction("Error", "Curso");
        }

        [Authorize]
        [HttpGet]
        public IActionResult Video(int idClase)
        {
            ViewBag.Categorias = context.GetCategorias();
            claim.SetHttpContext(HttpContext);
            context.AddProgreso(claim.GetLoggedUser().Id, idClase);
            var video = context.GetClases(idClase);
            return Json(video);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
