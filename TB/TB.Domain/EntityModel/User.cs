namespace TB.Domain.EntityModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("User")]
    public partial class User
    {
        public long UserId { get; set; }

        [StringLength(50)]
        public string Username { get; set; }

        [StringLength(250)]
        public string Password { get; set; }

        [StringLength(100)]
        public string Email { get; set; }

        public bool? EmailConfirmed { get; set; }

        public int? Type { get; set; }

        public long? ThongTinNguoiDungId { get; set; }

        public bool? IsActive { get; set; }

        public DateTime? CreatedDate { get; set; }
        public DateTime? UpdatedDate { get; set; }

        public virtual ThongTinNguoiDung ThongTinNguoiDung { get; set; }
    }
}
