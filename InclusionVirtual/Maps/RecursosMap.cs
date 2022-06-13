using InclusionVirtual.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InclusionVirtual.Maps
{
    public class RecursosMap : IEntityTypeConfiguration<Recursos>
    {
        public void Configure(EntityTypeBuilder<Recursos> builder)
        {
            builder.ToTable("Recursos");
            builder.HasKey(o => o.Id);
        }
    }
}
