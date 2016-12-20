using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;

namespace TB.LoaiHangHoaRepo
{
    public class LoaiHangHoaUpdateRepository : BaseRepository<int>
    {
        public LoaiHangHoa LoaiHangHoa { get; set; }

        public override Result<int> ExecuteCore(Controller CurrentContext)
        {
            
            if ( db.LoaiHangHoas.Count(p => p.Ma == LoaiHangHoa.Ma) > 1)
                return Fail("Đã tồn tại Loại hàng hóa có mã là : " + this.LoaiHangHoa.Ma);

            var lhh = db.LoaiHangHoas.SingleOrDefault(p=>p.LoaiHangHoaId == this.LoaiHangHoa.LoaiHangHoaId);
            lhh.Ma = LoaiHangHoa.Ma;
            lhh.Ten = LoaiHangHoa.Ten;

            return Success(db.SaveChanges());
        }
    }
}
