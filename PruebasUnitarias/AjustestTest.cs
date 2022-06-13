using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
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
    class AjustestTest
    {
        [Test]
        public void Index()
        {
            var conf = new Mock<IConfiguration>();

            var claim = new Mock<IClaimService>();
            claim.Setup(o => o.GetLoggedUser()).Returns(new Usuario { Id = 1, Nombres = "Jhan", IdRol = 1 });

            var repo = new Mock<IAjustesRepo>();
            repo.Setup(o => o.GetCategorias()).Returns(new List<Categoria>());
            repo.Setup(o => o.GetUsuario(1)).Returns(new Usuario { Id = 1, Nombres = "Jhan", IdRol = 1 });

            var controller = new AjustesController(repo.Object, claim.Object,conf.Object);
            var view = controller.Index() as ViewResult;

            Assert.AreEqual("Index", view.ViewName);
        }
    }
}
