using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;
using TB.DonHangRepo;
using TB.ThongTinNguoiDungRepo;
using TB.ChiTietDonHangRepo;

namespace TB.DonHangBus
{
    public class ThemDonHangKhachLaBusiness : BaseRepository<long>
    {
        public ThongTinNguoiDung ThongTinNguoiDung { get; set; }
        public DonHang DonHang { get; set; }
        public List<ChiTietDonHang> ChiTietDonHang { get; set; }

        public override Result<long> ExecuteCore(Controller CurrentContext)
        {
            ThongTinNguoiDungInsertRepository ttndInsert = new ThongTinNguoiDungInsertRepository { ThongTinNguoiDung = this.ThongTinNguoiDung };
            var ttndInsertResult = ttndInsert.Execute(CurrentContext);
            if (ttndInsertResult.IsSuccess == false)
                return Fail(ttndInsertResult.Message);
            var ttndId = ttndInsertResult.Data;
            this.DonHang.KhachHangId = ttndId;

            DonHangInsertRepository dhInsert = new DonHangInsertRepository { DonHang = this.DonHang };
            var dhInsertResult = dhInsert.Execute(CurrentContext);
            if (dhInsertResult.IsSuccess == false)
                return Fail(dhInsertResult.Message);

            var dhId = dhInsertResult.Data;

            foreach (var ctdh in ChiTietDonHang)
            {
                ctdh.DonHangId = dhId;
                ChiTietDonHangInsertRepository ctdhInsert = new ChiTietDonHangInsertRepository { ChiTietDonHang = ctdh };
                var ctdhInsertResult = ctdhInsert.Execute(CurrentContext);
                if (ctdhInsertResult.IsSuccess == false)
                {
                    //rollback
                    DonHangDeleteRepository deleteDH = new DonHangDeleteRepository { DonHangId = dhId };
                    deleteDH.Execute(CurrentContext);
                    return Fail(ctdhInsertResult.Message);
                }
            }
            return Success(dhId);
        }
    }
}
