using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;
using X.PagedList;
namespace TB.TinhThanhPhoRepo
{
    public class TinhThanhPhoSearchRepository : BaseRepository<dynamic>
    {
        public TinhThanhPho TinhThanhPho { get; set; }
        public override Result<dynamic> ExecuteCore(Controller CurrentContext)
        {
            #region Get List
            //if (TinhThanhPho == null || Extensions.DeepEquals(TinhThanhPho, new TinhThanhPho()))
            //{
            //    var tmp = db.TinhThanhPhoes.ToPagedListForEntityFramework(s => s.TinhThanhPhoId, Convert.ToInt32(Page), PageSize);
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
            //var result = db.TinhThanhPhoes.Where(
            //    p =>
            //    p.Ten.Contains(TinhThanhPho.Ten) );
            if (TinhThanhPho == null)
                TinhThanhPho = new TinhThanhPho();

            var result = db.TinhThanhPhoes.AsQueryable();

            if (!String.IsNullOrWhiteSpace(TinhThanhPho.Ten))
                result = result.Where(p => p.Ten.Contains(TinhThanhPho.Ten));

            result = result.OrderByDescending(p => p.UpdatedDate);

            int curPage = Page != null ? Convert.ToInt32(Page) : 1;
            var page = result.ToPagedListForEntityFramework(s => s.TinhThanhPhoId, curPage, PageSize);
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
