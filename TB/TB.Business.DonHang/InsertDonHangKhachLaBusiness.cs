using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;
using TB.DonHangRepo;
using TB.ChiTietDonHangRepo;
using TB.ThongTinNguoiDungRepo;

namespace TB.DonHangBus
{
    public class InsertDonHangKhachLaBusiness : BaseRepository<long>
    {
        public ThongTinNguoiDung ThongTinNguoiDung { get; set; }
        public DonHang DonHang { get; set; }
        public List<ChiTietDonHang> ChiTietDonHang { get; set; }
        public override Result<long> ExecuteCore(Controller CurrentContext)
        {
            ThongTinNguoiDungInsertRepository ttndRepo = new ThongTinNguoiDungInsertRepository { ThongTinNguoiDung = this.ThongTinNguoiDung };
            var ttndResult = ttndRepo.Execute(CurrentContext);
            if (ttndResult.IsSuccess == false)
                return Fail(ttndResult.Message);
            this.DonHang.KhachHangId = ttndResult.Data;
            InsertDonHangBusiness dhBus = new InsertDonHangBusiness { DonHang = this.DonHang, ChiTietDonHang = this.ChiTietDonHang };
            var dhId = dhBus.Execute(CurrentContext);
            ThanhToanDonHangBusiness ttdh = new ThanhToanDonHangBusiness { DonHangId = dhId.Data, GhiChu = DonHang.GhiChu };
            return ttdh.Execute(CurrentContext);
        }
    }
}
