using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace TB.MvcWeb.Controllers
{
    public class JavascriptController : Controller
    {
        public ActionResult Index(string id)
        {
            //Kiểm tra xem có guid trong session không
            if (Session[id] == null)
                return new HttpStatusCodeResult(HttpStatusCode.Forbidden);

            // trả vể file javascript để include.
            string path = Session[id].ToString();
            Session.Remove(id);

            return File(path, "application/javascript");
        }
    }
}