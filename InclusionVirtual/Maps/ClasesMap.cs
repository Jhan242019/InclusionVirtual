using InclusionVirtual.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InclusionVirtual.Maps
{
    public class ClasesMap : IEntityTypeConfiguration<Clases>
    {
        public void Configure(EntityTypeBuilder<Clases> builder)
        {
            builder.ToTable("Clases");
            builder.HasKey(o => o.Id);

            builder.HasMany(o => o.Recursos).
                WithOne().
                HasForeignKey(o => o.IdClase);
        }
    }
}
