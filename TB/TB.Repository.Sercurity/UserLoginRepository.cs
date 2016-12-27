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
    public class UserLoginRepository : BaseRepository<bool>
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public bool IsRemember { get; set; }
        public string ReturnUrl { get; set; }
        public override Result<bool> ExecuteCore(Controller CurrentContext)
        {
            Username = AESHandler.Encrypt(Username);
            Password = AESHandler.Encrypt(Password);
            var count = db.Users.Count(p => p.Username == Username && p.Password == Password);
            if (count != 1)
            {
                throw new Exception("Tên đăng nhập hoặc mật khẩu không đúng");
            }
            return Success(true);
        }
    }
}
