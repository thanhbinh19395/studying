namespace TB.Domain.EntityModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("LoaiHangHoa")]
    public partial class LoaiHangHoa
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public LoaiHangHoa()
        {
            //HangHoas = new HashSet<HangHoa>();
        }

        public long LoaiHangHoaId { get; set; }

        [StringLength(50)]
        [CaseSensitive]
        public string Ma { get; set; }

        [StringLength(100)]
        public string Ten { get; set; }

        //[System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        //public virtual ICollection<HangHoa> HangHoas { get; set; }
    }
}
