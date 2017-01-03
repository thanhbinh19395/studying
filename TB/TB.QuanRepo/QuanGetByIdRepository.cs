using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;

namespace TB.QuanRepo
{
    public class QuanGetByIdRepository : BaseRepository<Quan>
    {
        public int QuanId { get; set; }
        public override Result<Quan> ExecuteCore(Controller CurrentContext)
        {
            return Success(db.Quans.Single(p => p.QuanId == this.QuanId));
        }
    }
}
