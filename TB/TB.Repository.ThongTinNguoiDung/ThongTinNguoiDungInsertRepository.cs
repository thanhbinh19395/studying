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
    public class ThongTinNguoiDungInsertRepository: BaseRepository<long>
    {
        public ThongTinNguoiDung ThongTinNguoiDung { get; set; }

        public override Result<long> ExecuteCore(Controller CurrentContext)
        {
            db.ThongTinNguoiDungs.Add(ThongTinNguoiDung);
            db.SaveChanges();
            return Success(this.ThongTinNguoiDung.ThongTinNguoiDungId);
        }
    }
}
