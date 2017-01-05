using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;
using TB.Sercurity;

namespace TB.UserRepo
{
    public class UserUpdateRepository: BaseRepository<int>
    {
        public User User { get; set; }

        public override Result<int> ExecuteCore(Controller CurrentContext)
        {
            var user = db.Users.SingleOrDefault(p => p.UserId == this.User.UserId);
            //user.Username = User.Username;
            user.Password = AESHandler.Encrypt(User.Password);
            user.Email = User.Email;
            user.Type = User.Type;
            user.ThongTinNguoiDungId = User.ThongTinNguoiDungId;
            return Success(db.SaveChanges());
        }
    }
}
