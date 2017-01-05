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
    public class ThongTinNguoiDungGetByIdRepository : BaseRepository<ThongTinNguoiDung>
    {
        public long ThongTinNguoiDungId { get; set; }
        public override Result<ThongTinNguoiDung> ExecuteCore(Controller CurrentContext)
        {
            return Success(db.ThongTinNguoiDungs.Single(p => p.ThongTinNguoiDungId == this.ThongTinNguoiDungId));
        }
    }
}
