CREATE DATABASE [QuanLiBanHang]
GO
USE [QuanLiBanHang]
GO
/****** Object:  Table [dbo].[AnhHangHoa]    Script Date: 1/7/2017 11:18:07 PM ******/
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
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 1/7/2017 11:18:07 PM ******/
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
/****** Object:  Table [dbo].[ChiTietPhieuChi]    Script Date: 1/7/2017 11:18:07 PM ******/
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
/****** Object:  Table [dbo].[DonHang]    Script Date: 1/7/2017 11:18:07 PM ******/
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
/****** Object:  Table [dbo].[HangHoa]    Script Date: 1/7/2017 11:18:07 PM ******/
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
/****** Object:  Table [dbo].[HoaDon]    Script Date: 1/7/2017 11:18:07 PM ******/
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
/****** Object:  Table [dbo].[LoaiHangHoa]    Script Date: 1/7/2017 11:18:07 PM ******/
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
/****** Object:  Table [dbo].[MoTaThuocTinhHangHoa]    Script Date: 1/7/2017 11:18:07 PM ******/
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
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 1/7/2017 11:18:07 PM ******/
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
/****** Object:  Table [dbo].[PhieuChi]    Script Date: 1/7/2017 11:18:07 PM ******/
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
/****** Object:  Table [dbo].[Quan]    Script Date: 1/7/2017 11:18:07 PM ******/
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
/****** Object:  Table [dbo].[ThongTinNguoiDung]    Script Date: 1/7/2017 11:18:07 PM ******/
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
/****** Object:  Table [dbo].[ThuChi]    Script Date: 1/7/2017 11:18:07 PM ******/
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
/****** Object:  Table [dbo].[ThuocTinhHangHoa]    Script Date: 1/7/2017 11:18:07 PM ******/
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
/****** Object:  Table [dbo].[TinhThanhPho]    Script Date: 1/7/2017 11:18:07 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 1/7/2017 11:18:07 PM ******/
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
SET IDENTITY_INSERT [dbo].[AnhHangHoa] ON 

