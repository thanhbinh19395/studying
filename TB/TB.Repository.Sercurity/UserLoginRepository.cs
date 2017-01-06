using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;
using TB.Sercurity;

namespace TB.SercurityRepo
{
    public class UserLoginRepository : BaseRepository<User>
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public bool IsRemember { get; set; }
        public string ReturnUrl { get; set; }
        public override Result<User> ExecuteCore(Controller CurrentContext)
        {
            //Username = AESHandler.Encrypt(Username);
            Password = AESHandler.Encrypt(Password);
            var user = db.Users.SingleOrDefault(p => p.Username == Username && p.Password == Password);
            if (user == null)
            {
                throw new Exception("Tên đăng nhập hoặc mật khẩu không đúng");
            }
            return Success(user);
        }
    }
}
