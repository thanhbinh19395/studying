using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;

namespace TB.LoaiHangHoaRepo
{
    public class LoaiHangHoaDeleteRepository : BaseRepository<int>
    {
        public int LoaiHangHoaId { get; set; }
        public override Result<int> ExecuteCore(Controller CurrentContext)
        {
            db.LoaiHangHoas.Remove(db.LoaiHangHoas.Single(p => p.LoaiHangHoaId == this.LoaiHangHoaId));
            return Success(db.SaveChanges());
        }
    }
}
