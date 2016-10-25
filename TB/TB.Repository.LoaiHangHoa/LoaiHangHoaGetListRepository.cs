using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TB.BaseRepo;
using TB.Domain.EntityModel;
namespace TB.LoaiHangHoaRepo
{
    public class LoaiHangHoaGetListRepository: BaseRepository
    {
        public List<LoaiHangHoa> Excute()
        {
            return db.LoaiHangHoas.ToList();
        }
        public string ExcuteJson()
        {
            return JsonConvert.SerializeObject(this.Excute(), Formatting.Indented);
        }
    }
}
