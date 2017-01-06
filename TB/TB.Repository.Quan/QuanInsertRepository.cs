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
    public class QuanInsertRepository : BaseRepository<int>
    {
        public Quan Quan { get; set; }

        public override void ValidateCore(Controller CurrentContext)
        {
            if (db.Quans.SingleOrDefault(p => p.QuanId == this.Quan.QuanId) != null)
                throw new Exception("Đã tồn tại Quận có tên là: " + this.Quan.Ten);
        }
        public override Result<int> ExecuteCore(Controller CurrentContext)
        {
            Quan.CreatedDate = DateTime.Now;
            Quan.UpdatedDate = DateTime.Now;

            db.Quans.Add(Quan);
            return Success(db.SaveChanges());
        }
    }
}
