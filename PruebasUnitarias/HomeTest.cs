using InclusionVirtual.Controllers;
using InclusionVirtual.Models;
using InclusionVirtual.Repositorio;
using Microsoft.AspNetCore.Mvc;
using Moq;
using NUnit.Framework;
using System.Collections.Generic;

namespace InclusionVirtual.Test
{
    public class HomeTest
    {
        [SetUp]
        public void Setup()
        {
        }

        [Test]
        public void Index()
        {
            var repo = new Mock<IHomeRepository>();
            repo.Setup(o => o.GetCursos()).Returns(new List<Curso>());
            repo.Setup(o => o.GetCategorias()).Returns(new List<Categoria>());
            repo.Setup(o => o.GetComentarios()).Returns(new List<ComentarioCurso>());

            var controller = new HomeController(repo.Object);
            var view = controller.Index() as ViewResult;

            Assert.AreEqual("Index", view.ViewName);
        }
    }
}