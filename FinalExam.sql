USE [master]
GO
/****** Object:  Database [SMIT09]    Script Date: 2019/6/24 下午 10:33:21 ******/
CREATE DATABASE [SMIT09]
GO
ALTER DATABASE [SMIT09] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SMIT09].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SMIT09] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SMIT09] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SMIT09] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SMIT09] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SMIT09] SET ARITHABORT OFF 
GO
ALTER DATABASE [SMIT09] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SMIT09] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SMIT09] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SMIT09] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SMIT09] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SMIT09] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SMIT09] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SMIT09] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SMIT09] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SMIT09] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SMIT09] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [SMIT09] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SMIT09] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SMIT09] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SMIT09] SET  MULTI_USER 
GO
ALTER DATABASE [SMIT09] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SMIT09] SET ENCRYPTION ON
GO
ALTER DATABASE [SMIT09] SET QUERY_STORE = ON
GO
ALTER DATABASE [SMIT09] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 7), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 10, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO)
GO
USE [SMIT09]
GO
/****** Object:  Table [dbo].[DaySale]    Script Date: 2019/6/24 下午 10:33:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DaySale](
	[TradeTime] [time](7) NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[UnitePrice] [int] NULL,
	[Guest] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TradeTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 2019/6/24 下午 10:33:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[MemberID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [varchar](20) NULL,
	[UserPwd] [varchar](20) NULL,
	[MemberName] [nvarchar](10) NULL,
	[Gender] [nvarchar](1) NULL,
	[Age] [int] NULL,
	[Email] [varchar](50) NULL,
	[Phone] [varchar](10) NULL,
	[MemberAddress] [nvarchar](50) NULL,
	[MemberPhoto] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2019/6/24 下午 10:33:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [varchar](100) NULL,
	[ProductID] [int] NULL,
	[ProductName] [nvarchar](30) NULL,
	[UnitPrice] [int] NULL,
	[Quantity] [int] NULL,
	[IsApproved] [varchar](1) NULL,
	[MemberID] [int] NULL,
 CONSTRAINT [PK__OrderDet__D3B9D30C3E86AF89] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2019/6/24 下午 10:33:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [varchar](100) NOT NULL,
	[OrderDate] [datetime] NULL,
	[MemberID] [int] NULL,
	[TotalPrice] [int] NULL,
	[ReceiverName] [nvarchar](10) NULL,
	[ReceiverPhone] [varchar](10) NULL,
	[ReceiverAddress] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCost]    Script Date: 2019/6/24 下午 10:33:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCost](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[ProductUnitCost] [int] NULL,
	[Inventory] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2019/6/24 下午 10:33:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](30) NULL,
	[UnitPrice] [int] NULL,
	[ProductPhotoS] [nvarchar](100) NULL,
	[ProductPhotoL] [nvarchar](100) NULL,
	[Rating] [int] NULL,
	[ClickRate] [int] NULL,
	[Discontinued] [varchar](1) NULL,
	[ProductIntroduction] [nvarchar](500) NULL,
	[ProductDescription] [nvarchar](500) NULL,
 CONSTRAINT [PK__Products__B40CC6ED3C98D94B] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Satisfaction]    Script Date: 2019/6/24 下午 10:33:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Satisfaction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[desk] [int] NULL,
	[date] [char](8) NULL,
	[startTime] [char](4) NULL,
	[endTime] [char](4) NULL,
	[numPeople] [char](2) NULL,
	[idx] [varchar](50) NULL,
	[numSatisfactory] [int] NULL,
	[numUnsatisfactory] [int] NULL,
	[numMedium] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Members] ON 

INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (134, NULL, N'YsfBb6ta', N'陳英豪', N'女', 58, N'Tqezb1rafxfG@yahoo.com.tw', NULL, N'高雄市', NULL)
INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (135, NULL, N'Tf9rWVmS', N'王宛臻', N'女', 54, N'Pf3pRRkOopWk@yahoo.com.tw', NULL, N'雲林縣', NULL)
INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (136, NULL, N'aCxEJSXr', N'黃雅玲', N'男', 18, N'aAvBFOTqasiz@gmail.com', NULL, N'臺北市', NULL)
INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (137, NULL, N'yoVcF@Gw', N'任淑芬', N'男', 37, N'wnRcC6DumsOe@outlook.com', NULL, N'苗栗縣', NULL)
INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (138, NULL, N'Z$h7w0d?', N'黃木禮', N'女', 59, N'U6g2uWd7Cmmd@yahoo.com.tw', NULL, N'高雄市', NULL)
INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (139, NULL, N'ZHnFnD6G', N'許佳穎', N'女', 58, N'UEmCmA0EdpcO@yahoo.com.tw', NULL, N'高雄市', NULL)
INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (140, NULL, N'L$QEd-ZF', N'羅宗翰', N'女', 47, N'H6MBd9VCZ2eb@yahoo.com.tw', NULL, N'嘉義市', NULL)
INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (141, NULL, N'n2JRVTz?', N'黃怡玲', N'男', 28, N'kXFNRPx7Bbig@gmail.com', NULL, N'宜蘭縣', NULL)
INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (142, NULL, N'mxPpMwmG', N'李怡伶', N'男', 27, N'kvLoJukDce9R@gmail.com', NULL, N'宜蘭縣', NULL)
INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (143, NULL, N'z-xDCe6M', N'徐雅惠', N'男', 38, N'x9vAze1JDJRD@outlook.com', NULL, N'苗栗縣', NULL)
INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (144, NULL, N'zLDbtXSf', N'曹俊明', N'男', 38, N'xGAbrTOfeMJd@outlook.com', NULL, N'苗栗縣', NULL)
INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (145, NULL, N'!7zSyFJn', N'藍松雨', N'女', 68, N'52wOwCFmE8cv@icloud.com', NULL, N'臺東縣', NULL)
INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (146, NULL, N'thRTEgFZ', N'劉怡萱', N'男', 33, N'rgOPBfCUd5Rz@outlook.com', NULL, N'新竹縣', NULL)
INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (147, NULL, N'hdoEf6_2', N'李心怡', N'男', 23, N'gdnCf18XGFMS@gmail.com', NULL, N'新北市', NULL)
INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (148, NULL, N'gPtd$J0w', N'陳佳怡', N'男', 23, N'gMsc6FWuhJCs@gmail.com', NULL, N'新北市', NULL)
INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (149, NULL, N'4LYGsi99', N'倪芳儀', N'女', 63, N'ZHUDqi43Qz31@icloud.com', NULL, N'金門縣', NULL)
INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (150, NULL, N'anHVh8O_', N'蕭錦秀', N'男', 18, N'akEQh2L8g3LO@gmail.com', NULL, N'臺北市', NULL)
INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (151, NULL, N'ScA60MoG', N'鄭法樂', N'女', 53, N'Ocy1VJnDUcQT@yahoo.com.tw', NULL, N'雲林縣', NULL)
INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (152, NULL, N'3m-r6gtG', N'劉綠行', N'女', 62, N'Yk9q0gsDDJDM@icloud.com', NULL, N'澎湖縣', NULL)
INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (153, NULL, N'r@p3HVbC', N'駱興一', N'男', 31, N'q6oYERbAqsSE@outlook.com', NULL, N'新竹縣', NULL)
INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (154, NULL, N'rGvCyx3$', N'羅佳琪', N'男', 31, N'pDtzwvY61vKe@gmail.com', NULL, N'新竹縣', NULL)
INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (155, NULL, N'rbAap-QG', N'謝志宏', N'男', 31, N'pbyao9MDCyAP@gmail.com', NULL, N'新竹縣', NULL)
INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (156, NULL, N'dG3_fNJE', N'劉重生', N'男', 20, N'cDY8fJFBoaCc@gmail.com', NULL, N'臺北市', NULL)
INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (157, NULL, N'VwWkYqi$', N'林淑娟', N'女', 55, N'RuSjTpi60jGh@yahoo.com.tw', NULL, N'臺南市', NULL)
INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (158, NULL, N'wnQxz!0E', N'鐘小晴', N'男', 35, N'umMvx4VBCtLo@outlook.com', NULL, N'桃園市', NULL)
INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (159, NULL, N'@LyWqA17', N'臧惠雯', N'女', 69, N'5HwSpyW1yEWy@icloud.com', NULL, N'臺東縣', NULL)
INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (160, NULL, N'7eRNvuBe', N'林長歡', N'女', 65, N'2eNJtszeDU6e@icloud.com', NULL, N'屏東縣', NULL)
INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (161, NULL, N'CG_-c_F5', N'林以成', N'男', 41, N'AD89c8C0U6xu@outlook.com', NULL, N'臺中市', NULL)
INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (162, NULL, N'qQ8kizj-', N'郭松定', N'男', 31, N'pM3jhxi9LTT7@gmail.com', NULL, N'新竹縣', NULL)
INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (163, NULL, N'xt0Cu46o', N'梁隆琪', N'男', 36, N'vsVzsZ1nAERF@outlook.com', NULL, N'苗栗縣', NULL)
INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (164, NULL, N'tyh7qBt$', N'楊雅芳', N'男', 33, N'rwh1pyr6gXSW@outlook.com', NULL, N'新竹縣', NULL)
INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (165, N'ttt', N'123', N'test', NULL, NULL, NULL, N'0912345678', N'臺北市', NULL)
INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (166, N'Won', N'a12345', N'WonChang', N'f', 18, N'', N'0987654321', N'臺中市', NULL)
INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (167, N'kai', N'a123456', N'Eee', N'm', 22, N'123@hotmail.com', N'1234856970', N'臺北市', NULL)
INSERT [dbo].[Members] ([MemberID], [UserID], [UserPwd], [MemberName], [Gender], [Age], [Email], [Phone], [MemberAddress], [MemberPhoto]) VALUES (168, N'test', N'a12345', N'hello', N'f', 20, N'', N'', N'澎湖縣', NULL)
SET IDENTITY_INSERT [dbo].[Members] OFF
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (25, N'dff99130-8bd4-483e-a314-3b94686f560e', 8, N'紅醬蕃茄綜合海鮮麵', 178, 5, N'y', 4)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (32, N'bbc5208c-a670-4a4b-913a-bc290f94f8b4', 8, N'紅醬蕃茄綜合海鮮麵', 178, 1, N'y', 4)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (33, N'bbc5208c-a670-4a4b-913a-bc290f94f8b4', 4, N'墨西哥菲力牛肉披薩', 358, 1, N'y', 4)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (34, N'bbc5208c-a670-4a4b-913a-bc290f94f8b4', 5, N'炭烤沙朗牛與脆皮雞排', 360, 2, N'y', 4)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (35, N'04dcefc1-75f2-4110-9075-0ccc23dfdbb3', 5, N'炭烤沙朗牛與脆皮雞排', 360, 1, N'y', 4)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (36, N'04dcefc1-75f2-4110-9075-0ccc23dfdbb3', 7, N'軟殼蟹蛤蜊義大利麵', 359, 1, N'y', 4)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (37, N'cf0a839f-bb79-43a8-b571-6b68598903f5', 4, N'墨西哥菲力牛肉披薩', 358, 1, N'y', 4)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (38, N'cf0a839f-bb79-43a8-b571-6b68598903f5', 6, N'紹興酒奶油雞腿排', 229, 1, N'y', 4)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (39, N'f71425c6-e98e-4d5b-a1e3-fb5ac6c0a6f0', 5, N'炭烤沙朗牛與脆皮雞排', 360, 1, N'y', 4)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (40, N'f71425c6-e98e-4d5b-a1e3-fb5ac6c0a6f0', 7, N'軟殼蟹蛤蜊義大利麵', 359, 1, N'y', 4)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (42, N'f1ca3931-92cf-44b9-b42c-f25c5d105a3e', 4, N'墨西哥菲力牛肉披薩', 358, 1, N'y', 4)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (43, N'f1ca3931-92cf-44b9-b42c-f25c5d105a3e', 6, N'紹興酒奶油雞腿排', 229, 1, N'y', 4)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (49, N'ab393462-6d93-4b65-90e1-843ea6648e6c', 6, N'紹興酒奶油雞腿排', 229, 1, N'y', 4)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (50, N'A331/2019/4/14 上午 04:29:29', 16, N'蛋糕三重奏', 150, 19, N'y', 331)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (51, N'A50/2019/3/4 上午 02:58:58', 15, N'冰淇淋QQ鬆餅', 150, 2, N'y', 50)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (52, N'A100/2018/12/22 上午 07:53:53', 8, N'夏多內花蜜醋', 240, 26, N'y', 100)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (53, N'A444/2018/11/19 上午 07:53:53', 14, N'玫瑰生乳酪蛋糕', 150, 10, N'y', 444)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (54, N'A334/2018/8/26 下午 01:11:11', 2, N'焗烤肉醬薯條', 100, 2, N'y', 334)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (55, N'A495/2018/1/11 下午 04:09:09', 11, N'季節水果茶', 130, 14, N'y', 495)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (56, N'A246/2019/4/29 下午 12:38:38', 2, N'焗烤肉醬薯條', 100, 29, N'y', 246)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (57, N'A379/2018/9/11 下午 09:17:17', 9, N'蜜桃初戀泡泡', 110, 2, N'y', 379)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (58, N'A443/2018/8/26 下午 01:10:10', 16, N'蛋糕三重奏', 150, 7, N'y', 443)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (59, N'A374/2019/3/3 下午 08:38:38', 17, N'核桃燕麥鬆餅', 180, 23, N'y', 374)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (60, N'A389/2018/2/24 上午 07:40:40', 9, N'蜜桃初戀泡泡', 110, 25, N'y', 389)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (61, N'A172/2019/2/18 上午 02:54:54', 2, N'焗烤肉醬薯條', 100, 4, N'y', 172)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (62, N'A13/2018/10/3 上午 01:29:29', 12, N'橙花君度檸檬塔', 160, 3, N'y', 13)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (63, N'A148/2019/3/28 下午 03:26:26', 14, N'玫瑰生乳酪蛋糕', 150, 27, N'y', 148)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (64, N'A133/2018/8/4 上午 02:02:02', 15, N'冰淇淋QQ鬆餅', 150, 17, N'y', 133)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (65, N'A131/2018/11/10 下午 02:36:36', 7, N'紅醬蕃茄綜合海鮮麵', 178, 14, N'y', 131)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (66, N'A244/2018/7/5 上午 04:14:14', 14, N'玫瑰生乳酪蛋糕', 150, 4, N'y', 244)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (67, N'A314/2018/9/13 上午 11:22:22', 19, N'意大利番茄湯', 180, 26, N'y', 314)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (68, N'A353/2018/5/21 下午 06:47:47', 2, N'焗烤肉醬薯條', 100, 11, N'y', 353)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (69, N'A462/2018/4/3 上午 02:49:49', 7, N'紅醬蕃茄綜合海鮮麵', 178, 4, N'y', 462)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (70, N'A122/2019/1/2 下午 09:37:37', 16, N'蛋糕三重奏', 150, 15, N'y', 122)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (71, N'A382/2018/4/27 上午 10:17:17', 8, N'夏多內花蜜醋', 240, 23, N'y', 382)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (72, N'A289/2018/5/30 上午 10:08:08', 12, N'橙花君度檸檬塔', 160, 13, N'y', 289)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (73, N'A421/2019/1/4 下午 05:04:04', 10, N'蜜釀鳳梨冰茶', 160, 13, N'y', 421)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (74, N'A320/2018/5/20 上午 04:00:00', 14, N'玫瑰生乳酪蛋糕', 150, 26, N'y', 320)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (75, N'A486/2018/10/17 下午 04:09:09', 5, N'紹興酒奶油雞腿排', 229, 5, N'y', 486)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (76, N'A34/2018/3/15 下午 05:32:32', 15, N'冰淇淋QQ鬆餅', 150, 2, N'y', 34)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (77, N'A163/2018/5/28 下午 04:57:57', 17, N'核桃燕麥鬆餅', 180, 6, N'y', 163)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (78, N'A150/2018/10/12 下午 09:22:22', 17, N'核桃燕麥鬆餅', 180, 13, N'y', 150)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (79, N'A258/2019/1/15 下午 01:14:14', 21, N'原味白豆湯', 220, 2, N'y', 258)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (80, N'A55/2019/3/30 上午 09:54:54', 8, N'夏多內花蜜醋', 240, 9, N'y', 55)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (81, N'A443/2018/2/18 下午 04:36:36', 11, N'季節水果茶', 130, 7, N'y', 443)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (82, N'A427/2018/10/17 上午 03:37:37', 13, N'巧克力慕斯', 135, 1, N'y', 427)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (83, N'A333/2019/2/22 上午 08:27:27', 4, N'炭烤沙朗牛與脆皮雞排', 360, 14, N'y', 333)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (84, N'A467/2018/10/13 下午 08:21:21', 19, N'意大利番茄湯', 180, 12, N'y', 467)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (85, N'A283/2018/5/8 上午 03:45:45', 12, N'橙花君度檸檬塔', 160, 16, N'y', 283)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (86, N'A48/2018/11/27 上午 10:14:14', 4, N'炭烤沙朗牛與脆皮雞排', 360, 12, N'y', 48)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (87, N'A158/2018/4/12 上午 07:45:45', 16, N'蛋糕三重奏', 150, 18, N'y', 158)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (88, N'A218/2018/1/28 上午 10:17:17', 21, N'原味白豆湯', 220, 17, N'y', 218)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (89, N'A155/2018/6/6 上午 03:53:53', 14, N'玫瑰生乳酪蛋糕', 150, 19, N'y', 155)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (90, N'A193/2018/9/9 上午 11:24:24', 14, N'玫瑰生乳酪蛋糕', 150, 11, N'y', 193)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (91, N'A30/2018/7/1 上午 10:48:48', 9, N'蜜桃初戀泡泡', 110, 24, N'y', 30)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (92, N'A15/2018/6/9 下午 10:35:35', 21, N'原味白豆湯', 220, 18, N'y', 15)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (93, N'A483/2018/11/27 上午 08:48:48', 1, N'黃金薯條', 35, 2, N'y', 483)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (94, N'A488/2018/9/14 下午 06:25:25', 20, N'意大利婚禮湯', 280, 19, N'y', 488)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (95, N'A47/2019/4/9 下午 07:25:25', 1, N'黃金薯條', 35, 19, N'y', 47)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (96, N'A218/2018/10/10 上午 06:26:26', 1, N'黃金薯條', 35, 24, N'y', 218)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (97, N'A275/2019/4/5 上午 11:47:47', 5, N'紹興酒奶油雞腿排', 229, 1, N'y', 275)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (98, N'A42/2018/4/26 下午 12:56:56', 4, N'炭烤沙朗牛與脆皮雞排', 360, 6, N'y', 42)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (99, N'A222/2018/1/28 上午 02:06:06', 3, N'墨西哥菲力牛肉披薩', 358, 22, N'y', 222)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (100, N'A111/2018/2/27 下午 09:54:54', 9, N'蜜桃初戀泡泡', 110, 28, N'y', 111)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (101, N'A114/2018/11/12 上午 03:54:54', 17, N'核桃燕麥鬆餅', 180, 12, N'y', 114)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (102, N'A258/2019/2/4 上午 06:40:40', 21, N'原味白豆湯', 220, 27, N'y', 258)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (103, N'A495/2018/6/12 下午 09:59:59', 19, N'意大利番茄湯', 180, 6, N'y', 495)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (104, N'A425/2018/3/20 上午 10:57:57', 9, N'蜜桃初戀泡泡', 110, 28, N'y', 425)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (105, N'A232/2018/8/16 上午 01:37:37', 6, N'軟殼蟹蛤蜊義大利麵', 359, 8, N'y', 232)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (106, N'A465/2018/11/17 上午 05:57:57', 16, N'蛋糕三重奏', 150, 14, N'y', 465)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (107, N'A191/2019/3/1 上午 07:11:11', 20, N'意大利婚禮湯', 280, 2, N'y', 191)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (108, N'A284/2018/12/25 上午 08:54:54', 1, N'黃金薯條', 35, 26, N'y', 284)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (109, N'A124/2018/4/10 上午 03:41:41', 16, N'蛋糕三重奏', 150, 26, N'y', 124)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (110, N'A330/2018/5/8 上午 07:18:18', 21, N'原味白豆湯', 220, 25, N'y', 330)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (111, N'A127/2019/1/3 上午 03:35:35', 3, N'墨西哥菲力牛肉披薩', 358, 1, N'y', 127)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (112, N'A103/2018/3/5 下午 03:03:03', 18, N'特調玉米濃湯', 180, 21, N'y', 103)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (113, N'A169/2018/7/18 下午 02:33:33', 13, N'巧克力慕斯', 135, 26, N'y', 169)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (114, N'A276/2018/11/8 上午 03:32:32', 13, N'巧克力慕斯', 135, 7, N'y', 276)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (115, N'A277/2018/4/11 上午 10:38:38', 19, N'意大利番茄湯', 180, 29, N'y', 277)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (116, N'A444/2018/3/20 上午 09:57:57', 5, N'紹興酒奶油雞腿排', 229, 4, N'y', 444)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (117, N'A310/2018/10/28 上午 07:54:54', 21, N'原味白豆湯', 220, 23, N'y', 310)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (118, N'A81/2019/1/23 下午 07:05:05', 8, N'夏多內花蜜醋', 240, 15, N'y', 81)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (119, N'A209/2018/11/29 下午 02:07:07', 17, N'核桃燕麥鬆餅', 180, 5, N'y', 209)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (120, N'A495/2018/5/31 下午 02:18:18', 8, N'夏多內花蜜醋', 240, 16, N'y', 495)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (121, N'A77/2018/2/2 上午 12:05:05', 19, N'意大利番茄湯', 180, 2, N'y', 77)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (122, N'A496/2018/8/27 下午 12:15:15', 22, N'香料蔬菜湯', 250, 22, N'y', 496)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (123, N'A444/2018/8/13 上午 04:28:28', 17, N'核桃燕麥鬆餅', 180, 6, N'y', 444)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (124, N'A186/2018/10/11 上午 08:05:05', 3, N'墨西哥菲力牛肉披薩', 358, 23, N'y', 186)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (125, N'A272/2018/1/18 下午 06:45:45', 6, N'軟殼蟹蛤蜊義大利麵', 359, 11, N'y', 272)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (126, N'A368/2018/11/2 下午 07:55:55', 10, N'蜜釀鳳梨冰茶', 160, 26, N'y', 368)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (127, N'A230/2018/7/13 下午 01:52:52', 4, N'炭烤沙朗牛與脆皮雞排', 360, 7, N'y', 230)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (128, N'A435/2018/12/14 上午 01:39:39', 4, N'炭烤沙朗牛與脆皮雞排', 360, 6, N'y', 435)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (129, N'A398/2018/11/23 上午 04:13:13', 9, N'蜜桃初戀泡泡', 110, 22, N'y', 398)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (130, N'A36/2018/11/30 上午 09:41:41', 13, N'巧克力慕斯', 135, 7, N'y', 36)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (131, N'A369/2019/4/17 上午 11:02:02', 21, N'原味白豆湯', 220, 27, N'y', 369)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (132, N'A120/2018/10/23 上午 05:36:36', 3, N'墨西哥菲力牛肉披薩', 358, 29, N'y', 120)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (133, N'A489/2018/9/21 下午 01:01:01', 20, N'意大利婚禮湯', 280, 25, N'y', 489)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (134, N'A165/2018/12/14 下午 06:33:33', 9, N'蜜桃初戀泡泡', 110, 12, N'y', 165)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (135, N'A258/2018/1/17 上午 03:26:26', 7, N'紅醬蕃茄綜合海鮮麵', 178, 7, N'y', 258)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (136, N'A123/2019/4/5 下午 01:28:28', 21, N'原味白豆湯', 220, 17, N'y', 123)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (137, N'A292/2018/1/12 上午 01:48:48', 19, N'意大利番茄湯', 180, 4, N'y', 292)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (138, N'A483/2018/2/5 上午 03:52:52', 7, N'紅醬蕃茄綜合海鮮麵', 178, 11, N'y', 483)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (139, N'A229/2018/4/14 上午 05:58:58', 4, N'炭烤沙朗牛與脆皮雞排', 360, 8, N'y', 229)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (140, N'A457/2018/3/18 下午 12:02:02', 10, N'蜜釀鳳梨冰茶', 160, 20, N'y', 457)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (141, N'A457/2018/10/21 下午 08:03:03', 20, N'意大利婚禮湯', 280, 9, N'y', 457)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (142, N'A457/2018/10/9 上午 10:22:22', 7, N'紅醬蕃茄綜合海鮮麵', 178, 16, N'y', 457)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (143, N'A457/2018/11/27 上午 11:54:54', 2, N'焗烤肉醬薯條', 100, 23, N'y', 457)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (144, N'A457/2018/9/9 上午 02:31:31', 17, N'核桃燕麥鬆餅', 180, 25, N'y', 457)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (145, N'A457/2019/2/6 下午 05:34:34', 17, N'核桃燕麥鬆餅', 180, 21, N'y', 457)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (146, N'A386/2019/5/20 上午 03:16:16', 6, N'軟殼蟹蛤蜊義大利麵', 359, 25, N'y', 386)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (147, N'A383/2018/6/7 上午 03:32:32', 12, N'橙花君度檸檬塔', 160, 27, N'y', 383)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (148, N'A368/2018/5/19 上午 10:34:34', 5, N'紹興酒奶油雞腿排', 229, 11, N'y', 368)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (149, N'A160/2018/4/3 上午 07:02:02', 10, N'蜜釀鳳梨冰茶', 160, 26, N'y', 160)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (150, N'A68/2019/4/26 上午 01:07:07', 6, N'軟殼蟹蛤蜊義大利麵', 359, 17, N'y', 68)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (151, N'A261/2018/7/23 上午 07:49:49', 12, N'橙花君度檸檬塔', 160, 5, N'y', 261)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (152, N'A302/2018/5/15 上午 12:11:11', 5, N'紹興酒奶油雞腿排', 229, 13, N'y', 302)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (153, N'A412/2018/3/18 上午 01:30:30', 2, N'焗烤肉醬薯條', 100, 16, N'y', 412)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (154, N'A471/2018/7/3 上午 11:44:44', 22, N'香料蔬菜湯', 250, 5, N'y', 471)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (155, N'A447/2019/1/13 上午 09:06:06', 16, N'蛋糕三重奏', 150, 29, N'y', 447)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (156, N'A408/2019/5/3 上午 10:07:07', 2, N'焗烤肉醬薯條', 100, 10, N'y', 408)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (157, N'A53/2018/10/20 下午 06:06:06', 3, N'墨西哥菲力牛肉披薩', 358, 29, N'y', 53)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (158, N'A416/2018/7/12 下午 08:34:34', 2, N'焗烤肉醬薯條', 100, 1, N'y', 416)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (159, N'A353/2018/12/14 上午 12:52:52', 22, N'香料蔬菜湯', 250, 17, N'y', 353)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (160, N'A461/2018/7/31 上午 10:29:29', 7, N'紅醬蕃茄綜合海鮮麵', 178, 28, N'y', 461)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (161, N'A230/2018/7/11 下午 03:14:14', 6, N'軟殼蟹蛤蜊義大利麵', 359, 10, N'y', 230)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (162, N'A225/2018/12/21 上午 09:05:05', 9, N'蜜桃初戀泡泡', 110, 1, N'y', 225)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (163, N'A220/2019/4/2 下午 07:07:07', 4, N'炭烤沙朗牛與脆皮雞排', 360, 17, N'y', 220)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (164, N'A176/2018/8/15 下午 06:12:12', 11, N'季節水果茶', 130, 6, N'y', 176)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (165, N'A126/2018/6/12 下午 05:03:03', 20, N'意大利婚禮湯', 280, 12, N'y', 126)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (171, N'a57a2184-c1d1-4470-81ca-db5755e23308', 6, N'紹興酒奶油雞腿排', 229, 2, N'y', 4)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (173, N'a57a2184-c1d1-4470-81ca-db5755e23308', 13, N'橙花君度檸檬塔', 160, 2, N'y', 4)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (174, N'a57a2184-c1d1-4470-81ca-db5755e23308', 8, N'紅醬蕃茄綜合海鮮麵', 178, 1, N'y', 4)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (175, N'2cbb373a-0c01-460c-9e5d-fe6aa3a14525', 4, N'墨西哥菲力牛肉披薩', 358, 1, N'y', 4)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (176, N'2cbb373a-0c01-460c-9e5d-fe6aa3a14525', 6, N'紹興酒奶油雞腿排', 229, 1, N'y', 4)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (177, N'035a023b-9bcd-4187-8a6a-e400239200d5', 5, N'炭烤沙朗牛與脆皮雞排', 360, 1, N'y', 4)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (178, N'1f776fbf-12a3-4b33-99a6-78aa9754e281', 7, N'軟殼蟹蛤蜊義大利麵', 359, 1, N'y', 4)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (182, NULL, 7, N'軟殼蟹蛤蜊花義大利麵佐香檸奶汁', 359, 21, N'n', 4)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (183, N'ef51a574-50c9-4eee-824f-c86158697226', 5, N'炭烤沙朗心牛排與脆皮雞腿排', 360, 1, N'y', 165)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (184, N'ef51a574-50c9-4eee-824f-c86158697226', 4, N'墨西哥香辣菲力牛肉披薩', 358, 1, N'y', 165)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (185, N'550e9b55-8299-498a-98f3-695c247dd8b0', 4, N'墨西哥香辣菲力牛肉披薩', 358, 2, N'y', 165)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (186, N'550e9b55-8299-498a-98f3-695c247dd8b0', 6, N'紹興酒奶油雞腿排', 229, 1, N'y', 165)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (187, N'550e9b55-8299-498a-98f3-695c247dd8b0', 21, N'意大利番茄湯', 180, 1, N'y', 165)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (188, N'550e9b55-8299-498a-98f3-695c247dd8b0', 5, N'炭烤沙朗心牛排與脆皮雞腿排', 360, 1, N'y', 165)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (200, N'39d503da-5d0f-4851-84a3-ea2c94f143a6', 5, N'炭烤沙朗心牛排與脆皮雞腿排', 360, 2, N'y', 165)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (201, N'c53b330c-385a-4d1a-8950-44755e03d139', 4, N'墨西哥香辣菲力牛肉披薩', 358, 1, N'y', 165)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (203, N'c53b330c-385a-4d1a-8950-44755e03d139', 5, N'炭烤沙朗心牛排與脆皮雞腿排', 360, 1, N'y', 165)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (204, N'A462/2018/9/1 下午 08:08:08', 11, N'季節水果茶', 130, 13, N'y', 462)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (205, N'A237/2018/6/25 上午 11:40:40', 22, N'香料蔬菜湯', 250, 26, N'y', 237)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (206, N'A19/2019/3/14 上午 05:42:42', 16, N'蛋糕三重奏', 150, 1, N'y', 19)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (207, N'A36/2018/6/22 上午 03:46:46', 18, N'特調玉米濃湯', 180, 18, N'y', 36)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (208, N'A425/2018/9/21 下午 07:01:01', 4, N'炭烤沙朗心牛排與脆皮雞腿排', 360, 16, N'y', 425)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (209, N'A49/2019/1/29 上午 06:53:53', 10, N'蜜釀鳳梨冰茶', 160, 11, N'y', 49)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (210, N'A80/2018/10/19 下午 05:29:29', 21, N'原味白豆湯', 220, 22, N'y', 80)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (211, N'A274/2019/2/27 下午 06:51:51', 21, N'原味白豆湯', 220, 1, N'y', 274)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (212, N'A166/2018/8/21 下午 07:30:30', 15, N'冰淇淋QQ鬆餅', 150, 5, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (213, N'A158/2018/11/8 下午 03:01:01', 3, N'墨西哥香辣菲力牛肉披薩', 358, 5, N'y', 158)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (214, N'A235/2018/4/10 下午 05:19:19', 3, N'墨西哥香辣菲力牛肉披薩', 358, 11, N'y', 235)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (215, N'A101/2019/4/16 上午 02:39:39', 13, N'巧克力慕斯', 135, 2, N'y', 101)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (216, N'A110/2018/5/14 下午 02:41:41', 14, N'玫瑰生乳酪蛋糕', 150, 21, N'y', 110)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (217, N'A303/2018/12/16 下午 02:23:23', 18, N'特調玉米濃湯', 180, 20, N'y', 303)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (218, N'A214/2019/5/9 上午 12:53:53', 22, N'香料蔬菜湯', 250, 19, N'y', 214)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (219, N'A116/2018/9/13 上午 09:42:42', 21, N'原味白豆湯', 220, 14, N'y', 116)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (220, N'A274/2018/9/24 下午 12:01:01', 22, N'香料蔬菜湯', 250, 18, N'y', 274)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (221, N'A144/2018/7/5 上午 07:39:39', 5, N'紹興酒奶油雞腿排', 229, 27, N'y', 144)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (222, N'A66/2019/5/14 下午 08:57:57', 13, N'巧克力慕斯', 135, 3, N'y', 66)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (223, N'A446/2019/3/10 下午 01:24:24', 14, N'玫瑰生乳酪蛋糕', 150, 9, N'y', 446)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (224, N'A303/2018/10/14 下午 05:08:08', 18, N'特調玉米濃湯', 180, 28, N'y', 303)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (225, N'A191/2019/6/3 下午 06:20:20', 6, N'軟殼蟹蛤蜊花義大利麵佐香檸奶汁', 359, 29, N'y', 191)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (226, N'A157/2018/10/17 下午 02:22:22', 15, N'冰淇淋QQ鬆餅', 150, 22, N'y', 157)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (227, N'A199/2019/2/14 下午 08:36:36', 18, N'特調玉米濃湯', 180, 14, N'y', 199)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (228, N'A456/2018/9/15 下午 05:36:36', 6, N'軟殼蟹蛤蜊花義大利麵佐香檸奶汁', 359, 20, N'y', 456)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (229, N'A33/2018/4/1 上午 03:31:31', 11, N'季節水果茶', 130, 11, N'y', 33)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (230, N'A306/2018/7/23 上午 03:26:26', 21, N'原味白豆湯', 220, 27, N'y', 306)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (231, N'A418/2019/5/5 下午 04:37:37', 17, N'核桃燕麥鬆餅', 180, 7, N'y', 418)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (232, N'A120/2018/5/17 上午 02:26:26', 16, N'蛋糕三重奏', 150, 16, N'y', 120)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (233, N'A450/2019/3/22 下午 09:50:50', 16, N'蛋糕三重奏', 150, 2, N'y', 450)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (234, N'A355/2018/4/5 下午 12:21:21', 11, N'季節水果茶', 130, 1, N'y', 355)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (235, N'A26/2019/5/13 上午 03:17:17', 6, N'軟殼蟹蛤蜊花義大利麵佐香檸奶汁', 359, 19, N'y', 26)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (236, N'A116/2018/12/7 上午 09:40:40', 15, N'冰淇淋QQ鬆餅', 150, 2, N'y', 116)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (237, N'A228/2019/6/13 上午 11:25:25', 21, N'原味白豆湯', 220, 23, N'y', 228)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (238, N'A119/2018/4/6 上午 10:43:43', 8, N'夏多內花蜜醋', 240, 9, N'y', 119)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (239, N'A392/2019/4/19 上午 08:51:51', 11, N'季節水果茶', 130, 1, N'y', 392)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (240, N'A27/2018/10/8 上午 08:47:47', 18, N'特調玉米濃湯', 180, 1, N'y', 27)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (241, N'A33/2019/5/3 下午 02:12:12', 10, N'蜜釀鳳梨冰茶', 160, 4, N'y', 33)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (242, N'A282/2018/3/25 上午 03:03:03', 3, N'墨西哥香辣菲力牛肉披薩', 358, 6, N'y', 282)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (243, N'A358/2018/7/22 上午 02:19:19', 7, N'紅醬蕃茄綜合海鮮麵', 178, 18, N'y', 358)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (244, N'A432/2019/1/5 下午 06:14:14', 9, N'蜜桃初戀泡泡', 110, 18, N'y', 432)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (245, N'A455/2018/9/7 上午 11:38:38', 6, N'軟殼蟹蛤蜊花義大利麵佐香檸奶汁', 359, 15, N'y', 455)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (246, N'A347/2018/11/13 上午 04:05:05', 16, N'蛋糕三重奏', 150, 24, N'y', 347)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (247, N'A435/2019/4/28 下午 09:16:16', 6, N'軟殼蟹蛤蜊花義大利麵佐香檸奶汁', 359, 25, N'y', 435)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (248, N'A127/2019/1/25 上午 11:48:48', 9, N'蜜桃初戀泡泡', 110, 16, N'y', 127)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (249, N'A136/2018/11/21 下午 07:02:02', 16, N'蛋糕三重奏', 150, 4, N'y', 136)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (250, N'A499/2018/4/19 下午 12:41:41', 9, N'蜜桃初戀泡泡', 110, 19, N'y', 499)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (251, N'A482/2019/2/20 下午 10:34:34', 10, N'蜜釀鳳梨冰茶', 160, 19, N'y', 482)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (252, N'A140/2018/9/30 下午 05:37:37', 11, N'季節水果茶', 130, 2, N'y', 140)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (253, N'A235/2018/10/9 下午 04:17:17', 17, N'核桃燕麥鬆餅', 180, 5, N'y', 235)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (254, N'A26/2018/4/11 下午 01:16:16', 17, N'核桃燕麥鬆餅', 180, 12, N'y', 26)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (255, N'A390/2018/5/12 下午 02:42:42', 15, N'冰淇淋QQ鬆餅', 150, 24, N'y', 390)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (256, N'A397/2018/4/29 上午 02:42:42', 16, N'蛋糕三重奏', 150, 6, N'y', 397)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (257, N'A53/2018/5/11 上午 05:03:03', 9, N'蜜桃初戀泡泡', 110, 5, N'y', 53)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (258, N'A340/2018/9/18 上午 12:59:59', 4, N'炭烤沙朗心牛排與脆皮雞腿排', 360, 15, N'y', 340)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (259, N'A102/2019/3/7 上午 10:34:34', 6, N'軟殼蟹蛤蜊花義大利麵佐香檸奶汁', 359, 9, N'y', 102)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (260, N'A495/2019/5/19 下午 07:32:32', 16, N'蛋糕三重奏', 150, 2, N'y', 495)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (261, N'A84/2018/4/4 上午 08:54:54', 13, N'巧克力慕斯', 135, 23, N'y', 84)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (262, N'A462/2018/4/4 下午 06:26:26', 8, N'夏多內花蜜醋', 240, 14, N'y', 462)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (263, N'A364/2019/5/18 上午 01:08:08', 4, N'炭烤沙朗心牛排與脆皮雞腿排', 360, 20, N'y', 364)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (264, N'A21/2019/4/27 下午 07:12:12', 3, N'墨西哥香辣菲力牛肉披薩', 358, 28, N'y', 21)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (265, N'A414/2018/10/5 下午 06:44:44', 18, N'特調玉米濃湯', 180, 11, N'y', 414)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (266, N'A110/2018/1/20 上午 05:51:51', 18, N'特調玉米濃湯', 180, 23, N'y', 110)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (267, N'A7/2019/5/19 下午 02:35:35', 8, N'夏多內花蜜醋', 240, 4, N'y', 7)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (268, N'A106/2018/4/29 下午 05:19:19', 7, N'紅醬蕃茄綜合海鮮麵', 178, 11, N'y', 106)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (269, N'A10/2018/2/8 上午 02:59:59', 18, N'特調玉米濃湯', 180, 16, N'y', 10)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (270, N'A439/2019/5/5 上午 02:07:07', 17, N'核桃燕麥鬆餅', 180, 17, N'y', 439)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (271, N'A4/2019/1/6 下午 07:04:04', 14, N'玫瑰生乳酪蛋糕', 150, 11, N'y', 4)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (272, N'A479/2019/5/22 上午 10:28:28', 7, N'紅醬蕃茄綜合海鮮麵', 178, 20, N'y', 479)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (273, N'A144/2018/2/26 下午 12:13:13', 9, N'蜜桃初戀泡泡', 110, 21, N'y', 144)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (274, N'A163/2019/6/5 上午 07:09:09', 18, N'特調玉米濃湯', 180, 3, N'y', 163)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (275, N'A461/2018/8/30 上午 07:38:38', 18, N'特調玉米濃湯', 180, 4, N'y', 461)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (276, N'A458/2018/9/7 上午 10:31:31', 8, N'夏多內花蜜醋', 240, 17, N'y', 458)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (277, N'A487/2019/3/3 上午 05:09:09', 21, N'原味白豆湯', 220, 23, N'y', 487)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (278, N'A420/2018/9/1 下午 10:53:53', 11, N'季節水果茶', 130, 20, N'y', 420)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (279, N'A431/2018/9/6 下午 09:40:40', 20, N'意大利婚禮湯', 280, 27, N'y', 431)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (280, N'A59/2018/6/10 下午 10:24:24', 20, N'意大利婚禮湯', 280, 20, N'y', 59)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (281, N'A233/2018/11/3 下午 04:32:32', 11, N'季節水果茶', 130, 5, N'y', 233)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (282, N'A257/2018/3/14 上午 05:13:13', 4, N'炭烤沙朗心牛排與脆皮雞腿排', 360, 27, N'y', 257)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (283, N'A274/2018/2/4 上午 08:55:55', 9, N'蜜桃初戀泡泡', 110, 1, N'y', 274)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (284, N'A146/2019/5/1 下午 08:57:57', 10, N'蜜釀鳳梨冰茶', 160, 21, N'y', 146)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (285, N'A498/2018/2/15 下午 07:10:10', 9, N'蜜桃初戀泡泡', 110, 11, N'y', 498)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (286, N'A208/2018/12/11 上午 01:09:09', 21, N'原味白豆湯', 220, 25, N'y', 208)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (287, N'A298/2018/4/8 下午 04:21:21', 17, N'核桃燕麥鬆餅', 180, 15, N'y', 298)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (288, N'A240/2019/4/12 上午 01:05:05', 9, N'蜜桃初戀泡泡', 110, 20, N'y', 240)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (289, N'A323/2019/2/6 上午 05:54:54', 2, N'焗烤肉醬薯條', 100, 2, N'y', 323)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (290, N'A413/2019/1/18 上午 06:28:28', 17, N'核桃燕麥鬆餅', 180, 22, N'y', 413)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (291, N'A269/2018/10/26 上午 05:05:05', 11, N'季節水果茶', 130, 7, N'y', 269)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (292, N'A421/2018/5/29 下午 04:07:07', 5, N'紹興酒奶油雞腿排', 229, 23, N'y', 421)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (293, N'A381/2018/8/11 上午 12:48:48', 12, N'橙花君度檸檬塔', 160, 7, N'y', 381)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (294, N'A44/2018/12/17 上午 06:38:38', 11, N'季節水果茶', 130, 22, N'y', 44)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (295, N'A279/2018/11/15 下午 08:44:44', 21, N'原味白豆湯', 220, 24, N'y', 279)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (296, N'A64/2019/1/31 上午 11:04:04', 15, N'冰淇淋QQ鬆餅', 150, 11, N'y', 64)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (297, N'A93/2018/11/29 下午 07:49:49', 3, N'墨西哥香辣菲力牛肉披薩', 358, 14, N'y', 93)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (298, N'A83/2018/12/26 下午 01:54:54', 21, N'原味白豆湯', 220, 7, N'y', 83)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (299, N'A173/2018/11/12 上午 12:07:07', 9, N'蜜桃初戀泡泡', 110, 9, N'y', 173)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (300, N'A468/2019/2/15 下午 10:53:53', 16, N'蛋糕三重奏', 150, 28, N'y', 468)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (301, N'A226/2019/3/20 下午 01:27:27', 12, N'橙花君度檸檬塔', 160, 12, N'y', 226)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (302, N'A298/2018/9/21 上午 05:47:47', 15, N'冰淇淋QQ鬆餅', 150, 1, N'y', 298)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (303, N'A197/2019/2/16 下午 12:54:54', 3, N'墨西哥香辣菲力牛肉披薩', 358, 17, N'y', 197)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (304, N'A255/2018/3/18 下午 03:31:31', 20, N'意大利婚禮湯', 280, 12, N'y', 255)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (305, N'A222/2019/6/4 下午 04:40:40', 5, N'紹興酒奶油雞腿排', 229, 29, N'y', 222)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (306, N'A339/2019/5/7 上午 03:54:54', 5, N'紹興酒奶油雞腿排', 229, 1, N'y', 339)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (307, N'A234/2019/5/22 上午 09:07:07', 6, N'軟殼蟹蛤蜊花義大利麵佐香檸奶汁', 359, 24, N'y', 234)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (308, N'A211/2018/5/1 下午 12:20:20', 10, N'蜜釀鳳梨冰茶', 160, 7, N'y', 211)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (309, N'A367/2018/6/19 下午 08:01:01', 6, N'軟殼蟹蛤蜊花義大利麵佐香檸奶汁', 359, 12, N'y', 367)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (310, N'A484/2018/1/27 下午 08:19:19', 7, N'紅醬蕃茄綜合海鮮麵', 178, 20, N'y', 484)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (311, N'A31/2018/1/31 上午 03:29:29', 13, N'巧克力慕斯', 135, 3, N'y', 31)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (312, N'A333/2018/4/6 上午 08:35:35', 16, N'蛋糕三重奏', 150, 17, N'y', 333)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (313, N'A194/2019/4/19 上午 11:27:27', 10, N'蜜釀鳳梨冰茶', 160, 5, N'y', 194)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (314, N'A346/2019/3/7 上午 10:50:50', 4, N'炭烤沙朗心牛排與脆皮雞腿排', 360, 21, N'y', 346)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (315, N'A402/2018/8/28 上午 04:58:58', 14, N'玫瑰生乳酪蛋糕', 150, 1, N'y', 402)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (316, N'A85/2018/11/10 下午 03:00:00', 5, N'紹興酒奶油雞腿排', 229, 29, N'y', 85)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (318, N'e9350ba6-7531-44a6-bcf3-435e166ff1f0', 14, N'巧克力慕斯', 135, 1, N'y', 165)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (319, N'e9350ba6-7531-44a6-bcf3-435e166ff1f0', 9, N'夏多內花蜜醋', 240, 1, N'y', 165)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (320, N'e9350ba6-7531-44a6-bcf3-435e166ff1f0', 4, N'墨西哥香辣菲力牛肉披薩', 358, 1, N'y', 165)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (324, N'89411545-f669-4a09-88f2-c01d2157ee77', 4, N'墨西哥香辣菲力牛肉披薩', 358, 1, N'y', 165)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (326, N'89411545-f669-4a09-88f2-c01d2157ee77', 5, N'炭烤沙朗心牛排與脆皮雞腿排', 360, 1, N'y', 165)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (327, N'f672cd7f-973f-4970-8aa1-bffe30b69119', 4, N'墨西哥香辣菲力牛肉披薩', 358, 1, N'y', 165)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (334, N'3f79747a-ad3c-46c7-99b5-472fa62dd88f', 8, N'紅醬蕃茄綜合海鮮麵', 178, 2, N'y', 165)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (335, N'3f79747a-ad3c-46c7-99b5-472fa62dd88f', 11, N'蜜釀鳳梨冰茶', 160, 2, N'y', 165)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (336, N'b4ae2c69-c238-4cc6-9881-060f7053b982', 8, N'紅醬蕃茄綜合海鮮麵', 178, 2, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (337, N'b4ae2c69-c238-4cc6-9881-060f7053b982', 13, N'橙花君度檸檬塔', 160, 1, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (338, N'b4ae2c69-c238-4cc6-9881-060f7053b982', 12, N'季節水果茶', 130, 1, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (339, N'b4ae2c69-c238-4cc6-9881-060f7053b982', 10, N'蜜桃初戀泡泡', 110, 1, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (343, N'b0fb17b9-4b49-4826-8e0e-001ecdb6ba78', 8, N'紅醬蕃茄綜合海鮮麵', 178, 2, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (344, N'b0fb17b9-4b49-4826-8e0e-001ecdb6ba78', 13, N'橙花君度檸檬塔', 160, 1, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (345, N'b0fb17b9-4b49-4826-8e0e-001ecdb6ba78', 10, N'蜜桃初戀泡泡', 110, 1, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (346, N'b0fb17b9-4b49-4826-8e0e-001ecdb6ba78', 12, N'季節水果茶', 130, 1, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (347, N'1577dea9-30a1-4bf3-b165-73d4a74e950a', 5, N'炭烤沙朗心牛排與脆皮雞腿排', 360, 1, N'y', 165)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (348, N'4bd0f2fb-b78e-4ddc-8c77-44437314968d', 5, N'炭烤沙朗心牛排與脆皮雞腿排', 360, 1, N'y', 165)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (349, N'60a7853b-1a56-45b5-9e0f-ed43f5716200', 8, N'紅醬蕃茄綜合海鮮麵', 178, 2, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (351, N'60a7853b-1a56-45b5-9e0f-ed43f5716200', 13, N'橙花君度檸檬塔', 160, 1, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (352, N'60a7853b-1a56-45b5-9e0f-ed43f5716200', 10, N'蜜桃初戀泡泡', 110, 1, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (353, N'60a7853b-1a56-45b5-9e0f-ed43f5716200', 12, N'季節水果茶', 130, 1, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (354, N'49d1fc74-e139-48e7-a493-2e979729f061', 4, N'墨西哥香辣菲力牛肉披薩', 358, 1, N'y', 165)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (355, N'd10a2cc9-f0b1-4328-baeb-d460660c1ef2', 4, N'墨西哥香辣菲力牛肉披薩', 358, 2, N'y', 165)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (362, N'74e3e32a-2873-4fae-b239-2bbaa82053cb', 8, N'紅醬蕃茄綜合海鮮麵', 178, 2, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (363, N'74e3e32a-2873-4fae-b239-2bbaa82053cb', 13, N'橙花君度檸檬塔', 160, 1, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (364, N'74e3e32a-2873-4fae-b239-2bbaa82053cb', 10, N'蜜桃初戀泡泡', 110, 1, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (365, N'74e3e32a-2873-4fae-b239-2bbaa82053cb', 12, N'季節水果茶', 130, 1, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (367, N'0f93f4e3-a47c-4388-95a1-1286b8a5393a', 8, N'紅醬蕃茄綜合海鮮麵', 178, 2, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (368, N'0f93f4e3-a47c-4388-95a1-1286b8a5393a', 13, N'橙花君度檸檬塔', 160, 1, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (369, N'0f93f4e3-a47c-4388-95a1-1286b8a5393a', 10, N'蜜桃初戀泡泡', 110, 1, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (370, N'0f93f4e3-a47c-4388-95a1-1286b8a5393a', 12, N'季節水果茶', 130, 1, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (372, NULL, 4, N'墨西哥香辣菲力牛肉披薩', 358, 18, N'n', 167)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (373, NULL, 5, N'炭烤沙朗心牛排與脆皮雞腿排', 360, 8, N'n', 167)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (374, N'1d762d4a-1472-46e5-a7fc-9e368ddd0a91', 6, N'紹興酒奶油雞腿排', 229, 1, N'y', 165)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (375, N'68042e12-2bec-4d0b-a5e9-a8bddd5a5363', 8, N'紅醬蕃茄綜合海鮮麵', 178, 2, N'y', 165)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (384, N'018ab1f1-b3ff-4504-a175-811652f395e6', 13, N'橙花君度檸檬塔', 160, 1, N'y', 165)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (393, N'fb2d2758-4ac8-4871-a58b-7e3c0893afc1', 15, N'玫瑰生乳酪蛋糕', 150, 5, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (394, N'fb2d2758-4ac8-4871-a58b-7e3c0893afc1', 18, N'核桃燕麥鬆餅', 180, 1, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (399, N'b0e76d52-91f1-4616-96f5-5ec7c50b4074', 15, N'玫瑰生乳酪蛋糕', 150, 5, N'y', 166)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (400, N'b0e76d52-91f1-4616-96f5-5ec7c50b4074', 18, N'核桃燕麥鬆餅', 180, 1, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (401, N'7df2c267-8eaf-4035-9837-af981d23b88f', 14, N'巧克力慕斯', 135, 3, N'y', 165)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (402, N'f79158e5-8125-423c-b784-7f415f4b4403', 13, N'橙花君度檸檬塔', 160, 3, N'y', 165)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (403, N'94521ef8-5f47-4424-8c83-5688caf65a09', 13, N'橙花君度檸檬塔', 160, 1, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (404, N'94521ef8-5f47-4424-8c83-5688caf65a09', 12, N'季節水果茶', 130, 1, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (405, N'94521ef8-5f47-4424-8c83-5688caf65a09', 10, N'蜜桃初戀泡泡', 110, 1, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (406, N'94521ef8-5f47-4424-8c83-5688caf65a09', 8, N'紅醬蕃茄綜合海鮮麵', 178, 2, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (407, N'72523bc4-ae5f-4095-8d23-45d7c9245b56', 13, N'橙花君度檸檬塔', 160, 1, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (408, N'72523bc4-ae5f-4095-8d23-45d7c9245b56', 10, N'蜜桃初戀泡泡', 110, 2, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (409, N'72523bc4-ae5f-4095-8d23-45d7c9245b56', 12, N'季節水果茶', 130, 1, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (410, N'72523bc4-ae5f-4095-8d23-45d7c9245b56', 8, N'紅醬蕃茄綜合海鮮麵', 178, 3, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (411, N'c0bb0002-1e27-4772-bb25-360b97c65a8d', 13, N'橙花君度檸檬塔', 160, 1, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (412, N'c0bb0002-1e27-4772-bb25-360b97c65a8d', 10, N'蜜桃初戀泡泡', 110, 1, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (413, N'c0bb0002-1e27-4772-bb25-360b97c65a8d', 12, N'季節水果茶', 130, 1, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (414, N'c0bb0002-1e27-4772-bb25-360b97c65a8d', 8, N'紅醬蕃茄綜合海鮮麵', 178, 2, N'y', 166)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (415, N'89c05301-2424-484d-80fe-f7040c6dc9aa', 15, N'玫瑰生乳酪蛋糕', 150, 5, N'y', 165)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [IsApproved], [MemberID]) VALUES (416, N'89c05301-2424-484d-80fe-f7040c6dc9aa', 18, N'核桃燕麥鬆餅', 180, 4, N'y', 165)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'018ab1f1-b3ff-4504-a175-811652f395e6', CAST(N'2019-06-20T21:26:44.347' AS DateTime), 165, 160, N'test', N'0912345678', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'035a023b-9bcd-4187-8a6a-e400239200d5', CAST(N'2019-06-13T12:07:44.430' AS DateTime), 4, 360, N'', N'', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'0f93f4e3-a47c-4388-95a1-1286b8a5393a', CAST(N'2019-06-18T05:28:15.773' AS DateTime), 166, 936, N'WonChang', N'0987654321', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'1577dea9-30a1-4bf3-b165-73d4a74e950a', CAST(N'2019-06-18T09:37:39.647' AS DateTime), 165, 360, N'test', N'0912345678', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'1d762d4a-1472-46e5-a7fc-9e368ddd0a91', CAST(N'2019-06-19T22:43:41.383' AS DateTime), 165, 229, N'test', N'0912345678', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'1f776fbf-12a3-4b33-99a6-78aa9754e281', CAST(N'2019-06-13T12:15:32.527' AS DateTime), 4, 359, N'', N'', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'2cbb373a-0c01-460c-9e5d-fe6aa3a14525', CAST(N'2019-06-13T12:01:01.667' AS DateTime), 4, 587, N'', N'', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'39d503da-5d0f-4851-84a3-ea2c94f143a6', CAST(N'2019-06-14T16:46:49.310' AS DateTime), 165, 360, N'', N'', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'3f79747a-ad3c-46c7-99b5-472fa62dd88f', CAST(N'2019-06-17T17:41:41.533' AS DateTime), 165, 2005, N'test', N'0912345678', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'49d1fc74-e139-48e7-a493-2e979729f061', CAST(N'2019-06-18T05:22:45.667' AS DateTime), 165, 358, N'test', N'0912345678', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'4bd0f2fb-b78e-4ddc-8c77-44437314968d', CAST(N'2019-06-18T09:38:48.770' AS DateTime), 165, 360, N'test', N'0912345678', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'550e9b55-8299-498a-98f3-695c247dd8b0', CAST(N'2019-06-13T16:24:57.923' AS DateTime), 165, 1485, N'fsad', N'dafsd', N'dsafdsf')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'60a7853b-1a56-45b5-9e0f-ed43f5716200', CAST(N'2019-06-18T05:20:24.737' AS DateTime), 166, 936, N'WonChang', N'0987654321', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'68042e12-2bec-4d0b-a5e9-a8bddd5a5363', CAST(N'2019-06-20T01:28:18.117' AS DateTime), 165, 178, N'test', N'0912345678', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'72523bc4-ae5f-4095-8d23-45d7c9245b56', CAST(N'2019-06-22T01:26:48.480' AS DateTime), 166, 1044, N'WonChang', N'0987654321', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'74e3e32a-2873-4fae-b239-2bbaa82053cb', CAST(N'2019-06-18T05:25:11.550' AS DateTime), 166, 936, N'WonChang', N'0987654321', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'7df2c267-8eaf-4035-9837-af981d23b88f', CAST(N'2019-06-22T01:05:26.480' AS DateTime), 165, 135, N'test', N'0912345678', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'89411545-f669-4a09-88f2-c01d2157ee77', CAST(N'2019-06-17T17:16:27.223' AS DateTime), 165, 718, N'test', N'0912345678', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'89c05301-2424-484d-80fe-f7040c6dc9aa', CAST(N'2019-06-22T01:30:15.373' AS DateTime), 165, 930, N'test', N'0912345678', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'94521ef8-5f47-4424-8c83-5688caf65a09', CAST(N'2019-06-22T01:21:55.870' AS DateTime), 166, 578, N'WonChang', N'0987654321', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A0/2018/5/20 下午 06:20:20', CAST(N'2018-05-20T18:20:20.000' AS DateTime), 0, 4200, N'蔡家銘', N'0904584498', N'新竹縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A0/2018/6/6 上午 08:15:15', CAST(N'2018-06-06T08:15:15.000' AS DateTime), 0, 5220, N'戴俊傑', N'0935824303', N'雲林縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A10/2018/2/8 上午 02:59:59', CAST(N'2018-02-08T02:59:59.000' AS DateTime), 10, 2492, N'鄭淑惠', N'0997753939', N'新北市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A10/2018/5/25 下午 10:57:57', CAST(N'2018-05-25T22:57:57.000' AS DateTime), 10, 2100, N'簡佩日', N'0904584498', N'宜蘭縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A101/2019/4/16 上午 02:39:39', CAST(N'2019-04-16T02:39:39.000' AS DateTime), 101, 2880, N'王安春', N'0919720878', N'雲林縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A102/2018/12/15 下午 12:41:41', CAST(N'2018-12-15T12:41:41.000' AS DateTime), 102, 600, N'楊妙真', N'0913311541', N'宜蘭縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A102/2019/3/7 上午 10:34:34', CAST(N'2019-03-07T10:34:34.000' AS DateTime), 102, 1950, N'魏怡潔', N'0997753939', N'臺南市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A103/2018/3/5 下午 03:03:03', CAST(N'2018-03-05T15:03:03.000' AS DateTime), 103, 3900, N'李千慧', N'0901076093', N'屏東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A103/2019/2/4 上午 06:18:18', CAST(N'2019-02-04T06:18:18.000' AS DateTime), 103, 6480, N'林淑芳', N'0913311541', N'新北市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A106/2018/4/29 下午 05:19:19', CAST(N'2018-04-29T17:19:19.000' AS DateTime), 106, 2640, N'詹佳宏', N'0997753939', N'苗栗縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A106/2018/9/12 上午 09:13:13', CAST(N'2018-09-12T09:13:13.000' AS DateTime), 106, 300, N'謝俊宏', N'0982031925', N'嘉義縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A107/2019/1/1 下午 07:54:54', CAST(N'2019-01-01T19:54:54.000' AS DateTime), 107, 2848, N'鐘俊男', N'0913311541', N'新竹市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A109/2018/1/23 下午 09:28:28', CAST(N'2018-01-23T21:28:28.000' AS DateTime), 109, 2250, N'陳雅君', N'0913311541', N'雲林縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A11/2018/1/26 下午 03:17:17', CAST(N'2018-01-26T15:17:17.000' AS DateTime), 11, 720, N'彭雅婷', N'0982031925', N'嘉義市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A110/2018/1/20 上午 05:51:51', CAST(N'2018-01-20T05:51:51.000' AS DateTime), 110, 3360, N'吳文傑', N'0997753939', N'高雄市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A110/2018/5/14 下午 02:41:41', CAST(N'2018-05-14T14:41:41.000' AS DateTime), 110, 4050, N'王建龍', N'0919720878', N'桃園市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A111/2018/2/27 下午 09:54:54', CAST(N'2018-02-27T21:54:54.000' AS DateTime), 111, 160, N'劉淳季', N'0901076093', N'嘉義縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A112/2018/5/23 上午 01:38:38', CAST(N'2018-05-23T01:38:38.000' AS DateTime), 112, 2600, N'陳宇春', N'0913311541', N'臺北市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A113/2018/2/27 上午 04:17:17', CAST(N'2018-02-27T04:17:17.000' AS DateTime), 113, 4667, N'楊明哲', N'0913311541', N'新北市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A114/2018/11/12 上午 03:54:54', CAST(N'2018-11-12T03:54:54.000' AS DateTime), 114, 4094, N'李建志', N'0901076093', N'雲林縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A116/2018/12/7 上午 09:40:40', CAST(N'2018-12-07T09:40:40.000' AS DateTime), 116, 1015, N'張貴舜', N'0925467860', N'新竹市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A116/2018/9/1 下午 10:31:31', CAST(N'2018-09-01T22:31:31.000' AS DateTime), 116, 2400, N'周國賢', N'0982031925', N'苗栗縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A116/2018/9/13 上午 09:42:42', CAST(N'2018-09-13T09:42:42.000' AS DateTime), 116, 3060, N'賴宜君', N'0919720878', N'高雄市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A119/2018/4/6 上午 10:43:43', CAST(N'2018-04-06T10:43:43.000' AS DateTime), 119, 3780, N'吳怡君', N'0925467860', N'澎湖縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A120/2018/5/17 上午 02:26:26', CAST(N'2018-05-17T02:26:26.000' AS DateTime), 120, 3960, N'', N'0939934596', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A120/2018/9/30 上午 09:56:56', CAST(N'2018-09-30T09:56:56.000' AS DateTime), 120, 750, N'吳正文', N'0913311541', N'臺北市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A121/2018/2/23 下午 02:00:00', CAST(N'2018-02-23T14:00:00.000' AS DateTime), 121, 910, N'盧建良', N'0913311541', N'桃園市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A122/2019/1/2 下午 09:37:37', CAST(N'2019-01-02T21:37:37.000' AS DateTime), 122, 6480, N'謝左娟', N'0945851025', N'嘉義市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A123/2018/12/13 下午 01:50:50', CAST(N'2018-12-13T13:50:50.000' AS DateTime), 123, 2400, N'楊雅雯', N'0913311541', N'南投縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A124/2018/4/10 上午 03:41:41', CAST(N'2018-04-10T03:41:41.000' AS DateTime), 124, 1485, N'王惠珍', N'0901076093', N'雲林縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A125/2018/12/10 上午 05:36:36', CAST(N'2018-12-10T05:36:36.000' AS DateTime), 125, 8120, N'方建龍', N'0982031925', N'桃園市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A126/2018/12/2 上午 10:28:28', CAST(N'2018-12-02T10:28:28.000' AS DateTime), 126, 3900, N'林信意', N'0982031925', N'嘉義縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A127/2019/1/25 上午 11:48:48', CAST(N'2019-01-25T11:48:48.000' AS DateTime), 127, 800, N'鄭雅雯', N'0925467860', N'新竹市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A127/2019/1/3 上午 03:35:35', CAST(N'2019-01-03T03:35:35.000' AS DateTime), 127, 2470, N'方雅雯', N'0901076093', N'花蓮縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A128/2018/10/9 上午 10:43:43', CAST(N'2018-10-09T10:43:43.000' AS DateTime), 128, 180, N'陳雅慧', N'0913311541', N'彰化縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A128/2018/6/29 下午 06:26:26', CAST(N'2018-06-29T18:26:26.000' AS DateTime), 128, 1500, N'王佩君', N'0982031925', N'嘉義市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A13/2018/10/3 上午 01:29:29', CAST(N'2018-10-03T01:29:29.000' AS DateTime), 13, 3360, N'郭淑玲', N'0913092178', N'臺南市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A13/2018/8/20 上午 10:04:04', CAST(N'2018-08-20T10:04:04.000' AS DateTime), 13, 5040, N'許雨松', N'0982031925', N'澎湖縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A131/2018/11/10 下午 02:36:36', CAST(N'2018-11-10T14:36:36.000' AS DateTime), 131, 4760, N'方玉婷', N'0913092178', N'金門縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A131/2018/3/28 上午 08:07:07', CAST(N'2018-03-28T08:07:07.000' AS DateTime), 131, 2600, N'陳智偉', N'0913311541', N'新北市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A132/2018/2/14 下午 02:19:19', CAST(N'2018-02-14T14:19:19.000' AS DateTime), 132, 4480, N'林麗美', N'0913311541', N'澎湖縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A132/2018/9/14 上午 05:51:51', CAST(N'2018-09-14T05:51:51.000' AS DateTime), 132, 1780, N'郭子韋', N'0982031925', N'桃園市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A133/2018/8/4 上午 02:02:02', CAST(N'2018-08-04T02:02:02.000' AS DateTime), 133, 600, N'郭志明', N'0913092178', N'嘉義縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A134/2019/3/5 上午 05:41:41', CAST(N'2019-03-05T05:41:41.000' AS DateTime), 134, 4667, N'江家豪', N'0935824303', N'臺北市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A136/2018/11/21 下午 07:02:02', CAST(N'2018-11-21T19:02:02.000' AS DateTime), 136, 520, N'李成忠', N'0925467860', N'新竹縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A136/2018/8/15 下午 06:29:29', CAST(N'2018-08-15T18:29:29.000' AS DateTime), 136, 800, N'林佩玲', N'0982031925', N'高雄市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A137/2018/11/15 上午 10:27:27', CAST(N'2018-11-15T10:27:27.000' AS DateTime), 137, 4667, N'張雅玲', N'0913311541', N'嘉義縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A137/2018/2/8 上午 10:17:17', CAST(N'2018-02-08T10:17:17.000' AS DateTime), 137, 4350, N'葉國華', N'0913311541', N'臺中市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A138/2018/9/7 下午 05:01:01', CAST(N'2018-09-07T17:01:01.000' AS DateTime), 138, 1620, N'周雅惠', N'0982031925', N'澎湖縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A140/2018/9/30 下午 05:37:37', CAST(N'2018-09-30T17:37:37.000' AS DateTime), 140, 4000, N'童淳聖', N'0945319208', N'苗栗縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A140/2019/5/26 上午 02:54:54', CAST(N'2019-05-26T02:54:54.000' AS DateTime), 140, 1200, N'陳琬婷', N'0982031925', N'高雄市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A144/2018/2/26 下午 12:13:13', CAST(N'2018-02-26T12:13:13.000' AS DateTime), 144, 4272, N'陳淑芬', N'0997753939', N'苗栗縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A144/2018/7/5 上午 07:39:39', CAST(N'2018-07-05T07:39:39.000' AS DateTime), 144, 2154, N'賴雅惠', N'0919720878', N'金門縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A146/2018/6/1 下午 07:42:42', CAST(N'2018-06-01T19:42:42.000' AS DateTime), 146, 3240, N'鄭怡玲', N'0982031925', N'臺北市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A146/2019/5/1 下午 08:57:57', CAST(N'2019-05-01T20:57:57.000' AS DateTime), 146, 1950, N'李賢惠', N'0997753939', N'嘉義市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A147/2019/3/9 上午 06:29:29', CAST(N'2019-03-09T06:29:29.000' AS DateTime), 147, 100, N'洪佩君', N'0913311541', N'苗栗縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A148/2018/10/8 下午 12:20:20', CAST(N'2018-10-08T12:20:20.000' AS DateTime), 148, 3190, N'簡嘉玲', N'0913311541', N'桃園市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A148/2018/5/6 下午 12:32:32', CAST(N'2018-05-06T12:32:32.000' AS DateTime), 148, 1350, N'趙采夢', N'0982031925', N'苗栗縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A148/2019/3/28 下午 03:26:26', CAST(N'2019-03-28T15:26:26.000' AS DateTime), 148, 180, N'郭宗怡', N'0913092178', N'臺東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A149/2019/6/2 下午 06:45:45', CAST(N'2019-06-02T18:45:45.000' AS DateTime), 149, 6641, N'賴靜宜', N'0982031925', N'桃園市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A15/2018/6/9 下午 10:35:35', CAST(N'2018-06-09T22:35:35.000' AS DateTime), 15, 3300, N'白右綺', N'0901076093', N'嘉義縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A150/2018/10/12 下午 09:22:22', CAST(N'2018-10-12T21:22:22.000' AS DateTime), 150, 3645, N'陳信宏', N'0945851025', N'雲林縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A155/2018/10/19 下午 08:28:28', CAST(N'2018-10-19T20:28:28.000' AS DateTime), 155, 3738, N'陳致慧', N'0913311541', N'金門縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A155/2018/6/6 上午 03:53:53', CAST(N'2018-06-06T03:53:53.000' AS DateTime), 155, 160, N'黃宜珊', N'0901076093', N'苗栗縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A157/2018/10/17 下午 02:22:22', CAST(N'2018-10-17T14:22:22.000' AS DateTime), 157, 4122, N'', N'0939934596', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A158/2018/11/8 下午 03:01:01', CAST(N'2018-11-08T15:01:01.000' AS DateTime), 158, 2850, N'鄭素信', N'0919720878', N'金門縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A158/2018/4/12 上午 07:45:45', CAST(N'2018-04-12T07:45:45.000' AS DateTime), 158, 1200, N'賴祥偉', N'0901076093', N'臺南市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A159/2019/1/12 下午 02:20:20', CAST(N'2019-01-12T14:20:20.000' AS DateTime), 159, 4200, N'馮其明', N'0982031925', N'新竹市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A16/2018/4/11 上午 08:25:25', CAST(N'2018-04-11T08:25:25.000' AS DateTime), 16, 2400, N'楊佳琪', N'0913311541', N'澎湖縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A163/2018/5/28 下午 04:57:57', CAST(N'2018-05-28T16:57:57.000' AS DateTime), 163, 4080, N'陳慧玲', N'0945851025', N'新竹市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A163/2019/6/5 上午 07:09:09', CAST(N'2019-06-05T07:09:09.000' AS DateTime), 163, 945, N'陳淑智', N'0997753939', N'新竹縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A164/2019/5/17 下午 10:31:31', CAST(N'2019-05-17T22:31:31.000' AS DateTime), 164, 3435, N'劉家榮', N'0982031925', N'高雄市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A165/2018/10/7 上午 03:29:29', CAST(N'2018-10-07T03:29:29.000' AS DateTime), 165, 3510, N'張惠雯', N'0982031925', N'基隆市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A169/2018/7/18 下午 02:33:33', CAST(N'2018-07-18T14:33:33.000' AS DateTime), 169, 3510, N'陳榮宏', N'0901076093', N'高雄市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A171/2018/3/8 上午 09:19:19', CAST(N'2018-03-08T09:19:19.000' AS DateTime), 171, 4140, N'唐紫歡', N'0904584498', N'雲林縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A172/2018/3/5 上午 05:26:26', CAST(N'2018-03-05T05:26:26.000' AS DateTime), 172, 3250, N'葉慶水', N'0913311541', N'澎湖縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A172/2019/2/18 上午 02:54:54', CAST(N'2019-02-18T02:54:54.000' AS DateTime), 172, 1350, N'毛佑虎', N'0913092178', N'彰化縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A173/2018/11/12 上午 12:07:07', CAST(N'2018-11-12T00:07:07.000' AS DateTime), 173, 3080, N'蔡佳穎', N'0997753939', N'嘉義縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A175/2019/3/20 下午 09:19:19', CAST(N'2019-03-20T21:19:19.000' AS DateTime), 175, 2700, N'高筱娟', N'0913311541', N'臺北市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A177/2018/7/23 上午 01:54:54', CAST(N'2018-07-23T01:54:54.000' AS DateTime), 177, 1350, N'黎佳玲', N'0982031925', N'桃園市')
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A177/2019/5/11 下午 05:30:30', CAST(N'2019-05-11T17:30:30.000' AS DateTime), 177, 4320, N'吳與永', N'0982031925', N'澎湖縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A181/2018/3/7 下午 02:26:26', CAST(N'2018-03-07T14:26:26.000' AS DateTime), 181, 916, N'陳怡潔', N'0982031925', N'臺中市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A181/2019/1/16 下午 02:35:35', CAST(N'2019-01-16T14:35:35.000' AS DateTime), 181, 2560, N'林志偉', N'0913311541', N'臺北市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A186/2018/10/11 上午 08:05:05', CAST(N'2018-10-11T08:05:05.000' AS DateTime), 186, 2560, N'金佳慧', N'0901076093', N'花蓮縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A189/2018/10/23 上午 02:47:47', CAST(N'2018-10-23T02:47:47.000' AS DateTime), 189, 2340, N'傅慧玲', N'0913311541', N'新北市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A190/2018/6/8 上午 09:07:07', CAST(N'2018-06-08T09:07:07.000' AS DateTime), 190, 3450, N'吳福興', N'0935824303', N'臺北市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A191/2019/3/1 上午 07:11:11', CAST(N'2019-03-01T07:11:11.000' AS DateTime), 191, 2314, N'林惠婷', N'0901076093', N'高雄市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A191/2019/6/3 下午 06:20:20', CAST(N'2019-06-03T18:20:20.000' AS DateTime), 191, 3420, N'', N'0939934596', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A193/2018/9/9 上午 11:24:24', CAST(N'2018-09-09T11:24:24.000' AS DateTime), 193, 2160, N'林欣怡', N'0901076093', N'基隆市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A194/2018/4/21 上午 08:24:24', CAST(N'2018-04-21T08:24:24.000' AS DateTime), 194, 2860, N'楊紹儀', N'0913311541', N'金門縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A194/2018/8/1 上午 11:21:21', CAST(N'2018-08-01T11:21:21.000' AS DateTime), 194, 6480, N'林信意', N'0913311541', N'宜蘭縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A194/2019/4/19 上午 11:27:27', CAST(N'2019-04-19T11:27:27.000' AS DateTime), 194, 880, N'黃雅芳', N'0941941704', N'南投縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A195/2018/7/18 下午 10:17:17', CAST(N'2018-07-18T22:17:17.000' AS DateTime), 195, 2640, N'郭季欣', N'0904584498', N'嘉義縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A197/2018/1/28 上午 04:48:48', CAST(N'2018-01-28T04:48:48.000' AS DateTime), 197, 1015, N'陳建宏', N'0935824303', N'彰化縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A197/2018/12/28 下午 06:24:24', CAST(N'2018-12-28T18:24:24.000' AS DateTime), 197, 1980, N'徐惠琴', N'0982031925', N'嘉義縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A197/2019/2/16 下午 12:54:54', CAST(N'2019-02-16T12:54:54.000' AS DateTime), 197, 1320, N'陳鴻弘', N'0997753939', N'彰化縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A199/2019/2/14 下午 08:36:36', CAST(N'2019-02-14T20:36:36.000' AS DateTime), 199, 840, N'', N'0939934596', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A20/2018/4/27 上午 04:26:26', CAST(N'2018-04-27T04:26:26.000' AS DateTime), 20, 4351, N'杭佩雯', N'0982031925', N'嘉義市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A20/2018/8/6 上午 12:41:41', CAST(N'2018-08-06T00:41:41.000' AS DateTime), 20, 1120, N'謝韻如', N'0982031925', N'雲林縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A20/2019/1/21 下午 12:18:18', CAST(N'2019-01-21T12:18:18.000' AS DateTime), 20, 280, N'徐宗勇', N'0913311541', N'屏東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A202/2018/7/5 下午 06:39:39', CAST(N'2018-07-05T18:39:39.000' AS DateTime), 202, 2290, N'江綠志', N'0904584498', N'宜蘭縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A203/2019/5/23 上午 02:58:58', CAST(N'2019-05-23T02:58:58.000' AS DateTime), 203, 910, N'楊俊男', N'0935824303', N'基隆市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A208/2018/12/11 上午 01:09:09', CAST(N'2018-12-11T01:09:09.000' AS DateTime), 208, 2850, N'郭惠如', N'0997753939', N'雲林縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A208/2018/5/18 上午 09:07:07', CAST(N'2018-05-18T09:07:07.000' AS DateTime), 208, 945, N'林玉婷', N'0982031925', N'臺南市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A209/2018/11/29 下午 02:07:07', CAST(N'2018-11-29T14:07:07.000' AS DateTime), 209, 359, N'吳慧君', N'0901076093', N'澎湖縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A21/2019/4/27 下午 07:12:12', CAST(N'2019-04-27T19:12:12.000' AS DateTime), 21, 2420, N'鐘小晴', N'0997753939', N'宜蘭縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A210/2018/4/10 上午 05:39:39', CAST(N'2018-04-10T05:39:39.000' AS DateTime), 210, 2850, N'鐘慧君', N'0982031925', N'臺東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A211/2018/5/1 下午 12:20:20', CAST(N'2018-05-01T12:20:20.000' AS DateTime), 211, 6440, N'劉玉真', N'0941941704', N'苗栗縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A211/2019/4/22 上午 01:39:39', CAST(N'2019-04-22T01:39:39.000' AS DateTime), 211, 1620, N'沙淑娟', N'0982031925', N'彰化縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A214/2019/5/9 上午 12:53:53', CAST(N'2019-05-09T00:53:53.000' AS DateTime), 214, 4320, N'黃良文', N'0919720878', N'桃園市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A215/2018/5/13 下午 03:34:34', CAST(N'2018-05-13T15:34:34.000' AS DateTime), 215, 1200, N'盧國勇', N'0935824303', N'雲林縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A215/2018/7/9 上午 05:18:18', CAST(N'2018-07-09T05:18:18.000' AS DateTime), 215, 3640, N'劉俊雄', N'0982031925', N'臺東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A216/2018/6/16 下午 02:53:53', CAST(N'2018-06-16T14:53:53.000' AS DateTime), 216, 6720, N'謝家豪', N'0982031925', N'南投縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A218/2018/1/28 上午 10:17:17', CAST(N'2018-01-28T10:17:17.000' AS DateTime), 218, 3060, N'梁俊宏', N'0901076093', N'臺北市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A218/2018/10/10 上午 06:26:26', CAST(N'2018-10-10T06:26:26.000' AS DateTime), 218, 4160, N'謝佳慧', N'0901076093', N'臺南市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A22/2018/11/18 上午 11:36:36', CAST(N'2018-11-18T11:36:36.000' AS DateTime), 22, 3080, N'張亞元', N'0913311541', N'臺東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A220/2018/7/19 下午 12:29:29', CAST(N'2018-07-19T12:29:29.000' AS DateTime), 220, 810, N'張淑慧', N'0935824303', N'花蓮縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A220/2018/7/9 下午 02:52:52', CAST(N'2018-07-09T14:52:52.000' AS DateTime), 220, 5060, N'唐心怡', N'0982031925', N'嘉義市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A222/2018/1/28 上午 02:06:06', CAST(N'2018-01-28T02:06:06.000' AS DateTime), 222, 140, N'何惠雯', N'0901076093', N'新竹市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A222/2019/6/4 下午 04:40:40', CAST(N'2019-06-04T16:40:40.000' AS DateTime), 222, 2025, N'黃燕', N'0997753939', N'屏東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A226/2019/3/20 下午 01:27:27', CAST(N'2019-03-20T13:27:27.000' AS DateTime), 226, 9334, N'劉琬婷', N'0997753939', N'苗栗縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A228/2018/7/19 下午 08:10:10', CAST(N'2018-07-19T20:10:10.000' AS DateTime), 228, 3204, N'張美琴', N'0913311541', N'彰化縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A228/2019/6/13 上午 11:25:25', CAST(N'2019-06-13T11:25:25.000' AS DateTime), 228, 2850, N'吳文傑', N'0925467860', N'澎湖縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A229/2019/3/27 上午 04:09:09', CAST(N'2019-03-27T04:09:09.000' AS DateTime), 229, 675, N'林行鴻', N'0982031925', N'高雄市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A23/2019/2/7 下午 03:46:46', CAST(N'2019-02-07T15:46:46.000' AS DateTime), 23, 1900, N'許雅惠', N'0982031925', N'新竹縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A230/2018/7/13 下午 01:52:52', CAST(N'2018-07-13T13:52:52.000' AS DateTime), 230, 7920, N'馮雅芬', N'0901076093', N'桃園市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A232/2018/8/16 上午 01:37:37', CAST(N'2018-08-16T01:37:37.000' AS DateTime), 232, 1170, N'林佳蓉', N'0901076093', N'嘉義縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A233/2018/1/21 上午 01:16:16', CAST(N'2018-01-21T01:16:16.000' AS DateTime), 233, 1440, N'溫怡如', N'0913311541', N'嘉義縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A233/2018/11/3 下午 04:32:32', CAST(N'2018-11-03T16:32:32.000' AS DateTime), 233, 1120, N'陳信宏', N'0997753939', N'基隆市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A234/2019/5/22 上午 09:07:07', CAST(N'2019-05-22T09:07:07.000' AS DateTime), 234, 440, N'金志宏', N'0997753939', N'嘉義縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A235/2018/10/9 下午 04:17:17', CAST(N'2018-10-09T16:17:17.000' AS DateTime), 235, 4800, N'何婉如', N'0945319208', N'臺北市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A235/2018/4/10 下午 05:19:19', CAST(N'2018-04-10T17:19:19.000' AS DateTime), 235, 770, N'柯淑美', N'0919720878', N'金門縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A237/2018/10/23 上午 12:21:21', CAST(N'2018-10-23T00:21:21.000' AS DateTime), 237, 2240, N'林俊明', N'0982031925', N'雲林縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A237/2018/7/23 下午 05:23:23', CAST(N'2018-07-23T17:23:23.000' AS DateTime), 237, 1200, N'趙凡君', N'0913311541', N'屏東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A238/2019/1/28 上午 02:42:42', CAST(N'2019-01-28T02:42:42.000' AS DateTime), 238, 3960, N'和詩瑤', N'0935824303', N'臺北市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A238/2019/2/15 上午 03:44:44', CAST(N'2019-02-15T03:44:44.000' AS DateTime), 238, 3420, N'施土雲', N'0913311541', N'澎湖縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A24/2018/6/18 下午 02:37:37', CAST(N'2018-06-18T14:37:37.000' AS DateTime), 24, 1440, N'謝家豪', N'0982031925', N'高雄市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A24/2018/7/15 下午 09:40:40', CAST(N'2018-07-15T21:40:40.000' AS DateTime), 24, 2000, N'馮佩君', N'0913311541', N'彰化縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A240/2018/2/22 下午 09:55:55', CAST(N'2018-02-22T21:55:55.000' AS DateTime), 240, 3450, N'蘇志豪', N'0913311541', N'彰化縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A240/2019/4/12 上午 01:05:05', CAST(N'2019-04-12T01:05:05.000' AS DateTime), 240, 3382, N'郭志雄', N'0997753939', N'澎湖縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A244/2018/7/5 上午 04:14:14', CAST(N'2018-07-05T04:14:14.000' AS DateTime), 244, 3500, N'劉玉玲', N'0913092178', N'花蓮縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A246/2019/2/20 下午 06:38:38', CAST(N'2019-02-20T18:38:38.000' AS DateTime), 246, 2250, N'宓佩芬', N'0982031925', N'雲林縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A246/2019/3/23 上午 03:20:20', CAST(N'2019-03-23T03:20:20.000' AS DateTime), 246, 4640, N'王欣怡', N'0913311541', N'宜蘭縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A249/2018/8/2 上午 06:03:03', CAST(N'2018-08-02T06:03:03.000' AS DateTime), 249, 2860, N'王土正', N'0982031925', N'彰化縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A252/2018/12/29 上午 05:52:52', CAST(N'2018-12-29T05:52:52.000' AS DateTime), 252, 1540, N'黃華順', N'0913311541', N'屏東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A253/2019/1/16 下午 01:51:51', CAST(N'2019-01-16T13:51:51.000' AS DateTime), 253, 1080, N'陳慶凡', N'0913311541', N'臺東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A255/2018/3/18 下午 03:31:31', CAST(N'2018-03-18T15:31:31.000' AS DateTime), 255, 1080, N'陳美君', N'0997753939', N'澎湖縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A257/2018/3/14 上午 05:13:13', CAST(N'2018-03-14T05:13:13.000' AS DateTime), 257, 2400, N'陳欣儀', N'0997753939', N'新北市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A258/2019/1/15 下午 01:14:14', CAST(N'2019-01-15T13:14:14.000' AS DateTime), 258, 6444, N'袁怡伶', N'0945851025', N'臺北市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A258/2019/2/4 上午 06:40:40', CAST(N'2019-02-04T06:40:40.000' AS DateTime), 258, 3000, N'劉興皓', N'0901076093', N'屏東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A26/2018/12/22 上午 06:33:33', CAST(N'2018-12-22T06:33:33.000' AS DateTime), 26, 6120, N'張佩君', N'0982031925', N'彰化縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A26/2018/4/11 下午 01:16:16', CAST(N'2018-04-11T13:16:16.000' AS DateTime), 26, 9334, N'陳玉維', N'0945319208', N'南投縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A26/2019/5/13 上午 03:17:17', CAST(N'2019-05-13T03:17:17.000' AS DateTime), 26, 1500, N'王志明', N'0925467860', N'臺中市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A263/2019/1/19 上午 09:32:32', CAST(N'2019-01-19T09:32:32.000' AS DateTime), 263, 1350, N'韓佳穎', N'0982031925', N'嘉義縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A264/2018/3/30 下午 04:59:59', CAST(N'2018-03-30T16:59:59.000' AS DateTime), 264, 220, N'王智偉', N'0913311541', N'宜蘭縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A265/2019/4/5 下午 05:33:33', CAST(N'2019-04-05T17:33:33.000' AS DateTime), 265, 2340, N'陳佳琪', N'0913311541', N'臺中市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A266/2018/9/23 下午 09:46:46', CAST(N'2018-09-23T21:46:46.000' AS DateTime), 266, 2154, N'陳建安', N'0982031925', N'新北市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A266/2019/3/5 上午 07:32:32', CAST(N'2019-03-05T07:32:32.000' AS DateTime), 266, 1900, N'袁詩富', N'0982031925', N'澎湖縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A268/2019/3/20 下午 04:40:40', CAST(N'2019-03-20T16:40:40.000' AS DateTime), 268, 4760, N'陳主豪', N'0913311541', N'金門縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A269/2018/10/26 上午 05:05:05', CAST(N'2018-10-26T05:05:05.000' AS DateTime), 269, 1100, N'黃靜宜', N'0997753939', N'臺東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A27/2018/10/8 上午 08:47:47', CAST(N'2018-10-08T08:47:47.000' AS DateTime), 27, 3000, N'吳佩君', N'0925467860', N'苗栗縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A272/2018/1/18 下午 06:45:45', CAST(N'2018-01-18T18:45:45.000' AS DateTime), 272, 280, N'李睿明', N'0901076093', N'新北市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A274/2018/2/4 上午 08:55:55', CAST(N'2018-02-04T08:55:55.000' AS DateTime), 274, 1350, N'陳欣怡', N'0997753939', N'臺南市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A274/2018/9/24 下午 12:01:01', CAST(N'2018-09-24T12:01:01.000' AS DateTime), 274, 8120, N'黃雅慧', N'0919720878', N'高雄市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A275/2019/4/5 上午 11:47:47', CAST(N'2019-04-05T11:47:47.000' AS DateTime), 275, 3780, N'張淑芬', N'0901076093', N'臺東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A276/2018/11/8 上午 03:32:32', CAST(N'2018-11-08T03:32:32.000' AS DateTime), 276, 4320, N'林佳怡', N'0901076093', N'苗栗縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A276/2019/1/31 下午 03:07:07', CAST(N'2019-01-31T15:07:07.000' AS DateTime), 276, 4680, N'謝家豪', N'0913311541', N'基隆市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A277/2018/4/11 上午 10:38:38', CAST(N'2018-04-11T10:38:38.000' AS DateTime), 277, 1980, N'楊美娟', N'0901076093', N'澎湖縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A278/2019/1/19 上午 11:34:34', CAST(N'2019-01-19T11:34:34.000' AS DateTime), 278, 5280, N'王鈺婷', N'0982031925', N'彰化縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A279/2018/1/12 上午 01:18:18', CAST(N'2018-01-12T01:18:18.000' AS DateTime), 279, 3380, N'孫嘉慧', N'0913311541', N'屏東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A279/2018/11/15 下午 08:44:44', CAST(N'2018-11-15T20:44:44.000' AS DateTime), 279, 280, N'周佩穎', N'0997753939', N'臺中市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A280/2018/5/31 下午 12:11:11', CAST(N'2018-05-31T12:11:11.000' AS DateTime), 280, 750, N'劉慧玲', N'0982031925', N'嘉義市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A282/2018/3/25 上午 03:03:03', CAST(N'2018-03-25T03:03:03.000' AS DateTime), 282, 2400, N'林佩君', N'0925467860', N'屏東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A282/2019/5/9 下午 08:06:06', CAST(N'2019-05-09T20:06:06.000' AS DateTime), 282, 2700, N'羅宜君', N'0913311541', N'苗栗縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A283/2018/5/8 上午 03:45:45', CAST(N'2018-05-08T03:45:45.000' AS DateTime), 283, 9334, N'賴國賢', N'0901076093', N'臺東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A284/2018/12/25 上午 08:54:54', CAST(N'2018-12-25T08:54:54.000' AS DateTime), 284, 1820, N'駱怡婷', N'0901076093', N'基隆市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A284/2019/4/30 上午 06:40:40', CAST(N'2019-04-30T06:40:40.000' AS DateTime), 284, 150, N'周建良', N'0913311541', N'宜蘭縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A286/2019/2/25 上午 12:23:23', CAST(N'2019-02-25T00:23:23.000' AS DateTime), 286, 3500, N'吳慧君', N'0913311541', N'新竹市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A288/2019/3/22 上午 01:13:13', CAST(N'2019-03-22T01:13:13.000' AS DateTime), 288, 6160, N'郭毅榮', N'0982031925', N'臺中市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A289/2018/5/30 上午 10:08:08', CAST(N'2018-05-30T10:08:08.000' AS DateTime), 289, 2420, N'余怡君', N'0945851025', N'新竹市')
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A298/2018/4/8 下午 04:21:21', CAST(N'2018-04-08T16:21:21.000' AS DateTime), 298, 5040, N'王俊豪', N'0997753939', N'嘉義市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A298/2018/9/21 上午 05:47:47', CAST(N'2018-09-21T05:47:47.000' AS DateTime), 298, 10024, N'林佳欣', N'0997753939', N'新竹縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A30/2018/7/1 上午 10:48:48', CAST(N'2018-07-01T10:48:48.000' AS DateTime), 30, 130, N'鄭淑君', N'0901076093', N'苗栗縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A302/2019/3/5 上午 01:27:27', CAST(N'2019-03-05T01:27:27.000' AS DateTime), 302, 3780, N'傅淑萍', N'0913311541', N'雲林縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A303/2018/10/14 下午 05:08:08', CAST(N'2018-10-14T17:08:08.000' AS DateTime), 303, 1080, N'', N'0939934596', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A303/2018/12/16 下午 02:23:23', CAST(N'2018-12-16T14:23:23.000' AS DateTime), 303, 1755, N'廖雅婷', N'0919720878', N'嘉義縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A304/2019/5/26 下午 01:25:25', CAST(N'2019-05-26T13:25:25.000' AS DateTime), 304, 3520, N'沈介松', N'0913311541', N'金門縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A306/2018/7/23 上午 03:26:26', CAST(N'2018-07-23T03:26:26.000' AS DateTime), 306, 2200, N'', N'0939934596', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A307/2018/11/25 下午 01:20:20', CAST(N'2018-11-25T13:20:20.000' AS DateTime), 307, 5220, N'酆國偉', N'0982031925', N'嘉義市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A309/2018/2/19 上午 11:47:47', CAST(N'2018-02-19T11:47:47.000' AS DateTime), 309, 2240, N'許雅婷', N'0935824303', N'澎湖縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A31/2018/1/31 上午 03:29:29', CAST(N'2018-01-31T03:29:29.000' AS DateTime), 31, 2835, N'彭筱以', N'0941941704', N'臺中市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A310/2018/10/28 上午 07:54:54', CAST(N'2018-10-28T07:54:54.000' AS DateTime), 310, 1300, N'陳心怡', N'0901076093', N'金門縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A314/2018/9/13 上午 11:22:22', CAST(N'2018-09-13T11:22:22.000' AS DateTime), 314, 3590, N'郭季欣', N'0913092178', N'臺北市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A315/2018/7/4 下午 08:10:10', CAST(N'2018-07-04T20:10:10.000' AS DateTime), 315, 178, N'黃佳蓉', N'0935824303', N'臺中市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A317/2018/2/21 下午 05:16:16', CAST(N'2018-02-21T17:16:16.000' AS DateTime), 317, 1760, N'王淑婷', N'0982031925', N'澎湖縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A32/2018/7/30 下午 10:18:18', CAST(N'2018-07-30T22:18:18.000' AS DateTime), 32, 3060, N'陳輝煌', N'0982031925', N'臺中市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A32/2019/2/22 上午 12:42:42', CAST(N'2019-02-22T00:42:42.000' AS DateTime), 32, 600, N'袁淑慧', N'0913311541', N'新北市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A320/2018/2/25 上午 03:39:39', CAST(N'2018-02-25T03:39:39.000' AS DateTime), 320, 2080, N'陳家豪', N'0913311541', N'臺東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A320/2018/5/20 上午 04:00:00', CAST(N'2018-05-20T04:00:00.000' AS DateTime), 320, 1260, N'周宛南', N'0945851025', N'高雄市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A323/2019/2/6 上午 05:54:54', CAST(N'2019-02-06T05:54:54.000' AS DateTime), 323, 3150, N'吳志豪', N'0997753939', N'花蓮縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A324/2018/5/29 上午 12:59:59', CAST(N'2018-05-29T00:59:59.000' AS DateTime), 324, 1320, N'蔡賢', N'0913311541', N'金門縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A329/2019/6/7 上午 02:02:02', CAST(N'2019-06-07T02:02:02.000' AS DateTime), 329, 6960, N'盧曉蘭', N'0904584498', N'臺中市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A33/2018/4/1 上午 03:31:31', CAST(N'2018-04-01T03:31:31.000' AS DateTime), 33, 6720, N'', N'0939934596', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A33/2019/2/22 下午 02:47:47', CAST(N'2019-02-22T14:47:47.000' AS DateTime), 33, 358, N'黎文雄', N'0913311541', N'臺南市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A33/2019/5/3 下午 02:12:12', CAST(N'2019-05-03T14:12:12.000' AS DateTime), 33, 4308, N'潘淑芬', N'0925467860', N'嘉義市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A330/2018/5/8 上午 07:18:18', CAST(N'2018-05-08T07:18:18.000' AS DateTime), 330, 4350, N'黃華釗', N'0901076093', N'高雄市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A331/2018/6/8 下午 04:04:04', CAST(N'2018-06-08T16:04:04.000' AS DateTime), 331, 9360, N'陳毅和', N'0913311541', N'基隆市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A333/2018/4/6 上午 08:35:35', CAST(N'2018-04-06T08:35:35.000' AS DateTime), 333, 4180, N'賴火靖', N'0941941704', N'高雄市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A333/2019/2/22 上午 08:27:27', CAST(N'2019-02-22T08:27:27.000' AS DateTime), 333, 8616, N'張惠雯', N'0901076093', N'新竹縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A335/2018/7/13 上午 11:34:34', CAST(N'2018-07-13T11:34:34.000' AS DateTime), 335, 1800, N'蘇智旺', N'0982031925', N'新竹市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A338/2018/7/29 下午 04:21:21', CAST(N'2018-07-29T16:21:21.000' AS DateTime), 338, 3360, N'黃冠富', N'0913311541', N'臺南市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A338/2019/1/25 上午 01:21:21', CAST(N'2019-01-25T01:21:21.000' AS DateTime), 338, 2000, N'葉婷婷', N'0982031925', N'臺東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A339/2019/5/7 上午 03:54:54', CAST(N'2019-05-07T03:54:54.000' AS DateTime), 339, 2400, N'張旺興', N'0997753939', N'高雄市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A34/2018/3/15 下午 05:32:32', CAST(N'2018-03-15T17:32:32.000' AS DateTime), 34, 3750, N'周曉虎', N'0945851025', N'雲林縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A340/2018/9/18 上午 12:59:59', CAST(N'2018-09-18T00:59:59.000' AS DateTime), 340, 8257, N'林怡伶', N'0997753939', N'臺南市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A342/2018/10/16 上午 12:27:27', CAST(N'2018-10-16T00:27:27.000' AS DateTime), 342, 2420, N'林志強', N'0913311541', N'臺中市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A344/2018/5/21 下午 07:29:29', CAST(N'2018-05-21T19:29:29.000' AS DateTime), 344, 2670, N'徐宗勇', N'0982031925', N'花蓮縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A346/2019/3/7 上午 10:50:50', CAST(N'2019-03-07T10:50:50.000' AS DateTime), 346, 3080, N'張佳蓉', N'0941941704', N'南投縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A347/2018/11/13 上午 04:05:05', CAST(N'2018-11-13T04:05:05.000' AS DateTime), 347, 5026, N'廖佳琪', N'0925467860', N'臺東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A35/2018/8/31 上午 10:23:23', CAST(N'2018-08-31T10:23:23.000' AS DateTime), 35, 358, N'李琬婷', N'0913311541', N'臺東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A352/2019/1/13 上午 09:40:40', CAST(N'2019-01-13T09:40:40.000' AS DateTime), 352, 2520, N'林建元', N'0913311541', N'臺北市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A353/2018/5/21 下午 06:47:47', CAST(N'2018-05-21T18:47:47.000' AS DateTime), 353, 540, N'蔡榮宏', N'0913092178', N'澎湖縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A354/2018/4/11 上午 08:14:14', CAST(N'2018-04-11T08:14:14.000' AS DateTime), 354, 4480, N'許婉婷', N'0982031925', N'臺南市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A355/2018/4/5 下午 12:21:21', CAST(N'2018-04-05T12:21:21.000' AS DateTime), 355, 2160, N'李淑貞', N'0914562576', N'臺北市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A357/2019/1/12 上午 02:22:22', CAST(N'2019-01-12T02:22:22.000' AS DateTime), 357, 240, N'林育南', N'0982031925', N'新竹縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A358/2018/7/22 上午 02:19:19', CAST(N'2018-07-22T02:19:19.000' AS DateTime), 358, 1980, N'林欣儀', N'0925467860', N'彰化縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A358/2018/8/8 上午 12:41:41', CAST(N'2018-08-08T00:41:41.000' AS DateTime), 358, 3360, N'余美漢', N'0904584498', N'雲林縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A36/2019/1/20 下午 09:27:27', CAST(N'2019-01-20T21:27:27.000' AS DateTime), 36, 2100, N'何雅惠', N'0982031925', N'苗栗縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A363/2019/3/27 下午 06:42:42', CAST(N'2019-03-27T18:42:42.000' AS DateTime), 363, 1145, N'黃呈土', N'0913311541', N'高雄市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A364/2019/5/18 上午 01:08:08', CAST(N'2019-05-18T01:08:08.000' AS DateTime), 364, 220, N'方雅雯', N'0997753939', N'宜蘭縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A367/2018/6/19 下午 08:01:01', CAST(N'2018-06-19T20:01:01.000' AS DateTime), 367, 2970, N'李淑娟', N'0941941704', N'高雄市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A368/2018/11/2 下午 07:55:55', CAST(N'2018-11-02T19:55:55.000' AS DateTime), 368, 180, N'林宜芳', N'0901076093', N'宜蘭縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A369/2019/1/29 下午 10:52:52', CAST(N'2019-01-29T22:52:52.000' AS DateTime), 369, 2513, N'尤善綠', N'0935824303', N'臺南市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A37/2018/7/3 上午 06:23:23', CAST(N'2018-07-03T06:23:23.000' AS DateTime), 37, 2800, N'張佩君', N'0982031925', N'花蓮縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A371/2018/1/17 上午 08:30:30', CAST(N'2018-01-17T08:30:30.000' AS DateTime), 371, 3000, N'楊婉婷', N'0982031925', N'高雄市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A372/2018/8/31 下午 09:43:43', CAST(N'2018-08-31T21:43:43.000' AS DateTime), 372, 6500, N'陸雅玲', N'0913311541', N'桃園市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A376/2018/3/30 上午 04:46:46', CAST(N'2018-03-30T04:46:46.000' AS DateTime), 376, 800, N'王英正', N'0913311541', N'雲林縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A377/2018/11/7 上午 07:28:28', CAST(N'2018-11-07T07:28:28.000' AS DateTime), 377, 2700, N'謝罔市', N'0982031925', N'桃園市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A377/2018/12/19 上午 09:00:00', CAST(N'2018-12-19T09:00:00.000' AS DateTime), 377, 3080, N'賴陽木', N'0982031925', N'新北市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A378/2018/1/19 下午 01:18:18', CAST(N'2018-01-19T13:18:18.000' AS DateTime), 378, 4628, N'黎筱婷', N'0913311541', N'苗栗縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A381/2018/8/11 上午 12:48:48', CAST(N'2018-08-11T00:48:48.000' AS DateTime), 381, 4500, N'何建宏', N'0997753939', N'高雄市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A382/2018/4/27 上午 10:17:17', CAST(N'2018-04-27T10:17:17.000' AS DateTime), 382, 1900, N'陳佳怡', N'0945851025', N'花蓮縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A387/2018/10/9 上午 02:27:27', CAST(N'2018-10-09T02:27:27.000' AS DateTime), 387, 6103, N'林宜君', N'0982031925', N'宜蘭縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A389/2018/2/24 上午 07:40:40', CAST(N'2018-02-24T07:40:40.000' AS DateTime), 389, 1540, N'陳乃啟', N'0913092178', N'屏東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A389/2019/3/29 上午 12:36:36', CAST(N'2019-03-29T00:36:36.000' AS DateTime), 389, 3222, N'陳雅玲', N'0913311541', N'臺東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A39/2018/9/18 下午 01:59:59', CAST(N'2018-09-18T13:59:59.000' AS DateTime), 39, 3640, N'韓立偉', N'0913311541', N'南投縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A390/2018/11/20 上午 03:47:47', CAST(N'2018-11-20T03:47:47.000' AS DateTime), 390, 750, N'許政育', N'0982031925', N'新竹市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A390/2018/5/12 下午 02:42:42', CAST(N'2018-05-12T14:42:42.000' AS DateTime), 390, 3360, N'陳佳玲', N'0945319208', N'屏東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A390/2019/5/21 上午 07:20:20', CAST(N'2019-05-21T07:20:20.000' AS DateTime), 390, 7560, N'梁怡伶', N'0913311541', N'臺東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A392/2019/3/19 下午 10:50:50', CAST(N'2019-03-19T22:50:50.000' AS DateTime), 392, 2080, N'趙淑惠', N'0982031925', N'澎湖縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A392/2019/4/19 上午 08:51:51', CAST(N'2019-04-19T08:51:51.000' AS DateTime), 392, 6086, N'李志偉', N'0925467860', N'苗栗縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A396/2019/1/22 下午 05:11:11', CAST(N'2019-01-22T17:11:11.000' AS DateTime), 396, 2430, N'安郁婷', N'0982031925', N'苗栗縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A397/2018/4/29 上午 02:42:42', CAST(N'2018-04-29T02:42:42.000' AS DateTime), 397, 3780, N'陸耀輝', N'0945319208', N'臺中市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A397/2019/4/4 上午 06:27:27', CAST(N'2019-04-04T06:27:27.000' AS DateTime), 397, 1800, N'吳怡芬', N'0982031925', N'金門縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A398/2018/11/23 上午 04:13:13', CAST(N'2018-11-23T04:13:13.000' AS DateTime), 398, 5750, N'楊淑華', N'0901076093', N'屏東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A4/2018/6/6 上午 10:53:53', CAST(N'2018-06-06T10:53:53.000' AS DateTime), 4, 4840, N'郭奕綠', N'0913311541', N'新竹市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A4/2019/1/6 下午 07:04:04', CAST(N'2019-01-06T19:04:04.000' AS DateTime), 4, 1890, N'韓淑娟', N'0997753939', N'澎湖縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A401/2019/2/26 上午 06:34:34', CAST(N'2019-02-26T06:34:34.000' AS DateTime), 401, 718, N'周佳雯', N'0913311541', N'南投縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A402/2018/8/28 上午 04:58:58', CAST(N'2018-08-28T04:58:58.000' AS DateTime), 402, 600, N'闕淑君', N'0941941704', N'澎湖縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A405/2018/5/15 下午 08:46:46', CAST(N'2018-05-15T20:46:46.000' AS DateTime), 405, 780, N'賴宜芳', N'0935824303', N'新竹市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A406/2019/3/3 上午 06:57:57', CAST(N'2019-03-03T06:57:57.000' AS DateTime), 406, 458, N'洪佩君', N'0913311541', N'花蓮縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A407/2018/12/9 下午 09:07:07', CAST(N'2018-12-09T21:07:07.000' AS DateTime), 407, 1620, N'謝慶英', N'0982031925', N'高雄市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A408/2019/4/6 上午 01:01:01', CAST(N'2019-04-06T01:01:01.000' AS DateTime), 408, 1540, N'趙惟法', N'0913311541', N'雲林縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A409/2018/9/10 下午 05:03:03', CAST(N'2018-09-10T17:03:03.000' AS DateTime), 409, 7560, N'楊惠如', N'0982031925', N'臺中市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A409/2019/3/8 上午 05:03:03', CAST(N'2019-03-08T05:03:03.000' AS DateTime), 409, 560, N'曾家瑋', N'0913311541', N'澎湖縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A410/2018/2/23 上午 06:38:38', CAST(N'2018-02-23T06:38:38.000' AS DateTime), 410, 2880, N'郭欣宜', N'0935824303', N'苗栗縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A411/2018/12/3 上午 03:10:10', CAST(N'2018-12-03T03:10:10.000' AS DateTime), 411, 4272, N'侯榮啟', N'0904584498', N'臺中市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A411/2018/3/22 下午 12:09:09', CAST(N'2018-03-22T12:09:09.000' AS DateTime), 411, 1400, N'曹亞齊', N'0913311541', N'花蓮縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A412/2018/3/21 上午 03:36:36', CAST(N'2018-03-21T03:36:36.000' AS DateTime), 412, 1960, N'李賢惠', N'0982031925', N'澎湖縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A412/2018/8/29 上午 02:36:36', CAST(N'2018-08-29T02:36:36.000' AS DateTime), 412, 5320, N'許雅惠', N'0904584498', N'宜蘭縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A413/2019/1/18 上午 06:28:28', CAST(N'2019-01-18T06:28:28.000' AS DateTime), 413, 2340, N'陳佳玲', N'0997753939', N'臺北市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A414/2018/10/5 下午 06:44:44', CAST(N'2018-10-05T18:44:44.000' AS DateTime), 414, 1500, N'吳宗翰', N'0997753939', N'新竹縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A414/2019/2/20 上午 03:31:31', CAST(N'2019-02-20T03:31:31.000' AS DateTime), 414, 1980, N'陳佳蓉', N'0982031925', N'金門縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A414/2019/4/8 上午 10:05:05', CAST(N'2019-04-08T10:05:05.000' AS DateTime), 414, 2990, N'郭詩金', N'0982031925', N'高雄市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A418/2019/5/5 下午 04:37:37', CAST(N'2019-05-05T16:37:37.000' AS DateTime), 418, 7560, N'', N'0939934596', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A42/2018/4/26 下午 12:56:56', CAST(N'2018-04-26T12:56:56.000' AS DateTime), 42, 4296, N'劉重生', N'0901076093', N'新北市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A420/2018/9/1 下午 10:53:53', CAST(N'2018-09-01T22:53:53.000' AS DateTime), 420, 2640, N'林怡晴', N'0997753939', N'高雄市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A421/2018/5/29 下午 04:07:07', CAST(N'2018-05-29T16:07:07.000' AS DateTime), 421, 2970, N'張詩婷', N'0997753939', N'苗栗縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A421/2019/1/4 下午 05:04:04', CAST(N'2019-01-04T17:04:04.000' AS DateTime), 421, 3780, N'施宗憲', N'0945851025', N'臺南市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A425/2018/3/20 上午 10:57:57', CAST(N'2018-03-20T10:57:57.000' AS DateTime), 425, 8975, N'林思良', N'0901076093', N'花蓮縣')
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A426/2018/9/2 下午 02:07:07', CAST(N'2018-09-02T14:07:07.000' AS DateTime), 426, 3250, N'周國隆', N'0913311541', N'澎湖縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A427/2018/10/17 上午 03:37:37', CAST(N'2018-10-17T03:37:37.000' AS DateTime), 427, 7920, N'鄭新靖', N'0901076093', N'新竹縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A431/2018/9/6 下午 09:40:40', CAST(N'2018-09-06T21:40:40.000' AS DateTime), 431, 8950, N'洪佩君', N'0997753939', N'臺北市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A432/2019/1/5 下午 06:14:14', CAST(N'2019-01-05T18:14:14.000' AS DateTime), 432, 1650, N'陳榮成', N'0925467860', N'新竹市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A435/2018/12/14 上午 01:39:39', CAST(N'2018-12-14T01:39:39.000' AS DateTime), 435, 3222, N'陳雅雯', N'0901076093', N'臺北市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A435/2019/2/17 下午 01:31:31', CAST(N'2019-02-17T13:31:31.000' AS DateTime), 435, 2880, N'錢淑惠', N'0982031925', N'苗栗縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A435/2019/4/28 下午 09:16:16', CAST(N'2019-04-28T21:16:16.000' AS DateTime), 435, 6500, N'謝彥廷', N'0925467860', N'花蓮縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A438/2018/2/2 下午 02:51:51', CAST(N'2018-02-02T14:51:51.000' AS DateTime), 438, 7200, N'璩枝華', N'0982031925', N'臺東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A438/2018/3/13 上午 08:30:30', CAST(N'2018-03-13T08:30:30.000' AS DateTime), 438, 540, N'馬志明', N'0982031925', N'基隆市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A438/2018/5/14 下午 06:42:42', CAST(N'2018-05-14T18:42:42.000' AS DateTime), 438, 3120, N'侯惠玲', N'0935824303', N'金門縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A439/2019/5/5 上午 02:07:07', CAST(N'2019-05-05T02:07:07.000' AS DateTime), 439, 2700, N'林行鴻', N'0997753939', N'新竹市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A44/2018/1/21 上午 09:34:34', CAST(N'2018-01-21T09:34:34.000' AS DateTime), 44, 1120, N'賴俊賢', N'0913311541', N'南投縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A44/2018/12/17 上午 06:38:38', CAST(N'2018-12-17T06:38:38.000' AS DateTime), 44, 350, N'林宜珊', N'0997753939', N'屏東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A441/2018/12/16 下午 04:10:10', CAST(N'2018-12-16T16:10:10.000' AS DateTime), 441, 712, N'賴哲法', N'0982031925', N'金門縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A441/2019/6/4 下午 04:49:49', CAST(N'2019-06-04T16:49:49.000' AS DateTime), 441, 3240, N'詹宜芳', N'0982031925', N'屏東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A442/2018/1/24 下午 04:50:50', CAST(N'2018-01-24T16:50:50.000' AS DateTime), 442, 2200, N'李伯秋', N'0982031925', N'臺東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A442/2018/5/16 上午 12:20:20', CAST(N'2018-05-16T00:20:20.000' AS DateTime), 442, 2835, N'余景琪', N'0913311541', N'臺東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A442/2019/4/9 下午 01:24:24', CAST(N'2019-04-09T13:24:24.000' AS DateTime), 442, 1300, N'甘寶貴', N'0913311541', N'桃園市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A443/2018/2/18 下午 04:36:36', CAST(N'2018-02-18T16:36:36.000' AS DateTime), 443, 3915, N'黃雅玲', N'0901076093', N'彰化縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A444/2018/3/20 上午 09:57:57', CAST(N'2018-03-20T09:57:57.000' AS DateTime), 444, 840, N'許雅如', N'0901076093', N'南投縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A444/2018/8/13 上午 04:28:28', CAST(N'2018-08-13T04:28:28.000' AS DateTime), 444, 1440, N'陳惠如', N'0901076093', N'宜蘭縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A446/2018/6/9 下午 01:05:05', CAST(N'2018-06-09T13:05:05.000' AS DateTime), 446, 3360, N'蕭東智', N'0982031925', N'桃園市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A446/2019/1/26 下午 03:59:59', CAST(N'2019-01-26T15:59:59.000' AS DateTime), 446, 1700, N'陳婉婷', N'0982031925', N'宜蘭縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A446/2019/3/10 下午 01:24:24', CAST(N'2019-03-10T13:24:24.000' AS DateTime), 446, 1000, N'', N'0939934596', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A447/2018/1/23 下午 07:41:41', CAST(N'2018-01-23T19:41:41.000' AS DateTime), 447, 4200, N'黃心怡', N'0982031925', N'雲林縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A447/2018/2/27 上午 01:51:51', CAST(N'2018-02-27T01:51:51.000' AS DateTime), 447, 1700, N'張淑美', N'0913311541', N'桃園市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A447/2019/3/4 上午 10:45:45', CAST(N'2019-03-04T10:45:45.000' AS DateTime), 447, 1350, N'陳淑君', N'0913311541', N'雲林縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A450/2019/3/22 下午 09:50:50', CAST(N'2019-03-22T21:50:50.000' AS DateTime), 450, 1800, N'江雅怡', N'0914562576', N'宜蘭縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A451/2018/7/26 下午 08:10:10', CAST(N'2018-07-26T20:10:10.000' AS DateTime), 451, 1050, N'童建龍', N'0913311541', N'臺東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A452/2019/3/2 上午 10:26:26', CAST(N'2019-03-02T10:26:26.000' AS DateTime), 452, 4320, N'黃建宏', N'0913311541', N'新竹縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A454/2019/5/30 上午 11:56:56', CAST(N'2019-05-30T11:56:56.000' AS DateTime), 454, 900, N'葉怡慧', N'0935824303', N'新北市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A455/2018/5/31 下午 08:40:40', CAST(N'2018-05-31T20:40:40.000' AS DateTime), 455, 3900, N'楊淑君', N'0913311541', N'宜蘭縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A455/2018/9/7 上午 11:38:38', CAST(N'2018-09-07T11:38:38.000' AS DateTime), 455, 1080, N'王怡木', N'0925467860', N'嘉義縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A456/2018/9/15 下午 05:36:36', CAST(N'2018-09-15T17:36:36.000' AS DateTime), 456, 2400, N'', N'0939934596', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A458/2018/9/7 上午 10:31:31', CAST(N'2018-09-07T10:31:31.000' AS DateTime), 458, 500, N'王怡木', N'0997753939', N'臺中市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A460/2018/2/9 下午 09:54:54', CAST(N'2018-02-09T21:54:54.000' AS DateTime), 460, 4350, N'吳雅萍', N'0913311541', N'嘉義縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A461/2018/8/30 上午 07:38:38', CAST(N'2018-08-30T07:38:38.000' AS DateTime), 461, 110, N'李筱娟', N'0997753939', N'嘉義市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A462/2018/4/3 上午 02:49:49', CAST(N'2018-04-03T02:49:49.000' AS DateTime), 462, 960, N'林淑芬', N'0913092178', N'高雄市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A462/2018/4/4 下午 06:26:26', CAST(N'2018-04-04T18:26:26.000' AS DateTime), 462, 2730, N'蔡靜雯', N'0997753939', N'臺北市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A462/2018/5/3 上午 04:35:35', CAST(N'2018-05-03T04:35:35.000' AS DateTime), 462, 1485, N'林宜君', N'0935824303', N'臺中市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A464/2018/4/29 下午 03:05:05', CAST(N'2018-04-29T15:05:05.000' AS DateTime), 464, 1250, N'林青東', N'0913311541', N'雲林縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A465/2018/11/17 上午 05:57:57', CAST(N'2018-11-17T05:57:57.000' AS DateTime), 465, 390, N'姜淑珍', N'0901076093', N'苗栗縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A465/2018/11/25 上午 10:09:09', CAST(N'2018-11-25T10:09:09.000' AS DateTime), 465, 3040, N'郭佳慧', N'0982031925', N'花蓮縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A465/2019/5/18 下午 10:13:13', CAST(N'2019-05-18T22:13:13.000' AS DateTime), 465, 900, N'梁怡慧', N'0913311541', N'臺東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A466/2018/4/13 下午 07:58:58', CAST(N'2018-04-13T19:58:58.000' AS DateTime), 466, 7920, N'黃佳宏', N'0982031925', N'桃園市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A467/2018/10/13 下午 08:21:21', CAST(N'2018-10-13T20:21:21.000' AS DateTime), 467, 1755, N'許宜蓁', N'0901076093', N'金門縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A468/2019/2/15 下午 10:53:53', CAST(N'2019-02-15T22:53:53.000' AS DateTime), 468, 2565, N'藍靜怡', N'0997753939', N'基隆市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A469/2018/2/23 上午 05:36:36', CAST(N'2018-02-23T05:36:36.000' AS DateTime), 469, 6821, N'許思穎', N'0982031925', N'嘉義市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A47/2019/4/9 下午 07:25:25', CAST(N'2019-04-09T19:25:25.000' AS DateTime), 47, 3750, N'朱雅芳', N'0901076093', N'金門縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A471/2018/10/9 下午 12:55:55', CAST(N'2018-10-09T12:55:55.000' AS DateTime), 471, 4400, N'黃怡婷', N'0982031925', N'澎湖縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A472/2018/4/6 下午 06:51:51', CAST(N'2018-04-06T18:51:51.000' AS DateTime), 472, 4350, N'陳松漢', N'0982031925', N'新北市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A474/2018/5/16 下午 10:01:01', CAST(N'2018-05-16T22:01:01.000' AS DateTime), 474, 3150, N'童書蜂', N'0982031925', N'南投縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A474/2019/1/17 上午 09:00:00', CAST(N'2019-01-17T09:00:00.000' AS DateTime), 474, 3080, N'謝佩蓉', N'0913311541', N'苗栗縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A476/2018/5/15 下午 09:59:59', CAST(N'2018-05-15T21:59:59.000' AS DateTime), 476, 2500, N'謝美玲', N'0935824303', N'雲林縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A477/2018/3/31 上午 01:54:54', CAST(N'2018-03-31T01:54:54.000' AS DateTime), 477, 1100, N'王宗翰', N'0982031925', N'新北市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A478/2019/4/5 上午 01:48:48', CAST(N'2019-04-05T01:48:48.000' AS DateTime), 478, 3590, N'曾仁瑤', N'0913311541', N'彰化縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A479/2018/10/13 下午 09:38:38', CAST(N'2018-10-13T21:38:38.000' AS DateTime), 479, 1170, N'和詩瑤', N'0913311541', N'新北市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A479/2019/5/22 上午 10:28:28', CAST(N'2019-05-22T10:28:28.000' AS DateTime), 479, 2100, N'陳治虎', N'0997753939', N'高雄市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A48/2018/11/27 上午 10:14:14', CAST(N'2018-11-27T10:14:14.000' AS DateTime), 48, 2420, N'黃怡慧', N'0901076093', N'臺南市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A480/2019/1/7 下午 09:44:44', CAST(N'2019-01-07T21:44:44.000' AS DateTime), 480, 1350, N'姜玉芬', N'0982031925', N'苗栗縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A482/2019/2/20 下午 10:34:34', CAST(N'2019-02-20T22:34:34.000' AS DateTime), 482, 260, N'林欣怡', N'0925467860', N'臺東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A483/2018/11/27 上午 08:48:48', CAST(N'2018-11-27T08:48:48.000' AS DateTime), 483, 358, N'林智偉', N'0901076093', N'宜蘭縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A483/2019/4/10 下午 08:17:17', CAST(N'2019-04-10T20:17:17.000' AS DateTime), 483, 1424, N'曾志偉', N'0913311541', N'金門縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A484/2018/1/27 下午 08:19:19', CAST(N'2018-01-27T20:19:19.000' AS DateTime), 484, 300, N'楊景倫', N'0941941704', N'基隆市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A484/2019/4/27 上午 05:24:24', CAST(N'2019-04-27T05:24:24.000' AS DateTime), 484, 2700, N'林信意', N'0913311541', N'苗栗縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A486/2018/10/17 下午 04:09:09', CAST(N'2018-10-17T16:09:09.000' AS DateTime), 486, 180, N'馬佳玲', N'0945851025', N'金門縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A487/2019/3/3 上午 05:09:09', CAST(N'2019-03-03T05:09:09.000' AS DateTime), 487, 3120, N'徐鎮紹', N'0997753939', N'苗栗縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A488/2018/9/14 下午 06:25:25', CAST(N'2018-09-14T18:25:25.000' AS DateTime), 488, 595, N'張亦瑤', N'0901076093', N'南投縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A488/2019/2/17 下午 08:47:47', CAST(N'2019-02-17T20:47:47.000' AS DateTime), 488, 5040, N'皮佩君', N'0982031925', N'基隆市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A489/2018/7/26 上午 06:07:07', CAST(N'2018-07-26T06:07:07.000' AS DateTime), 489, 4400, N'劉雅萍', N'0935824303', N'嘉義縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A49/2018/3/11 下午 03:03:03', CAST(N'2018-03-11T15:03:03.000' AS DateTime), 49, 3000, N'鄭怡玲', N'0982031925', N'高雄市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A490/2019/5/6 下午 10:33:33', CAST(N'2019-05-06T22:33:33.000' AS DateTime), 490, 2520, N'陳佩君', N'0913311541', N'澎湖縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A495/2018/2/4 上午 01:57:57', CAST(N'2018-02-04T01:57:57.000' AS DateTime), 495, 2700, N'曾靜怡', N'0982031925', N'臺中市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A495/2018/5/31 下午 02:18:18', CAST(N'2018-05-31T14:18:18.000' AS DateTime), 495, 2520, N'吳行新', N'0901076093', N'臺南市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A495/2018/6/12 下午 09:59:59', CAST(N'2018-06-12T21:59:59.000' AS DateTime), 495, 4200, N'沈家豪', N'0901076093', N'臺東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A495/2019/5/19 下午 07:32:32', CAST(N'2019-05-19T19:32:32.000' AS DateTime), 495, 4320, N'王雅鈴', N'0997753939', N'花蓮縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A496/2018/7/22 上午 09:43:43', CAST(N'2018-07-22T09:43:43.000' AS DateTime), 496, 3960, N'陳毅和', N'0913311541', N'嘉義市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A496/2018/8/27 下午 12:15:15', CAST(N'2018-08-27T12:15:15.000' AS DateTime), 496, 1068, N'趙惟法', N'0901076093', N'澎湖縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A498/2018/2/15 下午 07:10:10', CAST(N'2018-02-15T19:10:10.000' AS DateTime), 498, 1500, N'陳榮成', N'0997753939', N'桃園市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A498/2019/1/9 下午 05:11:11', CAST(N'2019-01-09T17:11:11.000' AS DateTime), 498, 2600, N'林俊豪', N'0913311541', N'新北市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A499/2018/10/21 下午 04:58:58', CAST(N'2018-10-21T16:58:58.000' AS DateTime), 499, 6412, N'李紫仁', N'0913311541', N'南投縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A499/2018/4/19 下午 12:41:41', CAST(N'2018-04-19T12:41:41.000' AS DateTime), 499, 400, N'蔣家瑋', N'0925467860', N'彰化縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A499/2018/4/26 下午 01:20:20', CAST(N'2018-04-26T13:20:20.000' AS DateTime), 499, 6240, N'黃一月', N'0982031925', N'南投縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A499/2018/6/12 上午 03:00:00', CAST(N'2018-06-12T03:00:00.000' AS DateTime), 499, 3450, N'楊嘉慧', N'0982031925', N'高雄市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A53/2018/5/11 上午 05:03:03', CAST(N'2018-05-11T05:03:03.000' AS DateTime), 53, 2430, N'林雅慧', N'0945319208', N'基隆市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A55/2018/1/27 上午 07:47:47', CAST(N'2018-01-27T07:47:47.000' AS DateTime), 55, 2160, N'楊明哲', N'0982031925', N'金門縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A55/2018/11/9 下午 06:35:35', CAST(N'2018-11-09T18:35:35.000' AS DateTime), 55, 4320, N'吳馨儀', N'0982031925', N'臺中市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A55/2019/3/30 上午 09:54:54', CAST(N'2019-03-30T09:54:54.000' AS DateTime), 55, 360, N'戴雅雯', N'0901076093', N'新竹市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A57/2018/11/11 上午 02:38:38', CAST(N'2018-11-11T02:38:38.000' AS DateTime), 57, 4350, N'王鴻水', N'0982031925', N'花蓮縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A59/2018/6/10 下午 10:24:24', CAST(N'2018-06-10T22:24:24.000' AS DateTime), 59, 2000, N'藍佩珊', N'0997753939', N'嘉義縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A62/2018/10/21 上午 07:46:46', CAST(N'2018-10-21T07:46:46.000' AS DateTime), 62, 5400, N'竺雅萍', N'0982031925', N'宜蘭縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A63/2019/1/27 下午 06:36:36', CAST(N'2019-01-27T18:36:36.000' AS DateTime), 63, 3190, N'葉心怡', N'0913311541', N'臺東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A64/2018/1/26 上午 08:01:01', CAST(N'2018-01-26T08:01:01.000' AS DateTime), 64, 1300, N'吳初維', N'0982031925', N'澎湖縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A64/2019/1/31 上午 11:04:04', CAST(N'2019-01-31T11:04:04.000' AS DateTime), 64, 2520, N'李愛春', N'0997753939', N'新竹縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A65/2018/11/1 上午 08:13:13', CAST(N'2018-11-01T08:13:13.000' AS DateTime), 65, 2430, N'芮佩穎', N'0982031925', N'嘉義市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A66/2019/5/14 下午 08:57:57', CAST(N'2019-05-14T20:57:57.000' AS DateTime), 66, 3600, N'袁詩富', N'0919720878', N'澎湖縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A69/2018/10/18 上午 04:08:08', CAST(N'2018-10-18T04:08:08.000' AS DateTime), 69, 2210, N'蔡怡婷', N'0913311541', N'臺東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A7/2018/1/28 上午 06:59:59', CAST(N'2018-01-28T06:59:59.000' AS DateTime), 7, 1500, N'杭欣宜', N'0913311541', N'雲林縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A7/2019/5/19 下午 02:35:35', CAST(N'2019-05-19T14:35:35.000' AS DateTime), 7, 3450, N'林語禮', N'0997753939', N'高雄市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A71/2019/4/17 下午 07:41:41', CAST(N'2019-04-17T19:41:41.000' AS DateTime), 71, 300, N'黃靜宜', N'0982031925', N'新北市')
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A72/2019/1/23 下午 01:55:55', CAST(N'2019-01-23T13:55:55.000' AS DateTime), 72, 1560, N'蔡輝煌', N'0982031925', N'臺東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A72/2019/4/26 下午 04:02:02', CAST(N'2019-04-26T16:02:02.000' AS DateTime), 72, 2492, N'彭宜君', N'0913311541', N'臺南市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A77/2018/2/18 上午 11:14:14', CAST(N'2018-02-18T11:14:14.000' AS DateTime), 77, 1620, N'陳文傑', N'0913311541', N'桃園市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A77/2018/2/2 上午 12:05:05', CAST(N'2018-02-02T00:05:05.000' AS DateTime), 77, 1920, N'林一建', N'0901076093', N'新竹縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A78/2018/6/11 上午 05:12:12', CAST(N'2018-06-11T05:12:12.000' AS DateTime), 78, 3420, N'童小佩', N'0913311541', N'花蓮縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A80/2018/7/26 上午 11:54:54', CAST(N'2018-07-26T11:54:54.000' AS DateTime), 80, 3740, N'王玉婷', N'0982031925', N'花蓮縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A81/2019/1/23 下午 07:05:05', CAST(N'2019-01-23T19:05:05.000' AS DateTime), 81, 300, N'金嘉玲', N'0901076093', N'臺中市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A83/2018/12/26 下午 01:54:54', CAST(N'2018-12-26T13:54:54.000' AS DateTime), 83, 3780, N'吳宜君', N'0997753939', N'臺東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A84/2018/1/30 下午 05:28:28', CAST(N'2018-01-30T17:28:28.000' AS DateTime), 84, 180, N'楊依名', N'0982031925', N'苗栗縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A84/2018/4/4 上午 08:54:54', CAST(N'2018-04-04T08:54:54.000' AS DateTime), 84, 1000, N'黃建宏', N'0997753939', N'雲林縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A85/2018/11/10 下午 03:00:00', CAST(N'2018-11-10T15:00:00.000' AS DateTime), 85, 805, N'張志偉', N'0941941704', N'嘉義市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A85/2018/2/26 上午 07:04:04', CAST(N'2018-02-26T07:04:04.000' AS DateTime), 85, 100, N'陳淑慈', N'0913311541', N'彰化縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A86/2018/12/19 上午 07:29:29', CAST(N'2018-12-19T07:29:29.000' AS DateTime), 86, 5220, N'呂俊雄', N'0913311541', N'彰化縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A86/2019/3/23 下午 10:02:02', CAST(N'2019-03-23T22:02:02.000' AS DateTime), 86, 1320, N'李雅玲', N'0982031925', N'桃園市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A87/2019/3/3 下午 01:38:38', CAST(N'2019-03-03T13:38:38.000' AS DateTime), 87, 1080, N'郭蜂光', N'0913311541', N'嘉義市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A88/2018/6/28 下午 07:40:40', CAST(N'2018-06-28T19:40:40.000' AS DateTime), 88, 8280, N'劉慈隆', N'0935824303', N'南投縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A90/2019/5/10 下午 06:11:11', CAST(N'2019-05-10T18:11:11.000' AS DateTime), 90, 2880, N'陳欣儀', N'0913311541', N'宜蘭縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A91/2018/5/25 上午 06:21:21', CAST(N'2018-05-25T06:21:21.000' AS DateTime), 91, 1650, N'邱佳玲', N'0913311541', N'苗栗縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A91/2019/2/15 上午 03:55:55', CAST(N'2019-02-15T03:55:55.000' AS DateTime), 91, 3645, N'劉盈歡', N'0913311541', N'花蓮縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A93/2018/11/29 下午 07:49:49', CAST(N'2018-11-29T19:49:49.000' AS DateTime), 93, 2860, N'吳雅慧', N'0997753939', N'臺東縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A93/2018/3/21 上午 06:58:58', CAST(N'2018-03-21T06:58:58.000' AS DateTime), 93, 1760, N'黃玉真', N'0982031925', N'臺中市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A94/2018/1/11 上午 05:30:30', CAST(N'2018-01-11T05:30:30.000' AS DateTime), 94, 8950, N'林佩珊', N'0935824303', N'宜蘭縣')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A96/2019/2/20 下午 05:47:47', CAST(N'2019-02-20T17:47:47.000' AS DateTime), 96, 10411, N'吳萱哲', N'0904584498', N'桃園市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'A99/2018/10/3 上午 06:41:41', CAST(N'2018-10-03T06:41:41.000' AS DateTime), 99, 2240, N'張國勇', N'0982031925', N'新竹市')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'a57a2184-c1d1-4470-81ca-db5755e23308', CAST(N'2019-06-13T11:59:42.197' AS DateTime), 4, 956, N'', N'', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'b0e76d52-91f1-4616-96f5-5ec7c50b4074', CAST(N'2019-06-22T00:42:38.800' AS DateTime), 166, 330, N'WonChang', N'0987654321', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'b0fb17b9-4b49-4826-8e0e-001ecdb6ba78', CAST(N'2019-06-17T15:20:12.687' AS DateTime), 166, 578, N'WonChang', N'0987654321', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'b4ae2c69-c238-4cc6-9881-060f7053b982', CAST(N'2019-06-17T15:15:00.347' AS DateTime), 166, 756, N'WonChang', N'0987654321', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'c0bb0002-1e27-4772-bb25-360b97c65a8d', CAST(N'2019-06-22T01:27:26.820' AS DateTime), 166, 756, N'WonChang', N'0987654321', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'c53b330c-385a-4d1a-8950-44755e03d139', CAST(N'2019-06-14T19:26:09.527' AS DateTime), 165, 718, N'', N'', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'd10a2cc9-f0b1-4328-baeb-d460660c1ef2', CAST(N'2019-06-18T05:23:33.593' AS DateTime), 165, 716, N'test', N'0912345678', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'e9350ba6-7531-44a6-bcf3-435e166ff1f0', CAST(N'2019-06-16T17:04:49.240' AS DateTime), 165, 911, N'', N'', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'ef51a574-50c9-4eee-824f-c86158697226', CAST(N'2019-06-13T15:27:13.057' AS DateTime), 165, 718, N'dsasdf', N'adfasdf', N'adsfsadf')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'f672cd7f-973f-4970-8aa1-bffe30b69119', CAST(N'2019-06-17T17:20:39.917' AS DateTime), 165, 358, N'test', N'0912345678', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'f79158e5-8125-423c-b784-7f415f4b4403', CAST(N'2019-06-22T01:17:53.473' AS DateTime), 165, 480, N'test', N'0912345678', N'')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [MemberID], [TotalPrice], [ReceiverName], [ReceiverPhone], [ReceiverAddress]) VALUES (N'fb2d2758-4ac8-4871-a58b-7e3c0893afc1', CAST(N'2019-06-20T16:03:00.257' AS DateTime), 166, 330, N'WonChang', N'0987654321', N'')
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [ProductPhotoS], [ProductPhotoL], [Rating], [ClickRate], [Discontinued], [ProductIntroduction], [ProductDescription]) VALUES (1, N'凱薩沙拉', 60, N'/img/Appectizer/165x163/Appectizer_02.jpg', N'/img/Appectizer/800X600/Appectizer_02.jpg', NULL, NULL, NULL, N'炎熱時就該吃生菜輕飲食清爽一夏！', N'凱薩生菜棒的內容物有紅蘿蔔、豆薯、小黃瓜，一口咬下時有著清爽鮮甜的滋味，
一旁還有主廚調製的蜂蜜芥末醬可沾取，口感別於一般的生菜沙拉，吃起來創意又特別。')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [ProductPhotoS], [ProductPhotoL], [Rating], [ClickRate], [Discontinued], [ProductIntroduction], [ProductDescription]) VALUES (2, N'黃金薯條', 35, N'/img/Appectizer/165x163/Appectizer_06.jpg', N'/img/Appectizer/800X600/Appectizer_06.jpg', NULL, NULL, NULL, N'金黃酥脆的薯條口感讓人大呼過癮。', N'薯條炸得金黃酥脆，咬一口外酥內軟的口感讓人大呼過癮。')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [ProductPhotoS], [ProductPhotoL], [Rating], [ClickRate], [Discontinued], [ProductIntroduction], [ProductDescription]) VALUES (3, N'焗烤肉醬薯條', 100, N'/img/Appectizer/165x163/Appectizer_10.jpg', N'/img/Appectizer/800X600/Appectizer_10.jpg', NULL, NULL, NULL, N'將起司薯條夾起，濃郁的起司讓我欲罷不能。', N'焗烤肉醬薯條淋上肉醬汁，再鋪上一層濃厚的焗烤起司，上桌時起司香撲鼻而來，令人垂涎三尺。
薯條一口咬下，炸的金黃酥脆，融合著肉醬和起司的香氣，吃完不覺得膩口，就連小朋友也愛不釋手。')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [ProductPhotoS], [ProductPhotoL], [Rating], [ClickRate], [Discontinued], [ProductIntroduction], [ProductDescription]) VALUES (4, N'墨西哥香辣菲力牛肉披薩', 358, N'/img/Main/165x163/Main_01.jpg', N'/img/Main/800X600/Main_01.jpg', NULL, NULL, NULL, N'採窯烤披薩做法餅皮酥脆可口讓人愛不釋手。', N'採用南義拿坡里手工窯烤披薩作法，藉由窯內高溫，將水分及甜味鎖在麵糰裡， 讓餅皮口感外酥內軟。 番茄紅醬鋪底，與墨西哥辣椒的微辣鹹香，鮮嫩多汁的牛菲力， 在莫札瑞拉起士的襯托下更顯甜味！')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [ProductPhotoS], [ProductPhotoL], [Rating], [ClickRate], [Discontinued], [ProductIntroduction], [ProductDescription]) VALUES (5, N'炭烤沙朗心牛排與脆皮雞腿排', 360, N'/img/Main/165x163/Main_02.jpg', N'/img/Main/800X600/Main_02.jpg', NULL, NULL, NULL, N'上選牛排與雞腿排配上鮮甜大干貝，大滿足！', N'散發肉汁香氣還同時呈現明亮色澤的牛排與雞腿排， 鮮甜的大干貝和馬鈴薯、什錦鮮菇也不遜色 牛排與雞腿排使用先烤後煎更增添了風味香氣外 還保留了豐富肉汁讓人真的會一口接一口！無一處不美味啊！')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [ProductPhotoS], [ProductPhotoL], [Rating], [ClickRate], [Discontinued], [ProductIntroduction], [ProductDescription]) VALUES (6, N'紹興酒奶油雞腿排', 229, N'/img/Main/165x163/Main_04.jpg', N'/img/Main/800X600/Main_04.jpg', NULL, NULL, NULL, N'紹興酒的香氣撲鼻而來，濃郁滋味誰能抵抗！', N'有別於一般義大利麵的白醬口味，選用紹興酒醃製入味的去骨雞腿排，大口咬下時濃郁的紹興酒香直衝腦波，肉質吃起來微甜嫩口，再配上奶油白醬，麵條吃起來軟中帶Q讓人無法控制！')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [ProductPhotoS], [ProductPhotoL], [Rating], [ClickRate], [Discontinued], [ProductIntroduction], [ProductDescription]) VALUES (7, N'軟殼蟹蛤蜊花義大利麵佐香檸奶汁', 359, N'/img/Main/165x163/Main_07.jpg', N'/img/Main/800X600/Main_07.jpg', NULL, NULL, NULL, N'軟殼蟹炸後，香酥不油膩還有卡滋卡滋的聲響。', N'義大利麵佐香檸奶汁，還有蛤仔的鮮味，麵條彈牙吃起來鹹香帶鮮的滋味，口味算好吃。滿滿一盤的蛤蜊鋪，每顆蛤蜊好新鮮，令人越吃越過癮。')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [ProductPhotoS], [ProductPhotoL], [Rating], [ClickRate], [Discontinued], [ProductIntroduction], [ProductDescription]) VALUES (8, N'紅醬蕃茄綜合海鮮麵', 178, N'/img/Main/165x163/Main_05.jpg', N'/img/Main/800X600/Main_07.jpg', NULL, NULL, NULL, N'選用天使紅蝦、花枝、蛤仔、蔬菜，料多味美！', N'
紅醬選用蕃茄整顆搗碎製作成蕃茄湖，最後再加入鹽巴調味製作而成。麵條拌入紅醬，吃進嘴裡鹹香帶酸甜，麵條咬起來軟硬適中，有彈性且入味!')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [ProductPhotoS], [ProductPhotoL], [Rating], [ClickRate], [Discontinued], [ProductIntroduction], [ProductDescription]) VALUES (9, N'夏多內花蜜醋', 240, N'/img/Beverage/165x163/Beverage_03.jpg', N'/img/Beverage/800X600/Beverage_03.jpg', NULL, NULL, NULL, N'在夏多內海邊，浪花般的氛圍與酸甜一起縈繞！', N'由少見光臘樹花蜜與夏多內白酒醋的調配，一上桌時以RONA極薄酒杯讓花香氣在震盪搖晃時，將上面泡沫跟花蜜醋一起入口，味蕾上呈現著酸酸甜甜的口感，喝起來滿是淡淡花香在口中縈繞，忍不住想獨自佔有！ ')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [ProductPhotoS], [ProductPhotoL], [Rating], [ClickRate], [Discontinued], [ProductIntroduction], [ProductDescription]) VALUES (10, N'蜜桃初戀泡泡', 110, N'/img/Beverage/165x163/Beverage_05.jpg', N'/img/Beverage/800X600/Beverage_05.jpg', NULL, NULL, NULL, N'沁涼透心的初戀泡泡是嚴選蜜桃口味', N'沁涼透心的初戀滋味泡泡是嚴選蜜桃口味，蜜桃香甜與氣泡水的結合，再加上清香檸檬片，一喝下去清涼爽口，口中的氣泡，更增添另一種口感。
')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [ProductPhotoS], [ProductPhotoL], [Rating], [ClickRate], [Discontinued], [ProductIntroduction], [ProductDescription]) VALUES (11, N'蜜釀鳳梨冰茶', 160, N'/img/Beverage/165x163/Beverage_08.jpg', N'/img/Beverage/800X600/Beverage_08.jpg', NULL, NULL, NULL, N'蜜釀鳳梨冰茶，微酸香甜口感，帶有清爽的滋味。', N'蜜釀鳳梨冰茶，微酸香甜口感，帶有清爽的滋味，喝完有一種解油膩的感覺。')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [ProductPhotoS], [ProductPhotoL], [Rating], [ClickRate], [Discontinued], [ProductIntroduction], [ProductDescription]) VALUES (12, N'季節水果茶', 130, N'/img/Beverage/165x163/Beverage_10.jpg', N'/img/Beverage/800X600/Beverage_10.jpg', NULL, NULL, NULL, N'清甜略帶微酸的口感，讓人想一接著一口。', N'這一季的繽紛水果茶運用冬季限定洛神醬與鳳梨醬為基底茶，自家手工熬煮鳳梨醬，再搭配新鮮檸檬汁、百香果、蘋果的融合，喝一口清甜而略帶微酸的口感，讓嘴裡有著豐富韻味，讓人想一接著一口。')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [ProductPhotoS], [ProductPhotoL], [Rating], [ClickRate], [Discontinued], [ProductIntroduction], [ProductDescription]) VALUES (13, N'橙花君度檸檬塔', 160, N'/img/Dessert/165x163/Dessert_01.jpg', N'/img/Dessert/800X600/Dessert_01.jpg', NULL, NULL, NULL, N'檸檬塔溫潤滑順口感,讓時間停留在這美好的記憶！', N'
這道檸檬塔選用皮飽滿柑橘香的黃檸檬與黃檸檬汁，加入香氣清新的橙花，再使用日本伊娜寒天，最後再以極薄的杏仁餡鋪底，烤時保留了水份，像是馬卡龍口感微帶黏牙，一口咬下酥脆鬆鬆的塔皮結合爽口溫潤的檸檬餡，整體口感清新甜酸，卻略帶淘氣的初春滋味。')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [ProductPhotoS], [ProductPhotoL], [Rating], [ClickRate], [Discontinued], [ProductIntroduction], [ProductDescription]) VALUES (14, N'巧克力慕斯', 135, N'/img/Dessert/165x163/Dessert_07.jpg', N'/img/Dessert/800X600/Dessert_07.jpg', NULL, NULL, NULL, N'頂級法芙娜巧克力佐樹梅粒點綴，少女的最愛！', N'巧克力慕斯選用70%的巧克力來製作，再加入樹梅粒點綴一些增加口感，蛋糕體本身口感較微濕潤，配上高濃度70%巧克力，一入口有著苦甜滋味，口感並不會太甜，多重層次口感是許多少女們的最愛！')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [ProductPhotoS], [ProductPhotoL], [Rating], [ClickRate], [Discontinued], [ProductIntroduction], [ProductDescription]) VALUES (15, N'玫瑰生乳酪蛋糕', 150, N'/img/Dessert/165x163/Dessert_08.jpg', N'/img/Dessert/800X600/Dessert_08.jpg', NULL, NULL, NULL, N'夢幻繽紛的玫瑰與馬斯卡彭起司的結合', N'手工製作的玫瑰生乳酪蛋糕，特別選用法國進口原料與美國品牌的奶油起司製作而成，吃起來帶有玫瑰的甜馨香氣，口感柔細滑順又輕盈，一旁還有劃上浪漫的愛心，讓人好捨不得吃啊！')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [ProductPhotoS], [ProductPhotoL], [Rating], [ClickRate], [Discontinued], [ProductIntroduction], [ProductDescription]) VALUES (16, N'冰淇淋QQ鬆餅', 150, N'/img/Dessert/165x163/Dessert_10.jpg', N'/img/Dessert/800X600/Dessert_10.jpg', NULL, NULL, NULL, N'酥脆餅皮配上ＱＱ麻糬，交織出驚喜滋味。', N'法式手工鮮奶油與冰淇淋完美合體，讓鬆餅看起來更是霸氣有風味，鬆餅外層吃起來微微的酥脆，內餡蛋糕體配上ＱＱ麻糬，吃起來是扎實的口感且很厚實，一口吃下交織出驚喜滋味。')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [ProductPhotoS], [ProductPhotoL], [Rating], [ClickRate], [Discontinued], [ProductIntroduction], [ProductDescription]) VALUES (17, N'蛋糕三重奏', 150, N'/img/Dessert/165x163/Dessert_15.jpg', N'/img/Dessert/800X600/Dessert_15.jpg', NULL, NULL, NULL, N'超高CP值，一次吃到三種口味的蛋糕', N'檸檬磅蛋糕使用檸檬與白糖製成，在嘴裡散發檸檬迷人香氣，口味上清香卻不會甜膩。 起司蛋糕嚴選濃郁起司配上酥脆餅皮，大口咬下層層堆疊的起司味，吃起來清爽、柔滑，咬起來著入口即化有著絕妙口感，蜂蜜蛋糕獨特的厚實口感，大口咬下舌尖上散發濃郁的蜂蜜及蛋香，香氣十足直得細細品味！')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [ProductPhotoS], [ProductPhotoL], [Rating], [ClickRate], [Discontinued], [ProductIntroduction], [ProductDescription]) VALUES (18, N'核桃燕麥鬆餅', 180, N'/img/Dessert/165x163/Dessert_16.jpg', N'/img/Dessert/800X600/Dessert_16.jpg', NULL, NULL, NULL, N'嚴選燕麥片、原味核桃，綿密紮實又彈牙的口感！', N'桃燕麥鬆餅嚴選燕麥片、原味核桃，自己調配製作，再擺上鮮奶油與水果。一口咬下嘴裡滿滿的核桃香，吃起來有核桃爽口的堅果香，沾著一旁鮮奶油口感綿密還能享受紮實又彈牙的口感。')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [ProductPhotoS], [ProductPhotoL], [Rating], [ClickRate], [Discontinued], [ProductIntroduction], [ProductDescription]) VALUES (20, N'特調玉米濃湯', 180, N'/img/Soup/165x163/Soup_01.jpg', N'/img/Soup/800x600/Soup_01.jpg', NULL, NULL, NULL, N'滿滿的玉米、洋蔥香甜滋味，自然鮮濃。', N'特調玉米濃湯加入新鮮玉米、鮮奶、洋蔥、奶油等食材是喝得到食材原味的湯，吃得到食物原形讓口感好滿足、同時感受得到自然香濃。')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [ProductPhotoS], [ProductPhotoL], [Rating], [ClickRate], [Discontinued], [ProductIntroduction], [ProductDescription]) VALUES (21, N'意大利番茄湯', 180, N'/img/Soup/165x163/Soup_02.jpg', N'/img/Soup/800x600/Soup_02.jpg', NULL, NULL, NULL, N'新鮮成熟和美味的西紅柿，自然健康。', N'意大利番茄湯需要新鮮成熟和美味的西紅柿。搭配上橄欖油，青蔥，大蒜，白葡萄酒。與意大利草藥等香料均勻混合慢火煮成的番茄醬，美味又好吃。')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [ProductPhotoS], [ProductPhotoL], [Rating], [ClickRate], [Discontinued], [ProductIntroduction], [ProductDescription]) VALUES (22, N'意大利婚禮湯', 280, N'/img/Soup/165x163/Soup_03.jpg', N'/img/Soup/800x600/Soup_03.jpg', NULL, NULL, NULL, N'與婚禮無關，儘管常在意大利婚禮上作為開胃菜。', N'豐盛的綠色和豐富的鹹味肉類的幸福婚姻，通過肉類的濃郁的口感加上香濃口的雞湯以及多又兼康的蔬菜，融合在一個輕盈而令人滿意美味佳餚！')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [ProductPhotoS], [ProductPhotoL], [Rating], [ClickRate], [Discontinued], [ProductIntroduction], [ProductDescription]) VALUES (23, N'原味白豆湯', 220, N'/img/Soup/165x163/Soup_04.jpg', N'/img/Soup/800x600/Soup_04.jpg', NULL, NULL, NULL, N'白豆湯配方都是用新鮮的原料製成，使其真正新鮮。', N'簡單好吃的素食白豆湯為主廚使用新鮮的食材製成，從頭開始製慢火熬煮作蔬菜湯使其真正新鮮甘甜。自製的蔬菜湯底使其他單純的素食更加純樸好吃。')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [ProductPhotoS], [ProductPhotoL], [Rating], [ClickRate], [Discontinued], [ProductIntroduction], [ProductDescription]) VALUES (24, N'香料蔬菜湯', 250, N'/img/Soup/165x163/Soup_05.jpg', N'/img/Soup/800x600/Soup_05.jpg', NULL, NULL, NULL, N'香料蔬菜湯以蕃茄和香草為基底，具有療癒效果的熱湯!', N'香料蔬菜湯以蕃茄和香草為基底不需任何調味，嚐來滋味鮮甜自然，彷彿走進一片種滿有機蔬果的田園，喝來溫暖滿足！')
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Satisfaction] ON 

INSERT [dbo].[Satisfaction] ([id], [desk], [date], [startTime], [endTime], [numPeople], [idx], [numSatisfactory], [numUnsatisfactory], [numMedium]) VALUES (1, 1, N'20190607', N'1602', N'1735', N'3 ', N's1.0s0.999s0.997', 3, 0, 0)
INSERT [dbo].[Satisfaction] ([id], [desk], [date], [startTime], [endTime], [numPeople], [idx], [numSatisfactory], [numUnsatisfactory], [numMedium]) VALUES (2, 2, N'20190607', N'1143', N'1328', N'5 ', N's1.0s0.559s1.0s1.0s1.0', 4, 0, 1)
INSERT [dbo].[Satisfaction] ([id], [desk], [date], [startTime], [endTime], [numPeople], [idx], [numSatisfactory], [numUnsatisfactory], [numMedium]) VALUES (3, 3, N'20190607', N'1217', N'1401', N'3 ', N's0.917s1.0s0.0', 2, 1, 0)
INSERT [dbo].[Satisfaction] ([id], [desk], [date], [startTime], [endTime], [numPeople], [idx], [numSatisfactory], [numUnsatisfactory], [numMedium]) VALUES (16, 5, N'20190607', N'1803', N'1950', N'4 ', N's0.0s0.917s0.0s0.0', 1, 3, 0)
INSERT [dbo].[Satisfaction] ([id], [desk], [date], [startTime], [endTime], [numPeople], [idx], [numSatisfactory], [numUnsatisfactory], [numMedium]) VALUES (27, NULL, NULL, NULL, NULL, N'12', NULL, 352, 43, 122)
INSERT [dbo].[Satisfaction] ([id], [desk], [date], [startTime], [endTime], [numPeople], [idx], [numSatisfactory], [numUnsatisfactory], [numMedium]) VALUES (45, 4, N'20190607', N'1728', N'1840', N'4 ', N's0.0s0.379s0.0s0.0', 0, 3, 1)
INSERT [dbo].[Satisfaction] ([id], [desk], [date], [startTime], [endTime], [numPeople], [idx], [numSatisfactory], [numUnsatisfactory], [numMedium]) VALUES (108, 1, N'20190626', N'1936', N'2052', N'2 ', N's0.964s0.794', 2, 0, 0)
SET IDENTITY_INSERT [dbo].[Satisfaction] OFF
USE [master]
GO
ALTER DATABASE [SMIT09] SET  READ_WRITE 
GO
