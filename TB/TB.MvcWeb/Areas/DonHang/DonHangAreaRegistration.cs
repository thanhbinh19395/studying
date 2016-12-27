using System.Web.Mvc;

namespace DonHang.Controllers
{
    public class DonHangAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "DonHang";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "DonHang_default",
                "DonHang/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional },
                new string[] { "DonHang.Controllers" }
            );
        }
    }
}