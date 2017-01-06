using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using TB.Domain;
using TB.Domain.EntityModel;
using TB.SercurityRepo;

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
        [AllowAnonymous]
        public ActionResult ExecuteSignIn(UserLoginRepository login)
        {
            var result = login.Execute(this);
            bool isValidUser = result.IsSuccess;
            //bool isValidUser = true;
            if (isValidUser)
            {
                Session.Add("LoginUser", result.Data);
                Session.Add("LoginDate", DateTime.Now);
                if (String.IsNullOrWhiteSpace(login.ReturnUrl))
                {
                    return Redirect("/");
                }
                else
                {
                    return Redirect(login.ReturnUrl);
                }

            }
            else
            {
                ViewBag.ReturnUrl = login.ReturnUrl;
                ViewBag.Result = result;
                return View("SignIn");
            }
        }

        public ActionResult SignOut()
        {
            Session.Remove("LoginUser");
            Session.Remove("LoginDate");
            ViewBag.ReturnUrl = "";
            return View("SignIn");
        }
    }
}