using System.Web.Mvc;

namespace Quan.Controllers
{
    public class QuanAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "Quan";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "Quan_default",
                "Quan/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional },
                new string[] { "Quan.Controllers" }
            );
        }
    }
}