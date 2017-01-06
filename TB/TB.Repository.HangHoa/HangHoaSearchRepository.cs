using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;
using X.PagedList;

namespace TB.HangHoaRepo
{
    public class HangHoaSearchRepository : BaseRepository<dynamic>
    {
        public HangHoa HangHoa { get; set; }
        public override Result<dynamic> ExecuteCore(Controller CurrentContext)
        {
            #region Get List
            //if (HangHoa == null || Extensions.DeepEquals(HangHoa, new HangHoa()))
            //{
            //    var tmp = db.HangHoas.ToPagedListForEntityFramework(s => s.HangHoaId, Convert.ToInt32(Page), PageSize);
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
            //var result = db.HangHoas.Where(
            //    p =>
            //    p.Ma.Contains(HangHoa.Ma) ||
            //    p.Ten.Contains(HangHoa.Ten) ||
            //    p.NhaCungCapId == HangHoa.NhaCungCapId ||
            //    p.LoaiHangHoaId == HangHoa.LoaiHangHoaId
            //    );
            if (HangHoa == null)
                HangHoa = new HangHoa();

            var result = db.HangHoas.AsQueryable();

            if (!String.IsNullOrWhiteSpace(HangHoa.Ma))
                result = result.Where(p => p.Ma.Contains(HangHoa.Ma));
            if (!String.IsNullOrWhiteSpace(HangHoa.Ten))
                result = result.Where(p => p.Ten.Contains(HangHoa.Ten));
            if (HangHoa.GiaBanThamKhao != null)
                result = result.Where(p => p.GiaBanThamKhao == HangHoa.GiaBanThamKhao);
            if (HangHoa.LoaiHangHoaId != null)
                result = result.Where(p => p.LoaiHangHoaId == HangHoa.LoaiHangHoaId);
            if (HangHoa.NhaCungCapId != null)
                result = result.Where(p => p.NhaCungCapId == HangHoa.NhaCungCapId);

            result = result.OrderByDescending(p => p.UpdatedDate);

            int curPage = Page != null ? Convert.ToInt32(Page) : 1;
            var page = result.ToPagedListForEntityFramework(s => s.HangHoaId, curPage, PageSize);
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
