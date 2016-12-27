using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;

namespace TB.NhaCungCapRepo
{
    public class NhaCungCapGetByIdRepository : BaseRepository<NhaCungCap>
    {
        public int NhaCungCapId { get; set; }
        public override Result<NhaCungCap> ExecuteCore(Controller CurrentContext)
        {
            return Success(db.NhaCungCaps.Single(p => p.NhaCungCapId == this.NhaCungCapId));
        }
    }
}
