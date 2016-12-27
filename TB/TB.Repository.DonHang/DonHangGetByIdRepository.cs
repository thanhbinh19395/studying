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
    public class DonHangGetByIdRepository : BaseRepository<DonHang>
    {
        public int DonHangId { get; set; }
        public override Result<DonHang> ExecuteCore(Controller CurrentContext)
        {
            return Success(db.DonHangs.Single(p => p.DonHangId == this.DonHangId));
        }
    }
}
