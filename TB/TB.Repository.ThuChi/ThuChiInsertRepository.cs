using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;

namespace TB.LoaiHangHoaRepo
{
    public class ThuChiInsertRepository : BaseRepository<long>
    {
        public ThuChi ThuChi { get; set; }

        public override Result<long> ExecuteCore(Controller CurrentContext)
        {
            ThuChi.CreatedDate = DateTime.Now;
            ThuChi.UpdatedDate = DateTime.Now;

            ThuChi.Ngay = DateTime.Now;
            db.ThuChis.Add(ThuChi);
            db.SaveChanges();
            return Success(this.ThuChi.ThuChiId);
        }
    }
}
