using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TB.NhaCungCapRepo;

namespace NhaCungCap.Controllers
{
    public class NhaCungCapManagementController : Controller
    {
        //View
        public ActionResult ListNhaCungCap(NhaCungCapSearchRepository repo)
        {
            repo.Page = 1;
            repo.Execute(this);
            return View();
        }
    
        public ActionResult InsertNhaCungCap(string ParentId)
        {
            ViewBag.ParentId = ParentId;
            return View();
        }
        public ActionResult UpdateNhaCungCap(NhaCungCapGetByIdRepository repo)
        {
            repo.Execute(this);
            return View();
        }

        //API
        [HttpPost]
        public ActionResult ExecuteSearch(NhaCungCapSearchRepository repo)
        {
            var list = repo.Execute(this);
            return Json(list);
        }
        [HttpPost]
        public ActionResult ExecuteUpdateNhaCungCap(NhaCungCapUpdateRepository repo)
        {
            return Json(repo.Execute(this));
        }

        [HttpPost]
        public ActionResult ExecuteInsertNhaCungCap(NhaCungCapInsertRepository repo)
        {
            return Json(repo.Execute(this));
        }
        
        [HttpPost]
        public ActionResult ExecuteDeleteNhaCungCap(NhaCungCapDeleteRepository repo)
        {
            return Json(repo.Execute(this));
        }
    }
}