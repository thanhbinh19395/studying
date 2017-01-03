using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;
using TB.DonHangRepo;
using TB.HoaDonRepo;
namespace TB.DonHangBus
{
    public class ThanhToanDonHangBusiness : BaseRepository<long>
    {
        public long DonHangId { get; set; }
        public string GhiChu { get; set; }
        public override Result<long> ExecuteCore(Controller CurrentContext)
        {
            DonHangGetByIdRepository dhRepo = new DonHangGetByIdRepository { DonHangId = this.DonHangId };
            var DonHang = dhRepo.Execute(CurrentContext).Data;
            HoaDon HoaDon = new HoaDon { DonHangId = DonHang.DonHangId, GhiChu = this.GhiChu, ThanhTien = DonHang.ThanhTien };
            HoaDonInsertRepository hdRepo = new HoaDonInsertRepository { HoaDon = HoaDon };
            return hdRepo.Execute(CurrentContext);
        }
    }
}
