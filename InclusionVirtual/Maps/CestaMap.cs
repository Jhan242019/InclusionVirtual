using InclusionVirtual.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InclusionVirtual.Maps
{
    public class CestaMap : IEntityTypeConfiguration<Cesta>
    {
        public void Configure(EntityTypeBuilder<Cesta> builder)
        {
            builder.ToTable("Cesta");
            builder.HasKey(o => o.Id);

            builder.HasOne(o => o.Cursos).
                WithMany().
                HasForeignKey(o => o.IdCurso);

            builder.HasOne(o => o.Usuarios).
                WithMany().
                HasForeignKey(o => o.IdUser);
        }
    }
}
