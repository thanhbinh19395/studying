﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TB.BaseRepo;
using TB.Domain.EntityModel;

namespace TB.LoaiHangHoaRepo
{
    public class LoaiHangHoaInsertRepository : BaseRepository<int>
    {
        public LoaiHangHoa LoaiHangHoa { get; set; }

        public override Result<int> ExecuteCore(Controller CurrentContext)
        {
            if (db.LoaiHangHoas.SingleOrDefault(p => p.Ma == this.LoaiHangHoa.Ma) != null)
                return Fail("Đã tồn tại Loại hàng hóa có mã là : " + this.LoaiHangHoa.Ma);

            db.LoaiHangHoas.Add(LoaiHangHoa);
            return Success(db.SaveChanges());
        }
    }
}
