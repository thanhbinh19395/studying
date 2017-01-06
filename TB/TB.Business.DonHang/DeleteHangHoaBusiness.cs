using System.Web.Mvc;
using TB.AnhHangHoaRepo;
using TB.BaseRepo;
using TB.Domain.EntityModel;
using TB.HangHoaRepo;
namespace TB.DonHangBus
{
    public class DeleteHangHoaBusiness : BaseRepository<int>
    {
        public long HangHoaId { get; set; }
        public override Result<int> ExecuteCore(Controller CurrentContext)
        {
            AnhHangHoaDeleteByHangHoaIdRepository ahhRepo = new AnhHangHoaDeleteByHangHoaIdRepository { HangHoaId = this.HangHoaId };
            HangHoaDeleteRepository hhRepo = new HangHoaDeleteRepository { HangHoaId = HangHoaId };
            if (ahhRepo.Execute(CurrentContext).IsSuccess == true)
            {
                return hhRepo.Execute(CurrentContext);
            }
            return Fail();
        }
    }
}
