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

            if (ThongTinNguoiDung == null)
                ThongTinNguoiDung = new ThongTinNguoiDung();

            var result = db.ThongTinNguoiDungs.AsQueryable();

            if (!String.IsNullOrWhiteSpace(ThongTinNguoiDung.HoTen))
                result = result.Where(p => p.HoTen.Contains(ThongTinNguoiDung.HoTen));
            if (!String.IsNullOrWhiteSpace(ThongTinNguoiDung.SoDienThoai))
                result = result.Where(p => p.SoDienThoai.Contains(ThongTinNguoiDung.SoDienThoai));
            if (!String.IsNullOrWhiteSpace(ThongTinNguoiDung.Email))
                result = result.Where(p => p.Email.Contains(ThongTinNguoiDung.Email));
            if (!String.IsNullOrWhiteSpace(ThongTinNguoiDung.DiaChi))
                result = result.Where(p => p.DiaChi.Contains(ThongTinNguoiDung.DiaChi));
            if (ThongTinNguoiDung.TinhThanhPhoId != null)
                result = result.Where(p => p.TinhThanhPhoId == ThongTinNguoiDung.TinhThanhPhoId);
            if (ThongTinNguoiDung.QuanId != null)
                result = result.Where(p => p.QuanId == ThongTinNguoiDung.QuanId);

            int curPage = Page != null ? Convert.ToInt32(Page) : 1;
            var page = result.ToPagedListForEntityFramework(s => s.ThongTinNguoiDungId, curPage, PageSize);
            var dataSearch = new
            {
                Data = page.ToList(),
                PageCount = page.PageCount,
                Page = page.PageNumber,
            };
            return Success(dataSearch);
        }
    }
}
