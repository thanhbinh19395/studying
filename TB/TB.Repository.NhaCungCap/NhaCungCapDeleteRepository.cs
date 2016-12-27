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
    public class NhaCungCapDeleteRepository : BaseRepository<int>
    {
        public int NhaCungCapId { get; set; }
        public override Result<int> ExecuteCore(Controller CurrentContext)
        {
            db.NhaCungCaps.Remove(db.NhaCungCaps.Single(p => p.NhaCungCapId == this.NhaCungCapId));
            return Success(db.SaveChanges());
        }
    }
}
