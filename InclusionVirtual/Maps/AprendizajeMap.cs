using InclusionVirtual.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InclusionVirtual.Maps
{
    public class AprendizajeMap : IEntityTypeConfiguration<Aprendizaje>
    {
        public void Configure(EntityTypeBuilder<Aprendizaje> builder)
        {
            builder.ToTable("Aprendizaje");
            builder.HasKey(o => o.Id);
        }
    }
}
