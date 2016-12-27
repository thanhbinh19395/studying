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
    public class DonHangUpdateRepository : BaseRepository<int>
    {
        public DonHang DonHang { get; set; }
        public override void ValidateCore(Controller CurrentContext)
        {
            if (db.DonHangs.Count(p => p.DonHangId == DonHang.DonHangId) > 1)
                throw new Exception("Đã tồn tại Đơn hàng hóa có mã là : " + this.DonHang.DonHangId);
        }
        public override Result<int> ExecuteCore(Controller CurrentContext)
        {
            var lhh = db.DonHangs.SingleOrDefault(p=>p.DonHangId == this.DonHang.DonHangId);
            lhh.NgayLap = DonHang.NgayLap;
            lhh.ThanhTien = DonHang.ThanhTien;
            lhh.KhachHangId = DonHang.KhachHangId;
            lhh.GhiChu = DonHang.GhiChu;

            return Success(db.SaveChanges());
        }
    }
}
