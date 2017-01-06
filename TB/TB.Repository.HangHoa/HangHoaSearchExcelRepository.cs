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
        public override Result<List<HangHoa>> ExecuteCore(Controller CurrentContext)
        {
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

            return Success(result.ToList());
        }


    }
}
