using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;
using X.PagedList;

namespace TB.PhieuChiRepo
{
    public class PhieuChiSearchRepository : BaseRepository<dynamic>
    {   
        public PhieuChi PhieuChi { get; set; }
        public override Result<dynamic> ExecuteCore(Controller CurrentContext)
        {
            #region Get List
            //if (PhieuChi == null || Extensions.DeepEquals(PhieuChi, new PhieuChi()))
            //{
            //    var tmp = db.PhieuChis.ToPagedListForEntityFramework(s => s.PhieuChiId, Convert.ToInt32(Page), PageSize);
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
            //var result = db.PhieuChis.Where(
            //    p =>
            //    p.PhieuChiId == PhieuChi.PhieuChiId ||
            //    p.NguoiLap == PhieuChi.NguoiLap ||
            //    p.NgayLap == PhieuChi.NgayLap ||
            //    p.TongTien == PhieuChi.TongTien
            //     );
            if (PhieuChi == null)
                PhieuChi = new PhieuChi();

            var result = db.PhieuChis.AsQueryable();

            if (PhieuChi.NguoiLap != null)
                result = result.Where(p => p.NguoiLap == PhieuChi.NguoiLap);
            if (PhieuChi.TongTien != null)
                result = result.Where(p => p.TongTien == PhieuChi.TongTien);
            if (PhieuChi.NgayLap != null)
                result = result.Where(p => p.NgayLap == PhieuChi.NgayLap);

            result = result.OrderByDescending(p => p.UpdatedDate);

            int curPage = Page != null ? Convert.ToInt32(Page) : 1;
            var page = result.ToPagedListForEntityFramework(s => s.PhieuChiId, curPage, PageSize);
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
