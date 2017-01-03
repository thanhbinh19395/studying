using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;

namespace TB.ChiTietDonHangRepo
{
    public class ChiTietDonHangGetByIdRepository:BaseRepository<ChiTietDonHang>
    {
        public int ChiTietDonHangId { get; set; }
        public override Result<ChiTietDonHang> ExecuteCore(Controller CurrentContext)
        {
            return Success(db.ChiTietDonHangs.Single(p => p.ChiTietDonHangId == this.ChiTietDonHangId));
        }
    }
}
