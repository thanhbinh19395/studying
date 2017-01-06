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
    public class AnhHangHoaDeleteByHangHoaIdRepository : BaseRepository<int>
    {
        public long HangHoaId { get; set; }
        public override Result<int> ExecuteCore(Controller CurrentContext)
        {
            db.AnhHangHoas.RemoveRange(db.AnhHangHoas.Where(p => p.HangHoaId == this.HangHoaId));
            return Success(db.SaveChanges());
        }
    }
}
