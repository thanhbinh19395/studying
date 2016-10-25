namespace TB.Domain.EntityModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ThuocTinhHangHoa")]
    public partial class ThuocTinhHangHoa
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ThuocTinhHangHoa()
        {
            MoTaThuocTinhHangHoas = new HashSet<MoTaThuocTinhHangHoa>();
        }

        public long ThuocTinhHangHoaId { get; set; }

        [StringLength(100)]
        public string Ten { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MoTaThuocTinhHangHoa> MoTaThuocTinhHangHoas { get; set; }
    }
}
