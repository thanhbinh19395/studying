using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;

namespace TB.ChiTietDonHangRepo
{
    public class ChiTietDonHangInsertRepository : BaseRepository<int>
    {
        public ChiTietDonHang ChiTietDonHang { get; set; }

        public override Result<int> ExecuteCore(Controller CurrentContext)
        {
            db.ChiTietDonHangs.Add(ChiTietDonHang);
            return Success(db.SaveChanges());
        }
    }
}
