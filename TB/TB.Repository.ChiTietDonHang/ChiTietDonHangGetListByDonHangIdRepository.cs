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

namespace TB.ChiTietDonHangRepo
{
    public class ChiTietDonHangGetListByDonHangIdRepository : BaseRepository<List<ChiTietDonHang>>
    {
        public long DonHangId { get; set; }
        public override Result<List<ChiTietDonHang>> ExecuteCore(Controller CurrentContext)
        {
            return Success(db.ChiTietDonHangs.Where(p => p.DonHangId == this.DonHangId).ToList());
        }

    }
}
