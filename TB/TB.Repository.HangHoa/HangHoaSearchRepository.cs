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


            //if (String.IsNullOrWhiteSpace(Ma + Ten))
            //{
            //    var tmp = db.HangHoas.ToPagedListForEntityFramework(s => s.HangHoaId, Convert.ToInt32(Page), PageSize);
            //    var data =  new
            //    {
            //        Data = tmp.ToList(),
            //        PageCount = tmp.PageCount,
            //        Page = tmp.PageNumber,
            //    };
            //    return Success(data);

            //}
            #endregion

            #region Search
            var result = db.HangHoas.Where(
                p =>
                p.Ma.Contains(HangHoa.Ma) ||
                p.Ten.Contains(HangHoa.Ten) ||
                p.NhaCungCapId == HangHoa.NhaCungCapId ||
                p.LoaiHangHoaId == HangHoa.LoaiHangHoaId
                );
            var page = result.ToPagedListForEntityFramework(s => s.HangHoaId, Convert.ToInt32(Page), PageSize);
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
