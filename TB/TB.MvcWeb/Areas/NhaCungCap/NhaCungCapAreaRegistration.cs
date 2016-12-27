using System.Web.Mvc;

namespace TB.MvcWeb.Areas.NhaCungCap
{
    public class NhaCungCapAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "NhaCungCap";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "NhaCungCap_default",
                "NhaCungCap/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional },
                new string[] { "NhaCungCap.Controllers" }
            );
        }
    }
}