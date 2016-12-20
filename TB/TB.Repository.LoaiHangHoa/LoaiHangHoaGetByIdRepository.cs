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
    public class LoaiHangHoaGetByIdRepository:BaseRepository<LoaiHangHoa>
    {
        public int LoaiHangHoaId { get; set; }
        public override Result<LoaiHangHoa> ExecuteCore(Controller CurrentContext)
        {
            return Success(db.LoaiHangHoas.Single(p => p.LoaiHangHoaId == this.LoaiHangHoaId));
        }
    }
}
