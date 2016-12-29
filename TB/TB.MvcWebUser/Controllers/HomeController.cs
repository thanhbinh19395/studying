using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TB.Domain.EntityModel;

namespace TB.MvcWebUser.Controllers
{
    public class HomeController : Controller
    {
        private QLBH db = new QLBH();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Tientest()
        {
            return View(db.HangHoas.ToList());
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