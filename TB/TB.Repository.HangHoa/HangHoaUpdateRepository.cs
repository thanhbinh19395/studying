using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;

namespace TB.HangHoaRepo
{
    public class HangHoaUpdateRepository : BaseRepository<int>
    {
        public HangHoa HangHoa { get; set; }

        public override Result<int> ExecuteCore(Controller CurrentContext)
        {
            
            if ( db.HangHoas.Count(p => p.Ma == HangHoa.Ma) > 1)
                return Fail("Đã tồn tại Loại hàng hóa có mã là : " + this.HangHoa.Ma);

            var lhh = db.HangHoas.SingleOrDefault(p=>p.HangHoaId == this.HangHoa.HangHoaId);
            lhh.Ma = HangHoa.Ma;
            lhh.Ten = HangHoa.Ten;

            return Success(db.SaveChanges());
        }
    }
}
