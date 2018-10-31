using System;
using System.Collections.Generic;
using System.Text;

namespace Hoxro.Utiltiy.Helper
{
    public static class OutHttpContext
    {
        private static Microsoft.AspNetCore.Http.IHttpContextAccessor _contextAccessor;

        public static Microsoft.AspNetCore.Http.HttpContext Current => _contextAccessor.HttpContext;

        public static void Configure(Microsoft.AspNetCore.Http.IHttpContextAccessor contextAccessor)
        {
            _contextAccessor = contextAccessor;
        }
    }
}
