using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;

namespace TB.UserRepo
{
    public class UserUpdateRepository: BaseRepository<int>
    {
        public User User { get; set; }

        public override Result<int> ExecuteCore(Controller CurrentContext)
        {
            var lhh = db.Users.SingleOrDefault(p => p.UserId == this.User.UserId);
            lhh.Username = User.Username;
            lhh.Password = User.Password;
            lhh.Email = User.Email;
            lhh.EmailConfirmed = User.EmailConfirmed;
            lhh.Type = User.Type;
            lhh.ThongTinNguoiDungId = User.ThongTinNguoiDungId;
            lhh.IsActive = User.IsActive;
            return Success(db.SaveChanges());
        }
    }
}
