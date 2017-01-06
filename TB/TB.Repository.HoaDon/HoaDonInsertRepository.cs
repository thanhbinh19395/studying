using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;
using X.PagedList;

namespace TB.HoaDonRepo
{
    public class HoaDonInsertRepository : BaseRepository<long>
    {
        public HoaDon HoaDon { get; set; }

        public override Result<long> ExecuteCore(Controller CurrentContext)
        {
            HoaDon.CreatedDate = DateTime.Now;
            HoaDon.UpdatedDate = DateTime.Now;

            var user = CurrentContext.Session["LoginUser"] as User;
            HoaDon.NguoiLapId = user.UserId;
            HoaDon.NgayLap = DateTime.Now;
            db.HoaDons.Add(this.HoaDon);
            db.SaveChanges();
            return Success(this.HoaDon.HoaDonId);
        }


    }
}
