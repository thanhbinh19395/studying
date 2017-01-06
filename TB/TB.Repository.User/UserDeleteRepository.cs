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
    public class UserDeleteRepository: BaseRepository<int>
    {
        public long UserId { get; set; }
        public override Result<int> ExecuteCore(Controller CurrentContext)
        {
            db.Users.Remove(db.Users.Single(p => p.UserId == this.UserId));
            return Success(db.SaveChanges());
        }
    }
}
