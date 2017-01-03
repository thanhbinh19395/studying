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
    public class ChiTietDonHangDeleteRepository : BaseRepository<int>
    {
        public int ChiTietDonHangId { get; set; }
        public override Result<int> ExecuteCore(Controller CurrentContext)
        {
            db.ChiTietDonHangs.Remove(db.ChiTietDonHangs.Single(p => p.ChiTietDonHangId == this.ChiTietDonHangId));
            return Success(db.SaveChanges());
        }
    }
}
