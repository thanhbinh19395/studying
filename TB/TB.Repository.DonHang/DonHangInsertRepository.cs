using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;

namespace TB.DonHangRepo
{
    public class DonHangInsertRepository : BaseRepository<int>
    {
        public DonHang DonHang { get; set; }

        public override void ValidateCore(Controller CurrentContext)
        {
            if (db.DonHangs.SingleOrDefault(p => p.DonHangId == this.DonHang.DonHangId) != null)
                throw new Exception("Đã tồn tại Đơn hàng có mã là: " + this.DonHang.DonHangId);
        }
        public override Result<int> ExecuteCore(Controller CurrentContext)
        {
            db.DonHangs.Add(DonHang);
            return Success(db.SaveChanges());
        }
    }
}
