using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TB.Domain;
using TB.QuanRepo;

namespace Quan.Controllers
{
    public class QuanManagementController : Controller
    {
        public ActionResult Index()
        {         
            return View();
        }
        public ActionResult ListQuan(QuanSearchRepository repo)
        {
            ViewBag.SearchParam = repo.Quan;
            repo.Page = 1;
            repo.Execute(this);
            return View();
        }
        public ActionResult InsertQuan(string ParentId)
        {
            ViewBag.ParentId = ParentId;
            return View();
        }
        
        public ActionResult UpdateQuan(QuanGetByIdRepository repo)
        {
            repo.Execute(this);
            return View();
        }

        //API
        [HttpPost]
        public ActionResult ExecuteSearch(QuanSearchRepository repo)
        {
            var list = repo.Execute(this);
            return Json(list);
        }
        [HttpPost]
        public ActionResult ExecuteUpdateQuan(QuanUpdateRepository repo)
        {
            return Json(repo.Execute(this));
        }

        [HttpPost]
        public ActionResult ExecuteInsertQuan(QuanInsertRepository repo)
        {
            return Json(repo.Execute(this));
        }

        [HttpPost]
        public ActionResult ExecuteDeleteQuan(QuanDeleteRepository repo)
        {
            return Json(repo.Execute(this));
        }
        
    }
}