GO
INSERT [dbo].[AnhHangHoa] ([AnhHangHoaId], [HangHoaId], [LinkAnh], [LinkAnhMini], [CreatedDate], [UpdatedDate]) VALUES (54, 16, N'http://qlbh.tb.com/Uploader/ImagesUploader/GetImageHangHoa?fileName=16_6d38ab5c-3eda-4590-95d4-93879184fe81.jpg', N'http://qlbh.tb.com/Uploader/ImagesUploader/GetThumbnailImageHangHoa?fileName=16_6d38ab5c-3eda-4590-95d4-93879184fe81.jpg', CAST(N'2017-01-07T22:55:57.533' AS DateTime), CAST(N'2017-01-07T22:55:57.533' AS DateTime))
GO
INSERT [dbo].[AnhHangHoa] ([AnhHangHoaId], [HangHoaId], [LinkAnh], [LinkAnhMini], [CreatedDate], [UpdatedDate]) VALUES (55, 16, N'http://qlbh.tb.com/Uploader/ImagesUploader/GetImageHangHoa?fileName=16_ec2959d0-b640-44a3-8b33-ffe515bbcd3d.jpg', N'http://qlbh.tb.com/Uploader/ImagesUploader/GetThumbnailImageHangHoa?fileName=16_ec2959d0-b640-44a3-8b33-ffe515bbcd3d.jpg', CAST(N'2017-01-07T22:55:58.267' AS DateTime), CAST(N'2017-01-07T22:55:58.267' AS DateTime))
GO
INSERT [dbo].[AnhHangHoa] ([AnhHangHoaId], [HangHoaId], [LinkAnh], [LinkAnhMini], [CreatedDate], [UpdatedDate]) VALUES (56, 16, N'http://qlbh.tb.com/Uploader/ImagesUploader/GetImageHangHoa?fileName=16_12d95013-942c-4180-a3bb-08daeb423d38.jpg', N'http://qlbh.tb.com/Uploader/ImagesUploader/GetThumbnailImageHangHoa?fileName=16_12d95013-942c-4180-a3bb-08daeb423d38.jpg', CAST(N'2017-01-07T22:55:58.730' AS DateTime), CAST(N'2017-01-07T22:55:58.730' AS DateTime))
GO
INSERT [dbo].[AnhHangHoa] ([AnhHangHoaId], [HangHoaId], [LinkAnh], [LinkAnhMini], [CreatedDate], [UpdatedDate]) VALUES (57, 24, N'http://qlbh.tb.com/Uploader/ImagesUploader/GetImageHangHoa?fileName=24_ec9f4637-f951-46f0-902a-6450c78d591e.jpg', N'http://qlbh.tb.com/Uploader/ImagesUploader/GetThumbnailImageHangHoa?fileName=24_ec9f4637-f951-46f0-902a-6450c78d591e.jpg', CAST(N'2017-01-07T22:57:04.880' AS DateTime), CAST(N'2017-01-07T22:57:04.880' AS DateTime))
GO
INSERT [dbo].[AnhHangHoa] ([AnhHangHoaId], [HangHoaId], [LinkAnh], [LinkAnhMini], [CreatedDate], [UpdatedDate]) VALUES (58, 24, N'http://qlbh.tb.com/Uploader/ImagesUploader/GetImageHangHoa?fileName=24_ebd58e41-807f-4328-aebb-9aa18a0867f8.jpg', N'http://qlbh.tb.com/Uploader/ImagesUploader/GetThumbnailImageHangHoa?fileName=24_ebd58e41-807f-4328-aebb-9aa18a0867f8.jpg', CAST(N'2017-01-07T22:57:37.087' AS DateTime), CAST(N'2017-01-07T22:57:37.087' AS DateTime))
GO
INSERT [dbo].[AnhHangHoa] ([AnhHangHoaId], [HangHoaId], [LinkAnh], [LinkAnhMini], [CreatedDate], [UpdatedDate]) VALUES (59, 24, N'http://qlbh.tb.com/Uploader/ImagesUploader/GetImageHangHoa?fileName=24_e0f1cbcb-078a-4158-9eef-cb5dcb784721.jpg', N'http://qlbh.tb.com/Uploader/ImagesUploader/GetThumbnailImageHangHoa?fileName=24_e0f1cbcb-078a-4158-9eef-cb5dcb784721.jpg', CAST(N'2017-01-07T22:57:37.647' AS DateTime), CAST(N'2017-01-07T22:57:37.647' AS DateTime))
GO
INSERT [dbo].[AnhHangHoa] ([AnhHangHoaId], [HangHoaId], [LinkAnh], [LinkAnhMini], [CreatedDate], [UpdatedDate]) VALUES (60, 24, N'http://qlbh.tb.com/Uploader/ImagesUploader/GetImageHangHoa?fileName=24_e8135d39-6a2c-48e6-8722-5ba92f15f9fd.jpg', N'http://qlbh.tb.com/Uploader/ImagesUploader/GetThumbnailImageHangHoa?fileName=24_e8135d39-6a2c-48e6-8722-5ba92f15f9fd.jpg', CAST(N'2017-01-07T22:57:38.093' AS DateTime), CAST(N'2017-01-07T22:57:38.093' AS DateTime))
GO
INSERT [dbo].[AnhHangHoa] ([AnhHangHoaId], [HangHoaId], [LinkAnh], [LinkAnhMini], [CreatedDate], [UpdatedDate]) VALUES (61, 24, N'http://qlbh.tb.com/Uploader/ImagesUploader/GetImageHangHoa?fileName=24_11a17350-95ea-4f02-96ae-63bd77a2594e.jpg', N'http://qlbh.tb.com/Uploader/ImagesUploader/GetThumbnailImageHangHoa?fileName=24_11a17350-95ea-4f02-96ae-63bd77a2594e.jpg', CAST(N'2017-01-07T22:57:38.553' AS DateTime), CAST(N'2017-01-07T22:57:38.553' AS DateTime))
GO
INSERT [dbo].[AnhHangHoa] ([AnhHangHoaId], [HangHoaId], [LinkAnh], [LinkAnhMini], [CreatedDate], [UpdatedDate]) VALUES (62, 23, N'http://qlbh.tb.com/Uploader/ImagesUploader/GetImageHangHoa?fileName=23_f495b522-19ed-4987-acd1-9147ff2ac2d7.jpg', N'http://qlbh.tb.com/Uploader/ImagesUploader/GetThumbnailImageHangHoa?fileName=23_f495b522-19ed-4987-acd1-9147ff2ac2d7.jpg', CAST(N'2017-01-07T22:58:24.080' AS DateTime), CAST(N'2017-01-07T22:58:24.080' AS DateTime))
GO
INSERT [dbo].[AnhHangHoa] ([AnhHangHoaId], [HangHoaId], [LinkAnh], [LinkAnhMini], [CreatedDate], [UpdatedDate]) VALUES (63, 23, N'http://qlbh.tb.com/Uploader/ImagesUploader/GetImageHangHoa?fileName=23_534e8776-c27a-40f6-976f-d90441089274.jpg', N'http://qlbh.tb.com/Uploader/ImagesUploader/GetThumbnailImageHangHoa?fileName=23_534e8776-c27a-40f6-976f-d90441089274.jpg', CAST(N'2017-01-07T22:58:24.617' AS DateTime), CAST(N'2017-01-07T22:58:24.617' AS DateTime))
GO
INSERT [dbo].[AnhHangHoa] ([AnhHangHoaId], [HangHoaId], [LinkAnh], [LinkAnhMini], [CreatedDate], [UpdatedDate]) VALUES (64, 23, N'http://qlbh.tb.com/Uploader/ImagesUploader/GetImageHangHoa?fileName=23_1a362673-3489-46bc-806a-27a06eafcb09.jpg', N'http://qlbh.tb.com/Uploader/ImagesUploader/GetThumbnailImageHangHoa?fileName=23_1a362673-3489-46bc-806a-27a06eafcb09.jpg', CAST(N'2017-01-07T22:58:25.233' AS DateTime), CAST(N'2017-01-07T22:58:25.233' AS DateTime))
GO
INSERT [dbo].[AnhHangHoa] ([AnhHangHoaId], [HangHoaId], [LinkAnh], [LinkAnhMini], [CreatedDate], [UpdatedDate]) VALUES (65, 23, N'http://qlbh.tb.com/Uploader/ImagesUploader/GetImageHangHoa?fileName=23_258936c7-a16d-4ddd-bac6-4c4b13e7724b.jpg', N'http://qlbh.tb.com/Uploader/ImagesUploader/GetThumbnailImageHangHoa?fileName=23_258936c7-a16d-4ddd-bac6-4c4b13e7724b.jpg', CAST(N'2017-01-07T22:58:25.553' AS DateTime), CAST(N'2017-01-07T22:58:25.553' AS DateTime))
GO
INSERT [dbo].[AnhHangHoa] ([AnhHangHoaId], [HangHoaId], [LinkAnh], [LinkAnhMini], [CreatedDate], [UpdatedDate]) VALUES (66, 22, N'http://qlbh.tb.com/Uploader/ImagesUploader/GetImageHangHoa?fileName=22_279929b1-596c-4d45-bcc7-b46ab4a9a80f.jpg', N'http://qlbh.tb.com/Uploader/ImagesUploader/GetThumbnailImageHangHoa?fileName=22_279929b1-596c-4d45-bcc7-b46ab4a9a80f.jpg', CAST(N'2017-01-07T22:59:32.757' AS DateTime), CAST(N'2017-01-07T22:59:32.757' AS DateTime))
GO
INSERT [dbo].[AnhHangHoa] ([AnhHangHoaId], [HangHoaId], [LinkAnh], [LinkAnhMini], [CreatedDate], [UpdatedDate]) VALUES (67, 22, N'http://qlbh.tb.com/Uploader/ImagesUploader/GetImageHangHoa?fileName=22_37388c3c-c17c-47a4-ab4a-eed4feaaf4fb.jpg', N'http://qlbh.tb.com/Uploader/ImagesUploader/GetThumbnailImageHangHoa?fileName=22_37388c3c-c17c-47a4-ab4a-eed4feaaf4fb.jpg', CAST(N'2017-01-07T22:59:33.250' AS DateTime), CAST(N'2017-01-07T22:59:33.250' AS DateTime))
GO
INSERT [dbo].[AnhHangHoa] ([AnhHangHoaId], [HangHoaId], [LinkAnh], [LinkAnhMini], [CreatedDate], [UpdatedDate]) VALUES (68, 22, N'http://qlbh.tb.com/Uploader/ImagesUploader/GetImageHangHoa?fileName=22_92c33235-ecf1-4d89-ab4a-0f8eb26b9381.jpg', N'http://qlbh.tb.com/Uploader/ImagesUploader/GetThumbnailImageHangHoa?fileName=22_92c33235-ecf1-4d89-ab4a-0f8eb26b9381.jpg', CAST(N'2017-01-07T22:59:33.837' AS DateTime), CAST(N'2017-01-07T22:59:33.837' AS DateTime))
GO
INSERT [dbo].[AnhHangHoa] ([AnhHangHoaId], [HangHoaId], [LinkAnh], [LinkAnhMini], [CreatedDate], [UpdatedDate]) VALUES (69, 21, N'http://qlbh.tb.com/Uploader/ImagesUploader/GetImageHangHoa?fileName=21_fedecde0-37b1-4c87-90f9-ff5ef0074a8a.jpg', N'http://qlbh.tb.com/Uploader/ImagesUploader/GetThumbnailImageHangHoa?fileName=21_fedecde0-37b1-4c87-90f9-ff5ef0074a8a.jpg', CAST(N'2017-01-07T23:00:01.510' AS DateTime), CAST(N'2017-01-07T23:00:01.510' AS DateTime))
GO
INSERT [dbo].[AnhHangHoa] ([AnhHangHoaId], [HangHoaId], [LinkAnh], [LinkAnhMini], [CreatedDate], [UpdatedDate]) VALUES (70, 20, N'http://qlbh.tb.com/Uploader/ImagesUploader/GetImageHangHoa?fileName=20_d0efb099-69d1-443b-8be5-5e572b098691.jpg', N'http://qlbh.tb.com/Uploader/ImagesUploader/GetThumbnailImageHangHoa?fileName=20_d0efb099-69d1-443b-8be5-5e572b098691.jpg', CAST(N'2017-01-07T23:00:30.447' AS DateTime), CAST(N'2017-01-07T23:00:30.447' AS DateTime))
GO
INSERT [dbo].[AnhHangHoa] ([AnhHangHoaId], [HangHoaId], [LinkAnh], [LinkAnhMini], [CreatedDate], [UpdatedDate]) VALUES (71, 20, N'http://qlbh.tb.com/Uploader/ImagesUploader/GetImageHangHoa?fileName=20_d6e1ae10-30bc-445c-bb48-1cf94dc0912a.jpg', N'http://qlbh.tb.com/Uploader/ImagesUploader/GetThumbnailImageHangHoa?fileName=20_d6e1ae10-30bc-445c-bb48-1cf94dc0912a.jpg', CAST(N'2017-01-07T23:00:31.127' AS DateTime), CAST(N'2017-01-07T23:00:31.127' AS DateTime))
GO
INSERT [dbo].[AnhHangHoa] ([AnhHangHoaId], [HangHoaId], [LinkAnh], [LinkAnhMini], [CreatedDate], [UpdatedDate]) VALUES (72, 20, N'http://qlbh.tb.com/Uploader/ImagesUploader/GetImageHangHoa?fileName=20_45599d2e-b291-4ceb-9e32-2d3bc0fbb2fc.jpg', N'http://qlbh.tb.com/Uploader/ImagesUploader/GetThumbnailImageHangHoa?fileName=20_45599d2e-b291-4ceb-9e32-2d3bc0fbb2fc.jpg', CAST(N'2017-01-07T23:00:31.417' AS DateTime), CAST(N'2017-01-07T23:00:31.417' AS DateTime))
GO
INSERT [dbo].[AnhHangHoa] ([AnhHangHoaId], [HangHoaId], [LinkAnh], [LinkAnhMini], [CreatedDate], [UpdatedDate]) VALUES (73, 20, N'http://qlbh.tb.com/Uploader/ImagesUploader/GetImageHangHoa?fileName=20_9d20b79b-5b6b-470b-b397-884216ae2a91.jpg', N'http://qlbh.tb.com/Uploader/ImagesUploader/GetThumbnailImageHangHoa?fileName=20_9d20b79b-5b6b-470b-b397-884216ae2a91.jpg', CAST(N'2017-01-07T23:00:31.993' AS DateTime), CAST(N'2017-01-07T23:00:31.993' AS DateTime))
GO
INSERT [dbo].[AnhHangHoa] ([AnhHangHoaId], [HangHoaId], [LinkAnh], [LinkAnhMini], [CreatedDate], [UpdatedDate]) VALUES (75, 18, N'http://qlbh.tb.com/Uploader/ImagesUploader/GetImageHangHoa?fileName=18_d46a6c77-47a8-4535-b19c-e1d2ba8fc053.jpg', N'http://qlbh.tb.com/Uploader/ImagesUploader/GetThumbnailImageHangHoa?fileName=18_d46a6c77-47a8-4535-b19c-e1d2ba8fc053.jpg', CAST(N'2017-01-07T23:01:00.900' AS DateTime), CAST(N'2017-01-07T23:01:00.900' AS DateTime))
GO
INSERT [dbo].[AnhHangHoa] ([AnhHangHoaId], [HangHoaId], [LinkAnh], [LinkAnhMini], [CreatedDate], [UpdatedDate]) VALUES (76, 19, N'http://qlbh.tb.com/Uploader/ImagesUploader/GetImageHangHoa?fileName=19_53e956eb-9732-4691-9011-8808f337f511.jpg', N'http://qlbh.tb.com/Uploader/ImagesUploader/GetThumbnailImageHangHoa?fileName=19_53e956eb-9732-4691-9011-8808f337f511.jpg', CAST(N'2017-01-07T23:01:22.420' AS DateTime), CAST(N'2017-01-07T23:01:22.420' AS DateTime))
GO
INSERT [dbo].[AnhHangHoa] ([AnhHangHoaId], [HangHoaId], [LinkAnh], [LinkAnhMini], [CreatedDate], [UpdatedDate]) VALUES (77, 17, N'http://qlbh.tb.com/Uploader/ImagesUploader/GetImageHangHoa?fileName=17_b3fb4536-5cb0-440f-836a-8f1f94c93546.jpg', N'http://qlbh.tb.com/Uploader/ImagesUploader/GetThumbnailImageHangHoa?fileName=17_b3fb4536-5cb0-440f-836a-8f1f94c93546.jpg', CAST(N'2017-01-07T23:02:15.890' AS DateTime), CAST(N'2017-01-07T23:02:15.890' AS DateTime))
GO
INSERT [dbo].[AnhHangHoa] ([AnhHangHoaId], [HangHoaId], [LinkAnh], [LinkAnhMini], [CreatedDate], [UpdatedDate]) VALUES (78, 17, N'http://qlbh.tb.com/Uploader/ImagesUploader/GetImageHangHoa?fileName=17_f36cbac1-f09e-4242-b330-b116009b4137.jpg', N'http://qlbh.tb.com/Uploader/ImagesUploader/GetThumbnailImageHangHoa?fileName=17_f36cbac1-f09e-4242-b330-b116009b4137.jpg', CAST(N'2017-01-07T23:02:16.260' AS DateTime), CAST(N'2017-01-07T23:02:16.260' AS DateTime))
GO
INSERT [dbo].[AnhHangHoa] ([AnhHangHoaId], [HangHoaId], [LinkAnh], [LinkAnhMini], [CreatedDate], [UpdatedDate]) VALUES (79, 17, N'http://qlbh.tb.com/Uploader/ImagesUploader/GetImageHangHoa?fileName=17_30b5fadb-7a90-49d6-b8de-9e30bd73d689.jpg', N'http://qlbh.tb.com/Uploader/ImagesUploader/GetThumbnailImageHangHoa?fileName=17_30b5fadb-7a90-49d6-b8de-9e30bd73d689.jpg', CAST(N'2017-01-07T23:02:16.897' AS DateTime), CAST(N'2017-01-07T23:02:16.897' AS DateTime))
GO
INSERT [dbo].[AnhHangHoa] ([AnhHangHoaId], [HangHoaId], [LinkAnh], [LinkAnhMini], [CreatedDate], [UpdatedDate]) VALUES (80, 17, N'http://qlbh.tb.com/Uploader/ImagesUploader/GetImageHangHoa?fileName=17_bf74c2c2-c91b-45da-9151-7154032f7faf.jpg', N'http://qlbh.tb.com/Uploader/ImagesUploader/GetThumbnailImageHangHoa?fileName=17_bf74c2c2-c91b-45da-9151-7154032f7faf.jpg', CAST(N'2017-01-07T23:02:17.320' AS DateTime), CAST(N'2017-01-07T23:02:17.320' AS DateTime))
GO
INSERT [dbo].[AnhHangHoa] ([AnhHangHoaId], [HangHoaId], [LinkAnh], [LinkAnhMini], [CreatedDate], [UpdatedDate]) VALUES (81, 15, N'http://qlbh.tb.com/Uploader/ImagesUploader/GetImageHangHoa?fileName=15_8471a40a-4338-41d2-8aec-e2de476aca00.jpg', N'http://qlbh.tb.com/Uploader/ImagesUploader/GetThumbnailImageHangHoa?fileName=15_8471a40a-4338-41d2-8aec-e2de476aca00.jpg', CAST(N'2017-01-07T23:03:26.087' AS DateTime), CAST(N'2017-01-07T23:03:26.087' AS DateTime))
GO
INSERT [dbo].[AnhHangHoa] ([AnhHangHoaId], [HangHoaId], [LinkAnh], [LinkAnhMini], [CreatedDate], [UpdatedDate]) VALUES (82, 15, N'http://qlbh.tb.com/Uploader/ImagesUploader/GetImageHangHoa?fileName=15_4c439e55-c735-46ba-987a-b05b2bb0a290.jpg', N'http://qlbh.tb.com/Uploader/ImagesUploader/GetThumbnailImageHangHoa?fileName=15_4c439e55-c735-46ba-987a-b05b2bb0a290.jpg', CAST(N'2017-01-07T23:03:26.453' AS DateTime), CAST(N'2017-01-07T23:03:26.453' AS DateTime))
GO
INSERT [dbo].[AnhHangHoa] ([AnhHangHoaId], [HangHoaId], [LinkAnh], [LinkAnhMini], [CreatedDate], [UpdatedDate]) VALUES (83, 15, N'http://qlbh.tb.com/Uploader/ImagesUploader/GetImageHangHoa?fileName=15_82410a6a-5279-4fbd-8fea-d7ef84eb9378.jpg', N'http://qlbh.tb.com/Uploader/ImagesUploader/GetThumbnailImageHangHoa?fileName=15_82410a6a-5279-4fbd-8fea-d7ef84eb9378.jpg', CAST(N'2017-01-07T23:03:27.090' AS DateTime), CAST(N'2017-01-07T23:03:27.090' AS DateTime))
GO
INSERT [dbo].[AnhHangHoa] ([AnhHangHoaId], [HangHoaId], [LinkAnh], [LinkAnhMini], [CreatedDate], [UpdatedDate]) VALUES (84, 15, N'http://qlbh.tb.com/Uploader/ImagesUploader/GetImageHangHoa?fileName=15_61deed68-35fa-4ea0-af2a-2af83ae3a296.jpg', N'http://qlbh.tb.com/Uploader/ImagesUploader/GetThumbnailImageHangHoa?fileName=15_61deed68-35fa-4ea0-af2a-2af83ae3a296.jpg', CAST(N'2017-01-07T23:03:27.667' AS DateTime), CAST(N'2017-01-07T23:03:27.667' AS DateTime))
GO
INSERT [dbo].[AnhHangHoa] ([AnhHangHoaId], [HangHoaId], [LinkAnh], [LinkAnhMini], [CreatedDate], [UpdatedDate]) VALUES (85, 15, N'http://qlbh.tb.com/Uploader/ImagesUploader/GetImageHangHoa?fileName=15_48569152-fb63-4d7d-b1d4-74c788c2a060.jpg', N'http://qlbh.tb.com/Uploader/ImagesUploader/GetThumbnailImageHangHoa?fileName=15_48569152-fb63-4d7d-b1d4-74c788c2a060.jpg', CAST(N'2017-01-07T23:03:27.997' AS DateTime), CAST(N'2017-01-07T23:03:27.997' AS DateTime))
GO
INSERT [dbo].[AnhHangHoa] ([AnhHangHoaId], [HangHoaId], [LinkAnh], [LinkAnhMini], [CreatedDate], [UpdatedDate]) VALUES (86, 15, N'http://qlbh.tb.com/Uploader/ImagesUploader/GetImageHangHoa?fileName=15_afb3fd0f-6b61-4c2b-bda2-584b49af9672.jpg', N'http://qlbh.tb.com/Uploader/ImagesUploader/GetThumbnailImageHangHoa?fileName=15_afb3fd0f-6b61-4c2b-bda2-584b49af9672.jpg', CAST(N'2017-01-07T23:03:28.737' AS DateTime), CAST(N'2017-01-07T23:03:28.737' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[AnhHangHoa] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietPhieuChi] ON 

GO
INSERT [dbo].[ChiTietPhieuChi] ([ChiTietPhieuChiId], [MoTa], [TongTien], [GhiChu], [PhieuChiId], [CreatedDate], [UpdatedDate]) VALUES (1, N'không có', 123000, N'ad', NULL, NULL, NULL)
GO
INSERT [dbo].[ChiTietPhieuChi] ([ChiTietPhieuChiId], [MoTa], [TongTien], [GhiChu], [PhieuChiId], [CreatedDate], [UpdatedDate]) VALUES (2, N'đt', 600000, N'không có', NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[ChiTietPhieuChi] OFF
GO
SET IDENTITY_INSERT [dbo].[DonHang] ON 

GO
INSERT [dbo].[DonHang] ([DonHangId], [NgayLap], [ThanhTien], [KhachHangId], [GhiChu], [CreatedDate], [UpdatedDate]) VALUES (2, CAST(N'2016-10-05' AS Date), 123145324, 1234563454, N'1234567', NULL, NULL)
GO
INSERT [dbo].[DonHang] ([DonHangId], [NgayLap], [ThanhTien], [KhachHangId], [GhiChu], [CreatedDate], [UpdatedDate]) VALUES (3, CAST(N'2016-12-03' AS Date), 12321, 123, N'4123', NULL, NULL)
GO
INSERT [dbo].[DonHang] ([DonHangId], [NgayLap], [ThanhTien], [KhachHangId], [GhiChu], [CreatedDate], [UpdatedDate]) VALUES (4, CAST(N'2017-01-06' AS Date), 1000, 3, NULL, CAST(N'2017-01-06T20:37:17.923' AS DateTime), CAST(N'2017-01-06T20:37:17.923' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[DonHang] OFF
GO
SET IDENTITY_INSERT [dbo].[HangHoa] ON 

GO
INSERT [dbo].[HangHoa] ([HangHoaId], [Ma], [Ten], [GiaBanThamKhao], [MoTa], [LoaiHangHoaId], [NhaCungCapId], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (15, N'00001', N'Galaxy S7', 14990000, N'<p><a href="https://tinhte.vn/tags/samsung-galaxy-s7/">Samsung Galaxy S7</a>&nbsp;năm nay thật sự nhỏ gọn v&agrave; dễ thương hơn rất nhiều. Kh&ocirc;ng chỉ đưa ra những thay đổi về thiết kế, m&agrave;&nbsp;<a href="https://tinhte.vn/tags/samsung/">Samsung</a>&nbsp;c&ograve;n cập nhật th&ecirc;m phần mềm v&agrave; phần cứng cho m&aacute;y tương xứng hơn. Một số thay đổi đ&aacute;ng ch&uacute; &yacute; l&agrave; chống nước bụi IP68, tản nhiệt bằng chất lỏng, camera &iacute;t lồi hơn với 100% điểm ảnh c&oacute; thể lấy n&eacute;t theo pha, pin lớn hơn v&agrave; hỗ trợ 2 SIM hoặc 1 SIM/một khe cắm thẻ nhớ. M&igrave;nh nghe n&oacute;i l&agrave; giữa th&aacute;ng sau th&igrave;&nbsp;<a href="https://tinhte.vn/tags/galaxy-s7/">Galaxy S7</a>&nbsp;sẽ bắt đầu b&aacute;n ra ở Việt Nam rồi, rất sớm v&agrave; rất n&oacute;ng.</p>

<p><br />
<br />
​</p>

<p>Samsung Galaxy&nbsp;<a href="https://tinhte.vn/tags/s7/">S7</a>&nbsp;vẫn được thiết kế theo kiểu m&agrave; Samsung &aacute;p dụng từ Galaxy S6, nhưng n&oacute; thật sự tối ưu hơn rất nhiều. Samsung kh&ocirc;ng chỉ vuốt cong c&aacute;c cạnh ở mặt sau của m&aacute;y để người d&ugrave;ng cầm nắm dễ d&agrave;ng hơn m&agrave; họ cũng đ&atilde; tối ưu gờ tiếp x&uacute;c giữa c&aacute;c cạnh, l&agrave;m k&iacute;nh v&agrave; khung nh&ocirc;m kim loại ở 4 g&oacute;c ph&iacute;a sau trơn tru v&agrave; mượt m&agrave; hơn. Nếu từng chạm v&agrave;o Samsung Galaxy Note 5 v&agrave; Galaxy S6 edge Plus, hẳn bạn sẽ bị kh&oacute; chịu với phần tiếp x&uacute;c n&agrave;y nhưng tr&ecirc;n S7 v&agrave; S7 edge th&igrave; ch&uacute;ng đều rất mượt v&agrave; dịu với tay.<br />
<br />
Kh&ocirc;ng chỉ c&oacute; vậy, Galaxy S7 c&ograve;n nhận được một số thay đổi nhỏ nhằm &ldquo;đ&aacute;nh lừa&rdquo; người d&ugrave;ng về mặt cảm nhận. Trước kia th&igrave; phi&ecirc;n bản m&agrave;u m&agrave;u đen vẫn c&oacute; viền s&aacute;ng, c&ograve;n tr&ecirc;n S7 th&igrave; viền n&oacute; đ&atilde; c&oacute; m&agrave;u đồng nhất hơn với mặt trước, tạo th&agrave;nh một tổng thể h&ograve;a hợp v&agrave; gọn g&agrave;ng. Ngay cả phần camera ph&iacute;a sau cũng được l&agrave;m đồng bộ, kh&ocirc;ng bị đối lập m&agrave;u nữa, cho thấy Samsung đ&atilde; bắt đầu ch&uacute; &yacute; nhiều hơn đến những chi tiết nhỏ m&agrave; họ thường bỏ qua trước kia.<br />
<br />
<img alt="Tinhte_tren_tay_Galaxy_S7_MWC_2016-14.jpg" src="https://tinhte.vn/store/2016/02/3612263_Tinhte_tren_tay_Galaxy_S7_MWC_2016-14.jpg" /><br />
<br />
Với k&iacute;ch cỡ nhỏ gọn hơn, nhưng Galaxy S7 vẫn c&oacute; vi&ecirc;n pin lớn hơn thế hệ cũ l&agrave; vi&ecirc;n pin 3000mAh.<br />
<br />
Đ&oacute; l&agrave; phần ri&ecirc;ng của Galaxy S7, phần dưới n&agrave;y l&agrave; d&agrave;nh cho cả Galaxy S7 v&agrave; Galaxy S7 edge, c&aacute;c bạn c&oacute; thể bỏ qua phần dưới nếu đ&atilde; đọc b&agrave;i về Galaxy S7 edge trước, v&agrave; ngược lại.<br />
<br />
<strong>Khe cắm thẻ nhớ:</strong><br />
Tất cả c&aacute;c m&aacute;y Galaxy S7 v&agrave; Galaxy S7 edge b&aacute;n ra đều l&agrave; m&aacute;y hai SIM, bạn c&oacute; thể d&ugrave;ng cả hai SIM nếu muốn, nhưng khi đ&oacute; ch&uacute;ng ta sẽ phải hy sinh một khe cắm thẻ nhớ. Nếu muốn d&ugrave;ng thẻ nhớ th&igrave; bạn chỉ c&oacute; thể d&ugrave;ng một SIM ch&iacute;nh v&agrave; một thẻ microSD.<br />
<br />
<strong>Sức mạnh xử l&yacute;:</strong><br />
Samsung Galaxy S7/S7 edge được trang bị con chip xử l&yacute; mới của Samsung. Hiện tại m&igrave;nh chưa thể x&aacute;c nhận r&otilde; r&agrave;ng t&ecirc;n m&atilde; nhưng theo h&atilde;ng th&igrave; n&oacute; mạnh hơn 30% về mặt CPU v&agrave; 60% về GPU so với thế hệ trước. Kết hợp với 4GB RAM mặc định th&igrave; c&aacute;c bạn c&oacute; thể thấy l&agrave; n&oacute; hoạt động nhanh hơn, phản ứng nhanh hơn kh&aacute; nhiều trong video.<br />
<br />
<strong>Tản nhiệt chất lỏng:</strong><br />
Cũng như Microsoft Lumia 950XL, Samsung Galaxy S7/S7 edge c&oacute; tản nhiệt chất lỏng nhằm đảm bảo cho m&aacute;y sẽ lu&ocirc;n m&aacute;t. Nguy&ecirc;n tắc kh&aacute; đơn giản, một ống dẫn nhiệt d&agrave;y 0.4mm b&ecirc;n trong m&aacute;y c&oacute; chứa chất lỏng l&agrave;m m&aacute;t, n&oacute; sẽ đi ngang qua những bộ phận nguy hiểm như SoC, c&aacute;c con chip điều khiển, sau đ&oacute; mang nhiệt lượng từ đ&acirc;y qua những khu vực kh&aacute;c để trải đều diện t&iacute;ch tản nhiệt ra. Chất lỏng cứ tuần ho&agrave;n tuần ho&agrave;n như vậy b&ecirc;n trong, v&agrave; m&aacute;y sẽ lu&ocirc;n m&aacute;t hơn rất nhiều so với tản nhiệt thụ động kh&ocirc;ng kh&iacute; ch&uacute;ng ta thường thấy.<br />
<br />
Thực tế l&agrave; khi m&igrave;nh thử chơi game, chụp h&igrave;nh v&agrave; quay phim 4K ngắn tr&ecirc;n Galaxy S6 th&igrave; m&aacute;y kh&ocirc;ng bị n&oacute;ng, cầm vẫn rất dễ chịu. M&igrave;nh sẽ thử kỹ hơn khi c&oacute; m&aacute;y thương mại.<br />
<br />
<strong>Camera:</strong><br />
Camera l&agrave; thay đổi lớn tr&ecirc;n cả S6 v&agrave; S6 edge. Trước kia th&igrave; camera tr&ecirc;n hai chiếc m&aacute;y n&agrave;y lồi rất nhiều nhưng giờ th&igrave; n&oacute; chỉ c&ograve;n 0.46mm so với nắp lưng. Tuy vậy, đ&oacute; chỉ l&agrave; điểm phụ c&ograve;n điểm ch&iacute;nh l&agrave; Samsung đ&atilde; cải tiến triệt để camera của m&aacute;y, từ cảm biến, hệ thống lấy n&eacute;t cho tới ống k&iacute;nh.<br />
<br />
<img alt="Tinhte_tren_tay_Galaxy_S7_MWC_2016.jpg" src="https://tinhte.vn/store/2016/02/3612276_Tinhte_tren_tay_Galaxy_S7_MWC_2016.jpg" /><br />
<br />
Cảm biến ảnh tr&ecirc;n S7/S7 edge l&agrave; cảm biến ảnh 12MP, độ ph&acirc;n giải thấp hơn so với 16MP tr&ecirc;n thế hệ trước nhưng ch&iacute;nh v&igrave; vậy m&agrave; Samsung c&oacute; thể tăng k&iacute;ch cỡ từng điểm ảnh l&ecirc;n 1.4&mu;m so với 1.12 micromet trước kia. Chỉ ri&ecirc;ng việc tăng k&iacute;ch cỡ điểm ảnh n&agrave;y l&ecirc;n th&igrave; n&oacute; sẽ gi&uacute;p cảm biến thu được nhiều hơn 56% &aacute;nh s&aacute;ng. K&iacute;ch cỡ điểm ảnh 1.4&mu;m tương đương với Nokia Pureview 808, iPhone 5 (iPhone 6s l&agrave; 1.5) hay Moto X&hellip;<br />
<br />
Ống k&iacute;nh của S7/S7 edge cũng c&oacute; khẩu độ f1/7, s&aacute;ng hơn 25% so với f/1.9 tr&ecirc;n S6. Kết hợp cả ống k&iacute;nh v&agrave; k&iacute;ch cỡ điểm ảnh th&igrave; trong c&ugrave;ng một th&ocirc;ng số, c&ugrave;ng một điều kiện, ảnh từ Galaxy S7 sẽ s&aacute;ng hơn 95% so với S6, theo th&ocirc;ng b&aacute;o từ Samsung.<br />
<br />
Kh&ocirc;ng chỉ c&oacute; vậy, Galaxy S6 v&agrave; Galaxy S6 edge đều c&oacute; c&aacute;c điểm ảnh Dual Pixel. C&aacute;c điểm ảnh n&agrave;y hỗ trợ lấy n&eacute;t theo pha ở từng cấp độ điểm ảnh một, tức l&agrave; 100% điểm ảnh đều lấy n&eacute;t theo pha so với 0.78% tr&ecirc;n Galaxy S6. Thực tế th&igrave; m&aacute;y lấy n&eacute;t gần như ngay lập tức m&agrave; kh&ocirc;ng phải chờ như S6. M&igrave;nh c&oacute; quay sơ qua một đoạn ngắn trong video&nbsp;<a href="https://tinhte.vn/tags/tren-tay/">tr&ecirc;n tay</a>&nbsp;nhưng sẽ cần thử kỹ hơn sau n&agrave;y.<br />
<br />
<strong>Phần mềm:</strong><br />
Galaxy S7 v&agrave; S7 edge đều dựa tr&ecirc;n Android 6.0, bổ sung th&ecirc;m một số t&iacute;nh năng mới như Always On Display, API Vulkan cho game, c&aacute;c t&iacute;nh năng tối ưu h&oacute;a cho game&hellip; M&igrave;nh sẽ chia sẻ kỹ hơn v&agrave;o ng&agrave;y mai.<br />
&nbsp;</p>

<ul>
	<li><a href="https://tinhte.vn/store/2016/02/3612264_Tinhte_tren_tay_Galaxy_S7_MWC_2016-15.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/05/ae52a9d28935a80806c3cd2048c31408.jpg?3567" /></a></li>
	<li><a href="https://tinhte.vn/store/2016/02/3612265_Tinhte_tren_tay_Galaxy_S7_MWC_2016-11.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/6a/ee987acb527a31c459ca2d31adc112f6.jpg?3196" /></a></li>
	<li><a href="https://tinhte.vn/store/2016/02/3612267_Tinhte_tren_tay_Galaxy_S7_MWC_2016-9.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/81/9baf525bff2dc258700ba43510158e3f.jpg?2467" /></a></li>
	<li><a href="https://tinhte.vn/store/2016/02/3612268_Tinhte_tren_tay_Galaxy_S7_MWC_2016-10.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/26/9ad4b4c613063b03bbaf313522f3af85.jpg?3707" /></a></li>
	<li><a href="https://tinhte.vn/store/2016/02/3612269_Tinhte_tren_tay_Galaxy_S7_MWC_2016-7.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/1b/b725e41ea1c236327b7ab5aabd093a78.jpg?2743" /></a></li>
	<li><a href="https://tinhte.vn/store/2016/02/3612270_Tinhte_tren_tay_Galaxy_S7_MWC_2016-8.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/5f/5ab046cfa0d69c778f349656836dd9fb.jpg?3430" /></a></li>
	<li><a href="https://tinhte.vn/store/2016/02/3612271_Tinhte_tren_tay_Galaxy_S7_MWC_2016-6.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/b0/e7cac4f4b1af27070d57df1922cf1b64.jpg?2684" /></a></li>
	<li><a href="https://tinhte.vn/store/2016/02/3612272_Tinhte_tren_tay_Galaxy_S7_MWC_2016-4.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/db/912863f954d66e025131e93303a6ec4f.jpg?2235" /></a></li>
	<li><a href="https://tinhte.vn/store/2016/02/3612273_Tinhte_tren_tay_Galaxy_S7_MWC_2016-5.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/41/db192056b1b37abf941a968ab278e460.jpg?2082" /></a></li>
	<li><a href="https://tinhte.vn/store/2016/02/3612274_Tinhte_tren_tay_Galaxy_S7_MWC_2016-2.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/bb/174f8afdc9a1527dc91f6c7fa0562062.jpg?2222" /></a></li>
	<li><a href="https://tinhte.vn/store/2016/02/3612275_Tinhte_tren_tay_Galaxy_S7_MWC_2016-3.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/82/793b7b67e0a41c35f4bc489de684e945.jpg?2726" /></a></li>
	<li><a href="https://tinhte.vn/store/2016/02/3612276_Tinhte_tren_tay_Galaxy_S7_MWC_2016.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/16/bb212570d1b1299c8880c89597f1d8c5.jpg?2469" /></a></li>
	<li><a href="https://tinhte.vn/store/2016/02/3612266_Tinhte_tren_tay_Galaxy_S7_MWC_2016-12.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/f5/9ad0ae7511179250c761c2c3ee641d42.jpg?2458" /></a></li>
</ul>
', 1, 5, NULL, CAST(N'2017-01-07T08:44:52.790' AS DateTime), CAST(N'2017-01-07T08:44:52.790' AS DateTime))
GO
INSERT [dbo].[HangHoa] ([HangHoaId], [Ma], [Ten], [GiaBanThamKhao], [MoTa], [LoaiHangHoaId], [NhaCungCapId], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (16, N'00003', N'iPhone 7 Plus', 27990000, N'<p>&quot;<a href="https://tinhte.vn/tags/iphone-7-plus/">iPhone 7 Plus</a>&nbsp;kh&ocirc;ng c&oacute; qu&aacute; nhiều thay đổi về mặt t&iacute;nh năng so với thế hệ cũ, iPhone 7 Plus l&agrave; sự thụt l&ugrave;i của Apple&quot;&hellip; Chắc chắn l&agrave; c&aacute;c bạn đ&atilde; nghe rất nhiều những nhận định đ&oacute; từ những người xung quanh. Nếu l&agrave; iFan, &ldquo;<em>m&igrave;nh th&iacute;ch th&igrave; m&igrave;nh mua th&ocirc;i</em>&rdquo;, nhưng nếu l&agrave; người d&ugrave;ng b&igrave;nh thường, hay thậm ch&iacute; l&agrave; Android fan muốn đổi gi&oacute; th&igrave; iPhone 7 c&oacute; xứng đ&aacute;ng để mua hay kh&ocirc;ng lại l&agrave; một c&acirc;u chuyện kh&aacute;c.<br />
&nbsp;</p>

<p>​</p>

<p><br />
<strong>Thiết kế:</strong></p>

<p><br />
<strong><img alt="DSC_3700-Edit.jpg" src="https://tinhte.vn/store/2016/11/3907554_DSC_3700-Edit.jpg" /></strong><br />
​</p>

<p>Tạp ch&iacute; WSJ từng đăng một c&acirc;u n&oacute;i nổi tiếng: nếu n&oacute; kh&ocirc;ng c&oacute; vấn đề g&igrave; th&igrave; đừng t&igrave;m c&aacute;ch sửa n&oacute;. Thiết kế của iPhone về một mặt n&agrave;o đ&oacute; đ&uacute;ng l&agrave; kh&ocirc;ng c&oacute; vấn đề, khi n&oacute; vẫn dễ chịu để cầm v&agrave; dễ nh&igrave;n với hầu hết mọi người.<br />
<br />
Thế nhưng với một c&ocirc;ng ty được đ&aacute;nh gi&aacute; cao về mặt thẩm mỹ như Apple, 3 năm kh&ocirc;ng thay đổi thiết kế l&agrave; cả một khoảng thời gian d&agrave;i. Kh&ocirc;ng phải Apple kh&ocirc;ng l&agrave;m g&igrave;, thiết kế iPhone được cải tiến v&agrave; dần thay đổi để ho&agrave;n thiện hơn qua từng thế hệ, từ vật liệu cho đến những h&igrave;nh khối, những đường n&eacute;t nhỏ. Thế nhưng r&otilde; r&agrave;ng những cải tiến đ&oacute; l&agrave; kh&ocirc;ng đủ, h&atilde;y nh&igrave;n sang Note 7 ho&agrave;n thiện kh&ocirc;ng tốt bằng nhưng c&oacute; thiết kế truyền cảm hứng hơn nhiều, nh&igrave;n sang Xiaomi Mi Mix với viền m&agrave;n h&igrave;nh mỏng d&iacute;nh v&agrave; thiết kế độc đ&aacute;o hơn, ch&uacute;ng ta c&oacute; thể thấy iPhone 7 v&agrave; những người anh em của n&oacute; đang hơi lỗi nhịp với thời đại rồi.</p>

<p><br />
<img alt="DSC_3702-Edit.jpg" src="https://tinhte.vn/store/2016/11/3907551_DSC_3702-Edit.jpg" /><br />
​</p>

<p>Tr&ecirc;n iPhone 7 Plus, tỉ lệ sử dụng m&agrave;n h&igrave;nh ở mặt trước vẫn qu&aacute; thấp, viền m&agrave;n h&igrave;nh vẫn qu&aacute; lớn n&ecirc;n c&aacute;c bạn sẽ thấy một chiếc m&aacute;y lớn hơn so với những điện thoại kh&aacute;c c&ugrave;ng k&iacute;ch cỡ. Apple cũng đ&atilde; trang bị rất nhiều gioăng cao su v&agrave; keo chạy dọc khung m&aacute;y để tăng cường khả năng chống nước n&ecirc;n phần ch&ecirc;nh giữa những th&agrave;nh phần độc lập c&oacute; thể cảm nhận dễ d&agrave;ng hơn, đặc biệt l&agrave; ở khu gh&eacute;p nối giữa m&agrave;n h&igrave;nh v&agrave; th&acirc;n m&aacute;y. Đ&acirc;y l&agrave; những điểm m&agrave; m&igrave;nh kh&ocirc;ng th&iacute;ch, nhưng rồi cũng dần phải quen.</p>

<p><br />
<img alt="TDT09369-Edit.jpg" src="https://tinhte.vn/store/2016/11/3907563_TDT09369-Edit.jpg" /><br />
​</p>

<p>N&oacute;i về chống nước, iPhone 7 Plus cho ph&eacute;p sử dụng dưới nước nhưng kh&ocirc;ng khuyến c&aacute;o d&ugrave;ng khi đi lặn hay c&aacute;c hoạt động thể thao dưới nước. M&igrave;nh d&ugrave;ng khi đi tắm, ng&acirc;m bồn hay đi bơi th&igrave; đều chưa gặp vấn đề g&igrave; cả. Nhưng bạn cũng cần lưu &yacute; l&agrave; nếu m&aacute;y đ&atilde; bị mở ra (kh&ocirc;ng phải do kỹ thuật Apple) hoặc bị rơi th&igrave; n&ecirc;n cẩn thận. Một người bạn của m&igrave;nh bị rơi, m&oacute;p m&aacute;y, khi đem xuống hồ bơi nước v&agrave;o b&ecirc;n trong. May mắn l&agrave; b&ecirc;n trong iPhone 7 Plus c&oacute; rất nhiều gioăng cao su n&ecirc;n nước kh&ocirc;ng v&agrave;o linh kiện m&agrave; chỉ đọng hơi nước trong cụm camera th&ocirc;i, h&uacute;t ẩm l&agrave; d&ugrave;ng lại b&igrave;nh thường. Kh&ocirc;ng phải ai cũng may mắn như vậy n&ecirc;n nếu mua m&aacute;y cũ c&aacute;c bạn cũng cần để &yacute; đấy.<br />
<br />
Ph&iacute;m home l&agrave; một t&iacute;nh năng mới m&agrave; m&igrave;nh th&iacute;ch tr&ecirc;n iPhone 7 Plus, khi chưa quen th&igrave; rất kh&oacute; chịu nhưng sau đ&oacute; th&igrave; lại thấy tốt hơn rất nhiều, kh&ocirc;ng sợ hỏng n&uacute;t home như c&aacute;c m&aacute;y cũ m&agrave; thao t&aacute;c đa nhiệm lại nhanh ch&oacute;ng hơn.</p>

<p><br />
<img alt="DSC_3753.jpg" src="https://tinhte.vn/store/2016/11/3907564_DSC_3753.jpg" /><br />
​</p>

<p>Về phần jack cắm tai nghe, r&otilde; r&agrave;ng đ&acirc;y l&agrave; một điểm kh&ocirc;ng tốt của iPhone 7. Cứ cho l&agrave; n&oacute; sẽ th&uacute;c đẩy &acirc;m thanh tốt với bằng c&aacute;ch sử dụng DAC ngo&agrave;i, cứ cho l&agrave; tai nghe Bluetooth đang ng&agrave;y một ph&aacute;t triển hơn (doanh thu tai nghe kh&ocirc;ng d&acirc;y ở Mỹ đ&atilde; vượt qua tai nghe c&oacute; d&acirc;y) nhưng với đại đa số người d&ugrave;ng th&igrave; tai nghe l&agrave; c&aacute;i g&igrave; đ&oacute; qu&aacute; quen thuộc v&agrave; ch&uacute;ng ta đ&atilde; phải đầu tư qu&aacute; nhiều tiền cho n&oacute;. Hơn nữa, d&ugrave; Apple c&oacute; tặng k&egrave;m tai nghe Lightning v&agrave; adapter chuyển đổi Lightning sang 3.5mm trong hộp nhưng việc kh&ocirc;ng vừa sạc vừa nghe nhạc được (rất cần thiết khi đi m&aacute;y bay hay c&aacute;c phương tiện c&ocirc;ng cộng) v&agrave; phải mang theo một adapter cũng kh&aacute; l&agrave; bất tiện.<br />
<br />
<strong>M&agrave;n h&igrave;nh:</strong></p>

<p>&quot;Điện thoại 2016 m&agrave; m&agrave;n h&igrave;nh vẫn d&ugrave;ng FullHD, thế th&igrave; rỗ chết. D&ugrave;ng c&aacute;i tấm nền g&igrave; 3 năm m&agrave; kh&ocirc;ng thay đổi, lỳ như tr&acirc;u. H&uacute;t m&aacute;u, độ ph&acirc;n giải chả kh&aacute;c g&igrave; mấy điện thoại Android 6 triệu&quot;.<br />
<br />
<img alt="DSC_3761.jpg" src="https://tinhte.vn/store/2016/11/3907561_DSC_3761.jpg" /><br />
​</p>

<p>Đ&uacute;ng l&agrave; rất dễ để đưa ra những nhận định đ&oacute;, v&agrave; cũng rất dễ ăn gạch nếu n&oacute;i iPhone 7 Plus l&agrave; điện thoại c&oacute; m&agrave;n h&igrave;nh xuất sắc nhất thế giới ở thời điểm n&agrave;y. Nhưng dừng lại đ&oacute; đ&atilde;, ở một g&oacute;c độ n&agrave;o đ&oacute; th&igrave; iPhone 7 Plus thật sự xuất sắc nhất.<br />
<br />
C&ugrave;ng l&agrave; m&agrave;n h&igrave;nh FullHD nhưng c&oacute; rất nhiều kiểu tấm nền kh&aacute;c nhau, c&oacute; nhiều kiểu căn chỉnh kh&aacute;c nhau, nhiều kiểu thiết kế kh&aacute;c nhau. Tr&ecirc;n iPhone 7 Plus, Apple vẫn d&ugrave;ng tấm nền IPS LCD nhưng lần n&agrave;y th&igrave; họ mở rộng ra hỗ trợ kh&ocirc;ng gian m&agrave;u DCI-P3, kh&ocirc;ng gian m&agrave;u d&ugrave;ng trong điện ảnh c&oacute; khả năng hiển thị nhiều trạng th&aacute;i m&agrave;u sắc hơn l&agrave; dải m&agrave;u sRGB vốn kh&aacute; hẹp được sử dụng rộng r&atilde;i. Bạn cứ thử tưởng tượng trước kia ch&uacute;ng ta c&oacute; m&agrave;u đỏ, giờ th&igrave; c&oacute; m&agrave;u đỏ đỏ hơn, m&agrave;u cam cam hơn, m&agrave;u v&agrave;ng v&agrave;ng hơn v&agrave; hồng th&igrave; hồng hơn. Tuy vậy, m&agrave;u xanh l&aacute; th&igrave; kh&ocirc;ng xanh l&aacute; hơn nhiều nh&eacute;, v&igrave; kh&ocirc;ng gian m&agrave;u DCI P3 kh&ocirc;ng mạnh ở dải m&agrave;u n&agrave;y.<br />
&nbsp;</p>

<p><em>&quot;DCI-P3 th&igrave; c&oacute; g&igrave; mới, LG G5 chả phủ 98% kh&ocirc;ng gian m&agrave;u DCI-P3 đấy th&ocirc;i.&nbsp;<br />
Samsung kh&ocirc;ng th&egrave;m nhắc đến kh&ocirc;ng gian m&agrave;u rộng th&ocirc;i, chứ m&agrave;n h&igrave;nh AMOLED trước giờ kh&ocirc;ng gian m&agrave;u vẫn rộng th&ocirc;i.&quot;</em><br />
​</p>

<p>Ok, đ&oacute; l&agrave; sự thật. Nhưng Apple lu&ocirc;n c&oacute; một điểm m&agrave; c&aacute;c nh&agrave; sản xuất Android kh&aacute;c kh&ocirc;ng c&oacute; được: khả năng quản l&yacute; iOS. Khi Apple n&oacute;i họ hỗ trợ DCI-P3, th&igrave; cả phần cứng v&agrave; phần mềm đều hỗ trợ, camera chụp ảnh ra ở profile m&agrave;u DCI P3, m&agrave;u sắc hiển thị trong những ứng dụng n&agrave;o hỗ trợ DCI-P3 sẽ l&agrave; DCI-P3, ứng dụng n&agrave;o chưa hỗ trợ DCI th&igrave; hiển thị ở kh&ocirc;ng gian m&agrave;u sRGB. Đ&acirc;y l&agrave; điểm rất quan trọng v&igrave; nếu bắt tất cả c&aacute;c nội dung đều hiển thị ở DCI-P3 d&ugrave; n&oacute; kh&ocirc;ng hỗ trợ th&igrave; h&igrave;nh ảnh c&oacute; thể trở n&ecirc;n rất ảo v&agrave; bị lệch m&agrave;u.</p>

<p><br />
<img alt="DSC_3718.jpg" src="https://tinhte.vn/store/2016/11/3907552_DSC_3718.jpg" /><br />
​</p>

<p>Thiết bị di động đầu ti&ecirc;n của Apple hỗ trợ DCI-P3 l&agrave; iPad Pro 9.7&rdquo;, trước đ&oacute; th&igrave; d&ugrave; Mac OS l&agrave; hệ điều h&agrave;nh m&aacute;y t&iacute;nh hỗ trợ quản l&yacute; m&agrave;u sắc tốt nhất nhưng iOS th&igrave; chẳng c&oacute; một cơ chế quản l&yacute; m&agrave;u n&agrave;o cả, giống như Android. iOS 9 tr&ecirc;n iPad Pro 9.7 bắt đầu xuất hiện nhưng cơ chế quản l&yacute; m&agrave;u v&agrave; ho&agrave;n thiện hơn nữa tr&ecirc;n iOS 10 của iPhone 7 Plus. R&otilde; r&agrave;ng Google đ&atilde; chậm chạp trong việc hỗ trợ Android, l&agrave;m cho c&aacute;c nh&agrave; sản xuất nền tảng n&agrave;y bị mất lợi điểm so với Apple.</p>

<p><br />
<img alt="DSC_3714.jpg" src="https://tinhte.vn/store/2016/11/3907556_DSC_3714.jpg" /><br />
​</p>

<p>V&agrave; đ&oacute; l&agrave; ch&uacute;ng ta cũng chưa nhắc đến việc c&oacute; vẻ như Apple đ&atilde; c&acirc;n chỉnh từng tấm nền một để c&oacute; được kết quả hiển thị đồng nhất giữa c&aacute;c tấm nền kh&aacute;c nhau về m&agrave;u sắc. Một số b&aacute;o c&aacute;o cho thấy c&oacute; sự đồng đều về m&agrave;u sắc giữa tất cả c&aacute;c m&agrave;n h&igrave;nh iPhone b&aacute;n ra c&ugrave;ng một thị trường, điều rất hiếm hay thậm ch&iacute; l&agrave; chưa từng xảy ra với c&aacute;c sản phẩm kh&aacute;c.<br />
<br />
Nếu c&oacute; điểm g&igrave; đ&oacute; giữ kh&ocirc;ng cho m&agrave;n h&igrave;nh iPhone 7 Plus trở th&agrave;nh xuất sắc nhất th&igrave; đ&oacute; l&agrave; độ ph&acirc;n giải vẫn l&agrave; FullHD v&agrave; sự kh&ocirc;ng đồng nhất giữa những thị trường, c&oacute; thị trường m&aacute;y cho m&agrave;n h&igrave;nh m&agrave;u xanh hơn v&agrave; thị trường th&igrave; ngả v&agrave;ng hơn (điều n&agrave;y c&ograve;n g&acirc;y tranh c&atilde;i). Ngo&agrave;i ra, việc thiếu vắng c&ocirc;ng nghệ True Tone từng xuất hiện tr&ecirc;n iPad Pro 9.7 cũng l&agrave; một điểm đ&aacute;ng tiếc.<br />
<br />
<strong>Hiệu năng:</strong><br />
&nbsp;</p>

<p>&quot;Điện thoại g&igrave; l&egrave;o t&egrave;o 3GB RAM, CPU 4 nh&acirc;n trong khi người ta 8 nh&acirc;n, 10 nh&acirc;n, chạy thế qu&aacute;i n&agrave;o được&quot;​</p>

<p><br />
Ch&uacute;ng ta chẳng cần quan t&acirc;m đến hiệu năng của iPhone, v&igrave; n&oacute; tốt v&agrave; lu&ocirc;n tốt như thường lệ. Kỳ n&agrave;y th&igrave; Apple trang bị iPhone 7 Plus 3GB RAM, nhưng n&oacute; cũng chẳng kh&aacute;c biệt mấy so với iPhone 7 đ&acirc;u v&igrave; lượng RAM đ&oacute; d&ugrave;ng để g&aacute;nh cho m&agrave;n h&igrave;nh độ ph&acirc;n giải cao hơn. Trừ khi bạn mở qu&aacute; nhiều ứng dụng m&agrave; lười tải lại th&igrave; iPhone 7 Plus mới chiếm ưu thế về RAM.</p>

<p><br />
<img alt="DSC_3745.jpg" src="https://tinhte.vn/store/2016/11/3907562_DSC_3745.jpg" /><br />
​</p>

<p>Nếu quan t&acirc;m đến c&aacute;c con số benchmark th&igrave; iPhone 7 Plus mạnh hơn khoảng 40-50% so với thế hệ cũ, kh&ocirc;ng phải v&igrave; n&oacute; c&oacute; 4 nh&acirc;n xử l&yacute; m&agrave; v&igrave; c&oacute; xung nhịp cao hơn, l&ecirc;n tới 2.3GHz so với 1.8GHz trước kia. 2 nh&acirc;n xử l&yacute; phụ tr&ecirc;n iPhone 7 Plus c&oacute; vẻ như kh&ocirc;ng được thiết kế theo kiến tr&uacute;c big.Little, n&ecirc;n n&oacute; sẽ kh&ocirc;ng k&iacute;ch hoạt 4 nh&acirc;n c&ugrave;ng l&uacute;c. 2 nh&acirc;n phụ n&agrave;y c&oacute; lẽ chỉ hoạt động khi m&aacute;y ở chế độ sleep hoặc chạy ứng dụng rất nhẹ.<br />
<br />
<strong>Bộ nhớ:</strong><br />
Trong thời gian vừa qua th&igrave; c&aacute;c bạn cũng c&oacute; nghe về việc iPhone 32GB chậm hơn 128GB. Thực ra th&igrave; m&igrave;nh d&ugrave;ng 32GB cả th&aacute;ng rồi d&ugrave;ng 128GB nửa th&aacute;ng, chẳng thấy kh&aacute;c biệt thực tế n&agrave;o ngoại trừ việc 32GB hết dung lượng nhanh hơn Trong c&aacute;c b&agrave;i thử benchmark hay thử so s&aacute;nh cạnh nhau, hoặc nếu bạn thường xuy&ecirc;n ch&eacute;p dữ liệu v&agrave;o m&aacute;y th&igrave; c&oacute; thể 128GB sẽ c&oacute; ưu thế hơn, nhưng mọi chuyện cũng chỉ c&oacute; vậy.</p>

<p><br />
<img alt="DSC_3759.jpg" src="https://tinhte.vn/store/2016/11/3907560_DSC_3759.jpg" /><br />
​</p>

<p>C&oacute; một số bạn nghĩ rằng mua 256GB sẽ l&agrave; nhanh nhất, v&igrave; theo l&yacute; thuyết th&igrave; bộ nhớ flash dung lượng cao thường d&ugrave;ng nhiều chip nhỏ, chia nhiều l&agrave;n dữ liệu để truyền tải nhanh hơn. Tr&ecirc;n thực tế, Apple d&ugrave;ng chip nhớ dung lượng cao để tiết kiệm diện t&iacute;ch, n&ecirc;n tốc độ 256GB v&agrave; 128GB l&agrave; gần như tương đương. Hiệu năng SSD của iPhone 7 v&agrave; iPhone 6 cũng kh&ocirc;ng kh&aacute;c nhau mấy, Apple vẫn sử dụng controller ri&ecirc;ng do họ từ chế tạo n&ecirc;n tốc độ cũng như băng th&ocirc;ng iPhone 7 Plus vẫn dẫn đầu.</p>

<p><br />
<img alt="DSC_3748.jpg" src="https://tinhte.vn/store/2016/11/3907559_DSC_3748.jpg" /><br />
​</p>

<p>Trong b&agrave;i&nbsp;<a href="https://tinhte.vn/tags/review-iphone-7-plus/">review iPhone 7 Plus</a>&nbsp;n&agrave;y th&igrave; ch&uacute;ng ta c&oacute; sự xuất hiện của mục bộ nhớ, v&igrave; năm nay Apple đ&atilde; n&acirc;ng gấp đ&ocirc;i dung lượng iPhone l&ecirc;n 32GB thay v&igrave; 16GB như năm ngo&aacute;i. C&aacute; nh&acirc;n m&igrave;nh thấy 32GB l&agrave; đủ, thậm ch&iacute; dư x&agrave;i nếu bạn mua c&aacute;c g&oacute;i iCloud. M&igrave;nh d&ugrave;ng iCloud gi&aacute; khoảng 21 ng&agrave;n 1 th&aacute;ng (0.99$), được 50GB, c&aacute;c h&igrave;nh ảnh đều được tải l&ecirc;n iCloud tiết kiệm rất nhiều dung lượng. Nếu bạn nghe nhạc nhiều th&igrave; 32GB l&agrave; kh&ocirc;ng đủ, c&ograve;n với đại đa số người d&ugrave;ng m&igrave;nh thấy bản 32GB l&agrave; hợp l&yacute; nhất về cả chi ph&iacute; lẫn mức độ sử dụng.<br />
<br />
<strong>Pin:</strong><br />
&nbsp;</p>

<p><strong><img alt="DSC_3739.jpg" src="https://tinhte.vn/store/2016/11/3907557_DSC_3739.jpg" /></strong><br />
​</p>

<p>Sử dụng pin 2900mAh, pin của iPhone 7 tốt hơn 6s Plus nhưng kh&ocirc;ng nhiều. Nếu x&agrave;i nhiều th&igrave; khoảng 3 giờ chiều iPhone 6s Plus hết pin c&ograve;n iPhone 7 v&agrave;o khoảng 4 giờ. H&ocirc;m n&agrave;o m&igrave;nh d&ugrave;ng &iacute;t, 7 giờ hơn phải sạc lại iPhone 6s Plus th&igrave; iPhone 7 Plus c&ograve;n khoảng 15%.<br />
<br />
Pin th&igrave; tốt rồi, nhưng m&agrave; iPhone 7 vẫn c&ograve;n d&ugrave;ng sạc 5V 1A. Đ&acirc;y l&agrave; năm 2016, tức iPhone ra được 9 năm rồi, m&agrave; Apple vẫn d&ugrave;ng cục sạc thời tiền sử với tốc độ sạc rất chậm n&agrave;y th&igrave; đ&uacute;ng l&agrave; kh&ocirc;ng thể chấp nhận được. Đ&acirc;y mới l&agrave; h&uacute;t m&aacute;u thật sự. Chắc phải năm sau ch&uacute;ng ta mới c&oacute; sạc mới, c&oacute; thể l&agrave; sạc nhanh.<br />
<a href="https://tinhte.vn/threads/danh-gia-chi-tiet-pin-iphone-7-plus-hon-18-tieng-su-dung-hon-hop-lau-hon-6s-plus.2648539/">Xem th&ecirc;m pin v&agrave; sạc chi tiết của iPhone 7 Plus tại đ&acirc;y.</a><br />
<br />
<strong>Camera:</strong><br />
Kh&ocirc;ng phải l&agrave; chiếc điện thoại c&oacute; 2 camera đầu ti&ecirc;n, nhưng t&iacute;nh đến thời điểm n&agrave;y th&igrave; iPhone 7 Plus đang l&agrave; sản phẩm ứng dụng 2 camera một c&aacute;ch hợp l&yacute; nhất với sự xuất hiện của một camera g&oacute;c rộng v&agrave; một camera ti&ecirc;u cự trung b&igrave;nh. Huawei P9 l&agrave;m rất tốt nhiệm vụ của n&oacute; khi camera phụ trắng đen cho chất lượng hiển thị vượt trội, LG G5 cũng c&oacute; g&oacute;c rộng rất độc đ&aacute;o nhưng tất cả những t&iacute;nh năng đ&oacute; đều chỉ nhắm v&agrave;o một số rất &iacute;t đối tượng người d&ugrave;ng th&iacute;ch chụp ảnh, c&ograve;n camera tr&ecirc;n iPhone 7 Plus ph&ugrave; hợp với đại đa số người d&ugrave;ng, những mẹ bỉm sữa th&iacute;ch chụp con nhỏ, một anh c&ocirc;ng nh&acirc;n th&iacute;ch chụp người th&acirc;n hay c&ocirc; nh&acirc;n vi&ecirc;n văn ph&ograve;ng hứng th&uacute; với cảnh vật xung quanh.</p>

<p><br />
<img alt="DSC_3709-Edit.jpg" src="https://tinhte.vn/store/2016/11/3907553_DSC_3709-Edit.jpg" /><br />
​</p>

<p>Về chất lượng ảnh, ban ng&agrave;y th&igrave; iPhone 7 Plus kh&ocirc;ng kh&aacute;c biệt nhiều với iPhone 6s Plus, nhưng ban đ&ecirc;m th&igrave; bạn c&oacute; thể thấy l&agrave; Apple xử l&yacute; tốt hơn rất nhiều, đặc biệt l&agrave; ở những khu vực phức tạp như shadow th&igrave; &iacute;t nhiễu v&agrave; kiểm so&aacute;t tốt hơn. D&ugrave; vậy, x&eacute;t một c&aacute;ch tổng thể th&igrave; hiệu năng chụp đ&ecirc;m của iPhone 7 Plus vẫn thua một số đối thủ kh&aacute;c, d&ugrave; những phần c&ograve;n lại vẫn đủ sức gỡ lại.<br />
<br />
Về hai camera, thuật to&aacute;n xử l&yacute; của Apple ng&agrave;y c&agrave;ng tốt hơn. Ống k&iacute;nh 56mm thật sự rất ấn tượng khi đủ s&aacute;ng nhưng ban đ&ecirc;m th&igrave; n&oacute; rất tệ, tệ đến nối Apple tắt đi v&agrave; sử dụng zoom số từ cảm biến ch&iacute;nh để chụp. Đ&oacute; ch&iacute;nh l&agrave; l&yacute; do m&agrave; khi bạn che camera phụ đi v&agrave; zoom 2x th&igrave; h&igrave;nh ảnh vẫn hiển thị như b&igrave;nh thường khi chụp thiếu s&aacute;ng. Đ&acirc;y l&agrave; điểm m&igrave;nh kh&ocirc;ng th&iacute;ch, nếu như Apple trang bị cảm biến v&agrave; ống k&iacute;nh tương tự cảm biến ch&iacute;nh th&igrave; sẽ tốt hơn, nhưng tiếc l&agrave; kh&ocirc;ng được vậy.<br />
<br />
Khả năng quay phim của iPhone 7 Plus l&agrave; tốt nhất ở thời điểm hiện tại so với tất cả c&aacute;c flagship tr&ecirc;n thị trường. Apple sử dụng chip đồ họa của Imagination, được họ tối ưu lại v&agrave; xử l&yacute; video tốt hơn hẳn c&aacute;c m&aacute;y Android cao cấp d&ugrave;ng SnapDragon 820. Cứ thử quay phim trực tiếp từ hai m&aacute;y th&igrave; c&aacute;c bạn sẽ thấy được sự kh&aacute;c biệt kh&aacute; r&otilde; r&agrave;ng..<br />
<br />
<strong>Ảnh chụp từ camera iPhone 7, d&ugrave;ng Lightroom resize c&ograve;n 2048px, giới hạn dung lượng file l&agrave; 300KB, ảnh kh&ocirc;ng chỉnh sửa tr&ecirc;n m&aacute;y t&iacute;nh.</strong><br />
<br />
Ảnh trực tiếp từ camera:<br />
<img alt="iPhone_7_plus_camera_tinhte.vn-7.jpg" src="https://tinhte.vn/store/2016/11/3907487_iPhone_7_plus_camera_tinhte.vn-7.jpg" /><img alt="iPhone_7_plus_camera_tinhte.vn-8.jpg" src="https://tinhte.vn/store/2016/11/3907490_iPhone_7_plus_camera_tinhte.vn-8.jpg" /><img alt="iPhone_7_plus_camera_tinhte.vn-10.jpg" src="https://tinhte.vn/store/2016/11/3907491_iPhone_7_plus_camera_tinhte.vn-10.jpg" /><img alt="iPhone_7_plus_camera_tinhte.vn-9.jpg" src="https://tinhte.vn/store/2016/11/3907493_iPhone_7_plus_camera_tinhte.vn-9.jpg" /><img alt="iPhone_7_plus_camera_tinhte.vn-12.jpg" src="https://tinhte.vn/store/2016/11/3907492_iPhone_7_plus_camera_tinhte.vn-12.jpg" /><img alt="iPhone_7_plus_camera_tinhte.vn.jpg" src="https://tinhte.vn/store/2016/11/3907494_iPhone_7_plus_camera_tinhte.vn.jpg" /><img alt="iPhone_7_plus_camera_tinhte.vn-6.jpg" src="https://tinhte.vn/store/2016/11/3907489_iPhone_7_plus_camera_tinhte.vn-6.jpg" /><img alt="iPhone_7_plus_camera_tinhte.vn-11.jpg" src="https://tinhte.vn/store/2016/11/3907495_iPhone_7_plus_camera_tinhte.vn-11.jpg" /><br />
<br />
Ảnh c&oacute; &aacute;p m&agrave;u tr&ecirc;n iPhone:<br />
<img alt="iPhone_7_plus_camera_tinhte.vn-2.jpg" src="https://tinhte.vn/store/2016/11/3907484_iPhone_7_plus_camera_tinhte.vn-2.jpg" /><img alt="iPhone_7_plus_camera_tinhte.vn-5.jpg" src="https://tinhte.vn/store/2016/11/3907488_iPhone_7_plus_camera_tinhte.vn-5.jpg" /><img alt="iPhone_7_plus_camera_tinhte.vn-4.jpg" src="https://tinhte.vn/store/2016/11/3907486_iPhone_7_plus_camera_tinhte.vn-4.jpg" /><img alt="iPhone_7_plus_camera_tinhte.vn-3.jpg" src="https://tinhte.vn/store/2016/11/3907485_iPhone_7_plus_camera_tinhte.vn-3.jpg" />&nbsp;<br />
<br />
<strong>Kết luận:</strong><br />
&nbsp;</p>

<p><strong><img alt="DSC_3703-Edit.jpg" src="https://tinhte.vn/store/2016/11/3907555_DSC_3703-Edit.jpg" /></strong><br />
​</p>

<p>iPhone chưa bao giờ l&agrave; chiếc điện thoại xuất sắc về mặt t&iacute;nh năng, những thứ n&oacute; mới bắt đầu trang bị th&igrave; người ta đ&atilde; c&oacute; cả 1-2 thế hệ trước. Nhưng nếu để sử dụng b&igrave;nh thường, &iacute;t nghịch, muốn c&aacute;i g&igrave; đ&oacute; nhanh, ổn định, lu&ocirc;n l&agrave;m việc tốt khi ch&uacute;ng ta cần th&igrave; r&otilde; r&agrave;ng iPhone 7 Plus vẫn lu&ocirc;n l&agrave; một thiết bị h&agrave;ng đầu.<br />
<br />
Sẽ hơi bất c&ocirc;ng khi n&oacute;i iPhone 7 Plus chẳng c&oacute; g&igrave; kh&aacute;c biệt so với iPhone 6s Plus. N&oacute; được n&acirc;ng cấp m&agrave;n h&igrave;nh (kh&aacute; nhiều), hiệu năng (40%), camera (l&ecirc;n gấp đ&ocirc;i, chụp ch&acirc;n dung tốt hơn), pin l&acirc;u hơn, n&uacute;t Home tiện lợi hơn nhưng c&oacute; lẽ từng đ&oacute; l&agrave; kh&ocirc;ng đủ. Người ta vẫn sẽ mua iPhone 7 Plus, nhưng một phần l&agrave; v&igrave; hợp đồng 2 năm từ iPhone 6/6 Plus đ&atilde; hết hạn, một phần l&agrave; v&igrave; Note 7 gặp sự cố, một phần nhỏ v&igrave; hai camera v&agrave; chống nước, nhưng r&otilde; r&agrave;ng Apple cần l&agrave;m nhiều hơn cho những sản phẩm thế hệ tiếp theo.<br />
<br />
D&ugrave; sao đi nữa, iPhone 7 Plus vẫn l&agrave; một chiếc điện thoại rất đ&aacute;ng mua, nhất l&agrave; với những người hậu đậu sợ nước l&agrave;m hỏng điện thoại hay muốn ghi lại những khung h&igrave;nh lạ mắt hơn, ấn tượng hơn với camera thứ 2.<br />
&nbsp;</p>

<p>&quot;Ai th&iacute;ch th&igrave; người đ&oacute; mua th&ocirc;i&quot;</p>
', 1, 4, NULL, CAST(N'2017-01-07T08:47:50.480' AS DateTime), CAST(N'2017-01-07T19:12:49.237' AS DateTime))
GO
INSERT [dbo].[HangHoa] ([HangHoaId], [Ma], [Ten], [GiaBanThamKhao], [MoTa], [LoaiHangHoaId], [NhaCungCapId], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (17, N'00004', N'iPad Pro 12.9', 17990000, N'<p>Ng&agrave;y&nbsp;09/09/2015, Apple đ&atilde; ch&iacute;nh thức giới thiệu chiếc&nbsp;<a href="https://tinhte.vn/tags/ipad-pro/">iPad Pro</a>. Đ&acirc;y l&agrave; chiếc&nbsp;<a href="https://tinhte.vn/tags/ipad-3/">iPad</a>&nbsp;với m&agrave;n h&igrave;nh lớn nhất hiện tại, 12.9&rdquo;, độ ph&acirc;n giải 5.6 triệu điểm ảnh v&agrave; l&agrave; m&agrave;n h&igrave;nh ti&ecirc;n tiến nhất Apple từng l&agrave;m. Apple trang bị cho iPad Pro chip A9X nền tảng 64-bit mới với tốc độ nhanh hơn 1.8 lần so với chip A8X tr&ecirc;n iPad Air 2. Băng th&ocirc;ng RAM tăng gấp đ&ocirc;i, hiệu năng bộ nhớ lưu trữ v&agrave; hiệu năng đồ hoạ cũng tăng gấp đ&ocirc;i so với chip A8X.<br />
&nbsp;</p>

<p>​</p>

<p><br />
<img alt="iPad-Pro-Lifestyle-6.jpg" src="https://tinhte.vn/store/2015/09/3136973_iPad-Pro-Lifestyle-6.jpg" /><br />
<br />
Nếu bạn chưa thể tưởng tượng ra m&agrave;n h&igrave;nh 12.9&quot; to như thế n&agrave;o th&igrave; bạn c&oacute; thể so s&aacute;nh n&oacute; với Macbook 12&quot; v&agrave; Macbook Air 13&quot;. iPad Pro c&oacute; m&agrave;n h&igrave;nh thậm ch&iacute; lớn hơn Macbook 12&quot; v&agrave; ngang ngửa so với Macbook 13&quot;. C&ograve;n nếu so với iPad Air th&igrave; chiều rộng của iPad Pro bằng chiều cao của iPad Air. M&agrave;n h&igrave;nh của iPad Pro sẽ tương đương 2 m&agrave;n h&igrave;nh iPad Air cộng lại.<br />
<br />
Kh&ocirc;ng r&otilde; l&agrave; liệu một người d&ugrave;ng c&aacute; nh&acirc;n th&ocirc;ng thường c&oacute; cần đến một chiếc m&aacute;y t&iacute;nh bảng c&oacute; m&agrave;n h&igrave;nh to đến như vậy hay kh&ocirc;ng. Trong buổi ra mắt, Apple c&oacute; tr&igrave;nh diễn iPad Pro chạy ứng dụng AutoCAD v&agrave; mọi thứ diễn ra rất mượt m&agrave;. C&oacute; thể suy luận l&agrave; iPad Pro thật sự l&agrave; chiếc tablet d&agrave;nh cho những người l&agrave;m việc chuy&ecirc;n nghiệp, chẳng hạn như trong ng&agrave;nh thiết kế x&acirc;y dựng,...<br />
<br />
<img alt="iPad-Pro-Lifestyle-3.jpg" src="https://tinhte.vn/store/2015/09/3136970_iPad-Pro-Lifestyle-3.jpg" /><br />
<br />
N&oacute;i tiếp về chiếc m&agrave;n h&igrave;nh tr&ecirc;n iPad Pro. Ngo&agrave;i k&iacute;ch thước 12.9&rdquo; th&igrave; đ&acirc;y l&agrave; m&agrave;n h&igrave;nh c&oacute; c&ocirc;ng nghệ ti&ecirc;n tiến nhất của Apple. H&atilde;ng n&agrave;y đ&atilde; sử dụng c&ocirc;ng nghệ m&agrave; họ trang bị tr&ecirc;n iMac Retina 5K. Với độ ph&acirc;n giải 5.6 triệu điểm ảnh, iPad Pro sẽ mang lại chất lượng hiển thị h&igrave;nh ảnh tuyệt vời. V&agrave; lần đầu ti&ecirc;n tr&ecirc;n một m&agrave;n h&igrave;nh của Apple c&oacute; tần số qu&eacute;t biến thi&ecirc;n. Điều n&agrave;y c&oacute; nghĩa l&agrave; khi kh&ocirc;ng cần thiết th&igrave; tần số qu&eacute;t được giảm xuống, gi&uacute;p tiết kiệm pin.<br />
<br />
Chi tiết hơn về con chip A9X tr&ecirc;n iPad Pro. Phill Schiller đ&atilde; n&oacute;i vui rằng &ldquo;Nh&oacute;m l&agrave;m chip của ch&uacute;ng t&ocirc;i vừa mới bốc hoả.&rdquo; C&acirc;u n&agrave;y ngụ &yacute; l&agrave; Apple đ&atilde; tạo ra được một thế hệ vi xử l&yacute; di động mới với tốc độ xử l&yacute; nhanh hơn, khả năng đồ họa tốt hơn c&ugrave;ng nhiều cải tiến kh&aacute;c.<br />
<br />
<img alt="iPad-Pro-Lifestyle-5.jpg" src="https://tinhte.vn/store/2015/09/3136972_iPad-Pro-Lifestyle-5.jpg" /><br />
<br />
A9X l&agrave; vi xử l&yacute; 64-bit thế hệ thứ 3 m&agrave; Apple đ&atilde; ph&aacute;t triển. Con chip n&agrave;y mang đến cho iPad Pro hiệu năng cao hơn 80% những chiếc m&aacute;y t&iacute;nh x&aacute;ch tay ra mắt trong v&ograve;ng 12 th&aacute;ng vừa qua. So với chip A8X tr&ecirc;n iPad Air 2, chip A9X cho tốc độ xử l&yacute; nhanh hơn 1,8 lần; băng th&ocirc;ng bộ nhớ tăng gấp đ&ocirc;i, tốc độ lưu trữ tăng gấp đ&ocirc;i. Về sức mạnh đồ hoạ, Apple tuy&ecirc;n bố iPad Pro c&oacute; hiệu năng tương đương với những chiếc m&aacute;y chơi game console. So với iPad đời đầu, sức mạnh đồ hoạ của iPad Pro tăng đến 22 lần.<br />
<br />
Với sức mạnh như vậy nhưng iPad Pro vẫn c&oacute; thể hoạt động li&ecirc;n tục tới 10 giờ đồng hồ, tương đương với iPad Air 2. C&oacute; lẽ nhờ k&iacute;ch thước lớn hơn n&ecirc;n kh&ocirc;ng gian để bố tr&iacute; pin cũng nhiều hơn. Apple lu&ocirc;n l&agrave;m rất tốt về vấn đề pin, nhằm mang lại cho người d&ugrave;ng trải nghiệm tốt nhất.<br />
<br />
<img alt="iPad-Pro-Lifestyle-1.jpg" src="https://tinhte.vn/store/2015/09/3136968_iPad-Pro-Lifestyle-1.jpg" /><br />
<br />
Về tổng thể th&igrave; thiết kế của iPad Pro kh&ocirc;ng c&oacute; g&igrave; đặc biệt so với những mẫu iPad hiện tại. Mặt trước ch&uacute;ng ta c&oacute; một m&agrave;n h&igrave;nh 12.9&rdquo; c&ugrave;ng một n&uacute;t Home với Touch ID ở giữa viền dưới. Tr&ecirc;n đỉnh m&aacute;y l&agrave; n&uacute;t nguồn v&agrave; lỗ cắm tai nghe như th&ocirc;ng thường. Mặt sau l&agrave; camera iSight 8MP. Cạnh phải l&agrave; nơi bố tr&iacute; n&uacute;t tăng giảm &acirc;m lượng v&agrave; microphone.<br />
<br />
<img alt="iPad-Pro-10.png" src="https://tinhte.vn/store/2015/09/3136967_iPad-Pro-10.png" /><br />
<br />
C&ograve;n ở cạnh tr&aacute;i c&oacute; cổng kết nối mới m&agrave; Apple gọi l&agrave; Smart Connector, c&oacute; 3 chấm h&igrave;nh tr&ograve;n. Với Smart Connector, người d&ugrave;ng c&oacute; thể kết nối iPad Pro với phụ kiện b&agrave;n ph&iacute;m rời Smart Keyboard. Đ&acirc;y l&agrave; phụ kiện do ch&iacute;nh Apple sản xuất, m&igrave;nh sẽ n&oacute;i chi tiết về n&oacute; trong một b&agrave;i kh&aacute;c.<br />
<br />
<img alt="iPad-Pro-6.png" src="https://tinhte.vn/store/2015/09/3136963_iPad-Pro-6.png" /><br />
<br />
Ngo&agrave;i ra th&igrave; Apple c&ograve;n giới thiệu c&acirc;y b&uacute;t Apple Pencil để d&ugrave;ng k&egrave;m với iPad Pro. C&oacute; lẽ đ&acirc;y l&agrave; phụ kiện d&agrave;nh cho c&aacute;c kiến tr&uacute;c sư hay họa sĩ g&igrave; đ&oacute;. C&aacute;c ứng dụng tương th&iacute;ch với Apple Pencil gồm c&oacute; Mail v&agrave; Notes, Office for iOS đến từ Microsoft hay Adobe Photoshop Fix, Adobe Sketch,...<br />
<br />
Điểm ấn tượng tr&ecirc;n iPad Pro l&agrave; n&oacute; mỏng v&agrave; nhẹ, đặc biệt khi n&oacute; c&oacute; m&agrave;n h&igrave;nh tới 12.9&rdquo;. Độ d&agrave;y của iPad Pro chỉ l&agrave; 6.9mm v&agrave; n&oacute; nặng khoảng 0.7kg. Apple cho biết với trọng lượng n&agrave;y th&igrave; người d&ugrave;ng c&oacute; thể thoải m&aacute;i sử dụng m&aacute;y trong thời gian d&agrave;i hay l&agrave; mang theo người.<br />
<br />
iPad Pro c&oacute; tới 4 loa ngo&agrave;i, bố tr&iacute; ở 4 g&oacute;c m&aacute;y. V&agrave; với iOS9, 4 chiếc loa của iPad Pro sẽ c&oacute; thể tự c&acirc;n bằng &acirc;m thanh tuỳ theo c&aacute;ch người d&ugrave;ng cầm m&aacute;y. Chưa r&otilde; &yacute; định của Apple khi trang bị cho chiếc m&aacute;y t&iacute;nh bảng n&agrave;y tới 4 loa ngo&agrave;i, c&oacute; lẽ đối tượng m&agrave; họ nhắm đến thực sự kh&ocirc;ng phải l&agrave; người d&ugrave;ng c&aacute; nh&acirc;n.<br />
<br />
<img alt="iPad-Pro-Lifestyle-7.jpg" src="https://tinhte.vn/store/2015/09/3136974_iPad-Pro-Lifestyle-7.jpg" /><br />
<br />
Một điều m&agrave; ch&uacute;ng ta đ&atilde; b&agrave;n luận l&acirc;u nay l&agrave; liệu c&aacute;c thế hệ iDevice c&oacute; sử dụng cổng USB-C kh&ocirc;ng? C&acirc;u trả lời l&agrave; chưa, &iacute;t nhất l&agrave; tới thời điểm n&agrave;y với iPad Pro. Cạnh đ&aacute;y ch&uacute;ng ta vẫn c&oacute; cổng Lightning. Apple Pencil sẽ c&oacute; thể sạc khi cắm trực tiếp v&agrave;o cổng Lightning của iPad Pro.<br />
<br />
iPad Pro tất nhi&ecirc;n được c&agrave;i sẵn iOS 9, hệ điều h&agrave;nh di động mới nhất của Apple. Với c&aacute;c t&iacute;nh năng mới tr&ecirc;n iOS 9 th&igrave; iPad Pro cũng sẽ trở n&ecirc;n mạnh mẽ hơn. iOS 9 c&oacute; t&iacute;nh năng đa nhiệm mới được thiết kế đặc biệt cho iPad, cho ph&eacute;p người d&ugrave;ng l&agrave;m được nhiều việc hơn c&ugrave;ng l&uacute;c. Ứng dụng Notes, Maps hay News cũng được thiết kế lại để cho trải nghiệm tốt tr&ecirc;n nhiều thiết bị c&oacute; k&iacute;ch thước m&agrave;n h&igrave;nh kh&aacute;c nhau.<br />
<br />
Apple dự kiến sẽ bắt đầu b&aacute;n ra iPad Pro từ th&aacute;ng 11 với m&agrave;u bạc, v&agrave;ng v&agrave; x&aacute;m kh&ocirc;ng gian. Phi&ecirc;n bản 32GB WiFi sẽ c&oacute; gi&aacute; 799$, bản 128GB WiFi l&agrave; 949$ v&agrave; bản cao cấp nhất l&agrave; 128GB + LTE gi&aacute; 1.079$.<br />
<br />
Gi&aacute; cho 2 m&oacute;n phụ kiện Smart Keyboard v&agrave; Apple Pencil lần lượt l&agrave; 169$ v&agrave; 99$. Như vậy nếu bạn chọn một chiếc iPad Pro 128GB LTE + Smart Keyboard + Apple Pencil th&igrave; sẽ phải trả 1.347$, t&iacute;nh th&ecirc;m thuế nữa l&agrave; xấp xỉ 1.500$, tương đương khoảng 30 triệu đồng.<br />
&nbsp;</p>

<ul>
	<li><a href="https://tinhte.vn/store/2015/09/3136959_iPad-Pro-2.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/11/f174dacfc68551f3579d5080c7faa7bd.jpg?4131" /></a></li>
	<li><a href="https://tinhte.vn/store/2015/09/3136960_iPad-Pro-3.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/71/369717394601c22f9cc4f5d4e0466ec1.jpg?5764" /></a></li>
	<li><a href="https://tinhte.vn/store/2015/09/3136961_iPad-Pro-4.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/2c/a50b4e0b34b23db2e7a38306c07bb272.jpg?4580" /></a></li>
	<li><a href="https://tinhte.vn/store/2015/09/3136962_iPad-Pro-5.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/fb/06a38d4843c4a4a508f5327433281a26.jpg?6486" /></a></li>
	<li><a href="https://tinhte.vn/store/2015/09/3136965_iPad-Pro-8.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/70/f7d640baa7d8b3cfbd7c78cc4cc2719b.jpg?5356" /></a></li>
	<li><a href="https://tinhte.vn/store/2015/09/3136966_iPad-Pro-9.png"><img src="https://tinhte.vn/data/images/cache/145_sh/ca/c96c0ce9156c6f959929aa22744565ac.png?18588" /></a></li>
	<li><a href="https://tinhte.vn/store/2015/09/3136964_iPad-Pro-7.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/79/ba22d159fdde1a2b757546b8ecb319ed.jpg?5885" /></a></li>
	<li><a href="https://tinhte.vn/store/2015/09/3136971_iPad-Pro-Lifestyle-4.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/95/2040578791e9e08037cca8711bd79222.jpg?4326" /></a></li>
	<li><a href="https://tinhte.vn/store/2015/09/3136973_iPad-Pro-Lifestyle-6.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/08/c3b710334a3ffeed3751889d269e6734.jpg?5091" /></a></li>
</ul>
', 7, 4, NULL, CAST(N'2017-01-07T08:51:44.837' AS DateTime), CAST(N'2017-01-07T08:51:44.837' AS DateTime))
GO
INSERT [dbo].[HangHoa] ([HangHoaId], [Ma], [Ten], [GiaBanThamKhao], [MoTa], [LoaiHangHoaId], [NhaCungCapId], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (18, N'00005', N'Apple Pencil for iPad Pro', 2500000, N'<p><a href="https://tinhte.vn/tags/but-pencil/">B&uacute;t Pencil</a>&nbsp;l&agrave; một trong hai phụ kiện được&nbsp;<a href="https://tinhte.vn/tags/apple/">Apple</a>&nbsp;giới thiệu d&agrave;nh cho người d&ugrave;ng&nbsp;<a href="https://tinhte.vn/tags/ipad-pro/">iPad Pro</a>&nbsp;b&ecirc;n cạnh b&agrave;n ph&iacute;m. Đ&uacute;ng như t&ecirc;n gọi, phụ kiện n&agrave;y c&oacute; thiết kế rất giống một c&aacute;i&nbsp;<a href="https://tinhte.vn/tags/but/">b&uacute;t</a>&nbsp;ch&igrave; ngo&agrave;i đời với đầu b&uacute;t nhọn v&agrave; đầu kia tr&ograve;n nhưng kh&ocirc;ng c&oacute; đầu tẩy.&nbsp;<a href="https://tinhte.vn/tags/apple-pencil/">Apple Pencil</a>&nbsp;rất nhẹ v&agrave; dễ thao t&aacute;c, độ nhạy của n&oacute; ở mức rất tốt. Qua d&ugrave;ng thử,&nbsp;<a href="https://tinhte.vn/tags/pencil/">Pencil</a>&nbsp;c&oacute; thể nhận nhiều lực nhấn để tạo n&eacute;t thanh, n&eacute;t đậm, hoặc m&ocirc; ph&ograve;ng b&uacute;t t&ocirc; m&agrave;u, b&uacute;t ch&igrave;, b&uacute;t m&aacute;y...<br />
&nbsp;</p>

<p><br />
​</p>

<p><em>Cảm ơn Jundat Studio đ&atilde; cho m&igrave;nh mượn sản phẩm để thực hiện b&agrave;i viết n&agrave;y.</em></p>

<p><br />
<em><img alt="DSC_5193.jpg" src="https://tinhte.vn/store/2015/12/3561512_DSC_5193.jpg" /><br />
Pencil được đựng trong một hộp giấy d&agrave;i, b&ecirc;n trong c&oacute; b&uacute;t, phụ kiện v&agrave; c&aacute;c t&agrave;i liệu giới thiệu.<br />
<br />
<img alt="DSC_5201.jpg" src="https://tinhte.vn/store/2015/12/3561517_DSC_5201.jpg" /><br />
Apple c&oacute; tặng k&egrave;m một đầu b&uacute;t trong trường hợp đầu kia hỏng th&igrave; c&oacute; thể d&ugrave;ng c&aacute;i n&agrave;y thay thế. Cả hai c&oacute; k&iacute;ch thước như nhau.<br />
<br />
<img alt="DSC_5202.jpg" src="https://tinhte.vn/store/2015/12/3561518_DSC_5202.jpg" /><br />
Đ&acirc;y l&agrave; adapter để sạc Pencil bằng d&acirc;y c&aacute;p Lightning, hoặc kh&ocirc;ng th&igrave; c&oacute; thể sạc b&uacute;t th&ocirc;ng qua iPad Pro cũng được.<br />
<br />
<img alt="DSC_5206.jpg" src="https://tinhte.vn/store/2015/12/3561520_DSC_5206.jpg" /><br />
Pencil kh&aacute; nhẹ khi cầm&nbsp;<a href="https://tinhte.vn/tags/tren-tay/">tr&ecirc;n tay</a>&nbsp;v&agrave; thao t&aacute;c. N&oacute; c&oacute; thiết kế tương tự một chiếc b&uacute;t ch&igrave; m&agrave; bạn nh&igrave;n thấy ngo&agrave;i đời với đầu nhọn, đầu kia tr&ograve;n, th&acirc;n tr&ograve;n.&nbsp;<br />
<br />
<img alt="DSC_5210.jpg" src="https://tinhte.vn/store/2015/12/3561521_DSC_5210.jpg" /><br />
Đầu b&uacute;t của Pencil kh&ocirc;ng qu&aacute; nhọn, ngược lại hơi t&ugrave;. Tuy nhi&ecirc;n n&oacute; ho&agrave;n to&agrave;n c&oacute; thể nhận lực rất tốt, nếu bạn nhấn mạnh th&igrave; sẽ l&agrave; n&eacute;t đậm hoặc nhấn nhẹ l&agrave; n&eacute;t thanh. Nếu ai đ&atilde; từng luyện chữ đẹp bằng b&uacute;t m&aacute;y th&igrave; ho&agrave;n to&agrave;n c&oacute; thể d&ugrave;ng phụ kiện n&agrave;y để viết chữ đẹp tr&ecirc;n iPad.<br />
<br />
<img alt="DSC_5211.jpg" src="https://tinhte.vn/store/2015/12/3561522_DSC_5211.jpg" /><br />
Đầu c&ograve;n lại của Pencil c&oacute; thể th&aacute;o ra. Đầu n&agrave;y kh&ocirc;ng c&oacute; chức năng tẩy (eraser) như b&uacute;t ch&igrave; thật. V&igrave; thế để tẩy, ch&uacute;ng ta phải sử dụng c&ocirc;ng cụ trong từng ứng dụng.<br />
<br />
<img alt="DSC_5212.jpg" src="https://tinhte.vn/store/2015/12/3561523_DSC_5212.jpg" /><br />
Khi mở nắp sẽ lộ ra đầu sạc Lightning đực. Đầu n&agrave;y để cắm v&agrave;o iPad Pro để sạc hoặc kết nối trong lần đầu sử dụng.<br />
<br />
<img alt="DSC_5213.jpg" src="https://tinhte.vn/store/2015/12/3561524_DSC_5213.jpg" /><br />
B&ecirc;n dưới l&agrave; v&ograve;ng dạng mạ crom với chữ Pencil tr&ecirc;n đ&oacute;. B&uacute;t tr&ecirc;n Note 5 c&oacute; thể bấm được nhưng Pencil th&igrave; kh&ocirc;ng.&nbsp;<br />
<br />
<img alt="DSC_5214.jpg" src="https://tinhte.vn/store/2015/12/3561525_DSC_5214.jpg" /><br />
Cắm v&agrave;o iPad Pro để sạc. V&igrave; kh&aacute; d&agrave;i n&ecirc;n khi cắm anh em cần lưu &yacute; v&igrave; khi va quệt c&oacute; thể ảnh hưởng tới đầu kết nối, dẫn tới hỏng h&oacute;c.&nbsp;<br />
<br />
<img alt="DSC_5219.jpg" src="https://tinhte.vn/store/2015/12/3561526_DSC_5219.jpg" /><br />
Ph&iacute;a tr&ecirc;n đỉnh b&uacute;t.<br />
<br />
<img alt="DSC_5220.jpg" src="https://tinhte.vn/store/2015/12/3561527_DSC_5220.jpg" /><br />
Pencil d&agrave;i kh&ocirc;ng tới 20cm, m&igrave;nh c&oacute; đặt cạnh một b&uacute;t m&agrave;u của Thi&ecirc;n Long để anh em tiện so s&aacute;nh chiều d&agrave;i, k&iacute;ch thước.<br />
<br />
<img alt="DSC_5221.jpg" src="https://tinhte.vn/store/2015/12/3561528_DSC_5221.jpg" /><br />
D&agrave;i hơn b&uacute;t viết.<br />
<br />
<img alt="DSC_5222.jpg" src="https://tinhte.vn/store/2015/12/3561529_DSC_5222.jpg" /><br />
V&agrave; c&oacute; đầu nhọn.<br />
<br />
<img alt="DSC_5204.jpg" src="https://tinhte.vn/store/2015/12/3561519_DSC_5204.jpg" /><br />
Thử viết chữ tr&ecirc;n iPad Pro với Pencil. Phần mềm sẽ chỉ nhận diện lực từ đầu b&uacute;t cho n&ecirc;n anh em ho&agrave;n to&agrave;n c&oacute; thể tỳ tay l&ecirc;n m&agrave;n h&igrave;nh để viết m&agrave; kh&ocirc;ng sợ m&aacute;y nhận lực từ cổ tay.<br />
<br />
<img alt="DSC_5223.jpg" src="https://tinhte.vn/store/2015/12/3561530_DSC_5223.jpg" /><br />
Viết v&agrave; vẽ b&igrave;nh thường như thao t&aacute;c với b&uacute;t v&agrave; giấy thực.<br />
<br />
<img alt="DSC_5225.jpg" src="https://tinhte.vn/store/2015/12/3561531_DSC_5225.jpg" /><br />
Độ đậm nhạt của n&eacute;t viết, n&eacute;t t&ocirc; m&agrave;u phụ thuộc v&agrave;o tiết diện của b&uacute;t tới m&agrave;n h&igrave;nh. Nếu đ&egrave; b&uacute;t ngang, diện t&iacute;ch tiếp x&uacute;c lớn th&igrave; n&eacute;t sẽ đậm v&agrave; ngược lại.&nbsp;<br />
<br />
<img alt="DSC_5226.jpg" src="https://tinhte.vn/store/2015/12/3561532_DSC_5226.jpg" /><img alt="DSC_5228.jpg" src="https://tinhte.vn/store/2015/12/3561533_DSC_5228.jpg" /><br />
<img alt="DSC_5194.jpg" src="https://tinhte.vn/store/2015/12/3561513_DSC_5194.jpg" /><img alt="DSC_5197.jpg" src="https://tinhte.vn/store/2015/12/3561514_DSC_5197.jpg" /><img alt="DSC_5198.jpg" src="https://tinhte.vn/store/2015/12/3561515_DSC_5198.jpg" /><img alt="DSC_5199.jpg" src="https://tinhte.vn/store/2015/12/3561516_DSC_5199.jpg" /></em></p>
', 6, 4, NULL, CAST(N'2017-01-07T08:54:20.400' AS DateTime), CAST(N'2017-01-07T08:54:20.400' AS DateTime))
GO
INSERT [dbo].[HangHoa] ([HangHoaId], [Ma], [Ten], [GiaBanThamKhao], [MoTa], [LoaiHangHoaId], [NhaCungCapId], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (19, N'00006', N'AirPods', 3990000, N'<p>Bạn cứ việc n&oacute;i vui&nbsp;<a href="https://tinhte.vn/tags/airpods/">AirPods</a>&nbsp;l&agrave;&nbsp;<a href="https://tinhte.vn/tags/tai-nghe/">tai nghe</a>&nbsp;phi&ecirc;n bản lỗi của&nbsp;<a href="https://tinhte.vn/tags/apple/">Apple</a>&nbsp;bởi v&igrave; n&oacute; giống như&nbsp;<a href="https://tinhte.vn/tags/tai-nghe-iphone/">tai nghe iPhone</a>&nbsp;3.5 mm bị cắt cụt d&acirc;y. M&igrave;nh viết như vậy bởi v&igrave; phần tai nghe của AirPods giống tai nghe iPhone đến 95%, từ h&igrave;nh d&aacute;ng, k&iacute;ch thước cho đến vật liệu v&agrave; ho&agrave;n thiện bề mặt. Chỉ l&agrave; kh&ocirc;ng c&oacute; d&acirc;y th&ocirc;i. Trong hộp của&nbsp;<a href="https://tinhte.vn/tags/apple-airpods/">Apple AirPods</a>&nbsp;ngo&agrave;i bộ tai nghe ra c&ograve;n c&oacute; s&aacute;ch hướng dẫn sử dụng bằng tiếng Việt v&agrave; c&aacute;p sạc Lightning d&ugrave;ng để sạc cho hộp tai nghe.<br />
<br />
Video mở hộp:<br />
&nbsp;</p>

<p>​</p>

<p><br />
Video đeo tr&ecirc;n tai:<br />
&nbsp;</p>

<p>&nbsp;</p>

<p><br />
<strong>Chất lượng ho&agrave;n thiện</strong><br />
&nbsp;</p>

<p><img alt="tinhte_apple_airpod_ (2).jpg" src="https://tinhte.vn/store/2016/12/3936974_tinhte_apple_airpod__2.jpg" />​</p>

<p>Hộp của AirPods được l&agrave;m bằng nhựa, m&agrave;u trắng, bề mặt b&oacute;ng lo&aacute;ng tương tự như tai nghe iPhone. Mở hộp bằng c&aacute;ch d&ugrave;ng ng&oacute;n tay bật nắp l&ecirc;n giống như c&aacute;ch bật nắp hộp quẹt zippo (rất ngầu nh&eacute;&nbsp;<img alt=":D" src="https://tinhte.vn/styles/default/xenforo/clear.png" />) Muốn đ&oacute;ng nắp th&igrave; chỉ cần đẩy nhẹ phần nắp trở lại, bản lề c&oacute; l&ograve; xo sẽ tự động đẩy mạnh nắp trở về vị tr&iacute; cũ n&ecirc;n bạn kh&ocirc;ng cần phải d&ugrave;ng lực nhiều.<br />
&nbsp;</p>

<p><img alt="tinhte_apple_airpod_ (1).jpg" src="https://tinhte.vn/store/2016/12/3936973_tinhte_apple_airpod__1.jpg" />​</p>

<p>B&ecirc;n trong hộp c&oacute; hai chiếc tai nghe AirPod nằm chắc chắn trong hai c&aacute;i lỗ. B&ecirc;n trong lỗ c&oacute; ch&acirc;n tiếp x&uacute;c để hộp c&oacute; thể sạc pin cho tai nghe (bản th&acirc;n hộp cũng c&oacute; nguồn pin ri&ecirc;ng). Lấy tai nghe ra khỏi hộp rất dễ. C&ograve;n khi cất v&agrave;o th&igrave; nam ch&acirc;m b&ecirc;n trong sẽ tự động h&uacute;t AirPods v&agrave;o lại đ&uacute;ng vị tr&iacute; cũ khi bạn để n&oacute; gần v&agrave;o lỗ.<br />
<br />
Những chi tiết nhỏ n&agrave;y (bản lề cơ, nam ch&acirc;m h&uacute;t, c&aacute;ch nắp đ&oacute;ng mở) tạo cho m&igrave;nh cảm gi&aacute;c thấy đ&acirc;y l&agrave; một sản phẩm c&oacute; mức độ ho&agrave;n thiện tốt, cao cấp v&agrave; rất chắc chắn.<br />
<br />
<strong>C&aacute;ch kết nối</strong></p>

<ul>
	<li>Bật Bluetooth tr&ecirc;n iPhone v&agrave; mở kh&oacute;a m&agrave;n h&igrave;nh.</li>
	<li>Để hộp AirPods cạnh iPhone.</li>
	<li>Bật nắp AirPods.</li>
	<li>Tr&ecirc;n m&agrave;n h&igrave;nh iPhone sẽ hiện ra hộp thoại th&ocirc;ng b&aacute;o kết nối.</li>
	<li>Bạn l&agrave;m theo hướng dẫn tr&ecirc;n m&agrave;n h&igrave;nh, nhấn Connect, nhấn giữ ph&iacute;m Home ở mặt sau của hộp AirPods. Xong.</li>
</ul>

<p>To&agrave;n bộ qu&aacute; tr&igrave;nh n&agrave;y kết nối lần đầu n&agrave;y tốn chỉ khoảng 10 gi&acirc;y. C&ograve;n những lần sau chỉ cần bật nắp AirPods l&ecirc;n l&agrave; xong.<br />
&nbsp;</p>

<p><img alt="tinhte_apple_airpod_ (14).jpg" src="https://tinhte.vn/store/2016/12/3936972_tinhte_apple_airpod__14.jpg" />​</p>

<p><br />
<strong>C&aacute;ch sử dụng</strong><br />
&nbsp;</p>

<p><img alt="tinhte_apple_airpod_ (12).jpg" src="https://tinhte.vn/store/2016/12/3936984_tinhte_apple_airpod__12.jpg" />​</p>

<p>AirPods được trang bị chip W1 v&agrave; cảm biến để tự động nhận biết khi n&agrave;o bạn đeo ch&uacute;ng v&agrave; đeo 1 hay 2 c&aacute;i. Khi bạn đeo AirPods l&ecirc;n tai, n&oacute; sẽ tự động mở nguồn v&agrave; hoạt động ngay m&agrave; bạn kh&ocirc;ng cần phải l&agrave;m g&igrave; th&ecirc;m. Khi bạn đeo đủ hai c&aacute;i ở hai b&ecirc;n tai, AirPods sẽ k&iacute;ch hoạt chế độ Stereo, c&ograve;n nếu bạn chỉ đeo một c&aacute;i để đ&agrave;m thoại th&igrave; AirPods vẫn k&iacute;ch hoạt một b&ecirc;n tai cho bạn sử dụng.<br />
<br />
Khi kh&ocirc;ng d&ugrave;ng nữa, một l&agrave; bạn gỡ n&oacute; khỏi tai để AirPods tự ngắt nguồn, hai l&agrave; bạn bỏ n&oacute; v&agrave;o hộp đựng để hộp sạc pin cho tai nghe. Theo c&ocirc;ng bố của Apple, tai nghe AirPods c&oacute; thời lượng pin khoảng 5 tiếng, pin trong hộp c&oacute; thể sạc th&ecirc;m 24 tiếng nữa. Ở cạnh dưới của hộp c&oacute; cổng Lightning để sạc pin cho hộp v&agrave; tai nghe. Sau khi kết nối AirPods với điện thoại, bạn cũng sẽ xem được thời lượng pin c&ograve;n lại của hộp lẫn tai nghe.<br />
&nbsp;</p>

<p><img alt="tinhte_apple_airpod_ (13).jpg" src="https://tinhte.vn/store/2016/12/3936985_tinhte_apple_airpod__13.jpg" />​</p>

<p><strong>Chất lượng &acirc;m thanh</strong><br />
Giống tai nghe zin iPhone đến 95%, về &acirc;m lượng v&agrave; chất lượng. Đ&oacute; l&agrave; cảm nhận đầu ti&ecirc;n của m&igrave;nh. C&ograve;n để đ&aacute;nh gi&aacute; chi tiết hơn về chất lượng &acirc;m thanh th&igrave; Tinh Tế sẽ c&oacute; một b&agrave;i viết ri&ecirc;ng về n&oacute; sau khi d&agrave;nh nhiều thời gian trải nghiệm th&ecirc;m.<br />
<br />
Nh&igrave;n chung, ấn tượng lớn nhất m&agrave; AirPods mang lại cho m&igrave;nh đ&oacute; l&agrave; sự đơn giản trong mọi thao t&aacute;c: từ c&aacute;ch kết nối, c&aacute;ch sử dụng, c&aacute;ch ngắt sử dụng cho đến c&aacute;ch sạc thiết bị. M&igrave;nh kh&ocirc;ng cần quan t&acirc;m n&oacute; hoạt động như thế n&agrave;o, cũng kh&ocirc;ng cần phải lo tai nghe c&oacute; đang được bật hay kh&ocirc;ng hoặc c&oacute; tắt chưa để tiết kiệm pin. Mọi hoạt động của AirPods đều nương theo thao t&aacute;c sử dụng của người d&ugrave;ng. Khi đeo l&ecirc;n th&igrave; bắt đầu hoạt động, gỡ xuống th&igrave; ngắt. Bỏ v&agrave;o hộp th&igrave; tự sạc. Qu&aacute; khỏe.<br />
&nbsp;</p>

<p><img alt="tinhte_apple_airpod_ (9).jpg" src="https://tinhte.vn/store/2016/12/3936981_tinhte_apple_airpod__9.jpg" />​</p>

<p>Cảm gi&aacute;c đeo AirPods l&ecirc;n tai cũng giống như tai nghe iPhone trước đ&acirc;y. Tuy nhi&ecirc;n m&igrave;nh vẫn canh c&aacute;nh một nỗi lo rằng n&oacute; sẽ rơi ra trong qu&aacute; tr&igrave;nh đeo v&agrave; sử dụng. Đ&oacute; l&agrave; về cảm gi&aacute;c c&aacute; nh&acirc;n. Tụi m&igrave;nh sẽ l&agrave;m th&ecirc;m một b&agrave;i test nho nhỏ để kiểm tra khả năng chắc chắn của AirPods tr&ecirc;n tai.<br />
<br />
<em>C&aacute;m ơn cửa h&agrave;ng&nbsp;<a href="https://tinhte.vn/go-to/aHR0cDovL2hhbG9zaG9wLnZuL2FwcGxlLWFpcnBvZHMuaHRtbD9zZWFyY2g9QWlyUG9kcw==" target="_blank">Halo</a>&nbsp;đ&atilde; cho m&igrave;nh mượn sản phẩm để tr&ecirc;n tay.</em></p>

<p><br />
<img alt="tinhte_apple_airpod_ (3).jpg" src="https://tinhte.vn/store/2016/12/3936975_tinhte_apple_airpod__3.jpg" /><br />
<br />
<img alt="tinhte_apple_airpod_ (6).jpg" src="https://tinhte.vn/store/2016/12/3936978_tinhte_apple_airpod__6.jpg" /><br />
<em>N&uacute;t Home ở mặt sau d&ugrave;ng để kết nối tai nghe với điện thoại</em><br />
<br />
<img alt="tinhte_apple_airpod_ (7).jpg" src="https://tinhte.vn/store/2016/12/3936979_tinhte_apple_airpod__7.jpg" /><br />
<br />
<img alt="tinhte_apple_airpod_ (10).jpg" src="https://tinhte.vn/store/2016/12/3936982_tinhte_apple_airpod__10.jpg" /><br />
<br />
<img alt="tinhte_apple_airpod_ (11).jpg" src="https://tinhte.vn/store/2016/12/3936983_tinhte_apple_airpod__11.jpg" /></p>
', 6, 4, NULL, CAST(N'2017-01-07T08:57:10.120' AS DateTime), CAST(N'2017-01-07T08:57:10.120' AS DateTime))
GO
INSERT [dbo].[HangHoa] ([HangHoaId], [Ma], [Ten], [GiaBanThamKhao], [MoTa], [LoaiHangHoaId], [NhaCungCapId], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (20, N'00007', N'Surface Pro 4', 29990000, NULL, 5, 3, NULL, CAST(N'2017-01-07T09:00:07.463' AS DateTime), CAST(N'2017-01-07T09:00:07.463' AS DateTime))
GO
INSERT [dbo].[HangHoa] ([HangHoaId], [Ma], [Ten], [GiaBanThamKhao], [MoTa], [LoaiHangHoaId], [NhaCungCapId], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (21, N'00008', N'Macbook Pro ', 29990000, N'<p><img alt="tinhte.vn-macbook-pro-13-retina-10.jpg" src="https://tinhte.vn/store/2015/03/2997914_tinhte.vn-macbook-pro-13-retina-10.jpg" />​</p>

<p>M&aacute;y t&iacute;nh&nbsp;<a href="https://tinhte.vn/tags/macbook-pro/">MacBook Pro</a>&nbsp;13&quot; Retina 2015 (trong b&agrave;i gọi tắt l&agrave; MBP 13&quot; cho gọn) được n&acirc;ng cấp nhiều về cấu h&igrave;nh v&agrave; phần cứng trong khi thiết kế ngoại h&igrave;nh vẫn được giữ nguy&ecirc;n. Những điểm mới gồm c&oacute;:&nbsp;<strong>CPU Intel Core i5/i7 thế hệ thứ 5 (Broadwell)</strong>,&nbsp;<strong>ổ SSD tốc độ cao hơn</strong>,&nbsp;<strong>n&acirc;ng cấp l&ecirc;n cổng Thunderbolt 2</strong>&nbsp;v&agrave; quan trọng nhất l&agrave;&nbsp;<strong>b&agrave;n r&ecirc; cảm ứng lực&nbsp;<a href="https://tinhte.vn/tags/force-touch/">Force Touch</a></strong>. Gi&aacute; b&aacute;n x&aacute;ch tay tham khảo l&agrave; 29,28 triệu cho bản cấu h&igrave;nh thấp nhất.<br />
&nbsp;</p>

<p><br />
​</p>

<p>Thiết kế của MBP 13&quot; kh&ocirc;ng đổi, m&aacute;y vẫn được trang bị lớp vỏ nh&ocirc;m nguy&ecirc;n khối Unibody rất đẹp v&agrave; chắn chắn. Chỉ c&oacute; 2 điểm mới li&ecirc;n quan đến thiết kế đ&oacute; l&agrave; b&agrave;n r&ecirc; cảm ứng lực v&agrave; cổng Thunderbolt thế hệ thứ hai (mặc d&ugrave; nếu chỉ nh&igrave;n th&igrave; ch&uacute;ng ta kh&ocirc;ng ph&acirc;n biệt được đ&acirc;u). Cổng Thunderbolt 2 về mặt l&yacute; thuyết cho tốc độ cao hơn gấp đ&ocirc;i so với Thunderbolt 1 nhờ việc gộp chung hai k&ecirc;nh up v&agrave; down (mỗi k&ecirc;nh 10 Gbps) lại th&agrave;nh một k&ecirc;nh duy nhất cho tốc độ truyền tải dữ liệu l&agrave; 20 Gbps. Nhờ đ&oacute;, khi bạn ch&eacute;p file bằng cổng n&agrave;y th&igrave; tốc độ copy sẽ nhanh hơn gấp đ&ocirc;i so với chuẩn cũ. Đồng thời c&ograve;n c&oacute; thể xuất h&igrave;nh ảnh độ ph&acirc;n giải cao ra m&agrave;n h&igrave;nh 4K v&agrave; thậm ch&iacute; l&agrave; 5K.<br />
<br />
<strong>B&agrave;n r&ecirc; cảm ứng lực (Force Touch)</strong><br />
Force Touch l&agrave; một sự n&acirc;ng cấp&nbsp;<strong>mang t&iacute;nh bổ sung</strong>&nbsp;cho b&agrave;n r&ecirc; của MacBook. C&oacute; nghĩa l&agrave; bạn vẫn c&oacute; thể sử dụng n&oacute; theo kiểu cũ như trước giờ vẫn d&ugrave;ng, kh&ocirc;ng cần phải thay đổi th&oacute;i quen hay cảm gi&aacute;c sử dụng g&igrave; hết. Nếu bạn đ&atilde; v&agrave; đang y&ecirc;u th&iacute;ch sự mượt m&agrave; cũng như nhẹ nh&agrave;ng của b&agrave;n r&ecirc; MacBook th&igrave; tr&ecirc;n Force Touch, n&oacute; cũng mịn m&agrave;ng y như vậy, bạn kh&ocirc;ng cần phải lo lắng n&oacute; c&oacute; thay đổi cảm gi&aacute;c sử dụng hay kh&ocirc;ng. Nhưng nếu th&iacute;ch th&igrave; bạn c&oacute; thể d&ugrave;ng th&ecirc;m t&iacute;nh năng nhấn mạnh hết mức, gọi l&agrave; Force Touch.<br />
<br />
To&agrave;n bộ bề mặt b&agrave;n r&ecirc; l&agrave; một ph&iacute;m bấm duy nhất v&agrave; bạn c&oacute; thể nhấn ở bất kỳ đ&acirc;u. Trước đ&acirc;y, bạn kh&ocirc;ng thể nhấn l&ecirc;n s&aacute;t m&eacute;p viền hoặc 4 g&oacute;c của trackpad nhưng b&acirc;y giờ th&igrave; được, v&agrave; cảm gi&aacute;c nhấn ở mọi điểm l&agrave; như nhau. B&agrave;n r&ecirc; b&acirc;y giờ c&oacute; thể cảm ứng độ mạnh nhẹ của ng&oacute;n tay ch&uacute;ng ta. T&ugrave;y v&agrave;o lực nhấn m&agrave; hệ điều h&agrave;nh OS X 10.10 sẽ hiểu theo c&aacute;c mệnh lệnh kh&aacute;c nhau. V&iacute; dụ như nhấn mạnh l&ecirc;n một từ n&agrave;o đ&oacute; trong tr&igrave;nh duyệt hay văn bản để mở cửa sổ tra từ, nhấn mạnh l&ecirc;n app để mở cửa sổ th&ocirc;ng tin, nhấn mạnh l&ecirc;n Dockbar để mở menu chuột phải, nhấn mạnh l&ecirc;n n&uacute;t tua nhanh phim để tua nhanh hơn b&igrave;nh thường...<br />
<br />
Bạn cứ tưởng tượng b&agrave;n r&ecirc; b&acirc;y giờ c&oacute; hai nấc giống như n&uacute;t chụp h&igrave;nh tr&ecirc;n m&aacute;y ảnh v&agrave; điện thoại, khi bạn nhấn nhẹ (nhấn nửa c&ograve;) th&igrave; m&aacute;y sẽ hiểu l&agrave; thao t&aacute;c Click, c&ograve;n khi nhấn mạnh xuống hết mức th&igrave; m&aacute;y sẽ hiểu l&agrave; nhấn mạnh. Trong menu Trackpad của System Preferences c&oacute; th&ecirc;m một v&agrave;i t&ugrave;y chọn để bạn t&ugrave;y chỉnh c&aacute;c thao t&aacute;c nhấn mạnh hay nhẹ. Trong đ&acirc;y c&oacute; 3 mức phản hồi lực từ nhẹ nhất đến cao nhất, tức l&agrave; độ nặng cần c&oacute; để nhấn xuống hết mức cũng như độ phản hồi của b&agrave;n r&ecirc; trở lại đối tay ng&oacute;n tay ch&uacute;ng ta.<br />
&nbsp;</p>

<p><img alt="tinhte.vn-macbook-pro-13-retina-15.jpg" src="https://tinhte.vn/store/2015/03/2997919_tinhte.vn-macbook-pro-13-retina-15.jpg" />​</p>

<p>Cảm gi&aacute;c sử dụng thực tế cho thấy nếu kh&ocirc;ng d&ugrave;ng Force Touch th&igrave; mọi thao t&aacute;c, cảm gi&aacute;c, trải nghiệm đều OK như cũ. c&ograve;n nếu d&ugrave;ng Force Touch th&igrave; sẽ c&oacute; c&aacute;i lợi lẫn c&aacute;i hại:</p>

<ul>
	<li>Lợi: chỉ cần d&ugrave;ng 1 ng&oacute;n tay l&agrave; điều khiển được hết c&aacute;c thao t&aacute;c trước đ&acirc;y cần đến 2 hoặc 3 ng&oacute;n. Cộng th&ecirc;m v&agrave;i chức năng lẻ tẻ mới v&iacute; dụ như tua nhanh phim chẳng hạn.</li>
	<li>Hại: bạn phải nhấn một ng&oacute;n nhiều hơn v&agrave; nhấn mạnh tay hơn, hậu quả c&oacute; thể bạn sẽ cảm thấy kh&oacute; chịu v&agrave; hơi đau ở đầu ng&oacute;n tay.</li>
</ul>

<p>Trong b&agrave;i sau m&igrave;nh sẽ đo về tốc độ ổ SSD cũng như Benchmark to&agrave;n hệ thống. Dưới đ&acirc;y l&agrave; cấu h&igrave;nh ti&ecirc;u chuẩn bản thấp nhất của MacBook Pro 13&quot; Retina 2015:</p>

<ul>
	<li>Hệ điều h&agrave;nh: OS X 10.10.2</li>
	<li>CPU: 2.7GHz hai nh&acirc;n Intel Core i5 (Broadwell)</li>
	<li>GPU: Intel Iris Graphics 6100</li>
	<li>M&agrave;n h&igrave;nh: IPS 13,3&quot; độ ph&acirc;n giải 2560x1600, 227 ppi</li>
	<li>RAM: 8 GB 1866MHz LPDDR3</li>
	<li>Camera: Facetime HD</li>
	<li>Kết nối: 2 x USB 3.0, 2 x Thunderbolt 2, MagSafe 2, 3.5mm, đầu đọc thẻ SD, Wi-Fi ac, BT 4.0</li>
	<li>Bộ nhớ trong: SSD 128 GB</li>
	<li>K&iacute;ch thước: 1,8 x 31,4 x 21,9 cm</li>
	<li>Nặng: 1,58 kg</li>
</ul>
', 5, 4, NULL, CAST(N'2017-01-07T09:03:55.987' AS DateTime), CAST(N'2017-01-07T09:03:55.987' AS DateTime))
GO
INSERT [dbo].[HangHoa] ([HangHoaId], [Ma], [Ten], [GiaBanThamKhao], [MoTa], [LoaiHangHoaId], [NhaCungCapId], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (22, N'00009', N'Macbook 12', 29990000, N'<p><a href="https://tinhte.vn/tags/macbook-12-2/">Macbook 12</a>&quot; mới của&nbsp;<a href="https://tinhte.vn/tags/apple/">Apple</a>&nbsp;mang nhiều thay đổi lớn của Apple trong việc sản xuất m&aacute;y t&iacute;nh. Ch&uacute;ng ta c&oacute; một chiếc m&aacute;y nhỏ nhẹ, t&iacute;nh di động cao hơn cả&nbsp;<a href="https://tinhte.vn/tags/macbook/">Macbook</a>&nbsp;Air nhưng vẫn được trang bị m&agrave;n h&igrave;nh retina. B&agrave;n ph&iacute;m mới của Apple d&ugrave;ng cơ cấu nẩy mới gi&uacute;p cho n&oacute; mỏng hơn đ&aacute;ng kể so với co cấu truyền thống. Trackpad mới Apple gọi l&agrave; ForceTouch mỗi khi ch&uacute;ng ta nhấn v&agrave;o đều nhận được phản hổi bằng lực ngược lại. Apple chỉ trang bị một cổng kết nối hiếm c&oacute; hiện nay l&agrave; USB-C l&agrave; điểm m&agrave; nhiều người d&ugrave;ng phản đối v&agrave; hiện m&igrave;nh chẳng l&agrave;m g&igrave; được với c&aacute;i cổng n&agrave;y ngo&agrave;i việc sạc pin v&agrave; nối Nokia N1 v&agrave;o để thử sợi cable...<br />
&nbsp;</p>

<p><br />
​</p>

<p>M&agrave;u v&agrave;ng đồng m&agrave;u với iPad, iPhone cho ch&uacute;ng ta thấy Apple c&oacute; một hệ sinh th&aacute;i về nguy&ecirc;n vật liệu v&agrave; ho&agrave;n thiện sản phẩm đồng nhất. Điều n&agrave;y gi&uacute;p Apple giảm được chi ph&iacute; sản xuất cũng như đồng bộ ho&aacute; hệ sinh th&aacute;i hơn.<br />
<br />
<strong>Mỏng, nhẹ, đẹp, ho&agrave;n thiện chất lượng cao</strong><br />
Macbook 12&quot; c&oacute; thể xem l&agrave; điểm nhấn của Apple trong việc sản xuất m&aacute;y t&iacute;nh trong những năm gần đ&acirc;y sau cuộc c&aacute;ch mạng Macbook Air. Giờ đ&acirc;y họ ho&agrave;n thiện n&oacute; nhiều hơn nữa để tạo ra một chiếc m&aacute;y c&oacute; t&iacute;nh di động cao hơn v&agrave; đẳng cấp hơn, thời trang hơn với c&aacute;c m&agrave;u mới.<br />
<br />
<img alt="Tinhte-Macbook-12-25.jpg" src="https://tinhte.vn/store/2015/04/3025238_Tinhte-Macbook-12-25.jpg" /><br />
<em>M&aacute;y rất nhẹ v&agrave; mỏng, cầm&nbsp;<a href="https://tinhte.vn/tags/tren-tay/">tr&ecirc;n tay</a>&nbsp;rất thoải m&aacute;i v&agrave; bất ngờ, c&aacute;c cạnh bằng nh&ocirc;m nhưng được ho&agrave;n thiện kh&aacute; tốt n&ecirc;n kh&ocirc;ng bị cạnh sắc cấn v&agrave;o tay.<br />
<br />
<img alt="Tinhte-Macbook-12-15.jpg" src="https://tinhte.vn/store/2015/04/3025227_Tinhte-Macbook-12-15.jpg" /><br />
Logo t&aacute;o kh&ocirc;ng c&ograve;n đ&egrave;n m&agrave; l&agrave; loại b&oacute;ng như tr&ecirc;n iPhone v&agrave; iPad n&ecirc;n c&oacute; g&igrave; chiếu v&agrave;o đ&oacute; sẽ ra m&agrave;u đ&oacute;.&nbsp;</em><br />
<br />
<em><img alt="Tinhte-Macbook-12-2.jpg" src="https://tinhte.vn/store/2015/04/3025244_Tinhte-Macbook-12-2.jpg" /><br />
M&agrave;n h&igrave;nh Macbook 12&quot; Retina c&oacute; độ ph&acirc;n giải 2.304 x 1.440 điểm ảnh đạt mức 226ppi. Apple c&oacute; giải ph&aacute;p để h&igrave;nh ảnh hiển thị mịn như iPhone, iPad m&agrave; kh&ocirc;ng l&agrave;m nhỏ đối tượng. M&agrave;n h&igrave;nh của Macbook 12&quot; nh&igrave;n kh&ocirc;ng k&eacute;m g&igrave; m&agrave;n h&igrave;nh của Macbook Pro Retina hay iPhone, iPad v&agrave; vượt xa rất nhiều so với m&agrave;n h&igrave;nh Macbook Air.&nbsp;<br />
<br />
<em><img alt="Tinhte-Macbook-12-10.jpg" src="https://tinhte.vn/store/2015/04/3025223_Tinhte-Macbook-12-10.jpg" /><br />
B&agrave;n ph&iacute;m mới rất mỏng tuy vẫn c&oacute; k&iacute;ch thước b&igrave;nh thường (full-size), cảm gi&aacute;c g&otilde; kh&aacute; l&agrave; kh&oacute; chịu, cần phải g&otilde; nhiều mới quen được. Dưới mỗi b&agrave;n ph&iacute;m c&oacute; đều c&oacute; một đ&egrave;n led n&ecirc;n &aacute;nh s&aacute;ng chiếu l&ecirc;n từ b&aacute;n ph&igrave;m chỉ s&aacute;ng ở chỗ k&yacute; tự chứ kh&ocirc;ng s&aacute;ng ra bi&ecirc;n ph&iacute;m như c&aacute;c b&agrave;n ph&iacute;m trước đ&acirc;y của Apple n&ecirc;n nh&igrave;n rất đẹp.</em><br />
<br />
<img alt="Tinhte-Macbook-12.jpg" src="https://tinhte.vn/store/2015/04/3025251_Tinhte-Macbook-12.jpg" /><br />
Macbook 12&quot; chỉ c&oacute; một kết nối USB-C cho việc sạc v&agrave; kết nối dữ liệu. Đ&acirc;y l&agrave; điều m&agrave; rất nhiều người kh&ocirc;ng thể chấp nhận được. Tuy nhi&ecirc;n những người l&agrave;m việc văn ph&ograve;ng c&oacute; li&ecirc;n quan đến web, văn bản như vợ m&igrave;nh th&igrave; chỉ d&ugrave;ng c&aacute;i cổng USB để sạc iPhone.&nbsp;<br />
<br />
<img alt="Tinhte-Macbook-12-2.jpg" src="https://tinhte.vn/store/2015/04/3025249_Tinhte-Macbook-12-2.jpg" /><br />
Cục sạc mới của Macbook 12&quot; 29W, to hơn cục sạc iPad một ch&uacute;t. Sợi cable c&oacute; thể th&aacute;o ra được để c&oacute; thể mang đi v&agrave; cắp v&agrave;o pin di động.&nbsp;<br />
<br />
<img alt="Tinhte-Macbook-12-5.jpg" src="https://tinhte.vn/store/2015/04/3025253_Tinhte-Macbook-12-5.jpg" /><br />
Đầu sạc mới n&agrave;y kh&ocirc;ng c&oacute; t&iacute;nh năng an to&agrave;n (magsafe) như c&aacute;c cục sạc đời trước n&ecirc;n nếu đang cắp sạc m&agrave; đi vấp phải th&igrave; chắc chắn sẽ rớt m&aacute;y xuống b&agrave;n. Một sự đi l&ugrave;i đ&aacute;ng kể khi so với Macbook cũ.&nbsp;<br />
<br />
<img alt="Tinhte-Macbook-12-12.jpg" src="https://tinhte.vn/store/2015/04/3025225_Tinhte-Macbook-12-12.jpg" /><br />
B&agrave;n r&ecirc;n mới Apple gọi l&agrave; ForceTouch trackpad. Khi bạn bấm bất cứ chỗ n&agrave;o tr&ecirc;n c&aacute;i b&agrave;n r&ecirc; n&agrave;y th&igrave; n&oacute; cũng c&oacute; độ nh&uacute;ng v&agrave; c&oacute; phản hồi từ dưới l&ecirc;n, rất ấn tượng. Nhưng nếu bạn quen với việc touch (chạm chứ kh&ocirc;ng nhấn) th&igrave; việc nhấn v&agrave; phản hồi kh&ocirc;ng c&oacute; gi&aacute; trị lắm.&nbsp;<br />
<br />
<img alt="Tinhte-Macbook-12.jpg" src="https://tinhte.vn/store/2015/04/3025250_Tinhte-Macbook-12.jpg" /><br />
Sạc qua USB-C, kh&ocirc;ng c&ograve;n an to&agrave;n khi đ&aacute; v&agrave;o d&acirc;y<br />
<br />
<img alt="Tinhte-Macbook-12-19.jpg" src="https://tinhte.vn/store/2015/04/3025232_Tinhte-Macbook-12-19.jpg" /><br />
Kh&ocirc;ng c&ograve;n khu vực tải nhiệt (v&igrave; kh&ocirc;ng c&oacute; quạt) kh&ocirc;ng c&ograve;n đoạn nhựa m&agrave;u đen ở gần bản lề nữa, b&acirc;y giờ nguy&ecirc;n phần nắp m&agrave;n h&igrave;nh l&agrave; một khối lu&ocirc;n.&nbsp;<br />
<br />
<img alt="Tinhte-Macbook-12-26.jpg" src="https://tinhte.vn/store/2015/04/3025239_Tinhte-Macbook-12-26.jpg" /><br />
Khacten.com đ&atilde; l&agrave;m sẵn bao da cho Macbook mới dựa v&agrave;o một mẫu bằng gỗ.</em><br />
&nbsp;</p>

<ul>
	<li><em><a href="https://tinhte.vn/store/2015/04/3025215_Tinhte-Macbook-12-3.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/0e/4382faf01517416a70b0d3462f67af55.jpg?4099" /></a></em></li>
	<li><em><a href="https://tinhte.vn/store/2015/04/3025219_Tinhte-Macbook-12-4.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/a7/119461cad384b9480d27268b50778115.jpg?4491" /></a></em></li>
	<li><em><a href="https://tinhte.vn/store/2015/04/3025216_Tinhte-Macbook-12-7.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/42/66715b7cfba441bc73bacbb202dd0165.jpg?2787" /></a></em></li>
	<li><em><a href="https://tinhte.vn/store/2015/04/3025218_Tinhte-Macbook-12-6.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/7c/a0ab3e69f64fbc03b6f5444651a1adc6.jpg?3834" /></a></em></li>
	<li><em><a href="https://tinhte.vn/store/2015/04/3025220_Tinhte-Macbook-12-5.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/64/2847e6d27d5f0edcc9090629ef370f85.jpg?4905" /></a></em></li>
	<li><em><a href="https://tinhte.vn/store/2015/04/3025217_Tinhte-Macbook-12-2.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/46/50e88cee0bc63fb354340717bce310c7.jpg?4185" /></a></em></li>
	<li><em><a href="https://tinhte.vn/store/2015/04/3025221_Tinhte-Macbook-12-8.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/1a/7285ca363340f3db8b20bcf9be441711.jpg?3325" /></a></em></li>
	<li><em><a href="https://tinhte.vn/store/2015/04/3025222_Tinhte-Macbook-12-9.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/42/40ecee7a7fc086b9bbff7b55dc44caaf.jpg?3175" /></a></em></li>
	<li><em><a href="https://tinhte.vn/store/2015/04/3025223_Tinhte-Macbook-12-10.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/05/404acb4f0a0eee52671cb8d252de54af.jpg?4260" /></a></em></li>
	<li><em><a href="https://tinhte.vn/store/2015/04/3025224_Tinhte-Macbook-12-11.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/7c/79c9990b65d64cecb706914c7e44cb50.jpg?5026" /></a></em></li>
	<li><em><a href="https://tinhte.vn/store/2015/04/3025226_Tinhte-Macbook-12-13.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/c4/d139116517069c3e0ae0a8cee8731619.jpg?3316" /></a></em></li>
	<li><em><a href="https://tinhte.vn/store/2015/04/3025227_Tinhte-Macbook-12-15.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/53/7baa2f95f35a96751fa89d7f69301019.jpg?3442" /></a></em></li>
	<li><em><a href="https://tinhte.vn/store/2015/04/3025228_Tinhte-Macbook-12-14.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/bc/1a50ffac7abdb90ae318eb3075e436e1.jpg?3550" /></a></em></li>
	<li><em><a href="https://tinhte.vn/store/2015/04/3025231_Tinhte-Macbook-12-18.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/55/5939705e3b23d6f9917404d4bda861f8.jpg?2876" /></a></em></li>
	<li><em><a href="https://tinhte.vn/store/2015/04/3025230_Tinhte-Macbook-12-16.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/73/641d601c7db00445970be10348536deb.jpg?3378" /></a></em></li>
	<li><em><a href="https://tinhte.vn/store/2015/04/3025229_Tinhte-Macbook-12-17.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/f2/3f1a6d54a050937f9ee27f4991c18703.jpg?2773" /></a></em></li>
	<li><em><a href="https://tinhte.vn/store/2015/04/3025234_Tinhte-Macbook-12-21.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/1b/fb8d71de9aade05b0d4177722b345fc3.jpg?2986" /></a></em></li>
	<li><em><a href="https://tinhte.vn/store/2015/04/3025233_Tinhte-Macbook-12-20.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/b2/ea59299412c1da665c5906039f48370b.jpg?2564" /></a></em></li>
	<li><em><a href="https://tinhte.vn/store/2015/04/3025236_Tinhte-Macbook-12-22.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/c2/b0490cfe9da484fa72771c98450e3d55.jpg?2509" /></a></em></li>
	<li><em><a href="https://tinhte.vn/store/2015/04/3025235_Tinhte-Macbook-12-23.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/fe/8b856e5fb8a38bc4a265ea6ae770e880.jpg?2338" /></a></em></li>
	<li><em><a href="https://tinhte.vn/store/2015/04/3025237_Tinhte-Macbook-12-24.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/e8/c8bdea53ee3a8a2bdf69f6e9cf1dd167.jpg?2406" /></a></em></li>
	<li><em><a href="https://tinhte.vn/store/2015/04/3025238_Tinhte-Macbook-12-25.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/69/550957c364f327c21ec4fbc74eaf0f08.jpg?2674" /></a></em></li>
	<li><em><a href="https://tinhte.vn/store/2015/04/3025239_Tinhte-Macbook-12-26.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/fc/f3793ddfd5a564b1d37d8af0f111186e.jpg?3445" /></a></em></li>
	<li><em><a href="https://tinhte.vn/store/2015/04/3025240_Tinhte-Macbook-12-28.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/18/54807c3afcc7f1f56f329cc51028faf3.jpg?4012" /></a></em></li>
	<li><em><a href="https://tinhte.vn/store/2015/04/3025241_Tinhte-Macbook-12.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/ff/da125f4cdedb2e46e6341581bbb30345.jpg?3944" /></a></em></li>
	<li><em><a href="https://tinhte.vn/store/2015/04/3025242_Tinhte-Macbook-12-27.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/72/ad97ec19672c8e5b5c680fdeba3c2337.jpg?3325" /></a></em></li>
	<li><em><a href="https://tinhte.vn/store/2015/04/3025244_Tinhte-Macbook-12-2.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/b3/fe0deace2c3566f764f95616bd9fb00c.jpg?5953" /></a></em></li>
	<li><em><a href="https://tinhte.vn/store/2015/04/3025245_Tinhte-Macbook-12.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/6b/de3a7f7bb13eb3ff4c36373ddfd54f88.jpg?6010" /></a></em></li>
	<li><em><a href="https://tinhte.vn/store/2015/04/3025251_Tinhte-Macbook-12.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/d5/b7180750e46cdb38b57a869fa204ce94.jpg?3066" /></a></em></li>
	<li><em><a href="https://tinhte.vn/store/2015/04/3025249_Tinhte-Macbook-12-2.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/b5/311e62c78e1cfd1b8cad847a09967768.jpg?3915" /></a></em></li>
	<li><em><a href="https://tinhte.vn/store/2015/04/3025250_Tinhte-Macbook-12.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/26/014ce05c4b17bb54d01a544f27a3937b.jpg?5425" /></a></em></li>
	<li><em><a href="https://tinhte.vn/store/2015/04/3025253_Tinhte-Macbook-12-5.jpg"><img src="https://tinhte.vn/data/images/cache/145_sh/e5/1aee45f8867e7f4565b9a3e78b365dcf.jpg?2649" /></a></em></li>
</ul>
', 5, 4, NULL, CAST(N'2017-01-07T09:05:29.977' AS DateTime), CAST(N'2017-01-07T09:05:29.977' AS DateTime))
GO
INSERT [dbo].[HangHoa] ([HangHoaId], [Ma], [Ten], [GiaBanThamKhao], [MoTa], [LoaiHangHoaId], [NhaCungCapId], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (23, N'00010', N'Xbox One S 500GB Minecraft Favorites Console Bundle - Robot White', 7990000, N'<p>Microsoft đ&atilde; ch&iacute;nh thức giới thiệu&nbsp;<a href="https://tinhte.vn/tags/xbox-one-s/">Xbox One S</a>, phi&ecirc;n bản n&acirc;ng cấp đ&aacute;ng kể cho&nbsp;<a href="https://tinhte.vn/tags/xbox/">Xbox</a>&nbsp;One tại triển l&atilde;m game E3 vừa rồi. Như ch&uacute;ng ta đ&atilde; biết, để k&eacute;o d&agrave;i v&ograve;ng đời của một hệ m&aacute;y&nbsp;<a href="https://tinhte.vn/tags/console/">console</a>, c&aacute;c h&atilde;ng sẽ ra mắt bản n&acirc;ng cấp của chiếc m&aacute;y với nhiều cải tiến c&oacute; thể l&agrave; nhỏ gọn hơn, phần cứng mạnh hơn, ổ cứng lớn hơn v.v... Xbox&nbsp;<a href="https://tinhte.vn/tags/one-s/">One S</a>&nbsp;(c&oacute; thể S l&agrave; viết tắt của chữ Slim, giống với Xbox 360 S) c&oacute; k&iacute;ch thước nhỏ hơn đời trước tới 40%, t&iacute;ch hợp ổ cứng l&ecirc;n tới 2TB v&agrave; chip đồ họa mạnh hơn Xbox One.<br />
&nbsp;</p>

<p>​</p>

<p><br />
M&igrave;nh th&igrave; đang chơi PS4, hiện tại c&aacute;c tựa game m&igrave;nh chơi đều c&oacute; tr&ecirc;n Xbox One lẫn PS4, nhưng l&uacute;c chọn mua m&aacute;y, l&yacute; do quyết định khiến m&igrave;nh mua PS4 thay v&igrave; Xbox One l&agrave; do bộ nguồn của PS4 t&iacute;ch hợp sẵn v&ocirc; m&aacute;y, gọn g&agrave;ng v&agrave; thẩm mỹ, ngo&agrave;i ra n&oacute; c&ograve;n auto volt 100V - 240V n&ecirc;n rất tiện lợi, chỉ cần 1 đầu d&acirc;y cắm v&ocirc; ổ điện, đầu kia cắm v&ocirc; PS4 l&agrave; xong. Trong khi đ&oacute; Xbox One x&agrave;i cục nguồn to đ&ugrave;ng nằm b&ecirc;n ngo&agrave;i, m&agrave; m&aacute;y lại c&oacute; chia ra bản x&agrave;i điện 110V (x&aacute;ch tay) rồi bản điện 220V cho ch&acirc;u &Aacute; nữa chứ, rắc rối.<br />
<br />
Chắc chắn l&agrave; Sony cũng sẽ sớm ra mắt bản n&acirc;ng cấp PS4 để cạnh tranh với Microsoft, nhưng trước mắt th&igrave; ch&uacute;ng ta h&atilde;y c&ugrave;ng điểm qua những điểm n&acirc;ng cấp đ&aacute;ng gi&aacute; của Xbox One S đ&atilde; nh&eacute;.<br />
&nbsp;</p>

<ul>
	<li><strong><em>Gi&aacute; b&aacute;n tốt hơn:</em></strong></li>
</ul>

<p>Sở hữu nhiều n&acirc;ng cấp đ&aacute;ng gi&aacute; nhưng gi&aacute; của Xbox One S vẫn bằng với Xbox One l&uacute;c mới gi&aacute; mắt. Ch&uacute;ng ta c&oacute; Xbox One S bản ổ cứng 2TB l&agrave; 399$,&nbsp;<a href="https://tinhte.vn/go-to/aHR0cHM6Ly93d3cubWljcm9zb2Z0c3RvcmUuY29tL3N0b3JlL21zdXNhL2VuX1VTL3BkcC9wcm9kdWN0SUQuMzM2Njk5OTcwMA==" target="_blank">nhận đặt h&agrave;ng ngay từ h&ocirc;m nay</a>, ng&agrave;y 31/8 giao h&agrave;ng, bản ổ cứng 500GB v&agrave; 1TB sẽ c&oacute; gi&aacute; 299$/349$ nhưng cuối năm nay mới b&aacute;n.<br />
&nbsp;</p>

<p><img alt="xbox-one-s (1).jpg" src="https://tinhte.vn/store/2016/06/3758212_xbox-one-s_1.jpg" />&nbsp;​</p>

<ul>
	<li><strong><em>Thiết kế mới:</em></strong></li>
</ul>

<p>K&iacute;ch thước của Xbox One S nhỏ hơn Xbox One tới 40%, đồng thời bộ nguồn cũng được t&iacute;ch hợp b&ecirc;n trong m&aacute;y lu&ocirc;n, nếu ch&uacute;ng ta cộng 2 thứ n&agrave;y lại th&igrave; kh&ocirc;ng gian tiết kiệm được phải hơn 50% so với chiếc One. Th&ecirc;m nữa, Microsoft c&ograve;n tặng k&egrave;m đế đặt đứng m&aacute;y, như vậy ch&uacute;ng ta c&oacute; nhiều c&aacute;ch bố tr&iacute; m&aacute;y hơn.<br />
&nbsp;</p>

<p><img alt="xbox-one-s (5).jpg" src="https://tinhte.vn/store/2016/06/3758216_xbox-one-s_5.jpg" />&nbsp;​</p>

<p>&nbsp;</p>

<ul>
	<li><strong><em>Hỗ trợ video 4K v&agrave; HDR:</em></strong></li>
</ul>

<p>Microsoft chưa n&oacute;i r&otilde; GPU của Xbox One S được n&acirc;ng cấp như thế n&agrave;o, chỉ biết l&agrave; n&oacute; sẽ hỗ trợ chơi video 4K (3840 x 2160), từ c&aacute;c nội dung stream tr&ecirc;n YouTube, Netflix cho tới đĩa Bluray 4K. Game tr&ecirc;n Xbox One S cũng sẽ hỗ trợ th&ecirc;m dải tương phản động HDR.<br />
<br />
<img alt="xbox-one-s (7).jpg" src="https://tinhte.vn/store/2016/06/3758220_xbox-one-s_7.jpg" /><br />
&nbsp;</p>

<ul>
	<li><strong><em>T&iacute;ch hợp kết nối hồng ngoại:</em></strong></li>
</ul>

<p>L&uacute;c trước Microsoft b&aacute;n k&egrave;m Xbox One với Kinect khiến gi&aacute; m&aacute;y bị đẩy l&ecirc;n cao, sau n&agrave;y họ th&ecirc;m t&ugrave;y chọn mua ri&ecirc;ng Kinect n&ecirc;n gi&aacute; m&aacute;y giảm đi được tới 150$. Xbox One S cũng sẽ kh&ocirc;ng b&aacute;n k&egrave;m Kinect, nhưng m&aacute;y đ&atilde; được t&iacute;ch hợp kết nối hồng ngoại IR (c&oacute; tr&ecirc;n Kinect) v&agrave; ch&uacute;ng ta c&oacute; thể c&agrave;i đặt để One S l&agrave;m hub điều khiển HDTV, set-top box trong ph&ograve;ng bằng gamepad m&agrave; kh&ocirc;ng cần tới remote.<br />
&nbsp;</p>

<p><img alt="xbox-one-s (8).jpg" src="https://tinhte.vn/store/2016/06/3758222_xbox-one-s_8.jpg" />​</p>

<p>&nbsp;</p>

<ul>
	<li><strong><em>Cải tiến tay cầm:</em></strong></li>
</ul>

<p>Kh&ocirc;ng chỉ th&acirc;n m&aacute;y mới được n&acirc;ng cấp, Microsoft cho biết m&aacute;y Xbox One S sẽ đi k&egrave;m với tay cầm mới với phần b&aacute;ng cầm c&aacute;c chấm nh&ocirc; l&ecirc;n cho ph&eacute;p dễ cầm nắm hơn v&agrave; chất lượng kết nối Bluetooth cũng được cải thiện hơn so với trước đ&acirc;y.<br />
&nbsp;</p>

<p><img alt="xbox-one-s (4).jpg" src="https://tinhte.vn/store/2016/06/3758214_xbox-one-s_4.jpg" />&nbsp;​</p>

<ul>
	<li><strong><em>L&agrave;m tốt hơn những g&igrave; Xbox One c&oacute; thể:</em></strong></li>
</ul>

<p>Xbox One S l&agrave; phi&ecirc;n bản n&acirc;ng cấp phần cứng của Xbox One, do đ&oacute; n&oacute; vẫn sử dụng chung nền tảng phần mềm, game v&agrave; c&aacute;c nội dung số kh&aacute;c, chứ kh&ocirc;ng phải l&agrave; một hệ m&aacute;y mới ho&agrave;n to&agrave;n như từ Xbox 360 l&ecirc;n Xbox One. Tức l&agrave; m&aacute;y mới sẽ mạnh hơn, l&agrave;m tốt hơn những g&igrave; m&aacute;y cũ đ&atilde; v&agrave; đang l&agrave;m được.<br />
<br />
Sức mạnh đồ họa của Xbox One S được n&acirc;ng cấp như thế n&agrave;o vẫn c&ograve;n l&agrave; một c&acirc;u hỏi chưa c&oacute; lời đ&aacute;p, v&agrave; sắp tới đ&acirc;y Sony sẽ ra mắt bản n&acirc;ng cấp của PS4 để cạnh tranh, khi c&acirc;u trả lời đ&atilde; r&otilde; r&agrave;ng th&igrave; liệu bạn c&oacute; mua One S với những n&acirc;ng cấp đ&aacute;ng gi&aacute; kể tr&ecirc;n hay kh&ocirc;ng, c&ugrave;ng chia sẻ ở đ&acirc;y nh&eacute;!<br />
<br />
<img alt="xbox-one-s (6).jpg" src="https://tinhte.vn/store/2016/06/3758218_xbox-one-s_6.jpg" /></p>
', 8, 3, NULL, CAST(N'2017-01-07T09:11:22.317' AS DateTime), CAST(N'2017-01-07T09:11:22.317' AS DateTime))
GO
INSERT [dbo].[HangHoa] ([HangHoaId], [Ma], [Ten], [GiaBanThamKhao], [MoTa], [LoaiHangHoaId], [NhaCungCapId], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (24, N'00002', N'Galaxy S7 Edge', 16990000, N'<p><a class="Tinhte_XenTag_TagLink" href="https://tinhte.vn/tags/samsung-galaxy-s7-edge/" title=""><font color="#0066cc">Samsung Galaxy S7 edge</font></a> c&oacute; lẽ sẽ được nhiều người th&iacute;ch hơn so với Galaxy S7 v&igrave; n&oacute; c&oacute; hai m&agrave;n h&igrave;nh cong hai b&ecirc;n độc đ&aacute;o. C&oacute; vẻ như năm nay Galaxy S7 edge &ldquo;thật sự&rdquo; đ&atilde; bị khai tử m&agrave; chiếc m&aacute;y ch&uacute;ng ta đang thấy ch&iacute;nh l&agrave; Galaxy S7 edge Plus. Galaxy S7 edge c&oacute; m&agrave;n h&igrave;nh 5.5&rdquo; c&ograve;n S7 chỉ l&agrave; 5.1&rdquo;. M&igrave;nh nghe n&oacute;i l&agrave; giữa th&aacute;ng sau th&igrave; Galaxy S7 v&agrave; S7 Edge sẽ bắt đầu b&aacute;n ra ở Việt Nam rồi, rất sớm v&agrave; rất n&oacute;ng.</p>

<div style="text-align: center"><br />
<iframe allowfullscreen="" frameborder="0" height="450" src="https://www.youtube.com/embed/SbDdkfvFTl0?wmode=opaque" width="800"></iframe><br />
​</div>

<p><a class="Tinhte_XenTag_TagLink" href="https://tinhte.vn/tags/samsung/" title=""><font color="#0066cc">Samsung</font></a> Galaxy S7 edge mượt m&agrave;, nhẹ nh&agrave;ng hơn rất nhiều so với thế hệ trước, ở cả hai mặt của n&oacute;. X&eacute;t trong một g&oacute;c độ n&agrave;o đ&oacute;, n&oacute; giống hệt cục pin QuickCharge 2.0 của Samsung hay thiết kế cạnh viền ở mặt lưng của Galaxy Note 5, c&aacute;c cạnh kh&ocirc;ng bị cấn, dễ chịu với tay.<br />
<br />
Bằng việc thu gọn viền m&agrave;n h&igrave;nh v&agrave; thiết kế sử dụng m&agrave;u sắc đồng nhất hơn, Galaxy S7 edge nhiều gọn g&agrave;ng hơn so với S6 edge Plus, kể cả khi bạn cầm <a class="Tinhte_XenTag_TagLink" href="https://tinhte.vn/tags/tren-tay/" title=""><font color="#0066cc">tr&ecirc;n tay</font></a> trải nghiệm hay khi so s&aacute;nh trực tiếp. M&igrave;nh th&iacute;ch nhất l&agrave; Samsung đ&atilde; trang bị vi&ecirc;n pin 3.600mAh tr&ecirc;n S7 edge, d&ugrave;ng l&acirc;u hơn nhiều so với 3.000mAh của S6 edge Plus trước kia.<br />
&nbsp;</p>

<div style="text-align: center"><img alt="Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-16.jpg" class="LbImage bbCodeImage" src="https://tinhte.vn/store/2016/02/3611952_Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-16.jpg" title="Bấm vào để phóng to." /> ​</div>

<p><br />
Với vi&ecirc;n pin lớn như vậy, Samsung cũng phải trang bị c&ocirc;ng nghệ sạc nhanh mới cho S7 v&agrave; S7 edge. M&igrave;nh chưa r&otilde; chi tiết nhưng theo Samsung th&igrave; kể cả sạc kh&ocirc;ng d&acirc;y tr&ecirc;n S7 v&agrave; S7 edge cũng nhanh hơn sạc nhanh c&oacute; d&acirc;y tr&ecirc;n một số đối thủ kh&aacute;c.<br />
<br />
Đ&oacute; l&agrave; phần ri&ecirc;ng của Galaxy S7 edge, phần dưới n&agrave;y l&agrave; d&agrave;nh cho cả Galaxy S7 v&agrave; Galaxy S7 edge, c&aacute;c bạn c&oacute; thể bỏ qua phần dưới nếu đ&atilde; đọc b&agrave;i về Galaxy S7 trước, v&agrave; ngược lại.<br />
<br />
<strong>Khe cắm thẻ nhớ:</strong><br />
Tất cả c&aacute;c m&aacute;y Galaxy S7 v&agrave; Galaxy S7 edge b&aacute;n ra đều l&agrave; m&aacute;y hai SIM, bạn c&oacute; thể d&ugrave;ng cả hai SIM nếu muốn, nhưng khi đ&oacute; ch&uacute;ng ta sẽ phải hy sinh một khe cắm thẻ nhớ. Nếu muốn d&ugrave;ng thẻ nhớ th&igrave; bạn chỉ c&oacute; thể d&ugrave;ng một SIM ch&iacute;nh v&agrave; một thẻ microSD.<br />
<br />
<strong>Sức mạnh xử l&yacute;:</strong><br />
Samsung Galaxy S7/S7 edge được trang bị con chip xử l&yacute; mới của Samsung. Hiện tại m&igrave;nh chưa thể x&aacute;c nhận r&otilde; r&agrave;ng t&ecirc;n m&atilde; nhưng theo h&atilde;ng th&igrave; n&oacute; mạnh hơn 30% về mặt CPU v&agrave; 60% về GPU so với thế hệ trước. Kết hợp với 4GB RAM mặc định th&igrave; c&aacute;c bạn c&oacute; thể thấy l&agrave; n&oacute; hoạt động nhanh hơn, phản ứng nhanh hơn kh&aacute; nhiều trong video.<br />
<br />
<strong>Tản nhiệt chất lỏng:</strong><br />
Cũng như Microsoft Lumia 950XL, Samsung Galaxy S7/S7 edge c&oacute; tản nhiệt chất lỏng nhằm đảm bảo cho m&aacute;y sẽ lu&ocirc;n m&aacute;t. Nguy&ecirc;n tắc kh&aacute; đơn giản, một ống dẫn nhiệt d&agrave;y 0.4mm b&ecirc;n trong m&aacute;y c&oacute; chứa chất lỏng l&agrave;m m&aacute;t, n&oacute; sẽ đi ngang qua những bộ phận nguy hiểm như SoC, c&aacute;c con chip điều khiển, sau đ&oacute; mang nhiệt lượng từ đ&acirc;y qua những khu vực kh&aacute;c để trải đều diện t&iacute;ch tản nhiệt ra. Chất lỏng cứ tuần ho&agrave;n tuần ho&agrave;n như vậy b&ecirc;n trong, v&agrave; m&aacute;y sẽ lu&ocirc;n m&aacute;t hơn rất nhiều so với tản nhiệt thụ động kh&ocirc;ng kh&iacute; ch&uacute;ng ta thường thấy.<br />
<br />
Thực tế l&agrave; khi m&igrave;nh thử chơi game, chụp h&igrave;nh v&agrave; quay phim 4K ngắn tr&ecirc;n Galaxy S6 th&igrave; m&aacute;y kh&ocirc;ng bị n&oacute;ng, cầm vẫn rất dễ chịu. M&igrave;nh sẽ thử kỹ hơn khi c&oacute; m&aacute;y thương mại.<br />
<br />
<strong>Camera:</strong><br />
Camera l&agrave; thay đổi lớn tr&ecirc;n cả S6 v&agrave; S6 edge. Trước kia th&igrave; camera tr&ecirc;n hai chiếc m&aacute;y n&agrave;y lồi rất nhiều nhưng giờ th&igrave; n&oacute; chỉ c&ograve;n 0.46mm so với nắp lưng. Tuy vậy, đ&oacute; chỉ l&agrave; điểm phụ c&ograve;n điểm ch&iacute;nh l&agrave; Samsung đ&atilde; cải tiến triệt để camera của m&aacute;y, từ cảm biến, hệ thống lấy n&eacute;t cho tới ống k&iacute;nh.<br />
&nbsp;</p>

<div style="text-align: center"><img alt="Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-6.jpg" class="LbImage bbCodeImage" src="https://tinhte.vn/store/2016/02/3611938_Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-6.jpg" title="Bấm vào để phóng to." /> ​</div>

<p><br />
Cảm biến ảnh tr&ecirc;n S7/S7 edge l&agrave; cảm biến ảnh 12MP, độ ph&acirc;n giải thấp hơn so với 16MP tr&ecirc;n thế hệ trước nhưng ch&iacute;nh v&igrave; vậy m&agrave; Samsung c&oacute; thể tăng k&iacute;ch cỡ từng điểm ảnh l&ecirc;n 1.4&mu;m so với 1.12 micromet trước kia. Chỉ ri&ecirc;ng việc tăng k&iacute;ch cỡ điểm ảnh n&agrave;y l&ecirc;n th&igrave; n&oacute; sẽ gi&uacute;p cảm biến thu được nhiều hơn 56% &aacute;nh s&aacute;ng. K&iacute;ch cỡ điểm ảnh 1.4&mu;m tương đương với Nokia Pureview 808, iPhone 5 (iPhone 6s l&agrave; 1.5) hay Moto X&hellip;<br />
<br />
Ống k&iacute;nh của S7/S7 edge cũng c&oacute; khẩu độ f/1.7, s&aacute;ng hơn 25% so với f/1.9 tr&ecirc;n S6. Kết hợp cả ống k&iacute;nh v&agrave; k&iacute;ch cỡ điểm ảnh th&igrave; trong c&ugrave;ng một th&ocirc;ng số, c&ugrave;ng một điều kiện, ảnh từ Galaxy S7 sẽ s&aacute;ng hơn 95% so với S6, theo th&ocirc;ng b&aacute;o từ Samsung.<br />
<br />
Kh&ocirc;ng chỉ c&oacute; vậy, Galaxy S6 v&agrave; Galaxy S6 edge đều c&oacute; c&aacute;c điểm ảnh Dual Pixel. C&aacute;c điểm ảnh n&agrave;y hỗ trợ lấy n&eacute;t theo pha ở từng cấp độ điểm ảnh một, tức l&agrave; 100% điểm ảnh đều lấy n&eacute;t theo pha so với 0.78% tr&ecirc;n Galaxy S6. Thực tế th&igrave; m&aacute;y lấy n&eacute;t gần như ngay lập tức m&agrave; kh&ocirc;ng phải chờ như S6. M&igrave;nh c&oacute; quay sơ qua một đoạn ngắn trong video tr&ecirc;n tay nhưng sẽ cần thử kỹ hơn sau n&agrave;y.<br />
<br />
<strong>Phần mềm:</strong><br />
Galaxy S7 v&agrave; S7 edge đều dựa tr&ecirc;n Android 6.0, bổ sung th&ecirc;m một số t&iacute;nh năng mới như Always On Display, API Vulkan cho game, c&aacute;c t&iacute;nh năng tối ưu h&oacute;a cho game&hellip; M&igrave;nh sẽ chia sẻ kỹ hơn v&agrave;o ng&agrave;y mai.<br />
<br />
<br />
<img alt="Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-20.jpg" class="LbImage bbCodeImage" src="https://tinhte.vn/store/2016/02/3611956_Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-20.jpg" title="Bấm vào để phóng to." /> <img alt="Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-22.jpg" class="LbImage bbCodeImage" src="https://tinhte.vn/store/2016/02/3611957_Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-22.jpg" title="Bấm vào để phóng to." /> <img alt="Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn.jpg" class="LbImage bbCodeImage" src="https://tinhte.vn/store/2016/02/3611958_Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn.jpg" title="Bấm vào để phóng to." /> <img alt="Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-19.jpg" class="LbImage bbCodeImage" src="https://tinhte.vn/store/2016/02/3611954_Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-19.jpg" title="Bấm vào để phóng to." /> Thiết kế tr&ecirc;n Galaxy S7 edge gọn g&agrave;ng hơn, viền m&agrave;n h&igrave;nh mỏng hơn so với thế hệ trước <img alt="Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-14.jpg" class="LbImage bbCodeImage" src="https://tinhte.vn/store/2016/02/3611955_Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-14.jpg" title="Bấm vào để phóng to." /> M&aacute;y vẫn c&oacute; loa thoại kiểu d&aacute;ng rất quen thuộc, camera trước khẩu độ lớn ở b&ecirc;n cạnh <img alt="Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-11.jpg" class="LbImage bbCodeImage" src="https://tinhte.vn/store/2016/02/3611948_Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-11.jpg" title="Bấm vào để phóng to." /> <img alt="Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-18.jpg" class="LbImage bbCodeImage" src="https://tinhte.vn/store/2016/02/3611953_Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-18.jpg" title="Bấm vào để phóng to." /></p>

<div style="text-align: center"><img alt="Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-4.jpg" class="LbImage bbCodeImage" src="https://tinhte.vn/store/2016/02/3611939_Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-4.jpg" title="Bấm vào để phóng to." /> <img alt="Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-5.jpg" class="LbImage bbCodeImage" src="https://tinhte.vn/store/2016/02/3611941_Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-5.jpg" title="Bấm vào để phóng to." /> Mặt sau với camera được thiết kế bớt lồi hơn. <img alt="Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-2.jpg" class="LbImage bbCodeImage" src="https://tinhte.vn/store/2016/02/3611940_Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-2.jpg" title="Bấm vào để phóng to." /> <img alt="Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-3.jpg" class="LbImage bbCodeImage" src="https://tinhte.vn/store/2016/02/3611942_Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-3.jpg" title="Bấm vào để phóng to." /> <img alt="Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-7.jpg" class="LbImage bbCodeImage" src="https://tinhte.vn/store/2016/02/3611943_Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-7.jpg" title="Bấm vào để phóng to." /> Ph&iacute;m nguồn nằm ở cạnh phải, thiết kế đem lại cảm gi&aacute;c rất mỏng <img alt="Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-17.jpg" class="LbImage bbCodeImage" src="https://tinhte.vn/store/2016/02/3611950_Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-17.jpg" title="Bấm vào để phóng to." /> Ph&iacute;m tăng giảm &acirc;n lượng ở cạnh tr&aacute;i. <img alt="Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-10.jpg" class="LbImage bbCodeImage" src="https://tinhte.vn/store/2016/02/3611946_Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-10.jpg" title="Bấm vào để phóng to." /> <img alt="Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-8.jpg" class="LbImage bbCodeImage" src="https://tinhte.vn/store/2016/02/3611944_Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-8.jpg" title="Bấm vào để phóng to." /> Samsung vẫn sử dụng kết nối microUSB 2.0, thiết kế loa ngo&agrave;i ở b&ecirc;n dưới, hai cạnh bo s&oacute;ng đối xứng. <img alt="Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-9.jpg" class="LbImage bbCodeImage" src="https://tinhte.vn/store/2016/02/3611945_Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-9.jpg" title="Bấm vào để phóng to." /> Ph&iacute;a tr&ecirc;n l&agrave; khe cắm 2 SIM hoặc 1 SIM + 1 thẻ nhớ microSD <img alt="Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-12.jpg" class="LbImage bbCodeImage" src="https://tinhte.vn/store/2016/02/3611947_Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-12.jpg" title="Bấm vào để phóng to." /> <img alt="Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-13.jpg" class="LbImage bbCodeImage" src="https://tinhte.vn/store/2016/02/3611949_Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-13.jpg" title="Bấm vào để phóng to." /> <img alt="Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-15.jpg" class="LbImage bbCodeImage" src="https://tinhte.vn/store/2016/02/3611951_Tren_tay_Samsung_Galaxy_S7_edge_tinhte.vn-15.jpg" title="Bấm vào để phóng to." /></div>
', 1, 5, NULL, CAST(N'2017-01-07T19:08:58.880' AS DateTime), CAST(N'2017-01-07T19:12:39.413' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[HangHoa] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

GO
INSERT [dbo].[HoaDon] ([HoaDonId], [DonHangId], [NguoiLapId], [NgayLap], [ThanhTien], [GhiChu], [CreatedDate], [UpdatedDate]) VALUES (1, 2, 1, CAST(N'2016-10-05' AS Date), 1234563456, N'123', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiHangHoa] ON 

GO
INSERT [dbo].[LoaiHangHoa] ([LoaiHangHoaId], [Ma], [Ten], [CreatedDate], [UpdatedDate]) VALUES (1, N'DT', N'Điện Thoại', NULL, CAST(N'2017-01-07T08:00:25.460' AS DateTime))
GO
INSERT [dbo].[LoaiHangHoa] ([LoaiHangHoaId], [Ma], [Ten], [CreatedDate], [UpdatedDate]) VALUES (5, N'LT', N'Laptop', CAST(N'2017-01-07T08:00:39.797' AS DateTime), CAST(N'2017-01-07T08:00:39.797' AS DateTime))
GO
INSERT [dbo].[LoaiHangHoa] ([LoaiHangHoaId], [Ma], [Ten], [CreatedDate], [UpdatedDate]) VALUES (6, N'PK', N'Phụ Kiện', CAST(N'2017-01-07T08:00:54.920' AS DateTime), CAST(N'2017-01-07T08:00:54.920' AS DateTime))
GO
INSERT [dbo].[LoaiHangHoa] ([LoaiHangHoaId], [Ma], [Ten], [CreatedDate], [UpdatedDate]) VALUES (7, N'MTB', N'Máy Tính Bảng', CAST(N'2017-01-07T08:01:10.237' AS DateTime), CAST(N'2017-01-07T08:01:10.237' AS DateTime))
GO
INSERT [dbo].[LoaiHangHoa] ([LoaiHangHoaId], [Ma], [Ten], [CreatedDate], [UpdatedDate]) VALUES (8, N'CSL', N'Máy Chơi Game', CAST(N'2017-01-07T09:06:03.487' AS DateTime), CAST(N'2017-01-07T09:06:03.487' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[LoaiHangHoa] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

GO
INSERT [dbo].[NhaCungCap] ([NhaCungCapId], [Ma], [Ten], [CreatedDate], [UpdatedDate]) VALUES (3, N'MS', N'Microsoft', NULL, NULL)
GO
INSERT [dbo].[NhaCungCap] ([NhaCungCapId], [Ma], [Ten], [CreatedDate], [UpdatedDate]) VALUES (4, N'APL', N'Apple', NULL, CAST(N'2017-01-07T08:14:33.403' AS DateTime))
GO
INSERT [dbo].[NhaCungCap] ([NhaCungCapId], [Ma], [Ten], [CreatedDate], [UpdatedDate]) VALUES (5, N'SS', N'Samsung', NULL, NULL)
GO
INSERT [dbo].[NhaCungCap] ([NhaCungCapId], [Ma], [Ten], [CreatedDate], [UpdatedDate]) VALUES (7, N'LG', N'LG', CAST(N'2017-01-07T08:14:59.317' AS DateTime), CAST(N'2017-01-07T08:14:59.317' AS DateTime))
GO
INSERT [dbo].[NhaCungCap] ([NhaCungCapId], [Ma], [Ten], [CreatedDate], [UpdatedDate]) VALUES (8, N'XM', N'Xiaomi', CAST(N'2017-01-07T08:15:32.080' AS DateTime), CAST(N'2017-01-07T08:15:32.080' AS DateTime))
GO
INSERT [dbo].[NhaCungCap] ([NhaCungCapId], [Ma], [Ten], [CreatedDate], [UpdatedDate]) VALUES (9, N'DL', N'DELL', CAST(N'2017-01-07T08:15:51.147' AS DateTime), CAST(N'2017-01-07T08:15:51.147' AS DateTime))
GO
INSERT [dbo].[NhaCungCap] ([NhaCungCapId], [Ma], [Ten], [CreatedDate], [UpdatedDate]) VALUES (10, N'HTC', N'HTC', CAST(N'2017-01-07T08:16:13.760' AS DateTime), CAST(N'2017-01-07T08:16:13.760' AS DateTime))
GO
INSERT [dbo].[NhaCungCap] ([NhaCungCapId], [Ma], [Ten], [CreatedDate], [UpdatedDate]) VALUES (11, N'HW', N'Huawei', CAST(N'2017-01-07T08:16:57.647' AS DateTime), CAST(N'2017-01-07T08:16:57.647' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
GO
SET IDENTITY_INSERT [dbo].[PhieuChi] ON 

GO
INSERT [dbo].[PhieuChi] ([PhieuChiId], [NguoiLap], [TongTien], [GhiChu], [NgayLap], [CreatedDate], [UpdatedDate]) VALUES (1, 1, 123000, NULL, CAST(N'2017-05-01' AS Date), NULL, NULL)
GO
INSERT [dbo].[PhieuChi] ([PhieuChiId], [NguoiLap], [TongTien], [GhiChu], [NgayLap], [CreatedDate], [UpdatedDate]) VALUES (2, 3, 600000, N'none      ', CAST(N'2017-01-05' AS Date), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[PhieuChi] OFF
GO
SET IDENTITY_INSERT [dbo].[Quan] ON 

GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (1, 1, N'Ba Đình', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (2, 1, N'Hoàn Kiếm', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (3, 1, N'Tây Hồ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (4, 1, N'Long Biên', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (5, 1, N'Cầu Giấy', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (6, 1, N'Đống Đa', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (7, 1, N'Hai Bà Trưng', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (8, 1, N'Hoàng Mai', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (9, 1, N'Thanh Xuân', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (10, 1, N'Hà Đông', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (11, 1, N'Sơn Tây', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (12, 1, N'Sóc Sơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (13, 1, N'Đông Anh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (14, 1, N'Gia Lâm', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (15, 1, N'Từ Liêm', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (16, 1, N'Thanh Trì', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (17, 1, N'Mê Linh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (18, 1, N'Ba Vì', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (19, 1, N'Phúc Thọ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (20, 1, N'Đan Phượng', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (21, 1, N'Hoài Đức ', NULL, CAST(N'2017-01-06T21:04:44.217' AS DateTime))
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (22, 1, N'Quốc Oai', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (23, 1, N'Thạch Thất', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (24, 1, N'Chương Mỹ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (25, 1, N'Thanh Oai', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (26, 1, N'Thường Tín', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (27, 1, N'Phú Xuyên', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (28, 1, N'Ứng Hòa', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (29, 1, N'Mỹ Đức', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (30, 2, N'Hà Giang', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (31, 2, N'Đồng Văn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (32, 2, N'Mèo Vạc', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (33, 2, N'Yên Minh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (34, 2, N'Quản Bạ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (35, 2, N'Vị Xuyên', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (36, 2, N'Bắc Mê', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (37, 2, N'Hoàng Su Phì', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (38, 2, N'Xín Mần', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (39, 2, N'Bắc Quang', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (40, 2, N'Quang Bình', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (41, 4, N'Cao Bằng', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (42, 4, N'Bảo Lâm', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (43, 4, N'Bảo Lạc', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (44, 4, N'Thông Nông', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (45, 4, N'Hà Quảng', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (46, 4, N'Trà Lĩnh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (47, 4, N'Trùng Khánh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (48, 4, N'Hạ Lang', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (49, 4, N'Quảng Uyên', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (50, 4, N'Phục Hoà', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (51, 4, N'Hoà An', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (52, 4, N'Nguyên Bình', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (53, 4, N'Thạch An', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (54, 6, N'Bắc Kạn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (55, 6, N'Pác Nặm', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (56, 6, N'Ba Bể', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (57, 6, N'Ngân Sơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (58, 6, N'Bạch Thông', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (59, 6, N'Chợ Đồn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (60, 6, N'Chợ Mới', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (61, 6, N'Na Rì', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (62, 8, N'Tuyên Quang', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (63, 8, N'Nà Hang', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (64, 8, N'Chiêm Hóa', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (65, 8, N'Hàm Yên', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (66, 8, N'Yên Sơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (67, 8, N'Sơn Dương', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (68, 10, N'Lào Cai', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (69, 10, N'Bát Xát', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (70, 10, N'Mường Khương', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (71, 10, N'Si Ma Cai', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (72, 10, N'Bắc Hà', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (73, 10, N'Bảo Thắng', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (74, 10, N'Bảo Yên', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (75, 10, N'Sa Pa', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (76, 10, N'Văn Bàn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (77, 11, N'Điện Biên Phủ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (78, 11, N'Mường Lay', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (79, 11, N'Mường Nhé', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (80, 11, N'Mường Chà', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (81, 11, N'Tủa Chùa', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (82, 11, N'Tuần Giáo', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (83, 11, N'Điện Biên', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (84, 11, N'Điện Biên Đông', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (85, 11, N'Mường Ảng', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (86, 12, N'Lai Châu', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (87, 12, N'Tam Đường', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (88, 12, N'Mường Tè', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (89, 12, N'Sìn Hồ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (90, 12, N'Phong Thổ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (91, 12, N'Than Uyên', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (92, 12, N'Tân Uyên', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (93, 14, N'Sơn La', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (94, 14, N'Quỳnh Nhai', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (95, 14, N'Thuận Châu', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (96, 14, N'Mường La', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (97, 14, N'Bắc Yên', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (98, 14, N'Phù Yên', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (99, 14, N'Mộc Châu', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (100, 14, N'Yên Châu', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (101, 14, N'Mai Sơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (102, 14, N'Sông Mã', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (103, 14, N'Sốp Cộp', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (104, 15, N'Yên Bái', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (105, 15, N'Nghĩa Lộ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (106, 15, N'Lục Yên', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (107, 15, N'Văn Yên', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (108, 15, N'Mù Cang Chải', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (109, 15, N'Trấn Yên', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (110, 15, N'Trạm Tấu', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (111, 15, N'Văn Chấn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (112, 15, N'Yên Bình', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (113, 17, N'Hòa Bình', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (114, 17, N'Đà Bắc', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (115, 17, N'Kỳ Sơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (116, 17, N'Lương Sơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (117, 17, N'Kim Bôi', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (118, 17, N'Cao Phong', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (119, 17, N'Tân Lạc', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (120, 17, N'Mai Châu', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (121, 17, N'Lạc Sơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (122, 17, N'Yên Thủy', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (123, 17, N'Lạc Thủy', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (124, 19, N'Thái Nguyên', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (125, 19, N'Sông Công', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (126, 19, N'Định Hóa', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (127, 19, N'Phú Lương', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (128, 19, N'Đồng Hỷ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (129, 19, N'Võ Nhai', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (130, 19, N'Đại Từ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (131, 19, N'Phổ Yên', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (132, 19, N'Phú Bình', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (133, 20, N'Lạng Sơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (134, 20, N'Tràng Định', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (135, 20, N'Bình Gia', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (136, 20, N'Văn Lãng', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (137, 20, N'Cao Lộc', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (138, 20, N'Văn Quan', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (139, 20, N'Bắc Sơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (140, 20, N'Hữu Lũng', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (141, 20, N'Chi Lăng', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (142, 20, N'Lộc Bình', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (143, 20, N'Đình Lập', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (144, 22, N'Hạ Long', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (145, 22, N'Móng Cái', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (146, 22, N'Cẩm Phả', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (147, 22, N'Uông Bí', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (148, 22, N'Bình Liêu', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (149, 22, N'Tiên Yên', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (150, 22, N'Đầm Hà', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (151, 22, N'Hải Hà', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (152, 22, N'Ba Chẽ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (153, 22, N'Vân Đồn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (154, 22, N'Hoành Bồ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (155, 22, N'Đông Triều', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (156, 22, N'Yên Hưng', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (157, 22, N'Cô Tô', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (158, 24, N'Bắc Giang', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (159, 24, N'Yên Thế', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (160, 24, N'Tân Yên', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (161, 24, N'Lạng Giang', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (162, 24, N'Lục Nam', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (163, 24, N'Lục Ngạn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (164, 24, N'Sơn Động', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (165, 24, N'Yên Dũng', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (166, 24, N'Việt Yên', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (167, 24, N'Hiệp Hòa', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (168, 25, N'Việt Trì', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (169, 25, N'Phú Thọ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (170, 25, N'Đoan Hùng', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (171, 25, N'Hạ Hoà', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (172, 25, N'Thanh Ba', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (173, 25, N'Phù Ninh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (174, 25, N'Yên Lập', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (175, 25, N'Cẩm Khê', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (176, 25, N'Tam Nông', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (177, 25, N'Lâm Thao', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (178, 25, N'Thanh Sơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (179, 25, N'Thanh Thuỷ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (180, 25, N'Tân Sơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (181, 26, N'Vĩnh Yên', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (182, 26, N'Phúc Yên', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (183, 26, N'Lập Thạch', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (184, 26, N'Tam Dương', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (185, 26, N'Tam Đảo', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (186, 26, N'Bình Xuyên', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (187, 26, N'Yên Lạc', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (188, 26, N'Vĩnh Tường', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (189, 26, N'Sông Lô', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (190, 27, N'Bắc Ninh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (191, 27, N'Từ Sơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (192, 27, N'Yên Phong', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (193, 27, N'Quế Võ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (194, 27, N'Tiên Du', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (195, 27, N'Thuận Thành', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (196, 27, N'Gia Bình', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (197, 27, N'Lương Tài', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (198, 30, N'Hải Dương', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (199, 30, N'Chí Linh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (200, 30, N'Nam Sách', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (201, 30, N'Kinh Môn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (202, 30, N'Kim Thành', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (203, 30, N'Thanh Hà', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (204, 30, N'Cẩm Giàng', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (205, 30, N'Bình Giang', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (206, 30, N'Gia Lộc', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (207, 30, N'Tứ Kỳ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (208, 30, N'Ninh Giang', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (209, 30, N'Thanh Miện', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (210, 31, N'Hồng Bàng', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (211, 31, N'Ngô Quyền', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (212, 31, N'Lê Chân', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (213, 31, N'Hải An', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (214, 31, N'Kiến An', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (215, 31, N'Đồ Sơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (216, 31, N'Kinh Dương', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (217, 31, N'Thuỷ Nguyên', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (218, 31, N'An Dương', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (219, 31, N'An Lão', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (220, 31, N'Kiến Thụy', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (221, 31, N'Tiên Lãng', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (222, 31, N'Vĩnh Bảo', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (223, 31, N'Cát Hải', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (224, 31, N'Bạch Long Vĩ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (225, 33, N'Hưng Yên', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (226, 33, N'Văn Lâm', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (227, 33, N'Văn Giang', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (228, 33, N'Yên Mỹ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (229, 33, N'Mỹ Hào', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (230, 33, N'Ân Thi', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (231, 33, N'Khoái Châu', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (232, 33, N'Kim Động', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (233, 33, N'Tiên Lữ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (234, 33, N'Phù Cừ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (235, 34, N'Thái Bình', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (236, 34, N'Quỳnh Phụ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (237, 34, N'Hưng Hà', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (238, 34, N'Đông Hưng', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (239, 34, N'Thái Thụy', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (240, 34, N'Tiền Hải', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (241, 34, N'Kiến Xương', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (242, 34, N'Vũ Thư', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (243, 35, N'Phủ Lý', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (244, 35, N'Duy Tiên', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (245, 35, N'Kim Bảng', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (246, 35, N'Thanh Liêm', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (247, 35, N'Bình Lục', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (248, 35, N'Lý Nhân', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (249, 36, N'Nam Định', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (250, 36, N'Mỹ Lộc', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (251, 36, N'Vụ Bản', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (252, 36, N'Ý Yên', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (253, 36, N'Nghĩa Hưng', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (254, 36, N'Nam Trực', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (255, 36, N'Trực Ninh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (256, 36, N'Xuân Trường', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (257, 36, N'Giao Thủy', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (258, 36, N'Hải Hậu', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (259, 37, N'Ninh Bình', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (260, 37, N'Tam Điệp', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (261, 37, N'Nho Quan', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (262, 37, N'Gia Viễn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (263, 37, N'Hoa Lư', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (264, 37, N'Yên Khánh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (265, 37, N'Kim Sơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (266, 37, N'Yên Mô', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (267, 38, N'Thanh Hóa', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (268, 38, N'Bỉm Sơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (269, 38, N'Sầm Sơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (270, 38, N'Mường Lát', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (271, 38, N'Quan Hóa', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (272, 38, N'Bá Thước', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (273, 38, N'Quan Sơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (274, 38, N'Lang Chánh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (275, 38, N'Ngọc Lặc', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (276, 38, N'Cẩm Thủy', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (277, 38, N'Thạch Thành', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (278, 38, N'Hà Trung', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (279, 38, N'Vĩnh Lộc', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (280, 38, N'Yên Định', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (281, 38, N'Thọ Xuân', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (282, 38, N'Thường Xuân', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (283, 38, N'Triệu Sơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (284, 38, N'Thiệu Hoá', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (285, 38, N'Hoằng Hóa', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (286, 38, N'Hậu Lộc', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (287, 38, N'Nga Sơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (288, 38, N'Như Xuân', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (289, 38, N'Như Thanh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (290, 38, N'Nông Cống', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (291, 38, N'Đông Sơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (292, 38, N'Quảng Xương', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (293, 38, N'Tĩnh Gia', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (294, 40, N'Vinh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (295, 40, N'Cửa Lò', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (296, 40, N'Thái Hoà', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (297, 40, N'Quế Phong', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (298, 40, N'Quỳ Châu', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (299, 40, N'Kỳ Sơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (300, 40, N'Tương Dương', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (301, 40, N'Nghĩa Đàn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (302, 40, N'Quỳ Hợp', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (303, 40, N'Quỳnh Lưu', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (304, 40, N'Con Cuông', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (305, 40, N'Tân Kỳ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (306, 40, N'Anh Sơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (307, 40, N'Diễn Châu', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (308, 40, N'Yên Thành', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (309, 40, N'Đô Lương', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (310, 40, N'Thanh Chương', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (311, 40, N'Nghi Lộc', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (312, 40, N'Nam Đàn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (313, 40, N'Hưng Nguyên', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (314, 42, N'Hà Tĩnh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (315, 42, N'Hồng Lĩnh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (316, 42, N'Hương Sơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (317, 42, N'Đức Thọ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (318, 42, N'Vũ Quang', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (319, 42, N'Nghi Xuân', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (320, 42, N'Can Lộc', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (321, 42, N'Hương Khê', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (322, 42, N'Thạch Hà', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (323, 42, N'Cẩm Xuyên', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (324, 42, N'Kỳ Anh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (325, 42, N'Lộc Hà', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (326, 44, N'Đồng Hới', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (327, 44, N'Minh Hóa', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (328, 44, N'Tuyên Hóa', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (329, 44, N'Quảng Trạch', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (330, 44, N'Bố Trạch', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (331, 44, N'Quảng Ninh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (332, 44, N'Lệ Thủy', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (333, 45, N'Đông Hà', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (334, 45, N'Quảng Trị', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (335, 45, N'Vĩnh Linh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (336, 45, N'Hướng Hóa', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (337, 45, N'Gio Linh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (338, 45, N'Đa Krông', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (339, 45, N'Cam Lộ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (340, 45, N'Triệu Phong', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (341, 45, N'Hải Lăng', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (342, 45, N'Cồn Cỏ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (343, 46, N'Huế', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (344, 46, N'Phong Điền', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (345, 46, N'Quảng Điền', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (346, 46, N'Phú Vang', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (347, 46, N'Hương Thủy', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (348, 46, N'Hương Trà', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (349, 46, N'A Lưới', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (350, 46, N'Phú Lộc', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (351, 46, N'Nam Đông', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (352, 48, N'Liên Chiểu', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (353, 48, N'Thanh Khê', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (354, 48, N'Hải Châu', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (355, 48, N'Sơn Trà', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (356, 48, N'Ngũ Hành Sơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (357, 48, N'Cẩm Lệ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (358, 48, N'Hoà Vang', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (359, 48, N'Hoàng Sa', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (360, 49, N'Tam Kỳ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (361, 49, N'Hội An', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (362, 49, N'Tây Giang', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (363, 49, N'Đông Giang', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (364, 49, N'Đại Lộc', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (365, 49, N'Điện Bàn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (366, 49, N'Duy Xuyên', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (367, 49, N'Quế Sơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (368, 49, N'Nam Giang', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (369, 49, N'Phước Sơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (370, 49, N'Hiệp Đức', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (371, 49, N'Thăng Bình', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (372, 49, N'Tiên Phước', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (373, 49, N'Bắc Trà My', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (374, 49, N'Nam Trà My', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (375, 49, N'Núi Thành', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (376, 49, N'Phú Ninh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (377, 49, N'Nông Sơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (378, 51, N'Quảng Ngãi', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (379, 51, N'Bình Sơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (380, 51, N'Trà Bồng', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (381, 51, N'Tây Trà', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (382, 51, N'Sơn Tịnh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (383, 51, N'Tư Nghĩa', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (384, 51, N'Sơn Hà', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (385, 51, N'Sơn Tây', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (386, 51, N'Minh Long', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (387, 51, N'Nghĩa Hành', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (388, 51, N'Mộ Đức', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (389, 51, N'Đức Phổ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (390, 51, N'Ba Tơ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (391, 51, N'Lý Sơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (392, 52, N'Qui Nhơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (393, 52, N'An Lão', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (394, 52, N'Hoài Nhơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (395, 52, N'Hoài Ân', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (396, 52, N'Phù Mỹ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (397, 52, N'Vĩnh Thạnh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (398, 52, N'Tây Sơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (399, 52, N'Phù Cát', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (400, 52, N'An Nhơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (401, 52, N'Tuy Phước', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (402, 52, N'Vân Canh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (403, 54, N'Tuy Hòa', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (404, 54, N'Sông Cầu', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (405, 54, N'Đồng Xuân', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (406, 54, N'Tuy An', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (407, 54, N'Sơn Hòa', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (408, 54, N'Sông Hinh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (409, 54, N'Tây Hoà', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (410, 54, N'Phú Hoà', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (411, 54, N'Đông Hoà', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (412, 56, N'Nha Trang', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (413, 56, N'Cam Ranh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (414, 56, N'Cam Lâm', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (415, 56, N'Vạn Ninh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (416, 56, N'Ninh Hòa', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (417, 56, N'Khánh Vĩnh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (418, 56, N'Diên Khánh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (419, 56, N'Khánh Sơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (420, 56, N'Trường Sa', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (421, 58, N'Phan Rang-Tháp Chàm', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (422, 58, N'Bác Ái', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (423, 58, N'Ninh Sơn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (424, 58, N'Ninh Hải', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (425, 58, N'Ninh Phước', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (426, 58, N'Thuận Bắc', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (427, 58, N'Thuận Nam', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (428, 60, N'Phan Thiết', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (429, 60, N'La Gi', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (430, 60, N'Tuy Phong', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (431, 60, N'Bắc Bình', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (432, 60, N'Hàm Thuận Bắc', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (433, 60, N'Hàm Thuận Nam', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (434, 60, N'Tánh Linh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (435, 60, N'Đức Linh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (436, 60, N'Hàm Tân', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (437, 60, N'Phú Quí', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (438, 62, N'Kon Tum', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (439, 62, N'Đắk Glei', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (440, 62, N'Ngọc Hồi', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (441, 62, N'Đắk Tô', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (442, 62, N'Kon Plông', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (443, 62, N'Kon Rẫy', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (444, 62, N'Đắk Hà', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (445, 62, N'Sa Thầy', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (446, 62, N'Tu Mơ Rông', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (447, 64, N'Pleiku', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (448, 64, N'An Khê', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (449, 64, N'Ayun Pa', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (450, 64, N'Kbang', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (451, 64, N'Đăk Đoa', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (452, 64, N'Chư Păh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (453, 64, N'Ia Grai', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (454, 64, N'Mang Yang', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (455, 64, N'Kông Chro', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (456, 64, N'Đức Cơ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (457, 64, N'Chư Prông', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (458, 64, N'Chư Sê', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (459, 64, N'Đăk Pơ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (460, 64, N'Ia Pa', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (461, 64, N'Krông Pa', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (462, 64, N'Phú Thiện', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (463, 64, N'Chư Pưh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (464, 66, N'Buôn Ma Thuột', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (465, 66, N'Buôn Hồ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (466, 66, N'Ea Hleo', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (467, 66, N'Ea Súp', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (468, 66, N'Buôn Đôn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (469, 66, N'Cư Mgar', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (470, 66, N'Krông Búk', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (471, 66, N'Krông Năng', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (472, 66, N'Ea Kar', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (473, 66, N'Mđrắk', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (474, 66, N'Krông Bông', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (475, 66, N'Krông Pắc', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (476, 66, N'Krông A Na', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (477, 66, N'Lắk', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (478, 66, N'Cư Kuin', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (479, 67, N'Gia Nghĩa', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (480, 67, N'Đắk Glong', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (481, 67, N'Cư Jút', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (482, 67, N'Đắk Mil', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (483, 67, N'Krông Nô', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (484, 67, N'Đắk Song', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (485, 67, N'Đắk Rlấp', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (486, 67, N'Tuy Đức', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (487, 68, N'Đà Lạt', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (488, 68, N'Bảo Lộc', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (489, 68, N'Đam Rông', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (490, 68, N'Lạc Dương', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (491, 68, N'Lâm Hà', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (492, 68, N'Đơn Dương', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (493, 68, N'Đức Trọng', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (494, 68, N'Di Linh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (495, 68, N'Bảo Lâm', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (496, 68, N'Đạ Huoai', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (497, 68, N'Đạ Tẻh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (498, 68, N'Cát Tiên', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (499, 70, N'Đồng Xoài', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (500, 70, N'Phước Long', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (501, 70, N'Bình Long', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (502, 70, N'Bù Gia Mập', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (503, 70, N'Lộc Ninh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (504, 70, N'Bù Đốp', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (505, 70, N'Hớn Quản', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (506, 70, N'Đồng Phù', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (507, 70, N'Bù Đăng', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (508, 70, N'Chơn Thành', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (509, 72, N'Tây Ninh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (510, 72, N'Tân Biên', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (511, 72, N'Tân Châu', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (512, 72, N'Dương Minh Châu', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (513, 72, N'Châu Thành', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (514, 72, N'Hòa Thành', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (515, 72, N'Gò Dầu', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (516, 72, N'Bến Cầu', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (517, 72, N'Trảng Bàng', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (518, 74, N'Thủ Dầu Một', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (519, 74, N'Dầu Tiếng', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (520, 74, N'Bến Cát', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (521, 74, N'Phú Giáo', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (522, 74, N'Tân Uyên', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (523, 74, N'Dĩ An', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (524, 74, N'Thuận An', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (525, 75, N'Biên Hòa', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (526, 75, N'Long Khánh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (527, 75, N'Tân Phú', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (528, 75, N'Vĩnh Cửu', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (529, 75, N'Định Quán', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (530, 75, N'Trảng Bom', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (531, 75, N'Thống Nhất', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (532, 75, N'Cẩm Mỹ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (533, 75, N'Long Thành', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (534, 75, N'Xuân Lộc', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (535, 75, N'Nhơn Trạch', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (536, 77, N'Vũng Tầu', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (537, 77, N'Bà Rịa', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (538, 77, N'Châu Đức', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (539, 77, N'Xuyên Mộc', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (540, 77, N'Long Điền', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (541, 77, N'Đất Đỏ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (542, 77, N'Tân Thành', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (543, 77, N'Côn Đảo', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (544, 79, N'1', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (545, 79, N'12', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (546, 79, N'Thủ Đức', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (547, 79, N'9', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (548, 79, N'Gò Vấp', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (549, 79, N'Bình Thạnh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (550, 79, N'Tân Bình', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (551, 79, N'Tân Phú', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (552, 79, N'Phú Nhuận', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (553, 79, N'2', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (554, 79, N'3', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (555, 79, N'10', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (556, 79, N'11', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (557, 79, N'4', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (558, 79, N'5', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (559, 79, N'6', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (560, 79, N'8', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (561, 79, N'Bình Tân', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (562, 79, N'7', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (563, 79, N'Củ Chi', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (564, 79, N'Hóc Môn', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (565, 79, N'Bình Chánh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (566, 79, N'Nhà Bè', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (567, 79, N'Cần Giờ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (568, 80, N'Tân An', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (569, 80, N'Tân Hưng', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (570, 80, N'Vĩnh Hưng', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (571, 80, N'Mộc Hóa', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (572, 80, N'Tân Thạnh', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (573, 80, N'Thạnh Hóa', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (574, 80, N'Đức Huệ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (575, 80, N'Đức Hòa', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (576, 80, N'Bến Lức', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (577, 80, N'Thủ Thừa', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (578, 80, N'Tân Trụ', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (579, 80, N'Cần Đước', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (580, 80, N'Cần Giuộc', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (581, 80, N'Châu Thành', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (582, 82, N'Mỹ Tho', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (583, 82, N'Gò Công', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (584, 82, N'Tân Phước', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (585, 82, N'Cái Bè', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (586, 82, N'Cai Lậy', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (587, 82, N'Châu Thành', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (588, 82, N'Chợ Gạo', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (589, 82, N'Gò Công Tây', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (590, 82, N'Gò Công Đông', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (591, 82, N'Tân Phú Đông', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (592, 83, N'Bến Tre', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (593, 83, N'Châu Thành', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (594, 83, N'Chợ Lách', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (595, 83, N'Mỏ Cày Nam', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (596, 83, N'Giồng Trôm', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (597, 83, N'Bình Đại', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (598, 83, N'Ba Tri', NULL, NULL)
GO
INSERT [dbo].[Quan] ([QuanId], [TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (599, 83, N'Thạnh Phú', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Quan] OFF
GO
SET IDENTITY_INSERT [dbo].[ThongTinNguoiDung] ON 

GO
INSERT [dbo].[ThongTinNguoiDung] ([ThongTinNguoiDungId], [HoTen], [SoDienThoai], [Email], [DiaChi], [TinhThanhPhoId], [QuanId], [HinhAnh], [CreatedDate], [UpdatedDate]) VALUES (2, N'Vũ Huy Tuấn', NULL, NULL, NULL, 94, NULL, NULL, NULL, CAST(N'2017-01-07T08:26:26.193' AS DateTime))
GO
INSERT [dbo].[ThongTinNguoiDung] ([ThongTinNguoiDungId], [HoTen], [SoDienThoai], [Email], [DiaChi], [TinhThanhPhoId], [QuanId], [HinhAnh], [CreatedDate], [UpdatedDate]) VALUES (3, N'Trần Việt Tiến', NULL, NULL, NULL, 58, NULL, NULL, NULL, CAST(N'2017-01-07T08:26:36.113' AS DateTime))
GO
INSERT [dbo].[ThongTinNguoiDung] ([ThongTinNguoiDungId], [HoTen], [SoDienThoai], [Email], [DiaChi], [TinhThanhPhoId], [QuanId], [HinhAnh], [CreatedDate], [UpdatedDate]) VALUES (4, N'Hồ Thanh Bình', NULL, NULL, NULL, 79, NULL, NULL, NULL, CAST(N'2017-01-07T08:26:42.917' AS DateTime))
GO
INSERT [dbo].[ThongTinNguoiDung] ([ThongTinNguoiDungId], [HoTen], [SoDienThoai], [Email], [DiaChi], [TinhThanhPhoId], [QuanId], [HinhAnh], [CreatedDate], [UpdatedDate]) VALUES (6, N'Nguyễn Ngọc Quý', NULL, NULL, NULL, 68, NULL, NULL, CAST(N'2017-01-06T21:19:17.640' AS DateTime), CAST(N'2017-01-07T08:19:19.490' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ThongTinNguoiDung] OFF
GO
SET IDENTITY_INSERT [dbo].[ThuChi] ON 

GO
INSERT [dbo].[ThuChi] ([ThuChiId], [MaPhieu], [TongTien], [Ngay], [CreatedDate], [UpdatedDate]) VALUES (1, 1, 1230000, CAST(N'2017-04-01' AS Date), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[ThuChi] OFF
GO
SET IDENTITY_INSERT [dbo].[TinhThanhPho] ON 

GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (1, N'Hà Nội', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (2, N'Hà Giang', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (4, N'Cao Bằng', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (6, N'Bắc Kạn', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (8, N'Tuyên Quang', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (10, N'Lào Cai', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (11, N'Điện Biên', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (12, N'Lai Châu', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (14, N'Sơn La', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (15, N'Yên Bái', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (17, N'Hòa Bình', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (19, N'Thái Nguyên', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (20, N'Lạng Sơn', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (22, N'Quảng Ninh', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (24, N'Bắc Giang', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (25, N'Phú Thọ', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (26, N'Vĩnh Phúc', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (27, N'Bắc Ninh', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (30, N'Hải Dương', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (31, N'Hải Phòng', NULL, CAST(N'2017-01-07T08:13:10.780' AS DateTime))
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (33, N'Hưng Yên', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (34, N'Thái Bình', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (35, N'Hà Nam', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (36, N'Nam Định', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (37, N'Ninh Bình', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (38, N'Thanh Hóa', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (40, N'Nghệ An', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (42, N'Hà Tĩnh', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (44, N'Quảng Bình', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (45, N'Quảng Trị', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (46, N'Thừa Thiên Huế', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (48, N'Đà Nẵng', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (49, N'Quảng Nam', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (51, N'Quảng Ngãi', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (52, N'Bình Định', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (54, N'Phú Yên', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (56, N'Khánh Hòa', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (58, N'Ninh Thuận', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (60, N'Bình Thuận', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (62, N'Kon Tum', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (64, N'Gia Lai', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (66, N'Đắk Lắk', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (67, N'Đắk Nông', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (68, N'Lâm Đồng', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (70, N'Bình Phước', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (72, N'Tây Ninh', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (74, N'Bình Dương', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (75, N'Đồng Nai', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (77, N'Bà Rịa - Vũng Tàu', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (79, N'Hồ Chí Minh', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (80, N'Long An', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (82, N'Tiền Giang', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (83, N'Bến Tre', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (84, N'Trà Vinh', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (86, N'Vĩnh Long', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (87, N'Đồng Tháp', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (89, N'An Giang', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (91, N'Kiên Giang', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (92, N'Cần Thơ', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (93, N'Hậu Giang', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (94, N'Sóc Trăng', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (95, N'Bạc Liêu', NULL, NULL)
GO
INSERT [dbo].[TinhThanhPho] ([TinhThanhPhoId], [Ten], [CreatedDate], [UpdatedDate]) VALUES (96, N'Cà Mau', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[TinhThanhPho] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

GO
INSERT [dbo].[User] ([UserId], [Username], [Password], [Email], [EmailConfirmed], [Type], [ThongTinNguoiDungId], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (4, N'nhanvien01', N'M0OnInovHii2K5vANOU7jw==', NULL, NULL, 2, 2, NULL, CAST(N'2017-01-06T21:20:05.643' AS DateTime), CAST(N'2017-01-06T21:20:05.643' AS DateTime))
GO
INSERT [dbo].[User] ([UserId], [Username], [Password], [Email], [EmailConfirmed], [Type], [ThongTinNguoiDungId], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (6, N'nguoidung01', N'yLzsXRvqYTLw1Fo+774XDw==', NULL, NULL, 1, 3, NULL, CAST(N'2017-01-07T08:28:22.790' AS DateTime), CAST(N'2017-01-07T08:28:22.790' AS DateTime))
GO
INSERT [dbo].[User] ([UserId], [Username], [Password], [Email], [EmailConfirmed], [Type], [ThongTinNguoiDungId], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (7, N'nhanvien02', N'M0OnInovHii2K5vANOU7jw==', NULL, NULL, 2, 4, NULL, CAST(N'2017-01-07T08:28:44.887' AS DateTime), CAST(N'2017-01-07T08:28:44.887' AS DateTime))
GO
INSERT [dbo].[User] ([UserId], [Username], [Password], [Email], [EmailConfirmed], [Type], [ThongTinNguoiDungId], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (8, N'nguoidung02', N'yLzsXRvqYTLw1Fo+774XDw==', NULL, NULL, 1, 6, NULL, CAST(N'2017-01-07T08:29:04.590' AS DateTime), CAST(N'2017-01-07T08:29:04.590' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[User] OFF
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
