﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace TB.MvcWeb
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "POS", action = "Index", id = UrlParameter.Optional },
                namespaces: new string[] { "TB.MvcWeb.Controllers" }
            ).DataTokens.Add("area", "DonHang");
        }
    }
}
