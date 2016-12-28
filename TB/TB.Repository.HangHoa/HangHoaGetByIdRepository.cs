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
    public class HangHoaGetByIdRepository:BaseRepository<HangHoa>
    {
        public int HangHoaId { get; set; }
        public override Result<HangHoa> ExecuteCore(Controller CurrentContext)
        {
            HangHoa hh = db.HangHoas.Single(p => p.HangHoaId == this.HangHoaId);
            return Success(hh);
        }
    }
}
