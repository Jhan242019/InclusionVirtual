﻿using InclusionVirtual.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InclusionVirtual.Maps
{
    public class ModuloMap : IEntityTypeConfiguration<Modulo>
    {
        public void Configure(EntityTypeBuilder<Modulo> builder)
        {
            builder.ToTable("Modulo");
            builder.HasKey(o => o.Id);

            builder.HasMany(o => o.Clases).
                WithOne().
                HasForeignKey(o => o.IdModulo);
        }
    }
}
