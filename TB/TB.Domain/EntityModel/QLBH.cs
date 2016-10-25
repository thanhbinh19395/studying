namespace TB.Domain.EntityModel
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class QLBH : DbContext
    {
        public QLBH()
            : base("name=QLBH")
        {
        }

        public virtual DbSet<AnhHangHoa> AnhHangHoas { get; set; }
        public virtual DbSet<ChiTietDonHang> ChiTietDonHangs { get; set; }
        public virtual DbSet<ChiTietPhieuChi> ChiTietPhieuChis { get; set; }
        public virtual DbSet<DonHang> DonHangs { get; set; }
        public virtual DbSet<HangHoa> HangHoas { get; set; }
        public virtual DbSet<HoaDon> HoaDons { get; set; }
        public virtual DbSet<LoaiHangHoa> LoaiHangHoas { get; set; }
        public virtual DbSet<MoTaThuocTinhHangHoa> MoTaThuocTinhHangHoas { get; set; }
        public virtual DbSet<NhaCungCap> NhaCungCaps { get; set; }
        public virtual DbSet<PhieuChi> PhieuChis { get; set; }
        public virtual DbSet<Quan> Quans { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<ThongTinNguoiDung> ThongTinNguoiDungs { get; set; }
        public virtual DbSet<ThuChi> ThuChis { get; set; }
        public virtual DbSet<ThuocTinhHangHoa> ThuocTinhHangHoas { get; set; }
        public virtual DbSet<TinhThanhPho> TinhThanhPhoes { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AnhHangHoa>()
                .Property(e => e.LinkAnh)
                .IsUnicode(false);

            modelBuilder.Entity<HangHoa>()
                .Property(e => e.Ma)
                .IsUnicode(false);

            modelBuilder.Entity<LoaiHangHoa>()
                .Property(e => e.Ma)
                .IsUnicode(false);

            modelBuilder.Entity<NhaCungCap>()
                .Property(e => e.Ma)
                .IsUnicode(false);

            modelBuilder.Entity<PhieuChi>()
                .Property(e => e.GhiChu)
                .IsFixedLength();

            modelBuilder.Entity<ThongTinNguoiDung>()
                .Property(e => e.SoDienThoai)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Username)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Email)
                .IsUnicode(false);
        }
    }
}
