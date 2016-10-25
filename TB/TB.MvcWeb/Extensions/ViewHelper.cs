using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace TB.MvcWeb.Extensions
{
    public static class ViewHelper
    {
        public static string GetLayout(string parentId, string popupLayoutUrl = "~/Views/Shared/_PopupLayout.cshtml", string pageLayout = "~/Views/Shared/_Layout.cshtml")
        {
            if (string.IsNullOrWhiteSpace(parentId))
            {
                return pageLayout;
            }
            else
            {
                return popupLayoutUrl;
            }
        }
        public static MvcHtmlString AqViewBag(this HtmlHelper helper, string viewBagVarName = "ViewBag")
        {
            StringBuilder stringBuilder = new StringBuilder();
            JavaScriptSerializer serializer = new JavaScriptSerializer();

            var settings = new JsonSerializerSettings
            {
                DateFormatHandling = DateFormatHandling.IsoDateFormat,
                DateTimeZoneHandling = DateTimeZoneHandling.Unspecified,
                DefaultValueHandling = DefaultValueHandling.Ignore
            };

            stringBuilder.Append("<script type=\"text/javascript\">")
                         .Append("var ").Append(viewBagVarName).Append("=")
                         .Append(JsonConvert.SerializeObject(helper.ViewBag, Formatting.None, settings));

            stringBuilder.Append("</script>");

            return MvcHtmlString.Create(stringBuilder.ToString());
        }
    }
}