using InclusionVirtual.Models;
using InclusionVirtual.Repositorio;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace InclusionVirtual.Controllers
{
    public class HomeController : Controller
    {
        private readonly IHomeRepository context;

        public HomeController(IHomeRepository context)
        {
            this.context = context;
        }

        public IActionResult Index()
        {
            try
            {
                var profe = context.GetProfesores();
                ViewBag.Curso = context.GetCursos();
                ViewBag.Categorias = context.GetCategorias();
                ViewBag.ComentarioCurso = context.GetComentarios();
                return View("Index", profe);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public IActionResult Testimonial()
        {
            ViewBag.Categorias = context.GetCategorias();
            ViewBag.ComentarioCurso = context.GetComentarios();
            return View("Testimonial");
        }

        public IActionResult TerCon()
        {
            ViewBag.Categorias = context.GetCategorias();
            return View("TerCon");
        }

        public IActionResult PoliPri()
        {
            ViewBag.Categorias = context.GetCategorias();
            return View("PoliPri");
        }

        public IActionResult Contacto()
        {
            ViewBag.Categorias = context.GetCategorias();
            return View("Contacto");
        }

        [HttpGet]
        public IActionResult Cursos(int idCategoria)
        {
            ViewBag.Categorias = context.GetCategorias();

            var cursos = context.GetCursosCategorias(idCategoria);

            foreach (var item in ViewBag.Categorias)
            {
                if (idCategoria == item.Id)
                    ViewBag.Nombre = item.Nombre;
            }
            if (ViewBag.Nombre == null)
                return RedirectToAction("Error", "Curso");
            return View("Cursos", cursos);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
