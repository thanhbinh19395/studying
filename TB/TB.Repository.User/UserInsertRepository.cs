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
    public class UserInsertRepository: BaseRepository<long>
    {
        public User User { get; set; }

        public override Result<long> ExecuteCore(Controller CurrentContext)
        {
            User.CreatedDate = DateTime.Now;
            User.UpdatedDate = DateTime.Now;

            User.Password = AESHandler.Encrypt(User.Password);
            db.Users.Add(User);
            db.SaveChanges();
            return Success(this.User.UserId);
        }
    }
}
