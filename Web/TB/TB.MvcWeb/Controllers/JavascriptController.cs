using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Mvc;
using Yahoo.Yui.Compressor;

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

            //minify js code
            string unMinifiedString = System.IO.File.ReadAllText(path);
            var compressor = new JavaScriptCompressor();
            var minifiedString = compressor.Compress(unMinifiedString);
            return File(Encoding.UTF8.GetBytes(minifiedString), "application/javascript");
        }
    }
}