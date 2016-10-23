using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Hosting;
using System.Web.Mvc;


public static class JavascriptHelper
{
    public static MvcHtmlString InitPageMainModule<TModel>(this HtmlHelper<TModel> helper, string path = null)
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

        #region Tạo script để chạy requireJS, và tự include [pageName].js vào [pageName].html, tự include framework.js
        var require = new StringBuilder();

        var scriptsPath = "~/Content/js/";

        var absolutePath = VirtualPathUtility.ToAbsolute(scriptsPath);

        //require.AppendLine("<script>");
        //require.AppendFormat("    require([\"{0}require.config.js\"]," + Environment.NewLine, absolutePath);
        //require.Append("       function () {");
        //require.Append("           require([\"domReady!\", \"framework\"],");
        //require.Append("               function () {");
        //require.AppendFormat("                   require([\"{0}\"]);", getJSPath);
        //require.Append("               }");
        //require.Append("           );");
        //require.Append("       }");
        //require.Append("   );");
        //require.AppendLine("</script>");
        require.AppendFormat("require([\"{0}\"]);", getJSPath);
        return new MvcHtmlString(require.ToString());

        #endregion

    }
}
