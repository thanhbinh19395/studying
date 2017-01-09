using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using TB.Domain.EntityModel;
using TB.Sercurity;

namespace TB.MvcWebUser.Controllers
{
    public class LoginController : Controller
    {
        private QLBH db = new QLBH();
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(string taikhoan, string matkhau)
        {
            string pass = AESHandler.Encrypt(matkhau);
            User Taikhoan = db.Users.SingleOrDefault(p => p.Username == taikhoan && p.Password == pass);
            if (Taikhoan != null)
            {
                Session["taikhoan"] = Taikhoan;
                return RedirectToAction("Index", "Home");
            }
            else {
                Content("<script language='javascript' type='text/javascript'>alert('Tên đăng nhập và mật khẩu không đúng');</script>");
                return View();
            }
        }

        public ActionResult LogOut()
        {
            Session.Remove("taikhoan");
            Session.Remove("GioHang");
            return RedirectToAction("Index", "Home");
        }
    }
}