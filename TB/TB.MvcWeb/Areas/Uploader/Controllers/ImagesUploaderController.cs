using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TB.LoaiHangHoaRepo;
using TB.Domain;
namespace Uploader.Controllers
{
    public class ImagesUploaderController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}