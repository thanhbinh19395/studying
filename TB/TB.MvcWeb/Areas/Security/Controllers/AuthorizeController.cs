using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TB.Domain;
namespace Security.Controllers
{
    public class AuthorizeController : Controller
    {
        [AllowAnonymous]
        public ActionResult SignIn(string ReturnUrl)
        {
            ViewBag.ReturnUrl = ReturnUrl;
            return View();
        }
    }
}