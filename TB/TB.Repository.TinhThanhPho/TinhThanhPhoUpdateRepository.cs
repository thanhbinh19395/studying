using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;

namespace TB.TinhThanhPhoRepo
{
    public class TinhThanhPhoUpdateRepository : BaseRepository<int>
    {
        public TinhThanhPho TinhThanhPho { get; set; }
        public override void ValidateCore(Controller CurrentContext)
        {
            if (db.TinhThanhPhoes.Count(p => p.TinhThanhPhoId == TinhThanhPho.TinhThanhPhoId) > 1)
                throw new Exception("Đã tồn tại Tỉnh thành phố có tên là : " + this.TinhThanhPho.Ten);
        }
        public override Result<int> ExecuteCore(Controller CurrentContext)
        {
            var lhh = db.TinhThanhPhoes.SingleOrDefault(p => p.TinhThanhPhoId == this.TinhThanhPho.TinhThanhPhoId);
            lhh.TinhThanhPhoId = TinhThanhPho.TinhThanhPhoId;
            lhh.Ten = TinhThanhPho.Ten;

            return Success(db.SaveChanges());
        }
    }
}
