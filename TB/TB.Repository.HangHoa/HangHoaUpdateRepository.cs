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

        public override void ValidateCore(Controller CurrentContext)
        {
            if (db.HangHoas.Count(p => p.Ma == HangHoa.Ma) > 1)
                throw new Exception("Đã tồn tại Loại hàng hóa có mã là : " + this.HangHoa.Ma);
        }
        public override Result<int> ExecuteCore(Controller CurrentContext)
        {
            var hh = db.HangHoas.SingleOrDefault(p => p.HangHoaId == this.HangHoa.HangHoaId);
            hh.Ma = HangHoa.Ma;
            hh.Ten = HangHoa.Ten;

            return Success(db.SaveChanges());
        }
    }
}
