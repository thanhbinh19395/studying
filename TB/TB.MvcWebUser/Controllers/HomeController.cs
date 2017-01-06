using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TB.Domain.EntityModel;
using TB.DonHangBus;
using TB.MvcWebUser.Models;

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
        [HttpPost]
        public void AddCart(int HanghoaId)
        {
            //Lấy lại danh sách sách chọn ở trong Session
            List<CartItem> giohang = new List<CartItem>();
            if (Session["GioHang"] != null)
            {
                giohang = Session["GioHang"] as List<CartItem>;
            }

            //tìm xem đã có sách trong giỏ hàng
            CartItem item = giohang.SingleOrDefault(p => p.ProductOrder.HangHoaId == HanghoaId);
            if (item != null)
            {
                item.Quantity++;
            }
            else
            {
                giohang.Add(new CartItem
                {
                    ProductOrder = db.HangHoas.Find(HanghoaId),
                    Quantity = 1
                });
            }

            //ghi nhận Session
            Session["GioHang"] = giohang;
            //trả về tổng số lượng hàng hòa            


        }
        [HttpPost]
        public JsonResult getInfoCart()
        {
            List<CartItem> giohang = Session["GioHang"] as List<CartItem>;
            if (giohang != null)
            {
                return Json(
                    new
                    {
                        ItemCount = giohang.Sum(p => p.Quantity),
                        Total = Convert.ToDouble(giohang.Sum(p => p.Quantity * p.ProductOrder.GiaBanThamKhao)).ToString("N0"),
                        Giohang = giohang.ToList()
                    }
                );
            }
            else {
                return Json(
                    new
                    {
                        ItemCount = 0,
                        Total = 0,
                        //Giohang = giohang.ToList()
                    }
                );

            }
        }

        [HttpPost]
        public void SubtractionCart(int HanghoaId)
        {
            List<CartItem> giohang = Session["GioHang"] as List<CartItem>;
            CartItem item = giohang.SingleOrDefault(p => p.ProductOrder.HangHoaId == HanghoaId);
            if (item != null && item.Quantity > 1)
            {
                item.Quantity--;
            }
            Session["GioHang"] = giohang;
        }

        [HttpPost]
        public void UpdateCart(int HanghoaId, int soluong) {
            List<CartItem> giohang = Session["GioHang"] as List<CartItem>;
            CartItem item = giohang.SingleOrDefault(p => p.ProductOrder.HangHoaId == HanghoaId);
            if (item != null && soluong > 0)
            {
                item.Quantity = soluong;
            }
            Session["GioHang"] = giohang;
        }

        [HttpPost]
        public void DeleteCart(int HanghoaId)
        {
            List<CartItem> giohang = Session["GioHang"] as List<CartItem>;
            CartItem item = giohang.SingleOrDefault(p => p.ProductOrder.HangHoaId == HanghoaId);
            if (item != null)
            {
                giohang.Remove(item);
            }
            Session["GioHang"] = giohang;
        }

        public ActionResult ViewCarts()
        {
            return View();
        }

        public ActionResult CheckOut()
        {
            return View();
        }

        [HttpPost]
        public JsonResult GetQuanhuyen(long TinhThanhphoId)
        {
            List<Quan> Quan = db.Quans.Where(p => p.TinhThanhPhoId == TinhThanhphoId).ToList();
            return Json(Quan);
        }

        [HttpPost]
        public ActionResult ThemDonHangKhachLa(bool optionsRadios, InsertDonHangKhachLaBusiness repo)
        {
            List<CartItem> giohang = Session["GioHang"] as List<CartItem>;
            List<ChiTietDonHang> Listctdh = new List<ChiTietDonHang>();
            foreach (var item in giohang)
            {
                var ctdh = new ChiTietDonHang();
                ctdh.HangHoaId = item.ProductOrder.HangHoaId;
                ctdh.GiaTien = item.ProductOrder.GiaBanThamKhao;
                ctdh.SoLuong = item.Quantity;
                Listctdh.Add(ctdh);
            }
            if (!optionsRadios) {// khach la
                repo.DonHang = new DonHang();
                repo.ChiTietDonHang = Listctdh;
                repo.Execute(this);
                Session.Remove("GioHang");
            }
            return RedirectToAction( "Tientest", "Home");
        }
    }
}