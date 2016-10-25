using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TB.LoaiHangHoaRepo;
using TB.Domain;
namespace HangHoa.Controllers
{
    public class HangHoaManagementController : Controller
    {
        public ActionResult Index()
        {
            
            return View();
        }
    }
}