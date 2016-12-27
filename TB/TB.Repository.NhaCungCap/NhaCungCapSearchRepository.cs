﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;
using X.PagedList;

namespace TB.NhaCungCapRepo
{
    public class NhaCungCapSearchRepository : BaseRepository<dynamic>
    {
        public NhaCungCap NhaCungCap { get; set; }
        public override Result<dynamic> ExecuteCore(Controller CurrentContext)
        {
            #region Get List
            if (NhaCungCap == null || Extensions.DeepEquals(NhaCungCap, new NhaCungCap()))
            {
                var tmp = db.NhaCungCaps.ToPagedListForEntityFramework(s => s.NhaCungCapId, Convert.ToInt32(Page), PageSize);
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
            var result = db.NhaCungCaps.Where(
                p =>
                p.Ma.Contains(NhaCungCap.Ma) ||
                p.Ten.Contains(NhaCungCap.Ten));
            var page = result.ToPagedListForEntityFramework(s => s.NhaCungCapId, Convert.ToInt32(Page), PageSize);
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
