using InclusionVirtual.Repositorio;
using InclusionVirtual.Servicios;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InclusionVirtual.Controllers
{
    [Authorize]
    public class CursoUsuarioController : Controller
    {
        private readonly IClaimService claim;
        private readonly ICursoUsuarioRepo context;

        public CursoUsuarioController(ICursoUsuarioRepo context, IClaimService claim)
        {
            this.context = context;
            this.claim = claim;
        }

        [HttpGet]
        public IActionResult MisCursos()
        {
            ViewBag.Categorias = context.GetCategorias();
            claim.SetHttpContext(HttpContext);
            var user = context.GetUsuario(claim.GetLoggedUser().Id);
            ViewBag.CursoUsuario = context.GetCursosUsuario(user.Id);
            ViewBag.Nombre = "Mis Cursos";
            return View("MisCursos");
        }
    }
}
