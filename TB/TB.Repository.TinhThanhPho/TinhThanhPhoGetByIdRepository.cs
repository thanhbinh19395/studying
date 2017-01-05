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
    public class TinhThanhPhoGetByIdRepository : BaseRepository<TinhThanhPho>
    {
        public long TinhThanhPhoId { get; set; }
        public override Result<TinhThanhPho> ExecuteCore(Controller CurrentContext)
        {
            return Success(db.TinhThanhPhoes.Single(p => p.TinhThanhPhoId == this.TinhThanhPhoId));
        }
    }
}
