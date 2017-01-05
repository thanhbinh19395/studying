using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;
using X.PagedList;

namespace TB.DonHangRepo
{
    public class DonHangSearchRepository : BaseRepository<dynamic>
    {
        public DonHang DonHang { get; set; }
        public override Result<dynamic> ExecuteCore(Controller CurrentContext)
        {
            #region Get List
            //if (DonHang == null || Extensions.DeepEquals(DonHang, new DonHang()))
            //{
            //    var tmp = db.DonHangs.ToPagedListForEntityFramework(s => s.DonHangId, Convert.ToInt32(Page), PageSize);
            //    var data = new
            //    {
            //        Data = tmp.ToList(),
            //        PageCount = tmp.PageCount,
            //        Page = tmp.PageNumber,
            //    };
            //    return Success(data);

            //}
            //#endregion

            //#region Search
            //var result = db.DonHangs.Where(
            //    p =>
            //    p.DonHangId == DonHang.DonHangId ||
            //    p.NgayLap == DonHang.NgayLap ||
            //    p.KhachHangId == DonHang.KhachHangId ||
            //    p.ThanhTien == DonHang.ThanhTien 
            //     );
            if (DonHang == null)
                DonHang = new DonHang();

            var result = db.DonHangs.AsQueryable();

            if (DonHang.NgayLap != null)
                result = result.Where(p => p.NgayLap == DonHang.NgayLap);
            if (DonHang.ThanhTien != null)
                result = result.Where(p => p.ThanhTien == DonHang.ThanhTien);
            if (DonHang.KhachHangId != null)
                result = result.Where(p => p.KhachHangId == DonHang.KhachHangId);

            int curPage = Page != null ? Convert.ToInt32(Page) : 1;
            var page = result.ToPagedListForEntityFramework(s => s.DonHangId, curPage, PageSize);
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
