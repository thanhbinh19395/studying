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
    public class HangHoaDeleteRepository : BaseRepository<int>
    {
        public int HangHoaId { get; set; }
        public override Result<int> ExecuteCore(Controller CurrentContext)
        {
            db.HangHoas.Remove(db.HangHoas.Single(p => p.HangHoaId == this.HangHoaId));
            return Success(db.SaveChanges());
        }
    }
}
