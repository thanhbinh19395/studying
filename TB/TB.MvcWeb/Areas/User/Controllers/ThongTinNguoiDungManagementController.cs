using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TB.ThongTinNguoiDungRepo;
using TB.Domain;
namespace User.Controllers
{
    public class ThongTinNguoiDungManagementController : Controller
    {
        public ActionResult ListThongTinNguoiDung(ThongTinNguoiDungSearchRepository repo)
        {
            repo.Page = 1;
            repo.Execute(this);
            return View();
        }

        public ActionResult InsertThongTinNguoiDung(string ParentId)
        {
            ViewBag.ParentId = ParentId;
            return View();
        }
        public ActionResult UpdateThongTinNguoiDung(ThongTinNguoiDungGetByIdRepository repo)
        {
            repo.Execute(this);
            return View();
        }
        public ActionResult XemChiTiet(ThongTinNguoiDungGetByIdRepository repo)
        {
            repo.Execute(this);
            return View();
        }
        //API
        [HttpPost]
        public ActionResult ExecuteSearch(ThongTinNguoiDungSearchRepository repo)
        {
            var list = repo.Execute(this);
            return Json(list);
        }
        [HttpPost]
        public ActionResult ExecuteGetById(ThongTinNguoiDungGetByIdRepository repo)
        {
            var list = repo.Execute(this);
            return Json(list);
        }
        [HttpPost]
        public ActionResult ExecuteUpdateThongTinNguoiDung(ThongTinNguoiDungUpdateRepository repo)
        {
            return Json(repo.Execute(this));
        }

        [HttpPost]
        public ActionResult ExecuteInsertThongTinNguoiDung(ThongTinNguoiDungInsertRepository repo)
        {
            return Json(repo.Execute(this));
        }

        [HttpPost]
        public ActionResult ExecuteDeleteThongTinNguoiDung(ThongTinNguoiDungDeleteRepository repo)
        {
            return Json(repo.Execute(this));
        }
    }
}