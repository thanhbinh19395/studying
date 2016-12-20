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
        public string Ma { get; set; }
        public string Ten { get; set; }
        public override Result<dynamic> ExecuteCore(Controller CurrentContext)
        {
            #region Get List
            if (String.IsNullOrWhiteSpace(Ma + Ten))
            {
                var tmp = db.LoaiHangHoas.ToPagedListForEntityFramework(s => s.LoaiHangHoaId, Convert.ToInt32(Page), PageSize);
                var data =  new
                {
                    Data = tmp.ToList(),
                    PageCount = tmp.PageCount,
                    Page = tmp.PageNumber,
                };
                return Success(data);

            }
            #endregion

            #region Search
            var result = db.LoaiHangHoas.Where(
                p =>
                p.Ma.Contains(Ma) ||
                p.Ten.Contains(Ten));
            var page = result.ToPagedListForEntityFramework(s => s.LoaiHangHoaId, Convert.ToInt32(Page), PageSize);
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
