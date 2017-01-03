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
    public class DonHangDeleteRepository : BaseRepository<int>
    {
        public long DonHangId { get; set; }
        public override Result<int> ExecuteCore(Controller CurrentContext)
        {
            db.DonHangs.Remove(db.DonHangs.Single(p => p.DonHangId == this.DonHangId));
            return Success(db.SaveChanges());
        }
    }
}
