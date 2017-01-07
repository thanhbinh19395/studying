using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TB.AnhHangHoaRepo;
using TB.HangHoaRepo;

namespace HangHoa.Controllers
{
    public class AnhHangHoaManagementController : Controller
    {
        // GET: AnhHangHoa
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ListAnhHangHoa(AnhHangHoaSearchRepository repo)
        {
            HangHoaGetByIdRepository hhRepo = new HangHoaGetByIdRepository { HangHoaId = Convert.ToInt32(repo.HangHoaId) };
            ViewBag.HangHoa = hhRepo.Execute(this).Data;
            repo.Execute(this);

            return View();
        }

        //API
        [HttpPost]
        public ActionResult ExecuteSearch(AnhHangHoaSearchRepository repo)
        {
            var list = repo.Execute(this);
            return Json(list);
        }

        [HttpPost]
        public ActionResult ExecuteInsertAnhHangHoa(AnhHangHoaInsertRepository repo)
        {
            return Json(repo.Execute(this));
        }

        [HttpPost]
        public ActionResult ExecuteDeleteAnhHangHoa(AnhHangHoaDeleteRepository repo)
        {
            return Json(repo.Execute(this));
        }
    }
}