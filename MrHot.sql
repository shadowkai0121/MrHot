USE [master]
GO
/****** Object:  Database [MrHot]    Script Date: 2019/7/2 下午 10:43:14 ******/
CREATE DATABASE [MrHot]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MrHot', FILENAME = N'D:\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MrHot.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MrHot_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MrHot_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MrHot] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MrHot].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MrHot] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MrHot] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MrHot] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MrHot] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MrHot] SET ARITHABORT OFF 
GO
ALTER DATABASE [MrHot] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MrHot] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MrHot] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MrHot] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MrHot] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MrHot] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MrHot] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MrHot] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MrHot] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MrHot] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MrHot] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MrHot] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MrHot] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MrHot] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MrHot] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MrHot] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MrHot] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MrHot] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MrHot] SET  MULTI_USER 
GO
ALTER DATABASE [MrHot] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MrHot] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MrHot] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MrHot] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MrHot] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MrHot] SET QUERY_STORE = OFF
GO
USE [MrHot]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 2019/7/2 下午 10:43:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[fMemberID] [int] IDENTITY(1,1) NOT NULL,
	[fMemberUserID] [nvarchar](50) NULL,
	[fMemberPassword] [nvarchar](50) NULL,
	[fMemberName] [nvarchar](50) NULL,
	[fMemberEmail] [nvarchar](50) NULL,
	[fMemberPhone] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[fMemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2019/7/2 下午 10:43:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[fOrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[fOrderGuid] [nvarchar](50) NULL,
	[fMemberUserID] [nvarchar](50) NULL,
	[fProductID] [int] NULL,
	[fProductName] [nvarchar](50) NULL,
	[fOrderDetailUnitePrice] [int] NULL,
	[fOrderDetailQuantity] [int] NULL,
	[fIsApproved] [nvarchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[fOrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2019/7/2 下午 10:43:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[fOrderGuid] [nvarchar](50) NOT NULL,
	[fOrderDate] [datetime] NULL,
	[fOrderTransportDate] [datetime] NULL,
	[fOrderTotalPrice] [int] NULL,
	[fMemberUserID] [nvarchar](50) NULL,
	[fMemberName] [nvarchar](50) NULL,
	[fOrderReceiverName] [nvarchar](50) NULL,
	[fOrderContactPhone] [nchar](10) NULL,
	[fOrderReceiverAddress] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[fOrderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2019/7/2 下午 10:43:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[fProductID] [int] IDENTITY(1,1) NOT NULL,
	[fKind] [nvarchar](10) NOT NULL,
	[fProductName] [nvarchar](20) NOT NULL,
	[fProductUnitPrice] [int] NOT NULL,
	[fProductImage] [varchar](40) NOT NULL,
	[fDisontinued] [nchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[fProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 2019/7/2 下午 10:43:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[fReservationID] [int] IDENTITY(1,1) NOT NULL,
	[fCustomerName] [nvarchar](50) NULL,
	[fCustomerPhone] [nvarchar](50) NULL,
	[fArriveTime] [datetime] NULL,
	[Amount] [int] NULL,
	[Remark] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[fReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Members] ON 

INSERT [dbo].[Members] ([fMemberID], [fMemberUserID], [fMemberPassword], [fMemberName], [fMemberEmail], [fMemberPhone]) VALUES (1, N'a', N'a', NULL, NULL, NULL)
INSERT [dbo].[Members] ([fMemberID], [fMemberUserID], [fMemberPassword], [fMemberName], [fMemberEmail], [fMemberPhone]) VALUES (2, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Members] OFF
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([fOrderDetailId], [fOrderGuid], [fMemberUserID], [fProductID], [fProductName], [fOrderDetailUnitePrice], [fOrderDetailQuantity], [fIsApproved]) VALUES (1, NULL, N'a', 2, N'鹿兒島A4和牛', 123, 2, N'否')
INSERT [dbo].[OrderDetails] ([fOrderDetailId], [fOrderGuid], [fMemberUserID], [fProductID], [fProductName], [fOrderDetailUnitePrice], [fOrderDetailQuantity], [fIsApproved]) VALUES (2, NULL, N'a', 1, N'頂級安格斯無骨牛小排', 123, 1, N'否')
INSERT [dbo].[OrderDetails] ([fOrderDetailId], [fOrderGuid], [fMemberUserID], [fProductID], [fProductName], [fOrderDetailUnitePrice], [fOrderDetailQuantity], [fIsApproved]) VALUES (3, NULL, N'a', 4, N'招牌花雕雞', 123, 1, N'否')
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([fProductID], [fKind], [fProductName], [fProductUnitPrice], [fProductImage], [fDisontinued]) VALUES (1, N'牛肉', N'頂級安格斯無骨牛小排', 123, N'~/img/beef/頂級安格斯無骨牛小排.jpg', NULL)
INSERT [dbo].[Products] ([fProductID], [fKind], [fProductName], [fProductUnitPrice], [fProductImage], [fDisontinued]) VALUES (2, N'牛肉', N'鹿兒島A4和牛', 123, N'~/img/beef/鹿兒島A4和牛.jpg', NULL)
INSERT [dbo].[Products] ([fProductID], [fKind], [fProductName], [fProductUnitPrice], [fProductImage], [fDisontinued]) VALUES (3, N'牛肉', N'安格斯嫩肩', 123, N'~/img/beef/安格斯嫩肩.jpg', NULL)
INSERT [dbo].[Products] ([fProductID], [fKind], [fProductName], [fProductUnitPrice], [fProductImage], [fDisontinued]) VALUES (4, N'雞肉', N'招牌花雕雞', 123, N'~/img/chicken/招牌花雕雞.jpg', NULL)
INSERT [dbo].[Products] ([fProductID], [fKind], [fProductName], [fProductUnitPrice], [fProductImage], [fDisontinued]) VALUES (5, N'雞肉', N'剝皮辣椒雞', 123, N'~/img/chicken/剝皮辣椒雞.jpg', NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Reservations] ON 

INSERT [dbo].[Reservations] ([fReservationID], [fCustomerName], [fCustomerPhone], [fArriveTime], [Amount], [Remark]) VALUES (1, N'ㄎ', N'921665559', CAST(N'2019-05-21T12:59:00.000' AS DateTime), 42, N'')
INSERT [dbo].[Reservations] ([fReservationID], [fCustomerName], [fCustomerPhone], [fArriveTime], [Amount], [Remark]) VALUES (2, N'A', N'921665559', CAST(N'2019-05-10T22:00:00.000' AS DateTime), 42, N'')
INSERT [dbo].[Reservations] ([fReservationID], [fCustomerName], [fCustomerPhone], [fArriveTime], [Amount], [Remark]) VALUES (3, N'a', N'921665559', CAST(N'2019-05-08T12:59:00.000' AS DateTime), 42, N'')
INSERT [dbo].[Reservations] ([fReservationID], [fCustomerName], [fCustomerPhone], [fArriveTime], [Amount], [Remark]) VALUES (4, N'a', N'921665559', CAST(N'2019-05-01T01:59:00.000' AS DateTime), 42, N'')
INSERT [dbo].[Reservations] ([fReservationID], [fCustomerName], [fCustomerPhone], [fArriveTime], [Amount], [Remark]) VALUES (5, N'ㄇ', N'921665559', CAST(N'2019-05-08T23:54:00.000' AS DateTime), 12, N'')
INSERT [dbo].[Reservations] ([fReservationID], [fCustomerName], [fCustomerPhone], [fArriveTime], [Amount], [Remark]) VALUES (6, N'丁丁', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Reservations] OFF
USE [master]
GO
ALTER DATABASE [MrHot] SET  READ_WRITE 
GO
