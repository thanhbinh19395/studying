using System.Web.Mvc;

namespace ThuChi.Controllers
{
    public class ThuChiAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "ThuChi";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "ThuChi_default",
                "ThuChi/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional },
                new string[] { "ThuChi.Controllers" }
            );
        }
    }
}