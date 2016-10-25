namespace TB.Domain.EntityModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("MoTaThuocTinhHangHoa")]
    public partial class MoTaThuocTinhHangHoa
    {
        public long MoTaThuocTinhHangHoaId { get; set; }

        public long? ThuocTinhHangHoaId { get; set; }

        public long? HangHoaId { get; set; }

        [StringLength(100)]
        public string MoTa { get; set; }

        public virtual HangHoa HangHoa { get; set; }

        public virtual ThuocTinhHangHoa ThuocTinhHangHoa { get; set; }
    }
}
