namespace TB.Domain.EntityModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Quan")]
    public partial class Quan
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Quan()
        {
            //ThongTinNguoiDungs = new HashSet<ThongTinNguoiDung>();
        }

        public long QuanId { get; set; }

        public long? TinhThanhPhoId { get; set; }

        [StringLength(100)]
        public string Ten { get; set; }

        //public virtual TinhThanhPho TinhThanhPho { get; set; }

        //[System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        //public virtual ICollection<ThongTinNguoiDung> ThongTinNguoiDungs { get; set; }
    }
}
