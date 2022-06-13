using InclusionVirtual.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InclusionVirtual.Maps
{
    public class ProgresoMap : IEntityTypeConfiguration<Progreso>
    {
        public void Configure(EntityTypeBuilder<Progreso> builder)
        {
            builder.ToTable("Progreso");
            builder.HasKey(o => o.Id);
        }
    }
}
