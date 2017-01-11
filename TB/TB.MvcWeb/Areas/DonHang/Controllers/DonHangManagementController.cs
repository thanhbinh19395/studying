using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TB.DonHangRepo;
using TB.ChiTietDonHangRepo;
using Newtonsoft.Json;
using TB.DonHangBus;
using TB.Domain.EntityModel;
using TB.ThongTinNguoiDungRepo;

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
        public ActionResult ChiTietDonHang(DonHangGetByIdRepository repo)
        {
            var result = repo.Execute(this);
            ThongTinNguoiDungGetByIdRepository ttndRepo = new ThongTinNguoiDungGetByIdRepository { ThongTinNguoiDungId = Convert.ToInt32(result.Data.KhachHangId) };
            ViewBag.thongTinND = ttndRepo.Execute(this).Data;
            ViewBag.DonHang = result.Data;
            return View();
        }
        public ActionResult UpdateDonHang(DonHangGetByIdRepository repo)
        {
            repo.Execute(this);
            return View();
        }
        public ActionResult ThanhToanDonHang(string ParentId)
        {
            ViewBag.ParentId = ParentId;
            var user = Session["LoginUser"] as User;
            ViewBag.NhanVien = user;
            return View();
        }
        //API
        [HttpPost]
        public ActionResult ExecuteGetDonHangChuaThanhToan(DonHangGetChuaThanhToanByIdRepository repo)
        {
            var settings = new JsonSerializerSettings
            {
                DateFormatHandling = DateFormatHandling.IsoDateFormat,
                DateTimeZoneHandling = DateTimeZoneHandling.Unspecified,
                DefaultValueHandling = DefaultValueHandling.Ignore
            };
            return Json(JsonConvert.SerializeObject(repo.Execute(this), Formatting.None, settings));
        }
        
        [HttpPost]
        public ActionResult ExecuteThanhToanDonHang(ThanhToanDonHangBusiness repo)
        {
            return Json(repo.Execute(this));
        }
        [HttpPost]
        public ActionResult ExecuteSearch(DonHangSearchRepository repo)
        {
            var list = repo.Execute(this);
            var settings = new JsonSerializerSettings
            {
                DateFormatHandling = DateFormatHandling.IsoDateFormat,
                DateTimeZoneHandling = DateTimeZoneHandling.Unspecified,
                DefaultValueHandling = DefaultValueHandling.Ignore
            };
            return Json(JsonConvert.SerializeObject(list, Formatting.None, settings));
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
        [HttpPost]
        public ActionResult ExecuteGetListChiTietDonHang(ChiTietDonHangGetListByDonHangIdRepository repo)
        {
            return Json(repo.Execute(this));
        }
    }
}