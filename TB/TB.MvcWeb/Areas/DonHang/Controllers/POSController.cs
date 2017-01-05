using System.Web.Mvc;
using TB.DonHangBus;
using TB.HangHoaRepo;
using TB.HoaDonRepo;

namespace DonHang.Controllers
{
    public class POSController : Controller
    {
        public ActionResult Index(HangHoaSearchRepository repo )
        {
            repo.Page = 1;
            ViewBag.ListHangHoa = repo.Execute(this);
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
        public ActionResult ExecuteInsertDonHangKhachLa(InsertDonHangKhachLaBusiness bus)
        {
            return Json(bus.Execute(this));
        }
    }
}