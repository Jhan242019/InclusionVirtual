﻿using InclusionVirtual.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InclusionVirtual.Maps
{
    public class CursoMap : IEntityTypeConfiguration<Curso>
    {
        public void Configure(EntityTypeBuilder<Curso> builder)
        {
            builder.ToTable("Curso");
            builder.HasKey(o => o.Id);

            builder.HasOne(o => o.Docente).
                WithMany().
                HasForeignKey(o => o.IdDocente);

            builder.HasOne(o => o.Categoria).
                WithMany().
                HasForeignKey(o => o.IdCategoria);

            builder.HasMany(o => o.Aprendizajes).
                WithOne().
                HasForeignKey(o => o.IdCurso);

            builder.HasMany(o => o.Modulos).
                WithOne().
                HasForeignKey(o => o.IdCurso);

            builder.HasMany(o => o.Comentarios).
                WithOne().
                HasForeignKey(o => o.IdCurso);

            builder.HasMany(o => o.Requisitos).
                WithOne().
                HasForeignKey(o => o.IdCurso);
        }
    }
}
