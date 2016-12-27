using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TB.DonHangRepo;

namespace DonHang.Controllers
{
    public class DonHangManagementController : Controller
    {
        public ActionResult Index()
        {
            
            return View();
        }
        public ActionResult ListDonHang(DonHangSearchRepository repo)
        {
            repo.Page = 1;
            repo.Execute(this);
            return View();
        }
        public ActionResult InsertDonHang(string ParentId)
        {
            ViewBag.ParentId = ParentId;
            return View();
        }
        public ActionResult UpdateDonHang(DonHangGetByIdRepository repo)
        {
            repo.Execute(this);
            return View();
        }

        //API
        [HttpPost]
        public ActionResult ExecuteSearch(DonHangSearchRepository repo)
        {
            var list = repo.Execute(this);
            return Json(list);
        }
        [HttpPost]
        public ActionResult ExecuteUpdateDonHang(DonHangUpdateRepository repo)
        {
            return Json(repo.Execute(this));
        }

        [HttpPost]
        public ActionResult ExecuteInsertDonHang(DonHangInsertRepository repo)
        {
            return Json(repo.Execute(this));
        }

        [HttpPost]
        public ActionResult ExecuteDeleteDonHang(DonHangDeleteRepository repo)
        {
            return Json(repo.Execute(this));
        }
    }
}