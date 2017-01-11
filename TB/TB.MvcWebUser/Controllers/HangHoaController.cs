using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TB.HangHoaRepo;

namespace TB.MvcWebUser.Controllers
{
    public class HangHoaController : Controller
    {
        // GET: HangHoa

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult XemChiTiet(int id)
        {
            HangHoaGetByIdRepository repo = new HangHoaGetByIdRepository { HangHoaId = id };
            return View(repo.Execute(this).Data);
        }
    }
}