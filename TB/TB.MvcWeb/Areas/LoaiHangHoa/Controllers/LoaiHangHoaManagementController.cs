using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TB.LoaiHangHoaRepo;

namespace LoaiHangHoa.Controllers
{
    public class LoaiHangHoaManagementController : Controller
    {
        //View
        public ActionResult ListLoaiHangHoa(LoaiHangHoaSearchRepository repo)
        {
            repo.Page = 1;
            repo.Execute(this);
            return View();
        }
    
        public ActionResult InsertLoaiHangHoa(string ParentId)
        {
            ViewBag.ParentId = ParentId;
            return View();
        }
        public ActionResult UpdateLoaiHangHoa(LoaiHangHoaGetByIdRepository repo)
        {
            repo.Execute(this);
            return View();
        }

        //API
        [HttpPost]
        public ActionResult ExecuteSearch(LoaiHangHoaSearchRepository repo)
        {
            var list = repo.Execute(this);
            return Json(list);
        }
        [HttpPost]
        public ActionResult ExecuteUpdateLoaiHangHoa(LoaiHangHoaUpdateRepository repo)
        {
            return Json(repo.Execute(this));
        }

        [HttpPost]
        public ActionResult ExecuteInsertLoaiHangHoa(LoaiHangHoaInsertRepository repo)
        {
            return Json(repo.Execute(this));
        }
        
        [HttpPost]
        public ActionResult ExecuteDeleteLoaiHangHoa(LoaiHangHoaDeleteRepository repo)
        {
            return Json(repo.Execute(this));
        }
    }
}