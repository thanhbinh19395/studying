using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;

namespace TB.AnhHangHoaRepo
{
    public class AnhHangHoaDeleteRepository : BaseRepository<int>
    {
        public int AnhHangHoaId { get; set; }
        public override Result<int> ExecuteCore(Controller CurrentContext)
        {
            db.AnhHangHoas.Remove(db.AnhHangHoas.Single(p => p.AnhHangHoaId == this.AnhHangHoaId));
            return Success(db.SaveChanges());
        }
    }
}
