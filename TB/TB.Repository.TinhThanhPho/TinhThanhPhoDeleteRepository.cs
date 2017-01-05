using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;

namespace TB.TinhThanhPhoRepo
{
    public class TinhThanhPhoDeleteRepository : BaseRepository<int>
    {
        public int TinhThanhPhoId { get; set; }
        public override Result<int> ExecuteCore(Controller CurrentContext)
        {
            db.TinhThanhPhoes.Remove(db.TinhThanhPhoes.Single(p => p.TinhThanhPhoId == this.TinhThanhPhoId));
            return Success(db.SaveChanges());
        }
    }
}
