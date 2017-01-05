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
    public class QuanUpdateRepository : BaseRepository<int>
    {
        public Quan Quan { get; set; }
        public override void ValidateCore(Controller CurrentContext)
        {
            if (db.Quans.Count(p => p.QuanId == Quan.QuanId) > 1)
                throw new Exception("Đã tồn tại Quận có tên là : " + this.Quan.Ten);
        }
        public override Result<int> ExecuteCore(Controller CurrentContext)
        {
            var lhh = db.Quans.SingleOrDefault(p => p.QuanId == this.Quan.QuanId);
            lhh.QuanId = Quan.QuanId;
            lhh.TinhThanhPhoId = Quan.TinhThanhPhoId;
            lhh.Ten = Quan.Ten;

            return Success(db.SaveChanges());
        }
    }
}
