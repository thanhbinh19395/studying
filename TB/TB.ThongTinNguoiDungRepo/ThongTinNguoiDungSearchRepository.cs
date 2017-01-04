using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;
using X.PagedList;

namespace TB.ThongTinNguoiDungRepo
{
    public class ThongTinNguoiDungSearchRepository : BaseRepository<dynamic>
    {
        public ThongTinNguoiDung ThongTinNguoiDung { get; set; }
        public override Result<dynamic> ExecuteCore(Controller CurrentContext)
        {
            #region Get List
            if (ThongTinNguoiDung == null || Extensions.DeepEquals(ThongTinNguoiDung, new ThongTinNguoiDung()))
            {
                var tmp = db.ThongTinNguoiDungs.ToPagedListForEntityFramework(s => s.ThongTinNguoiDungId, Convert.ToInt32(Page), PageSize);
                var data = new
                {
                    Data = tmp.ToList(),
                    PageCount = tmp.PageCount,
                    Page = tmp.PageNumber,
                };
                return Success(data);

            }
            #endregion

            #region Search
            var result = db.ThongTinNguoiDungs.Where(
                p =>
                p.ThongTinNguoiDungId == ThongTinNguoiDung.ThongTinNguoiDungId ||
                p.HoTen.Contains(ThongTinNguoiDung.HoTen) ||
                p.SoDienThoai.Contains(ThongTinNguoiDung.SoDienThoai) ||
                p.Email.Contains(ThongTinNguoiDung.Email) ||
                p.DiaChi.Contains(ThongTinNguoiDung.DiaChi) ||
                p.TinhThanhPhoId == ThongTinNguoiDung.TinhThanhPhoId ||
                p.QuanId == ThongTinNguoiDung.QuanId
                );
            var page = result.ToPagedListForEntityFramework(s => s.ThongTinNguoiDungId, Convert.ToInt32(Page), PageSize);
            var dataSearch = new
            {
                Data = page.ToList(),
                PageCount = page.PageCount,
                Page = page.PageNumber,
            };
            return Success(dataSearch);

            #endregion
        }
    }
}
