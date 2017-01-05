using System;
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
            #region Search
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
