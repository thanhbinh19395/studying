using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TB.Domain.EntityModel;
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
        public ActionResult ViewCarts()
        {
            return View();
        }
    }
}