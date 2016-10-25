namespace TB.Domain.EntityModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ThongTinNguoiDung")]
    public partial class ThongTinNguoiDung
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ThongTinNguoiDung()
        {
            Users = new HashSet<User>();
        }

        public long ThongTinNguoiDungId { get; set; }

        [StringLength(100)]
        public string HoTen { get; set; }

        [StringLength(20)]
        public string SoDienThoai { get; set; }

        [StringLength(100)]
        public string Email { get; set; }

        [StringLength(100)]
        public string DiaChi { get; set; }

        public long? TinhThanhPhoId { get; set; }

        public long? QuanId { get; set; }

        [StringLength(250)]
        public string HinhAnh { get; set; }

        public virtual Quan Quan { get; set; }

        public virtual TinhThanhPho TinhThanhPho { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<User> Users { get; set; }
    }
}
