using InclusionVirtual.Maps;
using InclusionVirtual.Repositorio;
using InclusionVirtual.Servicios;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InclusionVirtual
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllersWithViews();
            services.AddDbContext<IncVirtual_Context>(
                o => o.UseSqlServer(Configuration.GetConnectionString("Connection")));
            services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
                .AddCookie(o => o.LoginPath = "/user/login");

            services.AddTransient<IClaimService, ClaimService>();
            services.AddTransient<IUserRepo, UserRepo>();
            services.AddTransient<IAdminRepo, AdminRepo>();
            services.AddTransient<IHomeRepository, HomeRepository>();
            services.AddTransient<IDocenteRepo, DocenteRepo>();
            services.AddTransient<IAjustesRepo, AjustesRepo>();
            services.AddTransient<ICursoRepo, CursoRepo>();
            services.AddTransient<IAprendizajeRepo, AprendizajeRepo>();
            services.AddTransient<ICursoUsuarioRepo, CursoUsuarioRepo>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }
            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");
            });
        }
    }
}
