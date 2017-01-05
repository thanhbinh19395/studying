using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;
using X.PagedList;

namespace TB.ChiTietPhieuChiRepo
{
    public class ChiTietPhieuChiGetListByPhieuChiIdRepository : BaseRepository<List<ChiTietPhieuChi>>
    {
        public long PhieuChiId { get; set; }
        public override Result<List<ChiTietPhieuChi>> ExecuteCore(Controller CurrentContext)
        {
            return Success(db.ChiTietPhieuChis.Where(p => p.PhieuChiId == this.PhieuChiId).ToList());
        }
    }
}
