using System.Web.Mvc;

namespace TinhThanhPho.Controllers
{
    public class TinhThanhPhoAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "TinhThanhPho";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "TinhThanhPho_default",
                "TinhThanhPho/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional },
                new string[] { "TinhThanhPho.Controllers" }
            );
        }
    }
}