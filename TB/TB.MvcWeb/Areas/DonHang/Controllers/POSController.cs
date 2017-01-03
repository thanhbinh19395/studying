using System.Web.Mvc;
using TB.HoaDonRepo;

namespace DonHang.Controllers
{
    public class POSController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ListHoaDon(HoaDonSearchRepository repo)
        {
            repo.Page = 1;
            repo.Execute(this);
            return View();
        }

        //API
        [HttpPost]
        public ActionResult ExecuteSearch(HoaDonSearchRepository repo)
        {
            var list = repo.Execute(this);
            return Json(list);
        }
    }
}