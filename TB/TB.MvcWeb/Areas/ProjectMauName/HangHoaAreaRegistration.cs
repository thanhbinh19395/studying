using System.Web.Mvc;

namespace HangHoa.Controllers
{
    public class HangHoaAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "HangHoa";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "HangHoa_default",
                "HangHoa/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional },
                new string[] { "HangHoa.Controllers" }
            );
        }
    }
}