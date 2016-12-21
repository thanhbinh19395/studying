using System.Web.Mvc;

namespace NhaXuatBan.Controllers
{
    public class NhaXuatBanAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "NhaXuatBan";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "NhaXuatBan_default",
                "NhaXuatBan/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional },
                new string[] { "NhaXuatBan.Controllers" }
            );
        }
    }
}