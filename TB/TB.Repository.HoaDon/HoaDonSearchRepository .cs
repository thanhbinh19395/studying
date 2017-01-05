using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;
using X.PagedList;

namespace TB.HoaDonRepo
{
    public class HoaDonSearchRepository : BaseRepository<dynamic>
    {
        public HoaDon HoaDon { get; set; }

        //public int NguoiLapId { get; set; }
        public DateTime FromDate { get; set; }
        public DateTime ToDate { get; set; }

        public override Result<dynamic> ExecuteCore(Controller CurrentContext)
        {
            #region Get List
            //if (HoaDon == null || Extensions.DeepEquals(HoaDon, new HoaDon()))
            //{
            //    var tmp = db.HoaDons.ToPagedListForEntityFramework(s => s.HoaDonId, Convert.ToInt32(Page), PageSize);
            //    var data = new
            //    {
            //        Data = tmp.ToList(),
            //        PageCount = tmp.PageCount,
            //        Page = tmp.PageNumber,
            //    };
            //    return Success(data);

            //}
            #endregion

            #region Search
            //var result = db.HoaDons.Where(
            //    p => p.NguoiLapId == HoaDon.NguoiLapId || 
            //    (HoaDon.NgayLap >= FromDate && HoaDon.NgayLap < ToDate)
            //     );
            if (HoaDon == null)
                HoaDon = new HoaDon();

            var result = db.HoaDons.AsQueryable();

            if (HoaDon.NguoiLapId != null)
                result = result.Where(p => p.NguoiLapId == HoaDon.NguoiLapId);
            if (HoaDon.NgayLap != null)
                result = result.Where(p => p.NgayLap == HoaDon.NgayLap);

            int curPage = Page != null ? Convert.ToInt32(Page) : 1;
            var page = result.ToPagedListForEntityFramework(s => s.NguoiLapId, curPage, PageSize);
            var dataSearch = new
            {
                Data = page.ToList(),
                PageCount = page.PageCount,
                Page = page.PageNumber,
            };
            return Success(dataSearch);

            #endregion
        }


    }
}
