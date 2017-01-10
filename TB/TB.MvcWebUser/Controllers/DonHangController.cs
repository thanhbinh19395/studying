using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TB.Domain.EntityModel;

namespace TB.MvcWebUser.Controllers
{
    public class DonHangController : Controller
    {
        private QLBH db = new QLBH();
        // GET: DonHang
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ListDonHang()
        {
            return View();
        }
        [HttpPost]
        public JsonResult GetThongtinDH(int DonHangId) {
            var dh = db.DonHangs.Find(DonHangId);
            var ListCtdh = db.ChiTietDonHangs.Where(p => p.DonHangId == dh.DonHangId).ToList();
            var Ttnd = db.ThongTinNguoiDungs.Find(dh.KhachHangId);
            return Json(
                new
                {
                    DonHang = dh,
                    ThongTinNguoiDung = Ttnd,
                    ListCtdh= ListCtdh,  
                    Ngaydat = dh.NgayLap.ToString()              
                }
            );
        }
    }
}