using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TB.TinhThanhPhoRepo;

namespace TinhThanhPho.Controllers
{
    public class TinhThanhPhoManagementController : Controller
    {
        public ActionResult Index()
        {            
            return View();
        }
        public ActionResult ListTinhThanhPho(TinhThanhPhoSearchRepository repo)
        {
            ViewBag.SearchParam = repo.TinhThanhPho;
            repo.Page = 1;
            repo.Execute(this);
            return View();
        }
        public ActionResult InsertTinhThanhPho(string ParentId)
        {
            ViewBag.ParentId = ParentId;
            return View();
        }
        public ActionResult UpdateTinhThanhPho(TinhThanhPhoGetByIdRepository repo)
        {
            repo.Execute(this);
            return View();
        }

        //API
        [HttpPost]
        public ActionResult ExecuteSearch(TinhThanhPhoSearchRepository repo)
        {
            var list = repo.Execute(this);
            return Json(list);
        }
        [HttpPost]
        public ActionResult ExecuteUpdateTinhThanhPho(TinhThanhPhoUpdateRepository repo)
        {
            return Json(repo.Execute(this));
        }

        [HttpPost]
        public ActionResult ExecuteInsertTinhThanhPho(TinhThanhPhoInsertRepository repo)
        {
            return Json(repo.Execute(this));
        }

        [HttpPost]
        public ActionResult ExecuteDeleteTinhThanhPho(TinhThanhPhoDeleteRepository repo)
        {
            return Json(repo.Execute(this));
        }
    }
}