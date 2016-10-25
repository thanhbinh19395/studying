using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TB.Domain.EntityModel;

namespace TB.BaseRepo
{
    public class BaseRepository
    {
        protected QLBH db { get; set; }
        protected int? Page { get; set; }
        protected int PageSize { get; set; }
        public BaseRepository()
        {
            PageSize = 20;
            Page = 1;
            db = new QLBH();
        }
    }
}
