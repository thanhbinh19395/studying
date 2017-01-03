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
    public class UserGetByIdRepository : BaseRepository<User>
    {
        public long UserId { get; set; }
        public override Result<User> ExecuteCore(Controller CurrentContext)
        {
            return Success(db.Users.Single(p => p.UserId == this.UserId));
        }
    }
}
