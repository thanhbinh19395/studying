using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;
using X.PagedList;

namespace TB.LoaiHangHoaRepo
{
    //public class LoaiHangHoaGetListRepository : BaseRepository<dynamic>
    //{
    //    public override dynamic ExecuteCore(Controller CurrentContext)
    //    {
    //        var result = db.LoaiHangHoas;
    //        if (Page != null)
    //        {
    //            //Phan trang
    //            var page = result.ToPagedListForEntityFramework((LoaiHangHoa s) => s.LoaiHangHoaId, Convert.ToInt32(Page), 2);
    //            return new
    //            {
    //                data = page.ToList(),
    //                PageCount = page.PageCount,
    //                Page = page.PageNumber,
    //            };
    //        }
    //        else
    //            return new
    //            {
    //                data = result.ToList()
    //            };
            
    //    }
    //    //public string ExcuteJson()
    //    //{
    //    //    return JsonConvert.SerializeObject(this.Excute(), Formatting.Indented);
    //    //}
    //}
}
