using InclusionVirtual.Maps;
using InclusionVirtual.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace InclusionVirtual.Servicios
{
    public interface IClaimService
    {
        Usuario GetLoggedUser();
        void SetHttpContext(HttpContext httpContext);
        void Logout();
        void Login(ClaimsPrincipal principal);

    }

    public class ClaimService : IClaimService
    {
        private readonly IncVirtual_Context context;
        private HttpContext httpContext;

        public ClaimService(IncVirtual_Context context)
        {
            this.context = context;
        }

        public Usuario GetLoggedUser()
        {
            var claim = httpContext.User.Claims.FirstOrDefault();
            return context.Usuarios.Where(o => o.Username == claim.Value).FirstOrDefault();
        }

        public void Login(ClaimsPrincipal principal)
        {
            httpContext.SignInAsync(principal);
        }

        public void Logout()
        {
            httpContext.SignOutAsync();
        }

        public void SetHttpContext(HttpContext httpContext)
        {
            this.httpContext = httpContext;
        }
    }
}
