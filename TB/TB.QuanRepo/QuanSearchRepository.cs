﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;
using X.PagedList;
namespace TB.QuanRepo
{
    public class QuanSearchRepository : BaseRepository<dynamic>
    {
        public Quan Quan { get; set; }
        public override Result<dynamic> ExecuteCore(Controller CurrentContext)
        {
            #region Get List
            //if (Quan == null || Extensions.DeepEquals(Quan, new Quan()))
            //{
            //    var tmp = db.Quans.ToPagedListForEntityFramework(s => s.QuanId, Convert.ToInt32(Page), PageSize);
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
            //var result = db.Quans.Where(
            //    p =>
            //    p.Ten.Contains(Quan.Ten) ||                
            //    p.TinhThanhPhoId == Quan.TinhThanhPhoId
            //    );
            if (Quan == null)
                Quan = new Quan();

            var result = db.Quans.AsQueryable();

            if (Quan.TinhThanhPhoId != null)
                result = result.Where(p => p.TinhThanhPhoId == Quan.TinhThanhPhoId);
            if (!String.IsNullOrWhiteSpace(Quan.Ten))
                result = result.Where(p => p.Ten.Contains(Quan.Ten));

            int curPage = Page != null ? Convert.ToInt32(Page) : 1;
            var page = result.ToPagedListForEntityFramework(s => s.QuanId, curPage, PageSize);
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
