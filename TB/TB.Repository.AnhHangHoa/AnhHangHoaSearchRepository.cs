using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;
using X.PagedList;

namespace TB.AnhHangHoaRepo
{
    public class AnhHangHoaSearchRepository : BaseRepository<dynamic>
    {
        public long? HangHoaId { get; set; }
        public override Result<dynamic> ExecuteCore(Controller CurrentContext)
        {
            var result = db.AnhHangHoas.AsQueryable();
            if (HangHoaId != null)
                result = result.Where(p => p.HangHoaId == HangHoaId);

            result = result.OrderByDescending(p => p.UpdatedDate);

            int curPage = Page != null ? Convert.ToInt32(Page) : 1;
            var page = result.ToPagedListForEntityFramework(s => s.AnhHangHoaId, curPage, PageSize);
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
