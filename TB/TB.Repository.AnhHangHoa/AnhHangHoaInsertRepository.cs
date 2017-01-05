using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;

namespace TB.AnhHangHoaRepo
{
    public class AnhHangHoaInsertRepository : BaseRepository<int>
    {
        public AnhHangHoa AnhHangHoa { get; set; }

        public override Result<int> ExecuteCore(Controller CurrentContext)
        {
            db.AnhHangHoas.Add(AnhHangHoa);
            return Success(db.SaveChanges());
        }
    }
}
