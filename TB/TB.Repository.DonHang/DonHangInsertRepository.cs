using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;

namespace TB.DonHangRepo
{
    public class DonHangInsertRepository : BaseRepository<long>
    {
        public DonHang DonHang { get; set; }

        public override Result<long> ExecuteCore(Controller CurrentContext)
        {
            DonHang.NgayLap = DateTime.Now;
            db.DonHangs.Add(DonHang);
            db.SaveChanges();
            return Success(this.DonHang.DonHangId);
        }
    }
}
