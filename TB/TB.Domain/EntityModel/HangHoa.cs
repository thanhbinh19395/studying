namespace TB.Domain.EntityModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HangHoa")]
    public partial class HangHoa
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public HangHoa()
        {
            AnhHangHoas = new HashSet<AnhHangHoa>();
            ChiTietDonHangs = new HashSet<ChiTietDonHang>();
            MoTaThuocTinhHangHoas = new HashSet<MoTaThuocTinhHangHoa>();
        }

        public long HangHoaId { get; set; }

        [StringLength(50)]
        [CaseSensitive]
        public string Ma { get; set; }

        [StringLength(100)]
        public string Ten { get; set; }

        public int? GiaBanThamKhao { get; set; }

        [StringLength(500)]
        public string MoTa { get; set; }

        public long? LoaiHangHoaId { get; set; }

        public long? NhaCungCapId { get; set; }

        public bool? IsActive { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AnhHangHoa> AnhHangHoas { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietDonHang> ChiTietDonHangs { get; set; }

        public virtual LoaiHangHoa LoaiHangHoa { get; set; }

        public virtual NhaCungCap NhaCungCap { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MoTaThuocTinhHangHoa> MoTaThuocTinhHangHoas { get; set; }
    }
}
