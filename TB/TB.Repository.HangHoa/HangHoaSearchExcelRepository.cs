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
    public class HangHoaSearchExcelRepository : BaseRepository<List<HangHoa>>
    {
        public HangHoa HangHoa { get; set; }
        public override void ValidateCore(Controller CurrentContext)
        {
            //HangHoa = (HangHoa)CurrentContext.Request.Form;
        }
        public override Result<List<HangHoa>> ExecuteCore(Controller CurrentContext)
        {
            #region Get List
            if (HangHoa == null || Extensions.DeepEquals(HangHoa, new HangHoa()))
            {
                var tmp = db.HangHoas.ToPagedListForEntityFramework(s => s.HangHoaId, Convert.ToInt32(Page), PageSize);
                return Success(tmp.ToList());

            }
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
            return Success(page.ToList());

            #endregion
        }


    }
}
