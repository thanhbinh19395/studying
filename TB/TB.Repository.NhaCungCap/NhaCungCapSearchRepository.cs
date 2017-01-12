using System;
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
           
            if (NhaCungCap == null)
                NhaCungCap = new NhaCungCap();

            var result = db.NhaCungCaps.AsQueryable();

            if (!String.IsNullOrWhiteSpace(NhaCungCap.Ma))
                result = result.Where(p => p.Ma.Contains(NhaCungCap.Ma));
            if (!String.IsNullOrWhiteSpace(NhaCungCap.Ten))
                result = result.Where(p => p.Ten.Contains(NhaCungCap.Ten));

            result = result.OrderByDescending(p => p.UpdatedDate);

            int curPage = Page != null ? Convert.ToInt32(Page) : 1;
            var page = result.ToPagedListForEntityFramework(s => s.NhaCungCapId, curPage, PageSize);
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
