using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TB.LoaiHangHoaRepo;

namespace LoaiHangHoa.Controllers
{
    public class LoaiHangHoaManagementController : Controller
    {
        public ActionResult Index(string ParentId)
        {
            LoaiHangHoaSearchRepository repo = new LoaiHangHoaSearchRepository();
            repo.Page = 1;
            ViewBag.data = repo.Excute();
            ViewBag.ParentId = ParentId;
            return View();
        }

        public ActionResult GetList(LoaiHangHoaGetListRepository repo)
        {
            var list = repo.Excute();
            return Json(list, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Search(LoaiHangHoaSearchRepository repo)
        {
            var list = repo.Excute();
            return Json(list, JsonRequestBehavior.AllowGet);
        }
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}