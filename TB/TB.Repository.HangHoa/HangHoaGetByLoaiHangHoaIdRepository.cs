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
    public class HangHoaGetByLoaiHangHoaIdRepository: BaseRepository<List<HangHoa>>
    {
        public int LoaiHangHoaId { get; set; }
        public override Result<List<HangHoa>> ExecuteCore(Controller CurrentContext)
        {
            List<HangHoa> hh = db.HangHoas.Where(p => p.LoaiHangHoaId == this.LoaiHangHoaId).ToList();
            return Success(hh);
        }
    }
}
