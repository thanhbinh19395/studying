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
    public class QuanDeleteRepository : BaseRepository<int>
    {
        public int QuanId { get; set; }
        public override Result<int> ExecuteCore(Controller CurrentContext)
        {
            db.Quans.Remove(db.Quans.Single(p => p.QuanId == this.QuanId));
            return Success(db.SaveChanges());
        }
    }
}
