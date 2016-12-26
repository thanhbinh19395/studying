﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TB.HangHoaRepo;
using TB.Domain;
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
        [HttpPost]
        public ActionResult ExecuteUpdateHangHoa(HangHoaUpdateRepository repo)
        {
            return Json(repo.Execute(this));
        }

        [HttpPost]
        public ActionResult ExecuteInsertHangHoa(HangHoaInsertRepository repo)
        {
            return Json(repo.Execute(this));
        }

        [HttpPost]
        public ActionResult ExecuteDeleteHangHoa(HangHoaDeleteRepository repo)
        {
            return Json(repo.Execute(this));
        }
    }
}