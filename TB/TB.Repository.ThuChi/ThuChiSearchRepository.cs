﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;
using X.PagedList;

namespace TB.ThuChiRepo
{
    public class ThuChiSearchRepository : BaseRepository<dynamic>
    {
        public ThuChi ThuChi { get; set; }

        public int TongTienTu { get; set; }
        public int TongTienDen { get; set; }
        public DateTime TuNgay { get; set; }
        public DateTime DenNgay { get; set; }

        public override Result<dynamic> ExecuteCore(Controller CurrentContext)
        {
            #region Get List
            //if (ThuChi == null || Extensions.DeepEquals(ThuChi, new ThuChi()))
            //{
            //    var tmp = db.ThuChis.ToPagedListForEntityFramework(s => s.ThuChiId, Convert.ToInt32(Page), PageSize);
            //    var data = new
            //    {
            //        Data = tmp.ToList(),
            //        PageCount = tmp.PageCount,
            //        Page = tmp.PageNumber,
            //    };
            //    return Success(data);

            //}
            #endregion

            #region Search
            //var result = db.ThuChis.Where(
            //    p =>
            //    p.MaPhieu == ThuChi.MaPhieu);
            if (ThuChi == null)
                ThuChi = new ThuChi();

            var result = db.ThuChis.AsQueryable();

            if (ThuChi.MaPhieu != null)
                result = result.Where(p => p.MaPhieu == ThuChi.MaPhieu);
            if (ThuChi.TongTien != null)
                result = result.Where(p => p.TongTien == ThuChi.TongTien);
            if (ThuChi.Ngay != null)
                result = result.Where(p => p.Ngay == ThuChi.Ngay);

            int curPage = Page != null ? Convert.ToInt32(Page) : 1;
            var page = result.ToPagedListForEntityFramework(s => s.ThuChiId, curPage, PageSize);
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
