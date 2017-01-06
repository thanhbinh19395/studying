USE [master]
GO
/****** Object:  Database [QuanLiBanHang]    Script Date: 1/6/2017 10:45:32 PM ******/
CREATE DATABASE [QuanLiBanHang]
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
USE [QuanLiBanHang]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [QuanLiBanHang]
GO
/****** Object:  Table [dbo].[AnhHangHoa]    Script Date: 1/6/2017 10:45:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnhHangHoa](
	[AnhHangHoaId] [bigint] IDENTITY(1,1) NOT NULL,
	[HangHoaId] [bigint] NULL,
	[LinkAnh] [varchar](250) NULL,
	[LinkAnhMini] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_AnhHangHoa] PRIMARY KEY CLUSTERED 
(
	[AnhHangHoaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 1/6/2017 10:45:32 PM ******/
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
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_ChiTietDonHang] PRIMARY KEY CLUSTERED 
(
	[ChiTietDonHangId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietPhieuChi]    Script Date: 1/6/2017 10:45:32 PM ******/
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
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_ChiTietPhieuChi] PRIMARY KEY CLUSTERED 
(
	[ChiTietPhieuChiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 1/6/2017 10:45:32 PM ******/
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
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[DonHangId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HangHoa]    Script Date: 1/6/2017 10:45:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangHoa](
	[HangHoaId] [bigint] IDENTITY(1,1) NOT NULL,
	[Ma] [varchar](50) NULL,
	[Ten] [nvarchar](100) NULL,
	[GiaBanThamKhao] [int] NULL,
	[MoTa] [nvarchar](max) NULL,
	[LoaiHangHoaId] [bigint] NULL,
	[NhaCungCapId] [bigint] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_HangHoa] PRIMARY KEY CLUSTERED 
(
	[HangHoaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 1/6/2017 10:45:32 PM ******/
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
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[HoaDonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiHangHoa]    Script Date: 1/6/2017 10:45:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiHangHoa](
	[LoaiHangHoaId] [bigint] IDENTITY(1,1) NOT NULL,
	[Ma] [varchar](50) NULL,
	[Ten] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_LoaiHangHoa] PRIMARY KEY CLUSTERED 
(
	[LoaiHangHoaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MoTaThuocTinhHangHoa]    Script Date: 1/6/2017 10:45:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MoTaThuocTinhHangHoa](
	[MoTaThuocTinhHangHoaId] [bigint] IDENTITY(1,1) NOT NULL,
	[ThuocTinhHangHoaId] [bigint] NULL,
	[HangHoaId] [bigint] NULL,
	[MoTa] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_MoTaThuocTinhHangHoa] PRIMARY KEY CLUSTERED 
(
	[MoTaThuocTinhHangHoaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 1/6/2017 10:45:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[NhaCungCapId] [bigint] IDENTITY(1,1) NOT NULL,
	[Ma] [varchar](50) NULL,
	[Ten] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[NhaCungCapId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuChi]    Script Date: 1/6/2017 10:45:32 PM ******/
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
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PhieuChi] PRIMARY KEY CLUSTERED 
(
	[PhieuChiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quan]    Script Date: 1/6/2017 10:45:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quan](
	[QuanId] [bigint] IDENTITY(1,1) NOT NULL,
	[TinhThanhPhoId] [bigint] NULL,
	[Ten] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[QuanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThongTinNguoiDung]    Script Date: 1/6/2017 10:45:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_ThongTinNguoiDung] PRIMARY KEY CLUSTERED 
(
	[ThongTinNguoiDungId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThuChi]    Script Date: 1/6/2017 10:45:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuChi](
	[ThuChiId] [bigint] IDENTITY(1,1) NOT NULL,
	[MaPhieu] [bigint] NULL,
	[TongTien] [int] NULL,
	[Ngay] [date] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_ThuChi] PRIMARY KEY CLUSTERED 
(
	[ThuChiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThuocTinhHangHoa]    Script Date: 1/6/2017 10:45:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuocTinhHangHoa](
	[ThuocTinhHangHoaId] [bigint] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_ThuocTinhHangHoa] PRIMARY KEY CLUSTERED 
(
	[ThuocTinhHangHoaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TinhThanhPho]    Script Date: 1/6/2017 10:45:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinhThanhPho](
	[TinhThanhPhoId] [bigint] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[TinhThanhPhoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 1/6/2017 10:45:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ChiTietPhieuChi] ON 

INSERT [dbo].[ChiTietPhieuChi] ([ChiTietPhieuChiId], [MoTa], [TongTien], [GhiChu], [PhieuChiId], [CreatedDate], [UpdatedDate]) VALUES (1, N'không có', 123000, N'ad', NULL, NULL, NULL)
INSERT [dbo].[ChiTietPhieuChi] ([ChiTietPhieuChiId], [MoTa], [TongTien], [GhiChu], [PhieuChiId], [CreatedDate], [UpdatedDate]) VALUES (2, N'đt', 600000, N'không có', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ChiTietPhieuChi] OFF
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([DonHangId], [NgayLap], [ThanhTien], [KhachHangId], [GhiChu], [CreatedDate], [UpdatedDate]) VALUES (2, CAST(N'2016-10-05' AS Date), 123145324, 1234563454, N'1234567', NULL, NULL)
INSERT [dbo].[DonHang] ([DonHangId], [NgayLap], [ThanhTien], [KhachHangId], [GhiChu], [CreatedDate], [UpdatedDate]) VALUES (3, CAST(N'2016-12-03' AS Date), 12321, 123, N'4123', NULL, NULL)
INSERT [dbo].[DonHang] ([DonHangId], [NgayLap], [ThanhTien], [KhachHangId], [GhiChu], [CreatedDate], [UpdatedDate]) VALUES (4, CAST(N'2017-01-06' AS Date), 1000, 3, NULL, CAST(N'2017-01-06T20:37:17.923' AS DateTime), CAST(N'2017-01-06T20:37:17.923' AS DateTime))
SET IDENTITY_INSERT [dbo].[DonHang] OFF
SET IDENTITY_INSERT [dbo].[HangHoa] ON 

INSERT [dbo].[HangHoa] ([HangHoaId], [Ma], [Ten], [GiaBanThamKhao], [MoTa], [LoaiHangHoaId], [NhaCungCapId], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (1, N'12', N'SF-P', 1000, N'none', 2, 5, NULL, NULL, NULL)
INSERT [dbo].[HangHoa] ([HangHoaId], [Ma], [Ten], [GiaBanThamKhao], [MoTa], [LoaiHangHoaId], [NhaCungCapId], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (2, N'LV', N'Levis', 1000000, N'quần', 3, 3, NULL, NULL, NULL)
INSERT [dbo].[HangHoa] ([HangHoaId], [Ma], [Ten], [GiaBanThamKhao], [MoTa], [LoaiHangHoaId], [NhaCungCapId], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (4, N'SS', N'Galaxy S7', 13000000, N'điện thoại', 2, 5, NULL, NULL, NULL)
INSERT [dbo].[HangHoa] ([HangHoaId], [Ma], [Ten], [GiaBanThamKhao], [MoTa], [LoaiHangHoaId], [NhaCungCapId], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (5, N'SS1', N'S7 Edge', 16000000, N'<p>Tạo ra một sản phẩm mới đủ tốt đ&atilde; kh&oacute;, nhưng tạo ra một sản phẩm xuất sắc hơn, ho&agrave;n thiện hơn sản phẩm cũ lại c&agrave;ng kh&oacute; hơn, nhất l&agrave; khi chiếc m&aacute;y cũ được đ&aacute;nh gi&aacute; rất cao về cả thiết kế, t&iacute;nh năng cũng như trải nghiệm người d&ugrave;ng.&nbsp;<a href="https://tinhte.vn/tags/danh-gia-samsung-galaxy-s7-edge/">Đ&aacute;nh gi&aacute; Samsung Galaxy S7 edge</a>&nbsp;thực chất giống so s&aacute;nh n&oacute; với Galaxy S6 edge hơn l&agrave; một b&agrave;i đ&aacute;nh gi&aacute; độc lập, v&igrave; Samsung đ&atilde; sửa chữa gần như tất cả những g&igrave; chưa ho&agrave;n thiện tr&ecirc;n Galaxy S6 edge, đồng thời bổ sung th&ecirc;m nhiều t&iacute;nh năng mới.</p>

<p><br />
<br />
​</p>

<p><strong>Thiết kế:&nbsp;</strong><br />
&nbsp;</p>

<p><strong><img alt="Danh_gia_review_samsung_galaxy_s7_edge_tinhte.vn-3.jpg" src="https://tinhte.vn/store/2016/03/3640374_Danh_gia_review_samsung_galaxy_s7_edge_tinhte.vn-3.jpg" /></strong><br />
​</p>

<p>Y hệt Galaxy S6e, chỉ ph&oacute;ng to l&ecirc;n l&agrave; những điểm m&agrave; bạn nghe người ta n&oacute;i r&acirc;t nhiều về&nbsp;<a href="https://tinhte.vn/tags/galaxy-s7e/">Galaxy S7e</a>. nhưng đ&oacute; c&oacute; thể l&agrave; những nhận định sai nhất m&agrave; bạn c&oacute; về S7 edge.&nbsp;<a href="https://tinhte.vn/tags/samsung-galaxy-s7-edge/">Samsung Galaxy S7 edge</a>&nbsp;cao thon hơn, hẹp về bề ngang hơn hẳn so với Galaxy s6e hay S6e Plus, những đặc điểm tối quan trọng để cầm v&agrave; sử dụng một chiếc điện thoại. Với việc smartphone ng&agrave;y c&agrave;ng lớn hơn th&igrave; chiếc m&aacute;y thon gọn sẽ gi&uacute;p tay ch&uacute;ng ta thoải m&aacute;i v&agrave; dễ chịu hơn, đặc biệt l&agrave; khi thao t&aacute;c một tay.</p>

<p><br />
<img alt="Danh_gia_review_samsung_galaxy_s7_edge_tinhte.vn-14.jpg" src="https://tinhte.vn/store/2016/03/3640383_Danh_gia_review_samsung_galaxy_s7_edge_tinhte.vn-14.jpg" /><br />
​</p>

<p>So với hầu hết c&aacute;c điện thoại 5.5&rdquo; kh&aacute;c tr&ecirc;n thị trường, Galaxy S7e nhỏ v&agrave; gọn g&agrave;ng đ&aacute;ng kể. Kh&ocirc;ng chỉ k&iacute;ch thước vật l&yacute; m&agrave; cảm nhận đ&oacute; c&ograve;n đến từ c&aacute;ch thiết kế với mặt k&iacute;nh cong ở cả mặt trước v&agrave; sau. Tr&ecirc;n Galaxy S6 v&agrave; Note 5 th&igrave; người d&ugrave;ng vẫn kh&oacute; chịu với c&aacute;c cạnh tiếp x&uacute;c, đặc biệt l&agrave; ở mặt sau nhưng tr&ecirc;n S7 edge mọi thứ đ&atilde; trở n&ecirc;n mượt v&agrave; phẳng hơn rất nhiều. Nếu để &yacute;, bạn sẽ thấy mặt k&iacute;nh cong của S7e vuốt nhẹ ở cả đỉnh v&agrave; đ&aacute;y m&aacute;y, cả ph&iacute;a trước v&agrave; ph&iacute;a sau, n&ecirc;n n&oacute; lu&ocirc;n cho cảm gi&aacute;c trơn tru, mịn m&agrave;ng.</p>

<p><br />
<img alt="Danh_gia_review_samsung_galaxy_s7_edge_tinhte.vn-5.jpg" src="https://tinhte.vn/store/2016/03/3640372_Danh_gia_review_samsung_galaxy_s7_edge_tinhte.vn-5.jpg" /><br />
​</p>

<p>Camera &iacute;t lồi hơn, chỉ c&ograve;n nhỉnh nhẹ so với bề mặt nắp lưng cũng l&agrave; một cải tiến đ&aacute;ng quan t&acirc;m kh&aacute;c của S7e, nhất l&agrave; khi Samsung đ&atilde; đầu tư thay đổi rất nhiều về mặt t&iacute;nh năng cho n&oacute;.</p>

<p><br />
<img alt="Danh_gia_review_samsung_galaxy_s7_edge_tinhte.vn-7.jpg" src="https://tinhte.vn/store/2016/03/3640371_Danh_gia_review_samsung_galaxy_s7_edge_tinhte.vn-7.jpg" /></p>
', 1, 5, NULL, NULL, CAST(N'2017-01-06T21:49:20.480' AS DateTime))
INSERT [dbo].[HangHoa] ([HangHoaId], [Ma], [Ten], [GiaBanThamKhao], [MoTa], [LoaiHangHoaId], [NhaCungCapId], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (6, N'2', N'fdaf', NULL, NULL, 3, 4, NULL, NULL, NULL)
INSERT [dbo].[HangHoa] ([HangHoaId], [Ma], [Ten], [GiaBanThamKhao], [MoTa], [LoaiHangHoaId], [NhaCungCapId], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (8, N'fdaf', N'dfakfs', 12000000, N'k', 3, 5, NULL, NULL, NULL)
INSERT [dbo].[HangHoa] ([HangHoaId], [Ma], [Ten], [GiaBanThamKhao], [MoTa], [LoaiHangHoaId], [NhaCungCapId], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (11, N'124', N'dfaẻ', 45656, NULL, 2, 4, NULL, NULL, NULL)
INSERT [dbo].[HangHoa] ([HangHoaId], [Ma], [Ten], [GiaBanThamKhao], [MoTa], [LoaiHangHoaId], [NhaCungCapId], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (12, N'SMF-20', N'Note 7', 18000000, NULL, 2, 5, NULL, NULL, NULL)
INSERT [dbo].[HangHoa] ([HangHoaId], [Ma], [Ten], [GiaBanThamKhao], [MoTa], [LoaiHangHoaId], [NhaCungCapId], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (13, N'SMG-20', N'S7 Edge', 100000, N'<p><img src="undefined" /></p>
', 3, 3, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HangHoa] OFF
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([HoaDonId], [DonHangId], [NguoiLapId], [NgayLap], [ThanhTien], [GhiChu], [CreatedDate], [UpdatedDate]) VALUES (1, 2, 1, CAST(N'2016-10-05' AS Date), 1234563456, N'123', NULL, NULL)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
SET IDENTITY_INSERT [dbo].[LoaiHangHoa] ON 

INSERT [dbo].[LoaiHangHoa] ([LoaiHangHoaId], [Ma], [Ten], [CreatedDate], [UpdatedDate]) VALUES (1, N'a102', N'tuan gay', NULL, CAST(N'2017-01-06T17:11:22.483' AS DateTime))
INSERT [dbo].[LoaiHangHoa] ([LoaiHangHoaId], [Ma], [Ten], [CreatedDate], [UpdatedDate]) VALUES (2, N'SF1233', N'Surface', NULL, CAST(N'2017-01-06T17:13:02.377' AS DateTime))
INSERT [dbo].[LoaiHangHoa] ([LoaiHangHoaId], [Ma], [Ten], [CreatedDate], [UpdatedDate]) VALUES (3, N'MS', N'Microsoft', NULL, CAST(N'2017-01-06T20:53:23.363' AS DateTime))
SET IDENTITY_INSERT [dbo].[LoaiHangHoa] OFF
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([NhaCungCapId], [Ma], [Ten], [CreatedDate], [UpdatedDate]) VALUES (3, N'MS', N'Microsoft', NULL, NULL)
INSERT [dbo].[NhaCungCap] ([NhaCungCapId], [Ma], [Ten], [CreatedDate], [UpdatedDate]) VALUES (4, N'AP', N'Táo', NULL, CAST(N'2017-01-06T21:00:45.740' AS DateTime))
INSERT [dbo].[NhaCungCap] ([NhaCungCapId], [Ma], [Ten], [CreatedDate], [UpdatedDate]) VALUES (5, N'SS', N'Samsung', NULL, NULL)
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
SET IDENTITY_INSERT [dbo].[PhieuChi] ON 

INSERT [dbo].[PhieuChi] ([PhieuChiId], [NguoiLap], [TongTien], [GhiChu], [NgayLap], [CreatedDate], [UpdatedDate]) VALUES (1, 1, 123000, NULL, CAST(N'2017-05-01' AS Date), NULL, NULL)
INSERT [dbo].[PhieuChi] ([PhieuChiId], [NguoiLap], [TongTien], [GhiChu], [NgayLap], [CreatedDate], [UpdatedDate]) VALUES (2, 3, 600000, N'none      ', CAST(N'2017-01-05' AS Date), NULL, NULL)
SET IDENTITY_INSERT [dbo].[PhieuChi] OFF
SET IDENTITY_INSERT [dbo].[Quan] ON 

INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (1, 1, N'Ba Đình', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (2, 1, N'Hoàn Kiếm', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (3, 1, N'Tây Hồ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (4, 1, N'Long Biên', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (5, 1, N'Cầu Giấy', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (6, 1, N'Đống Đa', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (7, 1, N'Hai Bà Trưng', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (8, 1, N'Hoàng Mai', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (9, 1, N'Thanh Xuân', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (10, 1, N'Hà Đông', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (11, 1, N'Sơn Tây', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (12, 1, N'Sóc Sơn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (13, 1, N'Đông Anh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (14, 1, N'Gia Lâm', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (15, 1, N'Từ Liêm', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (16, 1, N'Thanh Trì', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (17, 1, N'Mê Linh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (18, 1, N'Ba Vì', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (19, 1, N'Phúc Thọ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (20, 1, N'Đan Phượng', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (21, 1, N'Hoài Đức 1', NULL, CAST(N'2017-01-06T21:04:44.217' AS DateTime))
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (22, 1, N'Quốc Oai', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (23, 1, N'Thạch Thất', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (24, 1, N'Chương Mỹ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (25, 1, N'Thanh Oai', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (26, 1, N'Thường Tín', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (27, 1, N'Phú Xuyên', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (28, 1, N'Ứng Hòa', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (29, 1, N'Mỹ Đức', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (30, 2, N'Hà Giang', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (31, 2, N'Đồng Văn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (32, 2, N'Mèo Vạc', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (33, 2, N'Yên Minh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (34, 2, N'Quản Bạ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (35, 2, N'Vị Xuyên', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (36, 2, N'Bắc Mê', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (37, 2, N'Hoàng Su Phì', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (38, 2, N'Xín Mần', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (39, 2, N'Bắc Quang', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (40, 2, N'Quang Bình', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (41, 4, N'Cao Bằng', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (42, 4, N'Bảo Lâm', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (43, 4, N'Bảo Lạc', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (44, 4, N'Thông Nông', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (45, 4, N'Hà Quảng', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (46, 4, N'Trà Lĩnh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (47, 4, N'Trùng Khánh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (48, 4, N'Hạ Lang', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (49, 4, N'Quảng Uyên', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (50, 4, N'Phục Hoà', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (51, 4, N'Hoà An', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (52, 4, N'Nguyên Bình', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (53, 4, N'Thạch An', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (54, 6, N'Bắc Kạn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (55, 6, N'Pác Nặm', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (56, 6, N'Ba Bể', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (57, 6, N'Ngân Sơn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (58, 6, N'Bạch Thông', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (59, 6, N'Chợ Đồn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (60, 6, N'Chợ Mới', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (61, 6, N'Na Rì', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (62, 8, N'Tuyên Quang', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (63, 8, N'Nà Hang', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (64, 8, N'Chiêm Hóa', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (65, 8, N'Hàm Yên', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (66, 8, N'Yên Sơn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (67, 8, N'Sơn Dương', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (68, 10, N'Lào Cai', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (69, 10, N'Bát Xát', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (70, 10, N'Mường Khương', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (71, 10, N'Si Ma Cai', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (72, 10, N'Bắc Hà', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (73, 10, N'Bảo Thắng', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (74, 10, N'Bảo Yên', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (75, 10, N'Sa Pa', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (76, 10, N'Văn Bàn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (77, 11, N'Điện Biên Phủ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (78, 11, N'Mường Lay', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (79, 11, N'Mường Nhé', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (80, 11, N'Mường Chà', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (81, 11, N'Tủa Chùa', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (82, 11, N'Tuần Giáo', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (83, 11, N'Điện Biên', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (84, 11, N'Điện Biên Đông', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (85, 11, N'Mường Ảng', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (86, 12, N'Lai Châu', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (87, 12, N'Tam Đường', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (88, 12, N'Mường Tè', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (89, 12, N'Sìn Hồ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (90, 12, N'Phong Thổ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (91, 12, N'Than Uyên', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (92, 12, N'Tân Uyên', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (93, 14, N'Sơn La', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (94, 14, N'Quỳnh Nhai', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (95, 14, N'Thuận Châu', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (96, 14, N'Mường La', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (97, 14, N'Bắc Yên', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (98, 14, N'Phù Yên', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (99, 14, N'Mộc Châu', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (100, 14, N'Yên Châu', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (101, 14, N'Mai Sơn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (102, 14, N'Sông Mã', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (103, 14, N'Sốp Cộp', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (104, 15, N'Yên Bái', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (105, 15, N'Nghĩa Lộ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (106, 15, N'Lục Yên', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (107, 15, N'Văn Yên', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (108, 15, N'Mù Cang Chải', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (109, 15, N'Trấn Yên', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (110, 15, N'Trạm Tấu', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (111, 15, N'Văn Chấn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (112, 15, N'Yên Bình', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (113, 17, N'Hòa Bình', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (114, 17, N'Đà Bắc', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (115, 17, N'Kỳ Sơn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (116, 17, N'Lương Sơn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (117, 17, N'Kim Bôi', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (118, 17, N'Cao Phong', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (119, 17, N'Tân Lạc', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (120, 17, N'Mai Châu', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (121, 17, N'Lạc Sơn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (122, 17, N'Yên Thủy', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (123, 17, N'Lạc Thủy', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (124, 19, N'Thái Nguyên', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (125, 19, N'Sông Công', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (126, 19, N'Định Hóa', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (127, 19, N'Phú Lương', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (128, 19, N'Đồng Hỷ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (129, 19, N'Võ Nhai', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (130, 19, N'Đại Từ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (131, 19, N'Phổ Yên', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (132, 19, N'Phú Bình', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (133, 20, N'Lạng Sơn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (134, 20, N'Tràng Định', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (135, 20, N'Bình Gia', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (136, 20, N'Văn Lãng', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (137, 20, N'Cao Lộc', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (138, 20, N'Văn Quan', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (139, 20, N'Bắc Sơn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (140, 20, N'Hữu Lũng', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (141, 20, N'Chi Lăng', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (142, 20, N'Lộc Bình', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (143, 20, N'Đình Lập', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (144, 22, N'Hạ Long', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (145, 22, N'Móng Cái', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (146, 22, N'Cẩm Phả', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (147, 22, N'Uông Bí', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (148, 22, N'Bình Liêu', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (149, 22, N'Tiên Yên', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (150, 22, N'Đầm Hà', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (151, 22, N'Hải Hà', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (152, 22, N'Ba Chẽ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (153, 22, N'Vân Đồn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (154, 22, N'Hoành Bồ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (155, 22, N'Đông Triều', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (156, 22, N'Yên Hưng', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (157, 22, N'Cô Tô', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (158, 24, N'Bắc Giang', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (159, 24, N'Yên Thế', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (160, 24, N'Tân Yên', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (161, 24, N'Lạng Giang', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (162, 24, N'Lục Nam', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (163, 24, N'Lục Ngạn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (164, 24, N'Sơn Động', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (165, 24, N'Yên Dũng', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (166, 24, N'Việt Yên', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (167, 24, N'Hiệp Hòa', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (168, 25, N'Việt Trì', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (169, 25, N'Phú Thọ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (170, 25, N'Đoan Hùng', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (171, 25, N'Hạ Hoà', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (172, 25, N'Thanh Ba', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (173, 25, N'Phù Ninh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (174, 25, N'Yên Lập', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (175, 25, N'Cẩm Khê', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (176, 25, N'Tam Nông', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (177, 25, N'Lâm Thao', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (178, 25, N'Thanh Sơn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (179, 25, N'Thanh Thuỷ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (180, 25, N'Tân Sơn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (181, 26, N'Vĩnh Yên', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (182, 26, N'Phúc Yên', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (183, 26, N'Lập Thạch', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (184, 26, N'Tam Dương', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (185, 26, N'Tam Đảo', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (186, 26, N'Bình Xuyên', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (187, 26, N'Yên Lạc', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (188, 26, N'Vĩnh Tường', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (189, 26, N'Sông Lô', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (190, 27, N'Bắc Ninh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (191, 27, N'Từ Sơn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (192, 27, N'Yên Phong', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (193, 27, N'Quế Võ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (194, 27, N'Tiên Du', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (195, 27, N'Thuận Thành', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (196, 27, N'Gia Bình', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (197, 27, N'Lương Tài', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (198, 30, N'Hải Dương', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (199, 30, N'Chí Linh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (200, 30, N'Nam Sách', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (201, 30, N'Kinh Môn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (202, 30, N'Kim Thành', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (203, 30, N'Thanh Hà', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (204, 30, N'Cẩm Giàng', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (205, 30, N'Bình Giang', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (206, 30, N'Gia Lộc', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (207, 30, N'Tứ Kỳ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (208, 30, N'Ninh Giang', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (209, 30, N'Thanh Miện', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (210, 31, N'Hồng Bàng', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (211, 31, N'Ngô Quyền', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (212, 31, N'Lê Chân', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (213, 31, N'Hải An', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (214, 31, N'Kiến An', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (215, 31, N'Đồ Sơn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (216, 31, N'Kinh Dương', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (217, 31, N'Thuỷ Nguyên', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (218, 31, N'An Dương', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (219, 31, N'An Lão', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (220, 31, N'Kiến Thụy', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (221, 31, N'Tiên Lãng', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (222, 31, N'Vĩnh Bảo', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (223, 31, N'Cát Hải', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (224, 31, N'Bạch Long Vĩ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (225, 33, N'Hưng Yên', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (226, 33, N'Văn Lâm', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (227, 33, N'Văn Giang', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (228, 33, N'Yên Mỹ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (229, 33, N'Mỹ Hào', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (230, 33, N'Ân Thi', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (231, 33, N'Khoái Châu', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (232, 33, N'Kim Động', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (233, 33, N'Tiên Lữ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (234, 33, N'Phù Cừ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (235, 34, N'Thái Bình', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (236, 34, N'Quỳnh Phụ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (237, 34, N'Hưng Hà', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (238, 34, N'Đông Hưng', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (239, 34, N'Thái Thụy', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (240, 34, N'Tiền Hải', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (241, 34, N'Kiến Xương', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (242, 34, N'Vũ Thư', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (243, 35, N'Phủ Lý', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (244, 35, N'Duy Tiên', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (245, 35, N'Kim Bảng', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (246, 35, N'Thanh Liêm', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (247, 35, N'Bình Lục', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (248, 35, N'Lý Nhân', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (249, 36, N'Nam Định', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (250, 36, N'Mỹ Lộc', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (251, 36, N'Vụ Bản', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (252, 36, N'Ý Yên', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (253, 36, N'Nghĩa Hưng', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (254, 36, N'Nam Trực', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (255, 36, N'Trực Ninh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (256, 36, N'Xuân Trường', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (257, 36, N'Giao Thủy', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (258, 36, N'Hải Hậu', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (259, 37, N'Ninh Bình', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (260, 37, N'Tam Điệp', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (261, 37, N'Nho Quan', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (262, 37, N'Gia Viễn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (263, 37, N'Hoa Lư', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (264, 37, N'Yên Khánh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (265, 37, N'Kim Sơn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (266, 37, N'Yên Mô', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (267, 38, N'Thanh Hóa', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (268, 38, N'Bỉm Sơn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (269, 38, N'Sầm Sơn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (270, 38, N'Mường Lát', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (271, 38, N'Quan Hóa', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (272, 38, N'Bá Thước', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (273, 38, N'Quan Sơn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (274, 38, N'Lang Chánh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (275, 38, N'Ngọc Lặc', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (276, 38, N'Cẩm Thủy', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (277, 38, N'Thạch Thành', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (278, 38, N'Hà Trung', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (279, 38, N'Vĩnh Lộc', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (280, 38, N'Yên Định', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (281, 38, N'Thọ Xuân', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (282, 38, N'Thường Xuân', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (283, 38, N'Triệu Sơn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (284, 38, N'Thiệu Hoá', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (285, 38, N'Hoằng Hóa', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (286, 38, N'Hậu Lộc', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (287, 38, N'Nga Sơn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (288, 38, N'Như Xuân', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (289, 38, N'Như Thanh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (290, 38, N'Nông Cống', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (291, 38, N'Đông Sơn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (292, 38, N'Quảng Xương', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (293, 38, N'Tĩnh Gia', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (294, 40, N'Vinh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (295, 40, N'Cửa Lò', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (296, 40, N'Thái Hoà', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (297, 40, N'Quế Phong', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (298, 40, N'Quỳ Châu', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (299, 40, N'Kỳ Sơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (300, 40, N'Tương Dương', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (301, 40, N'Nghĩa Đàn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (302, 40, N'Quỳ Hợp', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (303, 40, N'Quỳnh Lưu', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (304, 40, N'Con Cuông', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (305, 40, N'Tân Kỳ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (306, 40, N'Anh Sơn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (307, 40, N'Diễn Châu', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (308, 40, N'Yên Thành', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (309, 40, N'Đô Lương', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (310, 40, N'Thanh Chương', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (311, 40, N'Nghi Lộc', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (312, 40, N'Nam Đàn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (313, 40, N'Hưng Nguyên', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (314, 42, N'Hà Tĩnh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (315, 42, N'Hồng Lĩnh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (316, 42, N'Hương Sơn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (317, 42, N'Đức Thọ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (318, 42, N'Vũ Quang', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (319, 42, N'Nghi Xuân', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (320, 42, N'Can Lộc', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (321, 42, N'Hương Khê', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (322, 42, N'Thạch Hà', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (323, 42, N'Cẩm Xuyên', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (324, 42, N'Kỳ Anh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (325, 42, N'Lộc Hà', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (326, 44, N'Đồng Hới', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (327, 44, N'Minh Hóa', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (328, 44, N'Tuyên Hóa', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (329, 44, N'Quảng Trạch', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (330, 44, N'Bố Trạch', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (331, 44, N'Quảng Ninh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (332, 44, N'Lệ Thủy', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (333, 45, N'Đông Hà', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (334, 45, N'Quảng Trị', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (335, 45, N'Vĩnh Linh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (336, 45, N'Hướng Hóa', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (337, 45, N'Gio Linh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (338, 45, N'Đa Krông', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (339, 45, N'Cam Lộ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (340, 45, N'Triệu Phong', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (341, 45, N'Hải Lăng', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (342, 45, N'Cồn Cỏ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (343, 46, N'Huế', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (344, 46, N'Phong Điền', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (345, 46, N'Quảng Điền', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (346, 46, N'Phú Vang', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (347, 46, N'Hương Thủy', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (348, 46, N'Hương Trà', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (349, 46, N'A Lưới', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (350, 46, N'Phú Lộc', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (351, 46, N'Nam Đông', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (352, 48, N'Liên Chiểu', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (353, 48, N'Thanh Khê', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (354, 48, N'Hải Châu', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (355, 48, N'Sơn Trà', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (356, 48, N'Ngũ Hành Sơn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (357, 48, N'Cẩm Lệ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (358, 48, N'Hoà Vang', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (359, 48, N'Hoàng Sa', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (360, 49, N'Tam Kỳ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (361, 49, N'Hội An', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (362, 49, N'Tây Giang', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (363, 49, N'Đông Giang', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (364, 49, N'Đại Lộc', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (365, 49, N'Điện Bàn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (366, 49, N'Duy Xuyên', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (367, 49, N'Quế Sơn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (368, 49, N'Nam Giang', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (369, 49, N'Phước Sơn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (370, 49, N'Hiệp Đức', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (371, 49, N'Thăng Bình', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (372, 49, N'Tiên Phước', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (373, 49, N'Bắc Trà My', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (374, 49, N'Nam Trà My', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (375, 49, N'Núi Thành', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (376, 49, N'Phú Ninh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (377, 49, N'Nông Sơn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (378, 51, N'Quảng Ngãi', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (379, 51, N'Bình Sơn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (380, 51, N'Trà Bồng', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (381, 51, N'Tây Trà', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (382, 51, N'Sơn Tịnh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (383, 51, N'Tư Nghĩa', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (384, 51, N'Sơn Hà', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (385, 51, N'Sơn Tây', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (386, 51, N'Minh Long', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (387, 51, N'Nghĩa Hành', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (388, 51, N'Mộ Đức', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (389, 51, N'Đức Phổ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (390, 51, N'Ba Tơ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (391, 51, N'Lý Sơn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (392, 52, N'Qui Nhơn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (393, 52, N'An Lão', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (394, 52, N'Hoài Nhơn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (395, 52, N'Hoài Ân', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (396, 52, N'Phù Mỹ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (397, 52, N'Vĩnh Thạnh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (398, 52, N'Tây Sơn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (399, 52, N'Phù Cát', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (400, 52, N'An Nhơn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (401, 52, N'Tuy Phước', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (402, 52, N'Vân Canh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (403, 54, N'Tuy Hòa', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (404, 54, N'Sông Cầu', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (405, 54, N'Đồng Xuân', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (406, 54, N'Tuy An', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (407, 54, N'Sơn Hòa', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (408, 54, N'Sông Hinh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (409, 54, N'Tây Hoà', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (410, 54, N'Phú Hoà', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (411, 54, N'Đông Hoà', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (412, 56, N'Nha Trang', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (413, 56, N'Cam Ranh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (414, 56, N'Cam Lâm', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (415, 56, N'Vạn Ninh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (416, 56, N'Ninh Hòa', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (417, 56, N'Khánh Vĩnh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (418, 56, N'Diên Khánh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (419, 56, N'Khánh Sơn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (420, 56, N'Trường Sa', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (421, 58, N'Phan Rang-Tháp Chàm', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (422, 58, N'Bác Ái', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (423, 58, N'Ninh Sơn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (424, 58, N'Ninh Hải', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (425, 58, N'Ninh Phước', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (426, 58, N'Thuận Bắc', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (427, 58, N'Thuận Nam', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (428, 60, N'Phan Thiết', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (429, 60, N'La Gi', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (430, 60, N'Tuy Phong', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (431, 60, N'Bắc Bình', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (432, 60, N'Hàm Thuận Bắc', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (433, 60, N'Hàm Thuận Nam', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (434, 60, N'Tánh Linh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (435, 60, N'Đức Linh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (436, 60, N'Hàm Tân', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (437, 60, N'Phú Quí', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (438, 62, N'Kon Tum', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (439, 62, N'Đắk Glei', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (440, 62, N'Ngọc Hồi', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (441, 62, N'Đắk Tô', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (442, 62, N'Kon Plông', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (443, 62, N'Kon Rẫy', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (444, 62, N'Đắk Hà', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (445, 62, N'Sa Thầy', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (446, 62, N'Tu Mơ Rông', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (447, 64, N'Pleiku', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (448, 64, N'An Khê', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (449, 64, N'Ayun Pa', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (450, 64, N'Kbang', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (451, 64, N'Đăk Đoa', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (452, 64, N'Chư Păh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (453, 64, N'Ia Grai', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (454, 64, N'Mang Yang', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (455, 64, N'Kông Chro', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (456, 64, N'Đức Cơ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (457, 64, N'Chư Prông', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (458, 64, N'Chư Sê', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (459, 64, N'Đăk Pơ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (460, 64, N'Ia Pa', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (461, 64, N'Krông Pa', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (462, 64, N'Phú Thiện', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (463, 64, N'Chư Pưh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (464, 66, N'Buôn Ma Thuột', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (465, 66, N'Buôn Hồ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (466, 66, N'Ea Hleo', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (467, 66, N'Ea Súp', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (468, 66, N'Buôn Đôn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (469, 66, N'Cư Mgar', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (470, 66, N'Krông Búk', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (471, 66, N'Krông Năng', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (472, 66, N'Ea Kar', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (473, 66, N'Mđrắk', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (474, 66, N'Krông Bông', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (475, 66, N'Krông Pắc', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (476, 66, N'Krông A Na', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (477, 66, N'Lắk', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (478, 66, N'Cư Kuin', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (479, 67, N'Gia Nghĩa', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (480, 67, N'Đắk Glong', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (481, 67, N'Cư Jút', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (482, 67, N'Đắk Mil', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (483, 67, N'Krông Nô', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (484, 67, N'Đắk Song', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (485, 67, N'Đắk Rlấp', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (486, 67, N'Tuy Đức', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (487, 68, N'Đà Lạt', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (488, 68, N'Bảo Lộc', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (489, 68, N'Đam Rông', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (490, 68, N'Lạc Dương', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (491, 68, N'Lâm Hà', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (492, 68, N'Đơn Dương', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (493, 68, N'Đức Trọng', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (494, 68, N'Di Linh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (495, 68, N'Bảo Lâm', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (496, 68, N'Đạ Huoai', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (497, 68, N'Đạ Tẻh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (498, 68, N'Cát Tiên', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (499, 70, N'Đồng Xoài', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (500, 70, N'Phước Long', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (501, 70, N'Bình Long', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (502, 70, N'Bù Gia Mập', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (503, 70, N'Lộc Ninh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (504, 70, N'Bù Đốp', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (505, 70, N'Hớn Quản', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (506, 70, N'Đồng Phù', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (507, 70, N'Bù Đăng', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (508, 70, N'Chơn Thành', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (509, 72, N'Tây Ninh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (510, 72, N'Tân Biên', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (511, 72, N'Tân Châu', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (512, 72, N'Dương Minh Châu', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (513, 72, N'Châu Thành', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (514, 72, N'Hòa Thành', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (515, 72, N'Gò Dầu', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (516, 72, N'Bến Cầu', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (517, 72, N'Trảng Bàng', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (518, 74, N'Thủ Dầu Một', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (519, 74, N'Dầu Tiếng', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (520, 74, N'Bến Cát', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (521, 74, N'Phú Giáo', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (522, 74, N'Tân Uyên', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (523, 74, N'Dĩ An', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (524, 74, N'Thuận An', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (525, 75, N'Biên Hòa', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (526, 75, N'Long Khánh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (527, 75, N'Tân Phú', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (528, 75, N'Vĩnh Cửu', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (529, 75, N'Định Quán', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (530, 75, N'Trảng Bom', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (531, 75, N'Thống Nhất', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (532, 75, N'Cẩm Mỹ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (533, 75, N'Long Thành', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (534, 75, N'Xuân Lộc', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (535, 75, N'Nhơn Trạch', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (536, 77, N'Vũng Tầu', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (537, 77, N'Bà Rịa', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (538, 77, N'Châu Đức', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (539, 77, N'Xuyên Mộc', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (540, 77, N'Long Điền', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (541, 77, N'Đất Đỏ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (542, 77, N'Tân Thành', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (543, 77, N'Côn Đảo', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (544, 79, N'1', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (545, 79, N'12', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (546, 79, N'Thủ Đức', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (547, 79, N'9', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (548, 79, N'Gò Vấp', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (549, 79, N'Bình Thạnh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (550, 79, N'Tân Bình', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (551, 79, N'Tân Phú', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (552, 79, N'Phú Nhuận', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (553, 79, N'2', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (554, 79, N'3', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (555, 79, N'10', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (556, 79, N'11', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (557, 79, N'4', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (558, 79, N'5', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (559, 79, N'6', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (560, 79, N'8', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (561, 79, N'Bình Tân', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (562, 79, N'7', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (563, 79, N'Củ Chi', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (564, 79, N'Hóc Môn', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (565, 79, N'Bình Chánh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (566, 79, N'Nhà Bè', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (567, 79, N'Cần Giờ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (568, 80, N'Tân An', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (569, 80, N'Tân Hưng', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (570, 80, N'Vĩnh Hưng', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (571, 80, N'Mộc Hóa', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (572, 80, N'Tân Thạnh', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (573, 80, N'Thạnh Hóa', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (574, 80, N'Đức Huệ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (575, 80, N'Đức Hòa', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (576, 80, N'Bến Lức', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (577, 80, N'Thủ Thừa', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (578, 80, N'Tân Trụ', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (579, 80, N'Cần Đước', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (580, 80, N'Cần Giuộc', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (581, 80, N'Châu Thành', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (582, 82, N'Mỹ Tho', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (583, 82, N'Gò Công', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (584, 82, N'Tân Phước', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (585, 82, N'Cái Bè', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (586, 82, N'Cai Lậy', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (587, 82, N'Châu Thành', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (588, 82, N'Chợ Gạo', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (589, 82, N'Gò Công Tây', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (590, 82, N'Gò Công Đông', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (591, 82, N'Tân Phú Đông', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (592, 83, N'Bến Tre', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (593, 83, N'Châu Thành', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (594, 83, N'Chợ Lách', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (595, 83, N'Mỏ Cày Nam', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (596, 83, N'Giồng Trôm', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (597, 83, N'Bình Đại', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (598, 83, N'Ba Tri', NULL, NULL)
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (599, 83, N'Thạnh Phú', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (600, 20, N'2', CAST(N'2017-01-06T21:04:55.290' AS DateTime), CAST(N'2017-01-06T21:04:55.290' AS DateTime))
SET IDENTITY_INSERT [dbo].[Quan] OFF
SET IDENTITY_INSERT [dbo].[ThongTinNguoiDung] ON 

INSERT [dbo].[ThongTinNguoiDung] ([ThongTinNguoiDungId], [HoTen], [SoDienThoai], [Email], [DiaChi], [TinhThanhPhoId], [QuanId], [HinhAnh], [CreatedDate], [UpdatedDate]) VALUES (2, N'Vu Huy Tuan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ThongTinNguoiDung] ([ThongTinNguoiDungId], [HoTen], [SoDienThoai], [Email], [DiaChi], [TinhThanhPhoId], [QuanId], [HinhAnh], [CreatedDate], [UpdatedDate]) VALUES (3, N'Tran Viet Tien', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ThongTinNguoiDung] ([ThongTinNguoiDungId], [HoTen], [SoDienThoai], [Email], [DiaChi], [TinhThanhPhoId], [QuanId], [HinhAnh], [CreatedDate], [UpdatedDate]) VALUES (4, N'Ho Thanh Binh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ThongTinNguoiDung] ([ThongTinNguoiDungId], [HoTen], [SoDienThoai], [Email], [DiaChi], [TinhThanhPhoId], [QuanId], [HinhAnh], [CreatedDate], [UpdatedDate]) VALUES (6, N'Nguyễn ngọc quý', NULL, NULL, NULL, 30, 204, NULL, CAST(N'2017-01-06T21:19:17.640' AS DateTime), CAST(N'2017-01-06T21:19:17.640' AS DateTime))
SET IDENTITY_INSERT [dbo].[ThongTinNguoiDung] OFF
SET IDENTITY_INSERT [dbo].[ThuChi] ON 

INSERT [dbo].[ThuChi] ([ThuChiId], [MaPhieu], [TongTien], [Ngay], [CreatedDate], [UpdatedDate]) VALUES (1, 1, 1230000, CAST(N'2017-04-01' AS Date), NULL, NULL)
SET IDENTITY_INSERT [dbo].[ThuChi] OFF
SET IDENTITY_INSERT [dbo].[TinhThanhPho] ON 

INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (1, N'Hà Nội', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (2, N'Hà Giang', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (4, N'Cao Bằng', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (6, N'Bắc Kạn', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (8, N'Tuyên Quang', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (10, N'Lào Cai', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (11, N'Điện Biên', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (12, N'Lai Châu', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (14, N'Sơn La', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (15, N'Yên Bái', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (17, N'Hòa Bình', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (19, N'Thái Nguyên', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (20, N'Lạng Sơn', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (22, N'Quảng Ninh', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (24, N'Bắc Giang', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (25, N'Phú Thọ', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (26, N'Vĩnh Phúc', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (27, N'Bắc Ninh', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (30, N'Hải Dương', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (31, N'Hải Phòng1', NULL, CAST(N'2017-01-06T21:17:15.587' AS DateTime))
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (33, N'Hưng Yên', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (34, N'Thái Bình', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (35, N'Hà Nam', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (36, N'Nam Định', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (37, N'Ninh Bình', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (38, N'Thanh Hóa', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (40, N'Nghệ An', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (42, N'Hà Tĩnh', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (44, N'Quảng Bình', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (45, N'Quảng Trị', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (46, N'Thừa Thiên Huế', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (48, N'Đà Nẵng', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (49, N'Quảng Nam', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (51, N'Quảng Ngãi', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (52, N'Bình Định', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (54, N'Phú Yên', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (56, N'Khánh Hòa', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (58, N'Ninh Thuận', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (60, N'Bình Thuận', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (62, N'Kon Tum', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (64, N'Gia Lai', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (66, N'Đắk Lắk', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (67, N'Đắk Nông', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (68, N'Lâm Đồng', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (70, N'Bình Phước', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (72, N'Tây Ninh', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (74, N'Bình Dương', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (75, N'Đồng Nai', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (77, N'Bà Rịa - Vũng Tàu', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (79, N'Hồ Chí Minh', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (80, N'Long An', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (82, N'Tiền Giang', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (83, N'Bến Tre', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (84, N'Trà Vinh', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (86, N'Vĩnh Long', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (87, N'Đồng Tháp', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (89, N'An Giang', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (91, N'Kiên Giang', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (92, N'Cần Thơ', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (93, N'Hậu Giang', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (94, N'Sóc Trăng', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (95, N'Bạc Liêu', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (96, N'Cà Mau', NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (97, N'nam hải', CAST(N'2017-01-06T21:17:25.980' AS DateTime), CAST(N'2017-01-06T21:17:25.980' AS DateTime))
SET IDENTITY_INSERT [dbo].[TinhThanhPho] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [Username], [Password], [Email], [EmailConfirmed], [Type], [ThongTinNguoiDungId], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (4, N'nhanvien01', N'M0OnInovHii2K5vANOU7jw==', NULL, NULL, 2, 2, NULL, CAST(N'2017-01-06T21:20:05.643' AS DateTime), CAST(N'2017-01-06T21:20:05.643' AS DateTime))
INSERT [dbo].[User] ([UserId], [Username], [Password], [Email], [EmailConfirmed], [Type], [ThongTinNguoiDungId], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (5, N'binh', N'gNj+Ga9TA7z2jc1CXaY3CA==', NULL, NULL, 2, NULL, NULL, CAST(N'2017-01-06T21:22:03.387' AS DateTime), CAST(N'2017-01-06T21:22:03.387' AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
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
