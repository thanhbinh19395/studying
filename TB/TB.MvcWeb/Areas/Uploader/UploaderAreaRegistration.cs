using System.Web.Mvc;

namespace Uploader.Controllers
{
    public class UploaderAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "Uploader";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "Uploader_default",
                "Uploader/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional },
                new string[] { "Uploader.Controllers" }
            );
        }
    }
}