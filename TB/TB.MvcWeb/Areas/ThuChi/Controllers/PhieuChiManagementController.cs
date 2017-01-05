using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TB.PhieuChiRepo;
using TB.ChiTietPhieuChiRepo;
using TB.Domain.EntityModel;

namespace ThuChi.Controllers
{
    public class PhieuChiManagementController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ListPhieuChi(PhieuChiSearchRepository repo)
        {
            repo.Page = 1;
            repo.Execute(this);
            return View();
        }

        //API
        [HttpPost]
        public ActionResult ExecuteSearch(PhieuChiSearchRepository repo)
        {
            var list = repo.Execute(this);
            return Json(list);
        }
        [HttpPost]
        public ActionResult ExecuteGetListChiTietDonHang(ChiTietPhieuChiGetListByPhieuChiIdRepository repo)
        {
            return Json(repo.Execute(this));
        }
    }
}