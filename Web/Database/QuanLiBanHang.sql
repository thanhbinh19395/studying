USE [master]
GO
/****** Object:  Database [QuanLiBanHang]    Script Date: 10/23/2016 11:21:49 AM ******/
CREATE DATABASE [QuanLiBanHang]
GO
ALTER DATABASE [QuanLiBanHang] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLiBanHang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLiBanHang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLiBanHang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLiBanHang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLiBanHang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLiBanHang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLiBanHang] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLiBanHang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLiBanHang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLiBanHang] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QuanLiBanHang] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QuanLiBanHang]
GO
/****** Object:  Table [dbo].[AnhHangHoa]    Script Date: 10/23/2016 11:21:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AnhHangHoa](
	[AnhHangHoaId] [bigint] IDENTITY(1,1) NOT NULL,
	[HangHoaId] [bigint] NULL,
	[LinkAnh] [varchar](250) NULL,
 CONSTRAINT [PK_AnhHangHoa] PRIMARY KEY CLUSTERED 
(
	[AnhHangHoaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 10/23/2016 11:21:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[ChiTietDonHangId] [bigint] IDENTITY(1,1) NOT NULL,
	[DonHangId] [bigint] NULL,
	[HangHoaId] [bigint] NULL,
	[SoLuong] [int] NULL,
	[GiaTien] [int] NULL,
	[GhiChu] [nvarchar](500) NULL,
 CONSTRAINT [PK_ChiTietDonHang] PRIMARY KEY CLUSTERED 
(
	[ChiTietDonHangId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietPhieuChi]    Script Date: 10/23/2016 11:21:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuChi](
	[ChiTietPhieuChiId] [bigint] IDENTITY(1,1) NOT NULL,
	[MoTa] [nvarchar](250) NULL,
	[TongTien] [int] NULL,
	[GhiChu] [nvarchar](250) NULL,
	[PhieuChiId] [bigint] NULL,
 CONSTRAINT [PK_ChiTietPhieuChi] PRIMARY KEY CLUSTERED 
(
	[ChiTietPhieuChiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 10/23/2016 11:21:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[DonHangId] [bigint] IDENTITY(1,1) NOT NULL,
	[NgayLap] [date] NULL,
	[ThanhTien] [int] NULL,
	[KhachHangId] [bigint] NULL,
	[GhiChu] [nvarchar](500) NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[DonHangId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HangHoa]    Script Date: 10/23/2016 11:21:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HangHoa](
	[HangHoaId] [bigint] IDENTITY(1,1) NOT NULL,
	[Ma] [varchar](50) NULL,
	[Ten] [nvarchar](100) NULL,
	[GiaBanThamKhao] [int] NULL,
	[MoTa] [nvarchar](500) NULL,
	[LoaiHangHoaId] [bigint] NULL,
	[NhaCungCapId] [bigint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_HangHoa] PRIMARY KEY CLUSTERED 
(
	[HangHoaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 10/23/2016 11:21:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[HoaDonId] [bigint] IDENTITY(1,1) NOT NULL,
	[DonHangId] [bigint] NULL,
	[NguoiLapId] [bigint] NULL,
	[NgayLap] [date] NULL,
	[ThanhTien] [int] NULL,
	[GhiChu] [nvarchar](500) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[HoaDonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiHangHoa]    Script Date: 10/23/2016 11:21:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoaiHangHoa](
	[LoaiHangHoaId] [bigint] IDENTITY(1,1) NOT NULL,
	[Ma] [varchar](50) NULL,
	[Ten] [nvarchar](100) NULL,
 CONSTRAINT [PK_LoaiHangHoa] PRIMARY KEY CLUSTERED 
(
	[LoaiHangHoaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MoTaThuocTinhHangHoa]    Script Date: 10/23/2016 11:21:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MoTaThuocTinhHangHoa](
	[MoTaThuocTinhHangHoaId] [bigint] IDENTITY(1,1) NOT NULL,
	[ThuocTinhHangHoaId] [bigint] NULL,
	[HangHoaId] [bigint] NULL,
	[MoTa] [nvarchar](100) NULL,
 CONSTRAINT [PK_MoTaThuocTinhHangHoa] PRIMARY KEY CLUSTERED 
(
	[MoTaThuocTinhHangHoaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 10/23/2016 11:21:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[NhaCungCapId] [bigint] IDENTITY(1,1) NOT NULL,
	[Ma] [varchar](50) NULL,
	[Ten] [nvarchar](100) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[NhaCungCapId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhieuChi]    Script Date: 10/23/2016 11:21:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuChi](
	[PhieuChiId] [bigint] IDENTITY(1,1) NOT NULL,
	[NguoiLap] [bigint] NULL,
	[TongTien] [int] NULL,
	[GhiChu] [nchar](10) NULL,
	[NgayLap] [date] NULL,
 CONSTRAINT [PK_PhieuChi] PRIMARY KEY CLUSTERED 
(
	[PhieuChiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quan]    Script Date: 10/23/2016 11:21:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quan](
	[QuanId] [bigint] IDENTITY(1,1) NOT NULL,
	[TinhThanhPhoId] [bigint] NULL,
	[Ten] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[QuanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThongTinNguoiDung]    Script Date: 10/23/2016 11:21:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ThongTinNguoiDung](
	[ThongTinNguoiDungId] [bigint] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](100) NULL,
	[SoDienThoai] [varchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[TinhThanhPhoId] [bigint] NULL,
	[QuanId] [bigint] NULL,
	[HinhAnh] [nvarchar](250) NULL,
 CONSTRAINT [PK_ThongTinNguoiDung] PRIMARY KEY CLUSTERED 
(
	[ThongTinNguoiDungId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ThuChi]    Script Date: 10/23/2016 11:21:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuChi](
	[ThuChiId] [bigint] IDENTITY(1,1) NOT NULL,
	[MaPhieu] [bigint] NULL,
	[TongTien] [int] NULL,
	[Ngay] [date] NULL,
 CONSTRAINT [PK_ThuChi] PRIMARY KEY CLUSTERED 
(
	[ThuChiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThuocTinhHangHoa]    Script Date: 10/23/2016 11:21:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuocTinhHangHoa](
	[ThuocTinhHangHoaId] [bigint] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](100) NULL,
 CONSTRAINT [PK_ThuocTinhHangHoa] PRIMARY KEY CLUSTERED 
(
	[ThuocTinhHangHoaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TinhThanhPho]    Script Date: 10/23/2016 11:21:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinhThanhPho](
	[TinhThanhPhoId] [bigint] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[TinhThanhPhoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 10/23/2016 11:21:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](250) NULL,
	[Email] [varchar](100) NULL,
	[EmailConfirmed] [bit] NULL,
	[Type] [int] NULL,
	[ThongTinNguoiDungId] [bigint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Quan] ON 

GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (1, 1, N'Ba Đình')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (2, 1, N'Hoàn Kiếm')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (3, 1, N'Tây Hồ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (4, 1, N'Long Biên')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (5, 1, N'Cầu Giấy')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (6, 1, N'Đống Đa')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (7, 1, N'Hai Bà Trưng')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (8, 1, N'Hoàng Mai')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (9, 1, N'Thanh Xuân')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (10, 1, N'Hà Đông')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (11, 1, N'Sơn Tây')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (12, 1, N'Sóc Sơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (13, 1, N'Đông Anh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (14, 1, N'Gia Lâm')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (15, 1, N'Từ Liêm')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (16, 1, N'Thanh Trì')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (17, 1, N'Mê Linh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (18, 1, N'Ba Vì')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (19, 1, N'Phúc Thọ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (20, 1, N'Đan Phượng')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (21, 1, N'Hoài Đức')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (22, 1, N'Quốc Oai')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (23, 1, N'Thạch Thất')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (24, 1, N'Chương Mỹ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (25, 1, N'Thanh Oai')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (26, 1, N'Thường Tín')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (27, 1, N'Phú Xuyên')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (28, 1, N'Ứng Hòa')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (29, 1, N'Mỹ Đức')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (30, 2, N'Hà Giang')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (31, 2, N'Đồng Văn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (32, 2, N'Mèo Vạc')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (33, 2, N'Yên Minh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (34, 2, N'Quản Bạ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (35, 2, N'Vị Xuyên')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (36, 2, N'Bắc Mê')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (37, 2, N'Hoàng Su Phì')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (38, 2, N'Xín Mần')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (39, 2, N'Bắc Quang')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (40, 2, N'Quang Bình')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (41, 4, N'Cao Bằng')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (42, 4, N'Bảo Lâm')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (43, 4, N'Bảo Lạc')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (44, 4, N'Thông Nông')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (45, 4, N'Hà Quảng')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (46, 4, N'Trà Lĩnh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (47, 4, N'Trùng Khánh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (48, 4, N'Hạ Lang')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (49, 4, N'Quảng Uyên')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (50, 4, N'Phục Hoà')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (51, 4, N'Hoà An')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (52, 4, N'Nguyên Bình')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (53, 4, N'Thạch An')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (54, 6, N'Bắc Kạn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (55, 6, N'Pác Nặm')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (56, 6, N'Ba Bể')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (57, 6, N'Ngân Sơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (58, 6, N'Bạch Thông')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (59, 6, N'Chợ Đồn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (60, 6, N'Chợ Mới')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (61, 6, N'Na Rì')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (62, 8, N'Tuyên Quang')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (63, 8, N'Nà Hang')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (64, 8, N'Chiêm Hóa')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (65, 8, N'Hàm Yên')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (66, 8, N'Yên Sơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (67, 8, N'Sơn Dương')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (68, 10, N'Lào Cai')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (69, 10, N'Bát Xát')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (70, 10, N'Mường Khương')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (71, 10, N'Si Ma Cai')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (72, 10, N'Bắc Hà')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (73, 10, N'Bảo Thắng')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (74, 10, N'Bảo Yên')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (75, 10, N'Sa Pa')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (76, 10, N'Văn Bàn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (77, 11, N'Điện Biên Phủ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (78, 11, N'Mường Lay')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (79, 11, N'Mường Nhé')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (80, 11, N'Mường Chà')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (81, 11, N'Tủa Chùa')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (82, 11, N'Tuần Giáo')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (83, 11, N'Điện Biên')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (84, 11, N'Điện Biên Đông')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (85, 11, N'Mường Ảng')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (86, 12, N'Lai Châu')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (87, 12, N'Tam Đường')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (88, 12, N'Mường Tè')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (89, 12, N'Sìn Hồ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (90, 12, N'Phong Thổ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (91, 12, N'Than Uyên')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (92, 12, N'Tân Uyên')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (93, 14, N'Sơn La')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (94, 14, N'Quỳnh Nhai')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (95, 14, N'Thuận Châu')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (96, 14, N'Mường La')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (97, 14, N'Bắc Yên')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (98, 14, N'Phù Yên')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (99, 14, N'Mộc Châu')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (100, 14, N'Yên Châu')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (101, 14, N'Mai Sơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (102, 14, N'Sông Mã')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (103, 14, N'Sốp Cộp')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (104, 15, N'Yên Bái')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (105, 15, N'Nghĩa Lộ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (106, 15, N'Lục Yên')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (107, 15, N'Văn Yên')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (108, 15, N'Mù Cang Chải')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (109, 15, N'Trấn Yên')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (110, 15, N'Trạm Tấu')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (111, 15, N'Văn Chấn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (112, 15, N'Yên Bình')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (113, 17, N'Hòa Bình')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (114, 17, N'Đà Bắc')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (115, 17, N'Kỳ Sơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (116, 17, N'Lương Sơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (117, 17, N'Kim Bôi')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (118, 17, N'Cao Phong')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (119, 17, N'Tân Lạc')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (120, 17, N'Mai Châu')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (121, 17, N'Lạc Sơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (122, 17, N'Yên Thủy')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (123, 17, N'Lạc Thủy')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (124, 19, N'Thái Nguyên')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (125, 19, N'Sông Công')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (126, 19, N'Định Hóa')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (127, 19, N'Phú Lương')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (128, 19, N'Đồng Hỷ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (129, 19, N'Võ Nhai')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (130, 19, N'Đại Từ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (131, 19, N'Phổ Yên')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (132, 19, N'Phú Bình')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (133, 20, N'Lạng Sơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (134, 20, N'Tràng Định')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (135, 20, N'Bình Gia')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (136, 20, N'Văn Lãng')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (137, 20, N'Cao Lộc')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (138, 20, N'Văn Quan')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (139, 20, N'Bắc Sơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (140, 20, N'Hữu Lũng')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (141, 20, N'Chi Lăng')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (142, 20, N'Lộc Bình')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (143, 20, N'Đình Lập')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (144, 22, N'Hạ Long')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (145, 22, N'Móng Cái')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (146, 22, N'Cẩm Phả')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (147, 22, N'Uông Bí')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (148, 22, N'Bình Liêu')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (149, 22, N'Tiên Yên')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (150, 22, N'Đầm Hà')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (151, 22, N'Hải Hà')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (152, 22, N'Ba Chẽ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (153, 22, N'Vân Đồn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (154, 22, N'Hoành Bồ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (155, 22, N'Đông Triều')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (156, 22, N'Yên Hưng')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (157, 22, N'Cô Tô')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (158, 24, N'Bắc Giang')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (159, 24, N'Yên Thế')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (160, 24, N'Tân Yên')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (161, 24, N'Lạng Giang')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (162, 24, N'Lục Nam')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (163, 24, N'Lục Ngạn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (164, 24, N'Sơn Động')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (165, 24, N'Yên Dũng')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (166, 24, N'Việt Yên')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (167, 24, N'Hiệp Hòa')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (168, 25, N'Việt Trì')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (169, 25, N'Phú Thọ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (170, 25, N'Đoan Hùng')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (171, 25, N'Hạ Hoà')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (172, 25, N'Thanh Ba')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (173, 25, N'Phù Ninh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (174, 25, N'Yên Lập')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (175, 25, N'Cẩm Khê')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (176, 25, N'Tam Nông')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (177, 25, N'Lâm Thao')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (178, 25, N'Thanh Sơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (179, 25, N'Thanh Thuỷ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (180, 25, N'Tân Sơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (181, 26, N'Vĩnh Yên')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (182, 26, N'Phúc Yên')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (183, 26, N'Lập Thạch')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (184, 26, N'Tam Dương')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (185, 26, N'Tam Đảo')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (186, 26, N'Bình Xuyên')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (187, 26, N'Yên Lạc')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (188, 26, N'Vĩnh Tường')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (189, 26, N'Sông Lô')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (190, 27, N'Bắc Ninh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (191, 27, N'Từ Sơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (192, 27, N'Yên Phong')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (193, 27, N'Quế Võ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (194, 27, N'Tiên Du')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (195, 27, N'Thuận Thành')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (196, 27, N'Gia Bình')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (197, 27, N'Lương Tài')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (198, 30, N'Hải Dương')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (199, 30, N'Chí Linh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (200, 30, N'Nam Sách')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (201, 30, N'Kinh Môn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (202, 30, N'Kim Thành')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (203, 30, N'Thanh Hà')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (204, 30, N'Cẩm Giàng')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (205, 30, N'Bình Giang')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (206, 30, N'Gia Lộc')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (207, 30, N'Tứ Kỳ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (208, 30, N'Ninh Giang')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (209, 30, N'Thanh Miện')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (210, 31, N'Hồng Bàng')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (211, 31, N'Ngô Quyền')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (212, 31, N'Lê Chân')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (213, 31, N'Hải An')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (214, 31, N'Kiến An')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (215, 31, N'Đồ Sơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (216, 31, N'Kinh Dương')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (217, 31, N'Thuỷ Nguyên')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (218, 31, N'An Dương')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (219, 31, N'An Lão')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (220, 31, N'Kiến Thụy')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (221, 31, N'Tiên Lãng')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (222, 31, N'Vĩnh Bảo')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (223, 31, N'Cát Hải')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (224, 31, N'Bạch Long Vĩ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (225, 33, N'Hưng Yên')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (226, 33, N'Văn Lâm')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (227, 33, N'Văn Giang')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (228, 33, N'Yên Mỹ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (229, 33, N'Mỹ Hào')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (230, 33, N'Ân Thi')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (231, 33, N'Khoái Châu')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (232, 33, N'Kim Động')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (233, 33, N'Tiên Lữ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (234, 33, N'Phù Cừ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (235, 34, N'Thái Bình')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (236, 34, N'Quỳnh Phụ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (237, 34, N'Hưng Hà')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (238, 34, N'Đông Hưng')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (239, 34, N'Thái Thụy')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (240, 34, N'Tiền Hải')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (241, 34, N'Kiến Xương')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (242, 34, N'Vũ Thư')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (243, 35, N'Phủ Lý')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (244, 35, N'Duy Tiên')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (245, 35, N'Kim Bảng')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (246, 35, N'Thanh Liêm')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (247, 35, N'Bình Lục')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (248, 35, N'Lý Nhân')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (249, 36, N'Nam Định')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (250, 36, N'Mỹ Lộc')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (251, 36, N'Vụ Bản')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (252, 36, N'Ý Yên')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (253, 36, N'Nghĩa Hưng')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (254, 36, N'Nam Trực')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (255, 36, N'Trực Ninh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (256, 36, N'Xuân Trường')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (257, 36, N'Giao Thủy')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (258, 36, N'Hải Hậu')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (259, 37, N'Ninh Bình')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (260, 37, N'Tam Điệp')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (261, 37, N'Nho Quan')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (262, 37, N'Gia Viễn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (263, 37, N'Hoa Lư')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (264, 37, N'Yên Khánh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (265, 37, N'Kim Sơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (266, 37, N'Yên Mô')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (267, 38, N'Thanh Hóa')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (268, 38, N'Bỉm Sơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (269, 38, N'Sầm Sơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (270, 38, N'Mường Lát')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (271, 38, N'Quan Hóa')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (272, 38, N'Bá Thước')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (273, 38, N'Quan Sơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (274, 38, N'Lang Chánh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (275, 38, N'Ngọc Lặc')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (276, 38, N'Cẩm Thủy')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (277, 38, N'Thạch Thành')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (278, 38, N'Hà Trung')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (279, 38, N'Vĩnh Lộc')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (280, 38, N'Yên Định')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (281, 38, N'Thọ Xuân')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (282, 38, N'Thường Xuân')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (283, 38, N'Triệu Sơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (284, 38, N'Thiệu Hoá')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (285, 38, N'Hoằng Hóa')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (286, 38, N'Hậu Lộc')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (287, 38, N'Nga Sơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (288, 38, N'Như Xuân')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (289, 38, N'Như Thanh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (290, 38, N'Nông Cống')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (291, 38, N'Đông Sơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (292, 38, N'Quảng Xương')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (293, 38, N'Tĩnh Gia')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (294, 40, N'Vinh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (295, 40, N'Cửa Lò')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (296, 40, N'Thái Hoà')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (297, 40, N'Quế Phong')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (298, 40, N'Quỳ Châu')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (299, 40, N'Kỳ Sơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (300, 40, N'Tương Dương')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (301, 40, N'Nghĩa Đàn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (302, 40, N'Quỳ Hợp')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (303, 40, N'Quỳnh Lưu')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (304, 40, N'Con Cuông')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (305, 40, N'Tân Kỳ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (306, 40, N'Anh Sơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (307, 40, N'Diễn Châu')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (308, 40, N'Yên Thành')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (309, 40, N'Đô Lương')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (310, 40, N'Thanh Chương')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (311, 40, N'Nghi Lộc')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (312, 40, N'Nam Đàn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (313, 40, N'Hưng Nguyên')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (314, 42, N'Hà Tĩnh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (315, 42, N'Hồng Lĩnh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (316, 42, N'Hương Sơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (317, 42, N'Đức Thọ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (318, 42, N'Vũ Quang')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (319, 42, N'Nghi Xuân')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (320, 42, N'Can Lộc')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (321, 42, N'Hương Khê')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (322, 42, N'Thạch Hà')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (323, 42, N'Cẩm Xuyên')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (324, 42, N'Kỳ Anh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (325, 42, N'Lộc Hà')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (326, 44, N'Đồng Hới')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (327, 44, N'Minh Hóa')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (328, 44, N'Tuyên Hóa')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (329, 44, N'Quảng Trạch')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (330, 44, N'Bố Trạch')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (331, 44, N'Quảng Ninh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (332, 44, N'Lệ Thủy')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (333, 45, N'Đông Hà')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (334, 45, N'Quảng Trị')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (335, 45, N'Vĩnh Linh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (336, 45, N'Hướng Hóa')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (337, 45, N'Gio Linh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (338, 45, N'Đa Krông')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (339, 45, N'Cam Lộ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (340, 45, N'Triệu Phong')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (341, 45, N'Hải Lăng')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (342, 45, N'Cồn Cỏ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (343, 46, N'Huế')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (344, 46, N'Phong Điền')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (345, 46, N'Quảng Điền')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (346, 46, N'Phú Vang')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (347, 46, N'Hương Thủy')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (348, 46, N'Hương Trà')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (349, 46, N'A Lưới')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (350, 46, N'Phú Lộc')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (351, 46, N'Nam Đông')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (352, 48, N'Liên Chiểu')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (353, 48, N'Thanh Khê')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (354, 48, N'Hải Châu')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (355, 48, N'Sơn Trà')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (356, 48, N'Ngũ Hành Sơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (357, 48, N'Cẩm Lệ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (358, 48, N'Hoà Vang')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (359, 48, N'Hoàng Sa')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (360, 49, N'Tam Kỳ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (361, 49, N'Hội An')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (362, 49, N'Tây Giang')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (363, 49, N'Đông Giang')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (364, 49, N'Đại Lộc')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (365, 49, N'Điện Bàn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (366, 49, N'Duy Xuyên')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (367, 49, N'Quế Sơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (368, 49, N'Nam Giang')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (369, 49, N'Phước Sơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (370, 49, N'Hiệp Đức')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (371, 49, N'Thăng Bình')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (372, 49, N'Tiên Phước')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (373, 49, N'Bắc Trà My')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (374, 49, N'Nam Trà My')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (375, 49, N'Núi Thành')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (376, 49, N'Phú Ninh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (377, 49, N'Nông Sơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (378, 51, N'Quảng Ngãi')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (379, 51, N'Bình Sơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (380, 51, N'Trà Bồng')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (381, 51, N'Tây Trà')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (382, 51, N'Sơn Tịnh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (383, 51, N'Tư Nghĩa')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (384, 51, N'Sơn Hà')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (385, 51, N'Sơn Tây')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (386, 51, N'Minh Long')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (387, 51, N'Nghĩa Hành')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (388, 51, N'Mộ Đức')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (389, 51, N'Đức Phổ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (390, 51, N'Ba Tơ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (391, 51, N'Lý Sơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (392, 52, N'Qui Nhơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (393, 52, N'An Lão')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (394, 52, N'Hoài Nhơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (395, 52, N'Hoài Ân')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (396, 52, N'Phù Mỹ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (397, 52, N'Vĩnh Thạnh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (398, 52, N'Tây Sơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (399, 52, N'Phù Cát')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (400, 52, N'An Nhơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (401, 52, N'Tuy Phước')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (402, 52, N'Vân Canh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (403, 54, N'Tuy Hòa')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (404, 54, N'Sông Cầu')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (405, 54, N'Đồng Xuân')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (406, 54, N'Tuy An')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (407, 54, N'Sơn Hòa')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (408, 54, N'Sông Hinh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (409, 54, N'Tây Hoà')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (410, 54, N'Phú Hoà')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (411, 54, N'Đông Hoà')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (412, 56, N'Nha Trang')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (413, 56, N'Cam Ranh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (414, 56, N'Cam Lâm')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (415, 56, N'Vạn Ninh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (416, 56, N'Ninh Hòa')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (417, 56, N'Khánh Vĩnh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (418, 56, N'Diên Khánh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (419, 56, N'Khánh Sơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (420, 56, N'Trường Sa')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (421, 58, N'Phan Rang-Tháp Chàm')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (422, 58, N'Bác Ái')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (423, 58, N'Ninh Sơn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (424, 58, N'Ninh Hải')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (425, 58, N'Ninh Phước')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (426, 58, N'Thuận Bắc')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (427, 58, N'Thuận Nam')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (428, 60, N'Phan Thiết')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (429, 60, N'La Gi')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (430, 60, N'Tuy Phong')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (431, 60, N'Bắc Bình')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (432, 60, N'Hàm Thuận Bắc')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (433, 60, N'Hàm Thuận Nam')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (434, 60, N'Tánh Linh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (435, 60, N'Đức Linh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (436, 60, N'Hàm Tân')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (437, 60, N'Phú Quí')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (438, 62, N'Kon Tum')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (439, 62, N'Đắk Glei')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (440, 62, N'Ngọc Hồi')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (441, 62, N'Đắk Tô')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (442, 62, N'Kon Plông')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (443, 62, N'Kon Rẫy')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (444, 62, N'Đắk Hà')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (445, 62, N'Sa Thầy')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (446, 62, N'Tu Mơ Rông')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (447, 64, N'Pleiku')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (448, 64, N'An Khê')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (449, 64, N'Ayun Pa')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (450, 64, N'Kbang')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (451, 64, N'Đăk Đoa')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (452, 64, N'Chư Păh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (453, 64, N'Ia Grai')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (454, 64, N'Mang Yang')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (455, 64, N'Kông Chro')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (456, 64, N'Đức Cơ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (457, 64, N'Chư Prông')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (458, 64, N'Chư Sê')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (459, 64, N'Đăk Pơ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (460, 64, N'Ia Pa')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (461, 64, N'Krông Pa')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (462, 64, N'Phú Thiện')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (463, 64, N'Chư Pưh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (464, 66, N'Buôn Ma Thuột')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (465, 66, N'Buôn Hồ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (466, 66, N'Ea Hleo')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (467, 66, N'Ea Súp')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (468, 66, N'Buôn Đôn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (469, 66, N'Cư Mgar')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (470, 66, N'Krông Búk')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (471, 66, N'Krông Năng')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (472, 66, N'Ea Kar')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (473, 66, N'Mđrắk')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (474, 66, N'Krông Bông')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (475, 66, N'Krông Pắc')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (476, 66, N'Krông A Na')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (477, 66, N'Lắk')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (478, 66, N'Cư Kuin')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (479, 67, N'Gia Nghĩa')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (480, 67, N'Đắk Glong')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (481, 67, N'Cư Jút')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (482, 67, N'Đắk Mil')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (483, 67, N'Krông Nô')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (484, 67, N'Đắk Song')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (485, 67, N'Đắk Rlấp')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (486, 67, N'Tuy Đức')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (487, 68, N'Đà Lạt')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (488, 68, N'Bảo Lộc')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (489, 68, N'Đam Rông')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (490, 68, N'Lạc Dương')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (491, 68, N'Lâm Hà')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (492, 68, N'Đơn Dương')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (493, 68, N'Đức Trọng')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (494, 68, N'Di Linh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (495, 68, N'Bảo Lâm')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (496, 68, N'Đạ Huoai')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (497, 68, N'Đạ Tẻh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (498, 68, N'Cát Tiên')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (499, 70, N'Đồng Xoài')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (500, 70, N'Phước Long')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (501, 70, N'Bình Long')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (502, 70, N'Bù Gia Mập')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (503, 70, N'Lộc Ninh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (504, 70, N'Bù Đốp')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (505, 70, N'Hớn Quản')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (506, 70, N'Đồng Phù')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (507, 70, N'Bù Đăng')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (508, 70, N'Chơn Thành')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (509, 72, N'Tây Ninh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (510, 72, N'Tân Biên')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (511, 72, N'Tân Châu')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (512, 72, N'Dương Minh Châu')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (513, 72, N'Châu Thành')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (514, 72, N'Hòa Thành')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (515, 72, N'Gò Dầu')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (516, 72, N'Bến Cầu')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (517, 72, N'Trảng Bàng')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (518, 74, N'Thủ Dầu Một')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (519, 74, N'Dầu Tiếng')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (520, 74, N'Bến Cát')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (521, 74, N'Phú Giáo')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (522, 74, N'Tân Uyên')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (523, 74, N'Dĩ An')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (524, 74, N'Thuận An')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (525, 75, N'Biên Hòa')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (526, 75, N'Long Khánh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (527, 75, N'Tân Phú')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (528, 75, N'Vĩnh Cửu')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (529, 75, N'Định Quán')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (530, 75, N'Trảng Bom')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (531, 75, N'Thống Nhất')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (532, 75, N'Cẩm Mỹ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (533, 75, N'Long Thành')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (534, 75, N'Xuân Lộc')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (535, 75, N'Nhơn Trạch')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (536, 77, N'Vũng Tầu')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (537, 77, N'Bà Rịa')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (538, 77, N'Châu Đức')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (539, 77, N'Xuyên Mộc')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (540, 77, N'Long Điền')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (541, 77, N'Đất Đỏ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (542, 77, N'Tân Thành')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (543, 77, N'Côn Đảo')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (544, 79, N'1')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (545, 79, N'12')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (546, 79, N'Thủ Đức')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (547, 79, N'9')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (548, 79, N'Gò Vấp')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (549, 79, N'Bình Thạnh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (550, 79, N'Tân Bình')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (551, 79, N'Tân Phú')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (552, 79, N'Phú Nhuận')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (553, 79, N'2')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (554, 79, N'3')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (555, 79, N'10')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (556, 79, N'11')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (557, 79, N'4')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (558, 79, N'5')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (559, 79, N'6')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (560, 79, N'8')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (561, 79, N'Bình Tân')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (562, 79, N'7')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (563, 79, N'Củ Chi')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (564, 79, N'Hóc Môn')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (565, 79, N'Bình Chánh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (566, 79, N'Nhà Bè')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (567, 79, N'Cần Giờ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (568, 80, N'Tân An')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (569, 80, N'Tân Hưng')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (570, 80, N'Vĩnh Hưng')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (571, 80, N'Mộc Hóa')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (572, 80, N'Tân Thạnh')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (573, 80, N'Thạnh Hóa')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (574, 80, N'Đức Huệ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (575, 80, N'Đức Hòa')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (576, 80, N'Bến Lức')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (577, 80, N'Thủ Thừa')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (578, 80, N'Tân Trụ')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (579, 80, N'Cần Đước')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (580, 80, N'Cần Giuộc')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (581, 80, N'Châu Thành')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (582, 82, N'Mỹ Tho')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (583, 82, N'Gò Công')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (584, 82, N'Tân Phước')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (585, 82, N'Cái Bè')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (586, 82, N'Cai Lậy')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (587, 82, N'Châu Thành')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (588, 82, N'Chợ Gạo')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (589, 82, N'Gò Công Tây')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (590, 82, N'Gò Công Đông')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (591, 82, N'Tân Phú Đông')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (592, 83, N'Bến Tre')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (593, 83, N'Châu Thành')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (594, 83, N'Chợ Lách')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (595, 83, N'Mỏ Cày Nam')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (596, 83, N'Giồng Trôm')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (597, 83, N'Bình Đại')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (598, 83, N'Ba Tri')
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten]) VALUES (599, 83, N'Thạnh Phú')
GO
SET IDENTITY_INSERT [dbo].[Quan] OFF
GO
SET IDENTITY_INSERT [dbo].[TinhThanhPho] ON 

GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (1, N'Hà Nội')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (2, N'Hà Giang')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (4, N'Cao Bằng')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (6, N'Bắc Kạn')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (8, N'Tuyên Quang')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (10, N'Lào Cai')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (11, N'Điện Biên')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (12, N'Lai Châu')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (14, N'Sơn La')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (15, N'Yên Bái')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (17, N'Hòa Bình')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (19, N'Thái Nguyên')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (20, N'Lạng Sơn')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (22, N'Quảng Ninh')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (24, N'Bắc Giang')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (25, N'Phú Thọ')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (26, N'Vĩnh Phúc')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (27, N'Bắc Ninh')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (30, N'Hải Dương')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (31, N'Hải Phòng')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (33, N'Hưng Yên')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (34, N'Thái Bình')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (35, N'Hà Nam')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (36, N'Nam Định')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (37, N'Ninh Bình')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (38, N'Thanh Hóa')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (40, N'Nghệ An')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (42, N'Hà Tĩnh')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (44, N'Quảng Bình')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (45, N'Quảng Trị')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (46, N'Thừa Thiên Huế')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (48, N'Đà Nẵng')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (49, N'Quảng Nam')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (51, N'Quảng Ngãi')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (52, N'Bình Định')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (54, N'Phú Yên')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (56, N'Khánh Hòa')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (58, N'Ninh Thuận')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (60, N'Bình Thuận')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (62, N'Kon Tum')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (64, N'Gia Lai')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (66, N'Đắk Lắk')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (67, N'Đắk Nông')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (68, N'Lâm Đồng')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (70, N'Bình Phước')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (72, N'Tây Ninh')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (74, N'Bình Dương')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (75, N'Đồng Nai')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (77, N'Bà Rịa - Vũng Tàu')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (79, N'Hồ Chí Minh')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (80, N'Long An')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (82, N'Tiền Giang')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (83, N'Bến Tre')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (84, N'Trà Vinh')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (86, N'Vĩnh Long')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (87, N'Đồng Tháp')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (89, N'An Giang')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (91, N'Kiên Giang')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (92, N'Cần Thơ')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (93, N'Hậu Giang')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (94, N'Sóc Trăng')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (95, N'Bạc Liêu')
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten]) VALUES (96, N'Cà Mau')
GO
SET IDENTITY_INSERT [dbo].[TinhThanhPho] OFF
GO
ALTER TABLE [dbo].[AnhHangHoa]  WITH CHECK ADD  CONSTRAINT [FK_AnhHangHoa_HangHoa] FOREIGN KEY([HangHoaId])
REFERENCES [dbo].[HangHoa] ([HangHoaId])
GO
ALTER TABLE [dbo].[AnhHangHoa] CHECK CONSTRAINT [FK_AnhHangHoa_HangHoa]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_DonHang] FOREIGN KEY([DonHangId])
REFERENCES [dbo].[DonHang] ([DonHangId])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_DonHang]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_HangHoa] FOREIGN KEY([HangHoaId])
REFERENCES [dbo].[HangHoa] ([HangHoaId])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_HangHoa]
GO
ALTER TABLE [dbo].[ChiTietPhieuChi]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuChi_PhieuChi] FOREIGN KEY([PhieuChiId])
REFERENCES [dbo].[PhieuChi] ([PhieuChiId])
GO
ALTER TABLE [dbo].[ChiTietPhieuChi] CHECK CONSTRAINT [FK_ChiTietPhieuChi_PhieuChi]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_HangHoa_LoaiHangHoa] FOREIGN KEY([LoaiHangHoaId])
REFERENCES [dbo].[LoaiHangHoa] ([LoaiHangHoaId])
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_HangHoa_LoaiHangHoa]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_HangHoa_NhaCungCap] FOREIGN KEY([NhaCungCapId])
REFERENCES [dbo].[NhaCungCap] ([NhaCungCapId])
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_HangHoa_NhaCungCap]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_DonHang] FOREIGN KEY([DonHangId])
REFERENCES [dbo].[DonHang] ([DonHangId])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_DonHang]
GO
ALTER TABLE [dbo].[MoTaThuocTinhHangHoa]  WITH CHECK ADD  CONSTRAINT [FK_MoTaThuocTinhHangHoa_HangHoa] FOREIGN KEY([HangHoaId])
REFERENCES [dbo].[HangHoa] ([HangHoaId])
GO
ALTER TABLE [dbo].[MoTaThuocTinhHangHoa] CHECK CONSTRAINT [FK_MoTaThuocTinhHangHoa_HangHoa]
GO
ALTER TABLE [dbo].[MoTaThuocTinhHangHoa]  WITH CHECK ADD  CONSTRAINT [FK_MoTaThuocTinhHangHoa_ThuocTinhHangHoa] FOREIGN KEY([ThuocTinhHangHoaId])
REFERENCES [dbo].[ThuocTinhHangHoa] ([ThuocTinhHangHoaId])
GO
ALTER TABLE [dbo].[MoTaThuocTinhHangHoa] CHECK CONSTRAINT [FK_MoTaThuocTinhHangHoa_ThuocTinhHangHoa]
GO
ALTER TABLE [dbo].[Quan]  WITH CHECK ADD  CONSTRAINT [FK_Quan_TinhThanhPho] FOREIGN KEY([TinhThanhPhoId])
REFERENCES [dbo].[TinhThanhPho] ([TinhThanhPhoId])
GO
ALTER TABLE [dbo].[Quan] CHECK CONSTRAINT [FK_Quan_TinhThanhPho]
GO
ALTER TABLE [dbo].[ThongTinNguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_ThongTinNguoiDung_Quan] FOREIGN KEY([QuanId])
REFERENCES [dbo].[Quan] ([QuanId])
GO
ALTER TABLE [dbo].[ThongTinNguoiDung] CHECK CONSTRAINT [FK_ThongTinNguoiDung_Quan]
GO
ALTER TABLE [dbo].[ThongTinNguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_ThongTinNguoiDung_TinhThanhPho] FOREIGN KEY([TinhThanhPhoId])
REFERENCES [dbo].[TinhThanhPho] ([TinhThanhPhoId])
GO
ALTER TABLE [dbo].[ThongTinNguoiDung] CHECK CONSTRAINT [FK_ThongTinNguoiDung_TinhThanhPho]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_ThongTinNguoiDung] FOREIGN KEY([ThongTinNguoiDungId])
REFERENCES [dbo].[ThongTinNguoiDung] ([ThongTinNguoiDungId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_ThongTinNguoiDung]
GO
USE [master]
GO
ALTER DATABASE [QuanLiBanHang] SET  READ_WRITE 
GO
