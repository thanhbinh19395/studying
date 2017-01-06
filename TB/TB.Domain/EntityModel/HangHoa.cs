namespace TB.Domain.EntityModel
{
    using NPOI.Extension;
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
            //ChiTietDonHangs = new HashSet<ChiTietDonHang>();
        }

        public long HangHoaId { get; set; }

        [StringLength(50)]
        [CaseSensitive]
        [NPOI.Extension.Column(Index = 0, Title = "Mã", AllowMerge = false)]
        public string Ma { get; set; }

        [StringLength(100)]
        [NPOI.Extension.Column(Index = 1, Title = "Tên", AllowMerge = false)]
        public string Ten { get; set; }

        [NPOI.Extension.Column(Index = 4, Title = "Giá bán", AllowMerge = false)]
        public int? GiaBanThamKhao { get; set; }

        public string MoTa { get; set; }

        public long? LoaiHangHoaId { get; set; }

        public long? NhaCungCapId { get; set; }

        public bool? IsActive { get; set; }

        [NPOI.Extension.Column(Index = 2, Title = "Loại Hàng hóa", AllowMerge = false)]
        public string TenLoaiHangHoa
        {
            get
            {
                if (this.LoaiHangHoa == null)
                    return null;
                return this.LoaiHangHoa.Ten;

            }
        }

        [NPOI.Extension.Column(Index = 3, Title = "Nhà cung cấp", AllowMerge = false)]
        public string TenNhaCungCap
        {
            get
            {
                if (this.NhaCungCap == null)
                    return null;
                return this.NhaCungCap.Ten;
            }
        }

        public DateTime? CreatedDate { get; set; }
        public DateTime? UpdatedDate { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AnhHangHoa> AnhHangHoas { get; set; }

        //[System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        //public virtual ICollection<ChiTietDonHang> ChiTietDonHangs { get; set; }

        public virtual LoaiHangHoa LoaiHangHoa { get; set; }

        public virtual NhaCungCap NhaCungCap { get; set; }

    }
}

