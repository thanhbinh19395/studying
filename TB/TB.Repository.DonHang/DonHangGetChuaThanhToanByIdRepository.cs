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
    public class DonHangGetChuaThanhToanByIdRepository : BaseRepository<DonHang>
    {
        public long DonHangId { get; set; }
        public override void ValidateCore(Controller CurrentContext)
        {
            if (db.HoaDons.Count(p => p.DonHangId == this.DonHangId) == 1)
                throw new Exception("Don hang nay da duoc thanh toan");
        }
        public override Result<DonHang> ExecuteCore(Controller CurrentContext)
        {
            return Success(db.DonHangs.SingleOrDefault(p => p.DonHangId == this.DonHangId));
        }
    }
}
