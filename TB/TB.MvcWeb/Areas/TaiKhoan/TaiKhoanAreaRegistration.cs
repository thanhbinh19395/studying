using System.Web.Mvc;

namespace TaiKhoan.Controllers
{
    public class TaiKhoanAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "TaiKhoan";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "TaiKhoan_default",
                "TaiKhoan/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional },
                new string[] { "TaiKhoan.Controllers" }
            );
        }
    }
}