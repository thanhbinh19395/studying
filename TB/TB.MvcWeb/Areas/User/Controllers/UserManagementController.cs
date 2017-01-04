using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TB.UserRepo;
using TB.Domain;
namespace User.Controllers
{
    public class UserManagementController : Controller
    {
        public ActionResult ListUser(UserSearchRepository repo)
        {
            repo.Page = 1;
            repo.Execute(this);
            return View();
        }

        public ActionResult InsertUser(string ParentId)
        {
            ViewBag.ParentId = ParentId;
            return View();
        }
        public ActionResult UpdateUser(UserGetByIdRepository repo)
        {
            repo.Execute(this);
            return View();
        }

        //API
        [HttpPost]
        public ActionResult ExecuteSearch(UserSearchRepository repo)
        {
            var list = repo.Execute(this);
            return Json(list);
        }
        [HttpPost]
        public ActionResult ExecuteUpdateUser(UserUpdateRepository repo)
        {
            return Json(repo.Execute(this));
        }

        [HttpPost]
        public ActionResult ExecuteInsertUser(UserInsertRepository repo)
        {
            return Json(repo.Execute(this));
        }

        [HttpPost]
        public ActionResult ExecuteDeleteUser(UserDeleteRepository repo)
        {
            return Json(repo.Execute(this));
        }
    }
}