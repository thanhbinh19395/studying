using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TB.LoaiHangHoaRepo;
using TB.Domain;
using System.IO;
using TB.Data;

namespace Uploader.Controllers
{
    public class ImagesUploaderController : Controller
    {
        public ActionResult Index(string ParentId)
        {
            ViewBag.ParentId = ParentId;
            return View();
        }
        public ActionResult UploadImageHangHoa(string name)
        {
            try
            {
                byte[] pic = Convert.FromBase64String(Request["fileHinh"]);
                var imageStoragePath = "~/App_Data/HinhAnhHangHoa";
                var thumbnailStoragePath = "~/App_Data/HinhAnhHangHoa/thumbnail";
                MemoryStream ms = new MemoryStream(pic, 0, pic.Length);
                ms.Write(pic, 0, pic.Length);
                System.Drawing.Image img = System.Drawing.Image.FromStream(ms, true);
                img.Save(Server.MapPath(imageStoragePath + '/' + name));

                var thumbWidth = Convert.ToInt32(img.Width * 0.25);
                var thumbHeight = Convert.ToInt32(img.Height * 0.25);
                System.Drawing.Image thumb = img.GetThumbnailImage(thumbWidth, thumbHeight, null, IntPtr.Zero);
                thumb.Save(Path.Combine(Server.MapPath(thumbnailStoragePath), name));

                thumb.Dispose();
                img.Dispose();
                ms.Close();
                var fullImagePath = String.Format("http://{0}/Uploader/ImagesUploader/GetImageHangHoa?fileName={1}", Request.Url.Host, name);
                var fullThumbnailPath = String.Format("http://{0}/Uploader/ImagesUploader/GetThumbnailImageHangHoa?fileName={1}", Request.Url.Host, name);
                return Json(new {
                    ImageUrl = fullImagePath,
                    ThumbnailUrl = fullThumbnailPath
                });
            }
            catch (Exception ex)
            {
                return Json(new
                {
                    IsSuccess = false,
                    Message = ex.Message
                });
            }

        }
        public ActionResult ImageUpload(int? chunk, string name)
        {
            var imageStoragePath = "~/App_Data/HinhAnh";
            var fileUpload = Request.Files[0];
            var uploadPath = Server.MapPath(imageStoragePath);
            chunk = chunk ?? 0;
            var path = Path.Combine(uploadPath, name);
            using (var fs = new FileStream(path, chunk == 0 ? FileMode.Create : FileMode.Append))
            {
                var buffer = new byte[fileUpload.InputStream.Length];
                fileUpload.InputStream.Read(buffer, 0, buffer.Length);
                fs.Write(buffer, 0, buffer.Length);
            }
            #region create thumbnail image
            while (FileHelper.IsFileLocked(new FileInfo(path)) == true)
            {
                //wait
            }

            var thumbnailStoragePath = "~/App_Data/HinhAnh/thumbnail";
            System.Drawing.Image img = System.Drawing.Image.FromFile(path);
            var thumbWidth = Convert.ToInt32(img.Width * 0.25);
            var thumbHeight = Convert.ToInt32(img.Height * 0.25);
            System.Drawing.Image thumb = img.GetThumbnailImage(thumbWidth, thumbHeight, null, IntPtr.Zero);
            thumb.Save(Path.Combine(Server.MapPath(thumbnailStoragePath), name));
            thumb.Dispose();
            img.Dispose();
            #endregion
            var fullImagePath = String.Format("http://{0}/Uploader/ImagesUploader/GetImage?fileName={1}", Request.Url.Host, name);
            var fullThumbnailPath = String.Format("http://{0}/Uploader/ImagesUploader/GetThumbnailImage?fileName={1}", Request.Url.Host, name);
            return new JsonResult()
            {
                Data = new
                {
                    ImageUrl = fullImagePath,
                    ThumbnailUrl = fullThumbnailPath
                }
            };
        }
        public ActionResult GetImage(string fileName)
        {
            var imageStoragePath = "~/App_Data/HinhAnh";
            var imgURL = Path.Combine(Server.MapPath(imageStoragePath), fileName);
            return File(imgURL, "image/png");

        }
        public ActionResult GetThumbnailImage(string fileName)
        {
            var thumbnailStoragePath = "~/App_Data/HinhAnh/thumbnail";
            var imgURL = Path.Combine(Server.MapPath(thumbnailStoragePath), fileName);
            return File(imgURL, "image/png");

        }
        public ActionResult GetImageHangHoa(string fileName)
        {
            var imageStoragePath = "~/App_Data/HinhAnhHangHoa";
            var imgURL = Path.Combine(Server.MapPath(imageStoragePath), fileName);
            return File(imgURL, "image/png");

        }
        public ActionResult GetThumbnailImageHangHoa(string fileName)
        {
            var thumbnailStoragePath = "~/App_Data/HinhAnhHangHoa/thumbnail";
            var imgURL = Path.Combine(Server.MapPath(thumbnailStoragePath), fileName);
            return File(imgURL, "image/png");

        }
    }
}