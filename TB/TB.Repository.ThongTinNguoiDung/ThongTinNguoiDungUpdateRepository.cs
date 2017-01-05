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
    public class ThongTinNguoiDungUpdateRepository : BaseRepository<int>
    {
        public ThongTinNguoiDung ThongTinNguoiDung { get; set; }
        public override void ValidateCore(Controller CurrentContext)
        {
            if (ThongTinNguoiDung.QuanId != null && ThongTinNguoiDung.TinhThanhPhoId != null)
            {
                var quanId = ThongTinNguoiDung.QuanId;
                var ttpId = ThongTinNguoiDung.TinhThanhPhoId;
                var quan = db.Quans.Single(p => p.QuanId == quanId);
                var TTP = db.TinhThanhPhoes.Single(p => p.TinhThanhPhoId == ttpId);
                if (TTP.TinhThanhPhoId != quan.TinhThanhPhoId)
                {
                    throw new Exception(String.Format("Quận {0} không thuộc tỉnh thành phố {1}", quan.Ten, TTP.Ten));
                }
            }
        }
        public override Result<int> ExecuteCore(Controller CurrentContext)
        {
            var lhh = db.ThongTinNguoiDungs.SingleOrDefault(p => p.ThongTinNguoiDungId == this.ThongTinNguoiDung.ThongTinNguoiDungId);
            lhh.HoTen = ThongTinNguoiDung.HoTen;
            lhh.SoDienThoai = ThongTinNguoiDung.SoDienThoai;
            lhh.Email = ThongTinNguoiDung.Email;
            lhh.DiaChi = ThongTinNguoiDung.DiaChi;
            lhh.TinhThanhPhoId = ThongTinNguoiDung.TinhThanhPhoId;
            lhh.QuanId = ThongTinNguoiDung.QuanId;
            lhh.HinhAnh = ThongTinNguoiDung.HinhAnh;
            return Success(db.SaveChanges());
        }
    }
}
