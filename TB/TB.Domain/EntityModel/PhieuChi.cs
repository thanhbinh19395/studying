namespace TB.Domain.EntityModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PhieuChi")]
    public partial class PhieuChi
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PhieuChi()
        {
            ChiTietPhieuChis = new HashSet<ChiTietPhieuChi>();
        }

        public long PhieuChiId { get; set; }

        public long? NguoiLap { get; set; }

        public int? TongTien { get; set; }

        [StringLength(10)]
        public string GhiChu { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayLap { get; set; }

        public DateTime? CreatedDate { get; set; }
        public DateTime? UpdatedDate { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietPhieuChi> ChiTietPhieuChis { get; set; }
    }
}
