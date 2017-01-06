namespace TB.Domain.EntityModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HoaDon")]
    public partial class HoaDon
    {
        public long HoaDonId { get; set; }

        public long? DonHangId { get; set; }

        public long? NguoiLapId { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayLap { get; set; }

        public int? ThanhTien { get; set; }

        [StringLength(500)]
        public string GhiChu { get; set; }

        public DateTime? CreatedDate { get; set; }
        public DateTime? UpdatedDate { get; set; }

        public virtual DonHang DonHang { get; set; }
    }
}
