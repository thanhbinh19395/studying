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
    public class LoaiHangHoaSearchRepository : BaseRepository<dynamic>
    {
        public LoaiHangHoa LoaiHangHoa { get; set; }
        public override Result<dynamic> ExecuteCore(Controller CurrentContext)
        {
            #region Get List
            //if (LoaiHangHoa == null || Extensions.DeepEquals(LoaiHangHoa, new LoaiHangHoa()))
            //{
            //    var tmp = db.LoaiHangHoas.ToPagedListForEntityFramework(s => s.LoaiHangHoaId, Convert.ToInt32(Page), PageSize);
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
            //var result = db.LoaiHangHoas.Where(
            //    p =>
            //    p.Ma.Contains(LoaiHangHoa.Ma) ||
            //    p.Ten.Contains(LoaiHangHoa.Ten));
            if (LoaiHangHoa == null)
                LoaiHangHoa = new LoaiHangHoa();

            var result = db.LoaiHangHoas.AsQueryable();

            if (!String.IsNullOrWhiteSpace(LoaiHangHoa.Ma))
                result = result.Where(p => p.Ma.Contains(LoaiHangHoa.Ma));
            if (!String.IsNullOrWhiteSpace(LoaiHangHoa.Ten))
                result = result.Where(p => p.Ten.Contains(LoaiHangHoa.Ten));

            int curPage = Page != null ? Convert.ToInt32(Page) : 1;
            var page = result.ToPagedListForEntityFramework(s => s.LoaiHangHoaId, curPage, PageSize);
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
