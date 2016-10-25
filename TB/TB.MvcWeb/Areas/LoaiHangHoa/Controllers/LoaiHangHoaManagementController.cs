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
        public ActionResult Index(string ParentId, LoaiHangHoaGetListRepository repo)
        {
            var list = repo.Excute();
            var json = repo.ExcuteJson();
            ViewBag.data = list;
            ViewBag.ParentId = ParentId;
            return View();
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