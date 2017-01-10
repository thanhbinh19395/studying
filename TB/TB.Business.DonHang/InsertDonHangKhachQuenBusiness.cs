using System.Collections.Generic;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;


namespace TB.DonHangBus
{
    public class InsertDonHangKhachQuenBusiness : BaseRepository<long>
    {
        public DonHang DonHang { get; set; }
        public List<ChiTietDonHang> ChiTietDonHang { get; set; }
        public override Result<long> ExecuteCore(Controller CurrentContext)
        {
            InsertDonHangBusiness dhBus = new InsertDonHangBusiness { DonHang = this.DonHang, ChiTietDonHang = this.ChiTietDonHang };
            var dhId = dhBus.Execute(CurrentContext);
            ThanhToanDonHangBusiness ttdh = new ThanhToanDonHangBusiness { DonHangId = dhId.Data, GhiChu = DonHang.GhiChu };
            ttdh.Execute(CurrentContext);
            return dhId;
        }
    }
}
