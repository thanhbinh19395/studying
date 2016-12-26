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
    public class HangHoaInsertRepository : BaseRepository<int>
    {
        public HangHoa HangHoa { get; set; }

        public override void ValidateCore(Controller CurrentContext)
        {
            if (db.HangHoas.SingleOrDefault(p => p.Ma == this.HangHoa.Ma) != null)
                throw new Exception("Đã tồn tại Loại hàng hóa có mã là : " + this.HangHoa.Ma);
        }
        public override Result<int> ExecuteCore(Controller CurrentContext)
        {
            db.HangHoas.Add(HangHoa);
            return Success(db.SaveChanges());
        }
    }
}
