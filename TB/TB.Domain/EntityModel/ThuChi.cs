namespace TB.Domain.EntityModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ThuChi")]
    public partial class ThuChi
    {
        public long ThuChiId { get; set; }

        public long? MaPhieu { get; set; }

        public int? TongTien { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Ngay { get; set; }

        public DateTime? CreatedDate { get; set; }
        public DateTime? UpdatedDate { get; set; }

    }
}
