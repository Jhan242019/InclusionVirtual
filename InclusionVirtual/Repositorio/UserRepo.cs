﻿using Castle.Core.Configuration;
using InclusionVirtual.Maps;
using InclusionVirtual.Models;
using InclusionVirtual.Models.Class;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using Microsoft.Extensions.Configuration;
using IConfiguration = Microsoft.Extensions.Configuration.IConfiguration;

namespace InclusionVirtual.Repositorio
{
    public interface IUserRepo
    {
        Usuario GetUsuario(string username, string password);
        Usuario GetUsuarioEmail(Recovery recovery);
        Usuario GetUsuarioRecover(string token);
        List<Usuario> GetUsers();
        void SaveUsers(Usuario usuario, IFormFile perfil);
        void ChangePass(Recovery recovery, Usuario users);
        void SavePassword(Usuario users, RecoverP recoverp);
        void CrearRoles();
    }
    public class UserRepo : IUserRepo
    {
        private readonly string email = "juliaRAF2020@gmail.com";
        private readonly string password = "juliaR4F2O2O";
        private readonly string urlDomain = "https://localhost:44363/";
        private readonly IncVirtual_Context context;
        private readonly IWebHostEnvironment hosting;
        private readonly IConfiguration configuration;

        public UserRepo(IncVirtual_Context context, IWebHostEnvironment hosting, IConfiguration configuration)
        {
            this.context = context;
            this.hosting = hosting;
            this.configuration = configuration;
        }

        public Usuario GetUsuario(string username, string password)
        {
            var user = context.Usuarios.Where(o => o.Username == username && o.Password == CreateHash(password)).FirstOrDefault();
            return user;
        }

        public List<Usuario> GetUsers()
        {
            return context.Usuarios.ToList();
        }

        public void SaveUsers(Usuario usuario, IFormFile perfil)
        {
            if (perfil != null)
                usuario.Imagen = SaveFile(perfil);
            else
            {
                usuario.Imagen = "/proyecto/userperfil4.png";
            }

            usuario.Password = CreateHash(usuario.Password);
            if (usuario.Correo == email)
            {
                if (context.Roles.ToList().Count == 0)
                    CrearRoles();
                usuario.IdRol = 1;
            }
            else
                usuario.IdRol = 3;
            context.Usuarios.Add(usuario);
            context.SaveChanges();
        }

        public Usuario GetUsuarioEmail(Recovery recovery)
        {
            return context.Usuarios.Where(o => o.Correo == recovery.Email).FirstOrDefault();
        }

        public void ChangePass(Recovery recovery, Usuario users)
        {
            Random random = new Random();
            int num = random.Next(1000, 9999);
            var numero = CreateHash(num.ToString());

            users.Recovery = numero;
            context.Usuarios.Update(users);
            context.SaveChanges();

            EmailSend(recovery.Email, numero);
        }

        public Usuario GetUsuarioRecover(string token)
        {
            return context.Usuarios.Where(o => o.Recovery == token).FirstOrDefault();
        }

        public void SavePassword(Usuario users, RecoverP recoverp)
        {
            users.Password = CreateHash(recoverp.Password);
            users.Recovery = null;
            context.Usuarios.Update(users);
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

        protected void EmailSend(string correoUser, string token)
        {
            string url = urlDomain + "user/startrecover/?token=" + token;
            MailMessage mailMessage = new MailMessage(email, correoUser,
                "Recuperación de la cuenta en INCVIRTUAL",
                "<p>Correo de recuperacion de contraseña</p><br>"
                + "<a href='" + url + "'><strong>Click para recuperar</strong></a>")
            {
                IsBodyHtml = true
            };
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com")
            {
                EnableSsl = true,
                UseDefaultCredentials = false,
                Host = "smtp.gmail.com",
                Port = 587,
                Credentials = new System.Net.NetworkCredential(email, password)
            };
            smtpClient.Send(mailMessage);
            smtpClient.Dispose();
        }

        public void CrearRoles()
        {
            var roles = new List<Roles>();
            var rol = new Roles() { Id = 1, Nombre = "Administrador" };
            var rol1 = new Roles() { Id = 2, Nombre = "Docente" };
            var rol2 = new Roles() { Id = 3, Nombre = "Estudiante" };
            roles.Add(rol);
            roles.Add(rol1);
            roles.Add(rol2);
            context.AddRange(roles);
            context.SaveChanges();
        }
    }
}
