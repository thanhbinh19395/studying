using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;

namespace TB.NhaCungCapRepo
{
    public class NhaCungCapUpdateRepository : BaseRepository<int>
    {
        public NhaCungCap NhaCungCap { get; set; }
        public override void ValidateCore(Controller CurrentContext)
        {
            if (db.NhaCungCaps.Count(p => p.Ma == NhaCungCap.Ma) > 1)
                throw new Exception("Đã tồn tại Nhà cung cấp có mã là : " + this.NhaCungCap.Ma);
        }
        public override Result<int> ExecuteCore(Controller CurrentContext)
        {
            var ncc = db.NhaCungCaps.SingleOrDefault(p=>p.NhaCungCapId == this.NhaCungCap.NhaCungCapId);
            ncc.Ma = NhaCungCap.Ma;
            ncc.Ten = NhaCungCap.Ten;

            ncc.UpdatedDate = DateTime.Now;
            return Success(db.SaveChanges());
        }
    }
}
