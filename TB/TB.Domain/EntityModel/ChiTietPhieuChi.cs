namespace TB.Domain.EntityModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChiTietPhieuChi")]
    public partial class ChiTietPhieuChi
    {
        public long ChiTietPhieuChiId { get; set; }

        [StringLength(250)]
        public string MoTa { get; set; }

        public int? TongTien { get; set; }

        [StringLength(250)]
        public string GhiChu { get; set; }

        public long? PhieuChiId { get; set; }

        public virtual PhieuChi PhieuChi { get; set; }
    }
}
