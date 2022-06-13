using InclusionVirtual.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InclusionVirtual.Maps
{
    public class RequisitosMap : IEntityTypeConfiguration<Requisitos>
    {
        public void Configure(EntityTypeBuilder<Requisitos> builder)
        {
            builder.ToTable("Requisitos");
            builder.HasKey(o => o.Id);
        }
    }
}
