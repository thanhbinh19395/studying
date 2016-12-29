using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TB.HangHoaRepo;
using TB.Domain;
using NPOI.Extension;

namespace HangHoa.Controllers
{
    public class HangHoaManagementController : Controller
    {
        public ActionResult ListHangHoa(HangHoaSearchRepository repo)
        {
            repo.Page = 1;
            var e = repo.Execute(this);
            return View();
        }

        public ActionResult InsertHangHoa(string ParentId)
        {
            ViewBag.ParentId = ParentId;
            return View();
        }
        public ActionResult UpdateHangHoa(HangHoaGetByIdRepository repo)
        {
            repo.Execute(this);
            return View();
        }

        //API
        [HttpPost]
        public ActionResult ExecuteSearch(HangHoaSearchRepository repo)
        {
            var list = repo.Execute(this);
            return Json(list);
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult ExecuteUpdateHangHoa(HangHoaUpdateRepository repo)
        {
            return Json(repo.Execute(this));
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult ExecuteInsertHangHoa(HangHoaInsertRepository repo)
        {
            return Json(repo.Execute(this));
        }

        [HttpPost]
        public ActionResult ExecuteDeleteHangHoa(HangHoaDeleteRepository repo)
        {
            return Json(repo.Execute(this));
        }

        [HttpPost]
        public ActionResult ExportExcelListHangHoa(HangHoaSearchExcelRepository repo)
        {
            var result = repo.Execute(this);
            if (result.IsSuccess == false)
            {
                return Json(result);
            }
            return File(result.Data.ToExcelContent(), System.Net.Mime.MediaTypeNames.Application.Octet, "test.xls"); ;
        }
    }
}