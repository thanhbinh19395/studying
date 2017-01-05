using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TB.ThuChiRepo;
using TB.Domain;
namespace ThuChi.Controllers
{
    public class ThuChiManagementController : Controller
    {
        public ActionResult ListThuChi(ThuChiSearchRepository repo)
        {
            repo.Page = 1;
            repo.Execute(this);
            return View();
        }

        //API
        [HttpPost]
        public ActionResult ExecuteSearch(ThuChiSearchRepository repo)
        {
            var list = repo.Execute(this);
            return Json(list);
        }
    }
}