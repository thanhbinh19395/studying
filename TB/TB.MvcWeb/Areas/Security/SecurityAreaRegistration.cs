using System.Web.Mvc;

namespace Security.Controllers
{
    public class SecurityAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "Security";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "Security_default",
                "Security/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional },
                new string[] { "Security.Controllers" }
            );
        }
    }
}