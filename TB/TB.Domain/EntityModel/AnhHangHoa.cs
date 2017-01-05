namespace TB.Domain.EntityModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("AnhHangHoa")]
    public partial class AnhHangHoa
    {
        public long AnhHangHoaId { get; set; }

        public long? HangHoaId { get; set; }

        [StringLength(250)]
        public string LinkAnh { get; set; }

        [StringLength(250)]
        public string LinkAnhMini { get; set; }
        
        //public virtual HangHoa HangHoa { get; set; }
    }
}
