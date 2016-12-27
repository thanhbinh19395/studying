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
    public class NhaCungCapInsertRepository : BaseRepository<int>
    {
        public NhaCungCap NhaCungCap { get; set; }

        public override void ValidateCore(Controller CurrentContext)
        {
            if (db.NhaCungCaps.SingleOrDefault(p => p.Ma == this.NhaCungCap.Ma) != null)
                throw new Exception("Đã tồn tại Nhà cung cấp có mã là: " + this.NhaCungCap.Ma);
        }
        public override Result<int> ExecuteCore(Controller CurrentContext)
        {
            db.NhaCungCaps.Add(NhaCungCap);
            return Success(db.SaveChanges());
        }
    }
}
