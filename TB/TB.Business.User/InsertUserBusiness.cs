using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TB.BaseRepo;
using TB.Domain.EntityModel;
using TB.UserRepo;
using TB.ThongTinNguoiDungRepo;
using System.Web.Mvc;

namespace TB.UserBus
{
    public class InsertUserBusiness: BaseRepository<long>
    {
        public User User { get; set; }
        public ThongTinNguoiDung ThongTinNguoiDung { get; set; }
        public override Result<long> ExecuteCore(Controller CurrentContext)
        {
            ThongTinNguoiDungInsertRepository ttndInsert = new ThongTinNguoiDungInsertRepository { ThongTinNguoiDung = this.ThongTinNguoiDung };
            var ttndInsertResult = ttndInsert.Execute(CurrentContext);
            if (ttndInsertResult.IsSuccess == false)
                return Fail(ttndInsertResult.Message);
            var ttndId = ttndInsertResult.Data;

            this.User.ThongTinNguoiDungId = ttndId;
            UserInsertRepository usInsert = new UserInsertRepository { User = this.User };
            var usInsertResult = usInsert.Execute(CurrentContext);
            if (usInsertResult.IsSuccess == false)
                return Fail(usInsertResult.Message);
            return Success(usInsertResult.Data);
        }
    }
}
