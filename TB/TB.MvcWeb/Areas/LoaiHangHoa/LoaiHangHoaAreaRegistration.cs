using System.Web.Mvc;

namespace TB.MvcWeb.Areas.LoaiHangHoa
{
    public class LoaiHangHoaAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "LoaiHangHoa";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "LoaiHangHoa_default",
                "LoaiHangHoa/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional },
                new string[] { "LoaiHangHoa.Controllers" }
            );
        }
    }
}