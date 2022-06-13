using Microsoft.AspNetCore.Mvc;
using Moq;
using NUnit.Framework;
using InclusionVirtual.Controllers;
using InclusionVirtual.Models;
using InclusionVirtual.Repositorio;
using InclusionVirtual.Servicios;
using System;
using System.Collections.Generic;
using System.Text;

namespace InclusionVirtual.Test
{
    class CursoTest
    {
        [Test]
        public void Cursos()
        {
            var claim = new Mock<IClaimService>();
            claim.Setup(o => o.GetLoggedUser()).Returns(new Usuario { Id = 1, Nombres = "Jhan", IdRol = 1 });

            var repo = new Mock<ICursoRepo>();
            repo.Setup(o => o.GetCursos()).Returns(new List<Curso>());

            var controller = new CursoController(repo.Object, claim.Object);
            var view = controller.Cursos() as ViewResult;

            Assert.AreEqual("Cursos", view.ViewName);
        }

        [Test]
        public void Desarrollo()
        {
            var claim = new Mock<IClaimService>();
            claim.Setup(o => o.GetLoggedUser()).Returns(new Usuario { Id = 1, Nombres = "Jhan", IdRol = 1 });

            var repo = new Mock<ICursoRepo>();
            repo.Setup(o => o.GetCurso(10)).Returns(new Curso());

            var controller = new CursoController(repo.Object, claim.Object);
            var view = controller.Desarrollo(10) as ViewResult;

            Assert.AreEqual("Desarrollo", view.ViewName);
        }
    }
}
