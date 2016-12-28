using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Hosting;
using System.Web.Mvc;

namespace TB.MvcHelper
{
    public static class JavascriptHelper
    {
        public static MvcHtmlString IncludeJavascript<TModel>(this HtmlHelper<TModel> helper, string path = null, params string[] moduleName)
        {
            #region Tạo link với current session là 1 guid, chỉ load được 1 lần khi mở page

            //lấy đường dẫn của view gọi hàm
            if (String.IsNullOrWhiteSpace(path))
                path = ((System.Web.Mvc.RazorView)helper.ViewContext.View).ViewPath.Replace(".cshtml", ".js");
            path = HostingEnvironment.MapPath(path);

            if (!File.Exists(path))
                return null;
            string guid = Guid.NewGuid().ToString();
            HttpContext.Current.Session[guid] = path;
            var getJSPath = "/Javascript?id=" + guid;
            #endregion

            string scriptTag = String.Format("<script src=\"{0}\" ></script>", getJSPath);
            return new MvcHtmlString(scriptTag);
        }
    }
}