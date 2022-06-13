using InclusionVirtual.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InclusionVirtual.Maps
{
    public class IncVirtual_Context : DbContext
    {
        public IncVirtual_Context(DbContextOptions<IncVirtual_Context> o) : base(o) { }

        public DbSet<Usuario> Usuarios { get; set; }
        public DbSet<Roles> Roles { get; set; }
        public DbSet<Categoria> Categorias { get; set; }
        public DbSet<Curso> Cursos { get; set; }
        public DbSet<Cesta> Cestas { get; set; }
        public DbSet<Aprendizaje> Aprendizajes { get; set; }
        public DbSet<Requisitos> Requisitos { get; set; }
        public DbSet<Modulo> Modulos { get; set; }
        public DbSet<Clases> Clases { get; set; }
        public DbSet<ComentarioCurso> ComentarioCursos { get; set; }
        public DbSet<Recursos> Recursos { get; set; }
        public DbSet<Progreso> Progresos { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.ApplyConfiguration(new UsuarioMap());
            modelBuilder.ApplyConfiguration(new RolesMap());
            modelBuilder.ApplyConfiguration(new CategoriaMap());
            modelBuilder.ApplyConfiguration(new CursoMap());
            modelBuilder.ApplyConfiguration(new CestaMap());
            modelBuilder.ApplyConfiguration(new AprendizajeMap());
            modelBuilder.ApplyConfiguration(new RequisitosMap());
            modelBuilder.ApplyConfiguration(new ModuloMap());
            modelBuilder.ApplyConfiguration(new ClasesMap());
            modelBuilder.ApplyConfiguration(new ComentarioCursoMap());
            modelBuilder.ApplyConfiguration(new RecursosMap());
            modelBuilder.ApplyConfiguration(new ProgresoMap());
        }
    }
}
