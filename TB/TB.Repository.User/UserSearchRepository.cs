using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;
using X.PagedList;

namespace TB.UserRepo
{
    public class UserSearchRepository : BaseRepository<dynamic>
    {
        public User User { get; set; }
        public override Result<dynamic> ExecuteCore(Controller CurrentContext)
        {
            #region Get List
            //if (User == null || Extensions.DeepEquals(User, new User()))
            //{
            //    var tmp = db.Users.ToPagedListForEntityFramework(s => s.UserId, Convert.ToInt32(Page), PageSize);
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
            //var result = db.Users.Where(
            //    p =>
            //    p.UserId == User.UserId ||
            //    p.Username.Contains(User.Username) ||
            //    p.Type == User.Type ||
            //    p.ThongTinNguoiDungId == User.ThongTinNguoiDungId
            //    );
            if (User == null)
                User = new User();

            var result = db.Users.AsQueryable();

            if (!String.IsNullOrWhiteSpace(User.Username))
                result = result.Where(p => p.Username.Contains(User.Username));
            if (!String.IsNullOrWhiteSpace(User.Email))
                result = result.Where(p => p.Email.Contains(User.Email));
            if (User.Type != null)
                result = result.Where(p => p.Type == User.Type);
            if (User.ThongTinNguoiDungId != null)
                result = result.Where(p => p.ThongTinNguoiDungId == User.ThongTinNguoiDungId);

            result = result.OrderByDescending(p => p.UpdatedDate);

            int curPage = Page != null ? Convert.ToInt32(Page) : 1;
            var page = result.ToPagedListForEntityFramework(s => s.UserId, curPage, PageSize);
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
