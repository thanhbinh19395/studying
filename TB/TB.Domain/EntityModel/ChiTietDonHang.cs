namespace TB.Domain.EntityModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChiTietDonHang")]
    public partial class ChiTietDonHang
    {

        public long ChiTietDonHangId { get; set; }

        public long? DonHangId { get; set; }

        public long? HangHoaId { get; set; }

        public int? SoLuong { get; set; }

        public int? GiaTien { get; set; }

        [StringLength(500)]
        public string GhiChu { get; set; }

        public virtual DonHang DonHang { get; set; }

        public virtual HangHoa HangHoa { get; set; }
    }
}
