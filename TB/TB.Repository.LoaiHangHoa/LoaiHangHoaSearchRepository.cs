using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TB.BaseRepo;
using TB.Domain.EntityModel;
using X.PagedList;

namespace TB.LoaiHangHoaRepo
{
    public class LoaiHangHoaSearchRepository : BaseRepository
    {
        public string Ma { get; set; }
        public string Ten { get; set; }
        public dynamic Excute()
        {
            #region Get List
            if (String.IsNullOrWhiteSpace(Ma + Ten))
            {
                var tmp = db.LoaiHangHoas.ToPagedListForEntityFramework(s => s.LoaiHangHoaId, Convert.ToInt32(Page), 2);
                return new
                {
                    Data = tmp.ToList(),
                    PageCount = tmp.PageCount,
                    Page = tmp.PageNumber,
                };

            }
            #endregion

            #region Search
            var result = db.LoaiHangHoas.Where(
                p =>
                p.Ma.Contains(Ma) ||
                p.Ten.Contains(Ten));
            var page = result.ToPagedListForEntityFramework(s => s.LoaiHangHoaId, Convert.ToInt32(Page), 2);
            return new
            {
                Data = page.ToList(),
                PageCount = page.PageCount,
                Page = page.PageNumber,
            };


            #endregion
        }


    }
}
