using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;

namespace TB.ThongTinNguoiDungRepo
{
    public class ThongTinNguoiDungDeleteRepository: BaseRepository<int>
    {
        public long ThongTinNguoiDungId { get; set; }
        public override Result<int> ExecuteCore(Controller CurrentContext)
        {
            db.ThongTinNguoiDungs.Remove(db.ThongTinNguoiDungs.Single(p => p.ThongTinNguoiDungId == this.ThongTinNguoiDungId));
            return Success(db.SaveChanges());
        }
    }
}
