USE [ShopOnline]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/21/2021 12:11:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catolog]    Script Date: 5/21/2021 12:11:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catolog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Catolog_Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Catolog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Combo]    Script Date: 5/21/2021 12:11:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Combo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Combo_Name] [nvarchar](max) NULL,
	[ProductList] [nvarchar](max) NULL,
	[StartDay] [datetime2](7) NOT NULL,
	[EndDay] [datetime2](7) NOT NULL,
	[TotalMoney] [decimal](18, 2) NOT NULL,
	[Discount] [nvarchar](max) NULL,
	[DiscountMoney] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Combo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 5/21/2021 12:11:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Gender] [bit] NOT NULL,
	[BirthDay] [datetime2](7) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[JoinDate] [datetime2](7) NOT NULL,
	[IsNew] [bit] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 5/21/2021 12:11:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Gender] [bit] NOT NULL,
	[BirthDay] [datetime2](7) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[JoinDate] [datetime2](7) NOT NULL,
	[Role_ID] [int] NOT NULL,
	[RoleID] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 5/21/2021 12:11:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Invoice_Name] [nvarchar](max) NULL,
	[Customer_Id] [int] NOT NULL,
	[Shipper_Id] [int] NOT NULL,
	[TotalMoney] [decimal](18, 2) NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[CustomerAddress] [nvarchar](max) NULL,
	[ShipDate] [datetime2](7) NOT NULL,
	[ShipperID] [int] NULL,
	[CustomerID] [int] NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceDetail]    Script Date: 5/21/2021 12:11:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceDetail](
	[Invoice_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Combo_ID] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[ProductID] [int] NULL,
	[InvoiceID] [int] NULL,
	[ComboID] [int] NULL,
 CONSTRAINT [PK_InvoiceDetail] PRIMARY KEY CLUSTERED 
(
	[Invoice_ID] ASC,
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/21/2021 12:11:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_Name] [nvarchar](max) NULL,
	[Catalog_id] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[price] [decimal](18, 2) NOT NULL,
	[CatologID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 5/21/2021 12:11:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetail](
	[Product_ID] [int] NOT NULL,
	[Product_Detail] [nvarchar](max) NULL,
 CONSTRAINT [PK_ProductDetail] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 5/21/2021 12:11:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImage](
	[Product_ID] [int] NOT NULL,
	[Image] [nvarchar](450) NOT NULL,
	[ProductID] [int] NULL,
 CONSTRAINT [PK_ProductImage] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC,
	[Image] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/21/2021 12:11:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Role_Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Storage]    Script Date: 5/21/2021 12:11:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Storage](
	[Product_Id] [nvarchar](450) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[importDate] [datetime2](7) NOT NULL,
	[exportDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Storage] PRIMARY KEY CLUSTERED 
(
	[Product_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210505043442_add_10_tables', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210505054413_modify_ProductId_in_Storage_table', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210506015525_add_ProductImage_table', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210509014144_add-ProductImage-table', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210512034410_delete-ProductDetail-table', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210512034636_re-add-ProductDetail-table', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210515021918_change-Detail-property-to-Product_Detail-property', N'5.0.6')
GO
SET IDENTITY_INSERT [dbo].[Catolog] ON 

INSERT [dbo].[Catolog] ([ID], [Catolog_Name]) VALUES (1, N'Laptop')
INSERT [dbo].[Catolog] ([ID], [Catolog_Name]) VALUES (2, N'Bàn phím')
INSERT [dbo].[Catolog] ([ID], [Catolog_Name]) VALUES (3, N'Chuột')
INSERT [dbo].[Catolog] ([ID], [Catolog_Name]) VALUES (4, N'Loa ngoài')
INSERT [dbo].[Catolog] ([ID], [Catolog_Name]) VALUES (5, N'Ổ cứng di động')
INSERT [dbo].[Catolog] ([ID], [Catolog_Name]) VALUES (6, N'Ram')
SET IDENTITY_INSERT [dbo].[Catolog] OFF
GO
SET IDENTITY_INSERT [dbo].[Combo] ON 

INSERT [dbo].[Combo] ([ID], [Combo_Name], [ProductList], [StartDay], [EndDay], [TotalMoney], [Discount], [DiscountMoney]) VALUES (2, N'Laptop Acer Aspire 5 + Ổ cứng SSD 500GB', N'4,20', CAST(N'2021-05-20T00:00:00.0000000' AS DateTime2), CAST(N'2021-06-20T00:00:00.0000000' AS DateTime2), CAST(17080000.00 AS Decimal(18, 2)), N'10%', CAST(1700000.00 AS Decimal(18, 2)))
INSERT [dbo].[Combo] ([ID], [Combo_Name], [ProductList], [StartDay], [EndDay], [TotalMoney], [Discount], [DiscountMoney]) VALUES (3, N'combo san pham a', N'4,5,24', CAST(N'2021-05-20T00:00:00.0000000' AS DateTime2), CAST(N'2021-06-12T00:00:00.0000000' AS DateTime2), CAST(20000000.00 AS Decimal(18, 2)), N'10%', CAST(2000000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Combo] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([ID], [Username], [Password], [FirstName], [LastName], [Gender], [BirthDay], [Address], [JoinDate], [IsNew]) VALUES (2, N'hoanglinh', N'123abc', N'Nguyễn', N'Hoàng Linh', 0, CAST(N'1997-01-06T00:00:00.0000000' AS DateTime2), N'212/58 Thoại Ngọc Hầu, P.Phú Thạnh, Q.Tân Phú, HCM', CAST(N'2021-05-16T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Customer] ([ID], [Username], [Password], [FirstName], [LastName], [Gender], [BirthDay], [Address], [JoinDate], [IsNew]) VALUES (3, N'phucnguyen', N'123abc', N'Nguyễn', N'Hoàng Phúc', 1, CAST(N'1993-08-03T00:00:00.0000000' AS DateTime2), N'178 C?ng Hòa, Q.Tân Bình, HCM', CAST(N'2021-05-17T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Customer] ([ID], [Username], [Password], [FirstName], [LastName], [Gender], [BirthDay], [Address], [JoinDate], [IsNew]) VALUES (4, N'ankhanh1', N'123abc', N'Nguyen', N'An Khánh', 0, CAST(N'2000-05-10T00:00:00.0000000' AS DateTime2), N'178 Trường Chinh, Q.Tân Bình, Hồ Chí Minh', CAST(N'2021-05-20T00:00:00.0000000' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([ID], [Username], [Password], [FirstName], [LastName], [Gender], [BirthDay], [Address], [JoinDate], [Role_ID], [RoleID]) VALUES (1, N'linhnguyen', N'123abc', N'Nguyễn', N'Hoàng Linh', 0, CAST(N'1997-01-06T00:00:00.0000000' AS DateTime2), N'48 Nguyễn Sơn', CAST(N'2021-05-06T00:00:00.0000000' AS DateTime2), 2, NULL)
INSERT [dbo].[Employee] ([ID], [Username], [Password], [FirstName], [LastName], [Gender], [BirthDay], [Address], [JoinDate], [Role_ID], [RoleID]) VALUES (2, N'vanhuy', N'xyz123', N'Văn Huy', N'Nguyễn', 0, CAST(N'2000-05-10T00:00:00.0000000' AS DateTime2), N'48 Nguyễn Sơn, Tân Phú, Hồ Chí Minh', CAST(N'2021-05-20T00:00:00.0000000' AS DateTime2), 3, NULL)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([ID], [Invoice_Name], [Customer_Id], [Shipper_Id], [TotalMoney], [CreateDate], [CustomerAddress], [ShipDate], [ShipperID], [CustomerID]) VALUES (37, N'hóa đơn thường', 4, 2, CAST(17080000.00 AS Decimal(18, 2)), CAST(N'2021-05-20T09:34:34.0000000' AS DateTime2), N'178 Trường Chinh, Q.Tân Bình, Hồ Chí Minh', CAST(N'2021-05-20T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[Invoice] ([ID], [Invoice_Name], [Customer_Id], [Shipper_Id], [TotalMoney], [CreateDate], [CustomerAddress], [ShipDate], [ShipperID], [CustomerID]) VALUES (38, N'Hóa đơn trực tuyến', 2, 0, CAST(29560000.00 AS Decimal(18, 2)), CAST(N'2021-05-20T10:44:28.8206897' AS DateTime2), N'212/58 Thoại Ngọc Hầu, P.Phú Thạnh, Q.Tân Phú, HCM', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[Invoice] ([ID], [Invoice_Name], [Customer_Id], [Shipper_Id], [TotalMoney], [CreateDate], [CustomerAddress], [ShipDate], [ShipperID], [CustomerID]) VALUES (39, N'Hóa đơn trực tuyến', 2, 0, CAST(11790000.00 AS Decimal(18, 2)), CAST(N'2021-05-20T10:56:47.3568508' AS DateTime2), N'212/58 Thoại Ngọc Hầu, P.Phú Thạnh, Q.Tân Phú, HCM', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[Invoice] ([ID], [Invoice_Name], [Customer_Id], [Shipper_Id], [TotalMoney], [CreateDate], [CustomerAddress], [ShipDate], [ShipperID], [CustomerID]) VALUES (40, N'Hóa đơn trực tuyến', 2, 0, CAST(11790000.00 AS Decimal(18, 2)), CAST(N'2021-05-20T10:57:10.7688100' AS DateTime2), N'212/58 Thoại Ngọc Hầu, P.Phú Thạnh, Q.Tân Phú, HCM', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[Invoice] ([ID], [Invoice_Name], [Customer_Id], [Shipper_Id], [TotalMoney], [CreateDate], [CustomerAddress], [ShipDate], [ShipperID], [CustomerID]) VALUES (41, N'Hóa đơn trực tuyến', 2, 0, CAST(19290000.00 AS Decimal(18, 2)), CAST(N'2021-05-20T10:57:44.7148967' AS DateTime2), N'212/58 Thoại Ngọc Hầu, P.Phú Thạnh, Q.Tân Phú, HCM', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[Invoice] ([ID], [Invoice_Name], [Customer_Id], [Shipper_Id], [TotalMoney], [CreateDate], [CustomerAddress], [ShipDate], [ShipperID], [CustomerID]) VALUES (42, N'Hóa đơn trực tuyến', 2, 0, CAST(19290000.00 AS Decimal(18, 2)), CAST(N'2021-05-20T10:59:15.1471613' AS DateTime2), N'212/58 Thoại Ngọc Hầu, P.Phú Thạnh, Q.Tân Phú, HCM', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[Invoice] ([ID], [Invoice_Name], [Customer_Id], [Shipper_Id], [TotalMoney], [CreateDate], [CustomerAddress], [ShipDate], [ShipperID], [CustomerID]) VALUES (43, N'Hóa đơn trực tuyến', 2, 0, CAST(13590000.00 AS Decimal(18, 2)), CAST(N'2021-05-20T11:00:05.5846011' AS DateTime2), N'212/58 Thoại Ngọc Hầu, P.Phú Thạnh, Q.Tân Phú, HCM', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[Invoice] ([ID], [Invoice_Name], [Customer_Id], [Shipper_Id], [TotalMoney], [CreateDate], [CustomerAddress], [ShipDate], [ShipperID], [CustomerID]) VALUES (44, N'Hóa đơn trực tuyến', 2, 0, CAST(19290000.00 AS Decimal(18, 2)), CAST(N'2021-05-20T11:02:56.9680920' AS DateTime2), N'212/58 Thoại Ngọc Hầu, P.Phú Thạnh, Q.Tân Phú, HCM', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[Invoice] ([ID], [Invoice_Name], [Customer_Id], [Shipper_Id], [TotalMoney], [CreateDate], [CustomerAddress], [ShipDate], [ShipperID], [CustomerID]) VALUES (45, N'Hóa đơn trực tuyến', 2, 0, CAST(11790000.00 AS Decimal(18, 2)), CAST(N'2021-05-20T11:05:10.8009072' AS DateTime2), N'212/58 Thoại Ngọc Hầu, P.Phú Thạnh, Q.Tân Phú, HCM', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[Invoice] ([ID], [Invoice_Name], [Customer_Id], [Shipper_Id], [TotalMoney], [CreateDate], [CustomerAddress], [ShipDate], [ShipperID], [CustomerID]) VALUES (46, N'Hóa đơn trực tuyến', 2, 0, CAST(13590000.00 AS Decimal(18, 2)), CAST(N'2021-05-20T11:06:48.3141844' AS DateTime2), N'212/58 Thoại Ngọc Hầu, P.Phú Thạnh, Q.Tân Phú, HCM', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[Invoice] ([ID], [Invoice_Name], [Customer_Id], [Shipper_Id], [TotalMoney], [CreateDate], [CustomerAddress], [ShipDate], [ShipperID], [CustomerID]) VALUES (47, N'Hóa đơn trực tuyến', 2, 0, CAST(19290000.00 AS Decimal(18, 2)), CAST(N'2021-05-20T11:07:22.7604799' AS DateTime2), N'212/58 Thoại Ngọc Hầu, P.Phú Thạnh, Q.Tân Phú, HCM', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[Invoice] ([ID], [Invoice_Name], [Customer_Id], [Shipper_Id], [TotalMoney], [CreateDate], [CustomerAddress], [ShipDate], [ShipperID], [CustomerID]) VALUES (48, N'Hóa đơn trực tuyến', 2, 0, CAST(12290000.00 AS Decimal(18, 2)), CAST(N'2021-05-20T11:07:51.1273689' AS DateTime2), N'212/58 Thoại Ngọc Hầu, P.Phú Thạnh, Q.Tân Phú, HCM', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[Invoice] ([ID], [Invoice_Name], [Customer_Id], [Shipper_Id], [TotalMoney], [CreateDate], [CustomerAddress], [ShipDate], [ShipperID], [CustomerID]) VALUES (49, N'Hóa đơn trực tuyến', 2, 0, CAST(12290000.00 AS Decimal(18, 2)), CAST(N'2021-05-20T11:09:18.6498280' AS DateTime2), N'212/58 Thoại Ngọc Hầu, P.Phú Thạnh, Q.Tân Phú, HCM', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[Invoice] ([ID], [Invoice_Name], [Customer_Id], [Shipper_Id], [TotalMoney], [CreateDate], [CustomerAddress], [ShipDate], [ShipperID], [CustomerID]) VALUES (50, N'Hóa đơn trực tuyến', 2, 0, CAST(11490000.00 AS Decimal(18, 2)), CAST(N'2021-05-20T11:18:02.1314730' AS DateTime2), N'212/58 Thoại Ngọc Hầu, P.Phú Thạnh, Q.Tân Phú, HCM', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[Invoice] ([ID], [Invoice_Name], [Customer_Id], [Shipper_Id], [TotalMoney], [CreateDate], [CustomerAddress], [ShipDate], [ShipperID], [CustomerID]) VALUES (51, N'Hóa đơn trực tuyến', 2, 0, CAST(19290000.00 AS Decimal(18, 2)), CAST(N'2021-05-20T11:19:08.9829725' AS DateTime2), N'212/58 Thoại Ngọc Hầu, P.Phú Thạnh, Q.Tân Phú, HCM', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[Invoice] ([ID], [Invoice_Name], [Customer_Id], [Shipper_Id], [TotalMoney], [CreateDate], [CustomerAddress], [ShipDate], [ShipperID], [CustomerID]) VALUES (52, N'Hóa đơn trực tuyến', 2, 0, CAST(12290000.00 AS Decimal(18, 2)), CAST(N'2021-05-20T11:25:09.4431808' AS DateTime2), N'123 Nguyễn Sơn', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[Invoice] ([ID], [Invoice_Name], [Customer_Id], [Shipper_Id], [TotalMoney], [CreateDate], [CustomerAddress], [ShipDate], [ShipperID], [CustomerID]) VALUES (53, N'Hóa đơn trực tuyến', 2, 0, CAST(11490000.00 AS Decimal(18, 2)), CAST(N'2021-05-20T11:25:20.5749025' AS DateTime2), N'212/58 Thoại Ngọc Hầu, P.Phú Thạnh, Q.Tân Phú, HCM', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[Invoice] ([ID], [Invoice_Name], [Customer_Id], [Shipper_Id], [TotalMoney], [CreateDate], [CustomerAddress], [ShipDate], [ShipperID], [CustomerID]) VALUES (54, N'hóa đơn thường', 4, 2, CAST(16580000.00 AS Decimal(18, 2)), CAST(N'2021-05-20T11:39:48.0000000' AS DateTime2), N'178 Trường Chinh, Q.Tân Bình, Hồ Chí Minh', CAST(N'2021-05-20T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[Invoice] ([ID], [Invoice_Name], [Customer_Id], [Shipper_Id], [TotalMoney], [CreateDate], [CustomerAddress], [ShipDate], [ShipperID], [CustomerID]) VALUES (55, N'Hóa đơn trực tuyến', 2, 0, CAST(39838000.00 AS Decimal(18, 2)), CAST(N'2021-05-20T14:51:16.3874864' AS DateTime2), N'123 Trường Chinh, Tân Bình, Hồ Chí Minh', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[Invoice] ([ID], [Invoice_Name], [Customer_Id], [Shipper_Id], [TotalMoney], [CreateDate], [CustomerAddress], [ShipDate], [ShipperID], [CustomerID]) VALUES (56, N'hóa đơn mua hàng', 4, 2, CAST(25380000.00 AS Decimal(18, 2)), CAST(N'2021-05-20T14:55:15.0000000' AS DateTime2), N'178 Trường Chinh, Q.Tân Bình, Hồ Chí Minh', CAST(N'2021-05-20T00:00:00.0000000' AS DateTime2), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Invoice] OFF
GO
INSERT [dbo].[InvoiceDetail] ([Invoice_ID], [Product_ID], [Combo_ID], [Amount], [Price], [ProductID], [InvoiceID], [ComboID]) VALUES (37, 4, 3, 1, CAST(13590000.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[InvoiceDetail] ([Invoice_ID], [Product_ID], [Combo_ID], [Amount], [Price], [ProductID], [InvoiceID], [ComboID]) VALUES (37, 20, 3, 1, CAST(3490000.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[InvoiceDetail] ([Invoice_ID], [Product_ID], [Combo_ID], [Amount], [Price], [ProductID], [InvoiceID], [ComboID]) VALUES (38, 5, 0, 2, CAST(11790000.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[InvoiceDetail] ([Invoice_ID], [Product_ID], [Combo_ID], [Amount], [Price], [ProductID], [InvoiceID], [ComboID]) VALUES (38, 23, 0, 2, CAST(2990000.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[InvoiceDetail] ([Invoice_ID], [Product_ID], [Combo_ID], [Amount], [Price], [ProductID], [InvoiceID], [ComboID]) VALUES (39, 5, 0, 1, CAST(11790000.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[InvoiceDetail] ([Invoice_ID], [Product_ID], [Combo_ID], [Amount], [Price], [ProductID], [InvoiceID], [ComboID]) VALUES (40, 5, 0, 1, CAST(11790000.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[InvoiceDetail] ([Invoice_ID], [Product_ID], [Combo_ID], [Amount], [Price], [ProductID], [InvoiceID], [ComboID]) VALUES (41, 6, 0, 1, CAST(19290000.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[InvoiceDetail] ([Invoice_ID], [Product_ID], [Combo_ID], [Amount], [Price], [ProductID], [InvoiceID], [ComboID]) VALUES (42, 6, 0, 1, CAST(19290000.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[InvoiceDetail] ([Invoice_ID], [Product_ID], [Combo_ID], [Amount], [Price], [ProductID], [InvoiceID], [ComboID]) VALUES (43, 4, 0, 1, CAST(13590000.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[InvoiceDetail] ([Invoice_ID], [Product_ID], [Combo_ID], [Amount], [Price], [ProductID], [InvoiceID], [ComboID]) VALUES (44, 6, 0, 1, CAST(19290000.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[InvoiceDetail] ([Invoice_ID], [Product_ID], [Combo_ID], [Amount], [Price], [ProductID], [InvoiceID], [ComboID]) VALUES (45, 5, 0, 1, CAST(11790000.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[InvoiceDetail] ([Invoice_ID], [Product_ID], [Combo_ID], [Amount], [Price], [ProductID], [InvoiceID], [ComboID]) VALUES (46, 4, 0, 1, CAST(13590000.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[InvoiceDetail] ([Invoice_ID], [Product_ID], [Combo_ID], [Amount], [Price], [ProductID], [InvoiceID], [ComboID]) VALUES (47, 6, 0, 1, CAST(19290000.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[InvoiceDetail] ([Invoice_ID], [Product_ID], [Combo_ID], [Amount], [Price], [ProductID], [InvoiceID], [ComboID]) VALUES (48, 7, 0, 1, CAST(12290000.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[InvoiceDetail] ([Invoice_ID], [Product_ID], [Combo_ID], [Amount], [Price], [ProductID], [InvoiceID], [ComboID]) VALUES (49, 7, 0, 1, CAST(12290000.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[InvoiceDetail] ([Invoice_ID], [Product_ID], [Combo_ID], [Amount], [Price], [ProductID], [InvoiceID], [ComboID]) VALUES (50, 9, 0, 1, CAST(11490000.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[InvoiceDetail] ([Invoice_ID], [Product_ID], [Combo_ID], [Amount], [Price], [ProductID], [InvoiceID], [ComboID]) VALUES (51, 6, 0, 1, CAST(19290000.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[InvoiceDetail] ([Invoice_ID], [Product_ID], [Combo_ID], [Amount], [Price], [ProductID], [InvoiceID], [ComboID]) VALUES (52, 7, 0, 1, CAST(12290000.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[InvoiceDetail] ([Invoice_ID], [Product_ID], [Combo_ID], [Amount], [Price], [ProductID], [InvoiceID], [ComboID]) VALUES (53, 9, 0, 1, CAST(11490000.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[InvoiceDetail] ([Invoice_ID], [Product_ID], [Combo_ID], [Amount], [Price], [ProductID], [InvoiceID], [ComboID]) VALUES (54, 1, 2, 1, CAST(15380000.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[InvoiceDetail] ([Invoice_ID], [Product_ID], [Combo_ID], [Amount], [Price], [ProductID], [InvoiceID], [ComboID]) VALUES (54, 4, 3, 1, CAST(13590000.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[InvoiceDetail] ([Invoice_ID], [Product_ID], [Combo_ID], [Amount], [Price], [ProductID], [InvoiceID], [ComboID]) VALUES (54, 5, 3, 3, CAST(35370000.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[InvoiceDetail] ([Invoice_ID], [Product_ID], [Combo_ID], [Amount], [Price], [ProductID], [InvoiceID], [ComboID]) VALUES (54, 6, 3, 1, CAST(19290000.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[InvoiceDetail] ([Invoice_ID], [Product_ID], [Combo_ID], [Amount], [Price], [ProductID], [InvoiceID], [ComboID]) VALUES (54, 23, 3, 1, CAST(2990000.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[InvoiceDetail] ([Invoice_ID], [Product_ID], [Combo_ID], [Amount], [Price], [ProductID], [InvoiceID], [ComboID]) VALUES (55, 6, 0, 2, CAST(19290000.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[InvoiceDetail] ([Invoice_ID], [Product_ID], [Combo_ID], [Amount], [Price], [ProductID], [InvoiceID], [ComboID]) VALUES (55, 15, 0, 2, CAST(629000.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[InvoiceDetail] ([Invoice_ID], [Product_ID], [Combo_ID], [Amount], [Price], [ProductID], [InvoiceID], [ComboID]) VALUES (56, 4, 3, 1, CAST(13590000.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[InvoiceDetail] ([Invoice_ID], [Product_ID], [Combo_ID], [Amount], [Price], [ProductID], [InvoiceID], [ComboID]) VALUES (56, 5, 3, 1, CAST(11790000.00 AS Decimal(18, 2)), NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Product_Name], [Catalog_id], [Amount], [price], [CatologID]) VALUES (4, N'Laptop Acer Aspire 5 A514 54 33WY i3 1115G4/4GB/256GB/Win10 (NX.A23SV.00J)', 1, 4, CAST(13590000.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Product] ([ID], [Product_Name], [Catalog_id], [Amount], [price], [CatologID]) VALUES (5, N'Laptop Lenovo IdeaPad Slim 3 15IIL05 i3 1005G1/4GB/512GB/Win10 (81WE0132VN)', 1, 21, CAST(11790000.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Product] ([ID], [Product_Name], [Catalog_id], [Amount], [price], [CatologID]) VALUES (6, N'Laptop Acer Aspire 7 A715 42G R4ST R5 5500U/8GB/256GB/4GB GTX1650/Win10 (NH.QAYSV.004)', 1, 20, CAST(19290000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Product] ([ID], [Product_Name], [Catalog_id], [Amount], [price], [CatologID]) VALUES (7, N'Laptop HP 15s du1108TU i3 10110U/4GB/256GB/Win10 (2Z6L7PA)', 1, 14, CAST(12290000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Product] ([ID], [Product_Name], [Catalog_id], [Amount], [price], [CatologID]) VALUES (8, N'Laptop HP 340s G7 i3 1005G1/4GB/256GB/Win10 (240Q4PA)', 1, 24, CAST(12390000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Product] ([ID], [Product_Name], [Catalog_id], [Amount], [price], [CatologID]) VALUES (9, N'Laptop Lenovo ThinkBook 15IIL i3 1005G1/4GB/512GB/Win10 (20SM00D9VN)', 1, 25, CAST(11490000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Product] ([ID], [Product_Name], [Catalog_id], [Amount], [price], [CatologID]) VALUES (10, N'Laptop MSI GF75 Thin 10SCXR i7 10750H/8GB/512GB/4GB GTX1650/144Hz/Balo/Chuột/Win10 (068VN) ', 1, 30, CAST(22490000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Product] ([ID], [Product_Name], [Catalog_id], [Amount], [price], [CatologID]) VALUES (11, N'Laptop Acer Nitro 5 AN515 45 R3SM R5 5600H/8GB/512GB/4GB GTX1650/144Hz/Balo/Win10 (NH.QBMSV.005)', 1, 32, CAST(22490000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Product] ([ID], [Product_Name], [Catalog_id], [Amount], [price], [CatologID]) VALUES (12, N'Chuột không dây Logitech MX Master 3 Đen', 3, 12, CAST(2490000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Product] ([ID], [Product_Name], [Catalog_id], [Amount], [price], [CatologID]) VALUES (13, N'Chuột Gaming Logitech G102 Gen2 Lightsync ', 3, 16, CAST(599000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Product] ([ID], [Product_Name], [Catalog_id], [Amount], [price], [CatologID]) VALUES (14, N'Chuột Gaming Corsair Nightsword RGB Tunable FBS/MOBA Đen', 3, 25, CAST(1672000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Product] ([ID], [Product_Name], [Catalog_id], [Amount], [price], [CatologID]) VALUES (15, N'Chuột Không dây Bluetooth Rapoo MT550 Đen ', 3, 9, CAST(629000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Product] ([ID], [Product_Name], [Catalog_id], [Amount], [price], [CatologID]) VALUES (16, N'Loa bluetooth JBL Charge 4 ', 4, 11, CAST(2990000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Product] ([ID], [Product_Name], [Catalog_id], [Amount], [price], [CatologID]) VALUES (17, N'Loa bluetooth JBL GO 3', 4, 15, CAST(990000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Product] ([ID], [Product_Name], [Catalog_id], [Amount], [price], [CatologID]) VALUES (18, N'Loa vi tính Creative Pebble V2 Đen ', 4, 18, CAST(690000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Product] ([ID], [Product_Name], [Catalog_id], [Amount], [price], [CatologID]) VALUES (19, N'Loa bluetooth Sony Extra Bass SRS-XB33', 4, 23, CAST(3690000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Product] ([ID], [Product_Name], [Catalog_id], [Amount], [price], [CatologID]) VALUES (20, N'Ổ cứng SSD 500GB WD My Passport BAGF5000', 5, 24, CAST(3490000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Product] ([ID], [Product_Name], [Catalog_id], [Amount], [price], [CatologID]) VALUES (21, N'Ổ cứng HDD 1TB WD My Passport Đen', 5, 12, CAST(1690000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Product] ([ID], [Product_Name], [Catalog_id], [Amount], [price], [CatologID]) VALUES (22, N'Ổ cứng HDD 1TB Seagate Backup Plus Slim Đen', 5, 8, CAST(1690000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Product] ([ID], [Product_Name], [Catalog_id], [Amount], [price], [CatologID]) VALUES (23, N'Ổ cứng HDD 2TB WD My Passport Ultra Bạc', 5, 6, CAST(2990000.00 AS Decimal(18, 2)), NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[ProductDetail] ([Product_ID], [Product_Detail]) VALUES (4, N'CPU:Intel Core i3 Tiger Lake1115G43.00 GHz\nRAM:4 GBDDR4 (On board +1 khe)2666 MHz\nỔ cứng:SSD 256 GB NVMe PCIe\nHỗ trợ khe cắm: HDD SATA\nMàn hình:14"Full HD (1920 x 1080)\nCard màn hình:\nCard đồ họa tích hợp: Intel UHD Graphics\nCổng kết nối:3 x USB 3.2HDMILAN (RJ45)USB Type-C\nHệ điều hành:Windows 10 Home SL\nThiết kế:Vỏ nhựa - nắp lưng bằng kim loại\nPIN liền\nKích thước:Dày 17.95 mm1.46 kg\nThời điểm ra mắt:2020')
INSERT [dbo].[ProductDetail] ([Product_ID], [Product_Detail]) VALUES (5, N'CPU: Intel Core i3 Ice Lake1005G11.20 GHz\nRAM: 4 GBDDR4 (On board +1 khe)2666 MHz \nỔ cứng: SSD 512 GB NVMe PCIeHỗ trợ khe cắm HDD SATA \nMàn hình: 15.6"Full HD (1920 x 1080) \nCard màn hình: Card đồ họa tích hợpIntel UHD Graphics \nCổng kết nối: 2 x USB 3.2HDMIUSB 2.0 \nHệ điều hành: Windows 10 Home SL \nThiết kế: Vỏ nhựa \nPIN: liền \nKích thước: Dày 19.9 mm1.85 kg \nThời điểm ra mắt: 2020')
INSERT [dbo].[ProductDetail] ([Product_ID], [Product_Detail]) VALUES (6, N'CPU: AMD Ryzen 55500U2.10 GHz\nRAM: 8 GBDDR4 (2 khe)3200 MHz\nỔ cứng: SSD 256 GB NVMe PCIe\nMàn hình: 15.6"Full HD (1920 x 1080)\nCard màn hình: Card đồ họa rờiNVIDIA GeForce GTX 1650 4 GB\nCổng kết nối: 2 x USB 3.2HDMILAN (RJ45)USB 2.0USB Type-C\nĐặc biệt: Có đèn bàn phím\nHệ điều hành: Windows 10 Home SL\nThiết kế: Vỏ nhựaPIN liền\nKích thước: Dày 22.9 mm2.1kg')
INSERT [dbo].[ProductDetail] ([Product_ID], [Product_Detail]) VALUES (7, N'CPU: Intel Core i3 Comet Lake10110U2.10 GHz\n
RAM: 4 GBDDR4 (2 khe)2666 MHz\n
Ổ cứng: SSD 256 GB NVMe PCIe Hỗ trợ khe cắm HDD SATA\n
Màn hình: 15.6"Full HD (1920 x 1080)\n
Card màn hình: Card đồ họa tích hợp Intel UHD Graphics\n
Cổng kết nối: 2x SuperSpeed USB AHDMILAN (RJ45)USB Type-C\n
Hệ điều hành: Windows 10 Home SL\n
Thiết kế: Vỏ nhựa\n 
PIN: liền\n
Kích thước: Dày 18 mm1.74 kg\n
Thời điểm ra mắt: 2020')
INSERT [dbo].[ProductDetail] ([Product_ID], [Product_Detail]) VALUES (8, N'CPU: Intel Core i3 Ice Lake1005G11.20 GHz\n
RAM: 4 GBDDR4 (2 khe)2666 MHz\n
Ổ cứng: SSD 256 GB NVMe PCIeKhông hỗ trợ khe cắm HDD\n
Màn hình: 14"Full HD (1920 x 1080)\n
Card màn hình: Card đồ họa tích hợp Intel UHD Graphics\n
Cổng kết nối: 2 x USB 3.1HDMIUSB Type-C\n
Hệ điều hành: Windows 10 Home SL\n
Thiết kế: Vỏ nhựa\n
PIN liền\n
Kích thước: Dày 17.9 mm1.38 kg\n
Thời điểm ra mắt: 2020')
INSERT [dbo].[ProductDetail] ([Product_ID], [Product_Detail]) VALUES (9, N'CPU: Intel Core i3 Ice Lake1005G11.20 GHz\n
RAM: 4 GBDDR4 (1 khe)2666 MHz\n
Ổ cứng: SSD 512 GB NVMe PCIe Hỗ trợ khe cắm HDD SATA\n
Màn hình: 15.6"Full HD (1920 x 1080)\n
Card màn hình: Card đồ họa tích hợp Intel UHD Graphics\n
Cổng kết nối: 2 x USB 3.1HDMILAN (RJ45)USB 2.02 x USB Type-C\n
Hệ điều hành: Windows 10 Home SL\n
Thiết kế: Vỏ kim loại\n
PIN liền\n
Kích thước: Dày 18.9 mm1.8 Kg\n
Thời điểm ra mắt: 2020')
INSERT [dbo].[ProductDetail] ([Product_ID], [Product_Detail]) VALUES (10, N'CPU: Intel Core i7 Comet Lake10750H2.60 GHz\n
RAM: 8 GBDDR4 (2 khe)3200 MHz\n
Ổ cứng: SSD 512 GB NVMe PCIeHỗ trợ khe cắm HDD SATA\n
Màn hình: 17.3 inchFull HD (1920 x 1080), 144Hz\n
Card màn hình: Card đồ họa rờiNVIDIA GeForce GTX 1650 4 GB\n
Cổng kết nối: 3 x USB 3.2HDMILAN (RJ45)USB Type-C\n
Đặc biệt: Có đèn bàn phím\n
Hệ điều hành: Windows 10 Home SL\n
Thiết kế: Vỏ nhựa\n
PIN liền\n
Kích thước: Dày 23.1 mm2.2 kg')
INSERT [dbo].[ProductDetail] ([Product_ID], [Product_Detail]) VALUES (11, N'CPU: AMD Ryzen 55600H3.30 GHz\n
RAM: 8 GBDDR4 (2 khe)3200 MHz\n
Ổ cứng: SSD 512 GB NVMe PCIe Hỗ trợ khe cắm SSD M.2 PCIeHỗ trợ khe cắm HDD SATA\n
Màn hình: 15.6"Full HD (1920 x 1080), 144Hz\n
Card màn hình: Card đồ họa rời NVIDIA GeForce GTX 1650 4 GB\n
Cổng kết nối: 3 x USB 3.2HDMILAN (RJ45)USB Type-C\n
Đặc biệt: Có đèn bàn phím\n
Hệ điều hành: Windows 10 Home SL\n
Thiết kế: Vỏ nhựa\n
PIN liền\n
Kích thước: Dày 23.9 mm2.2 kg')
INSERT [dbo].[ProductDetail] ([Product_ID], [Product_Detail]) VALUES (12, N'Tương thích: MacOS (MacBook, iMac)Windows\n
Độ phân giải: 4000 DPI\n
Cách kết nối: BluetoothĐầu thu USB Receiver\n
Độ dài dây / Khoảng cách kết nối: 10 m\n
Thời gian sử dụng: 70 ngày/ 1 lần sạc\n
Thời gian sạc đầy: 3 giờ\n
Cổng sạc: USB Type-C\n
Trọng lượng: 141 g\n
Thương hiệu của: Thụy Sĩ\n
Sản xuất tại: Trung Quốc')
INSERT [dbo].[ProductDetail] ([Product_ID], [Product_Detail]) VALUES (13, N'Tương thích: Windows\n
Độ phân giải: 8000 DPI\n
Đèn LED: RGB 16.8 triệu màu\n
Cách kết nối: Dây cắm USB\n
Độ dài dây / Khoảng cách kết nối: Dây dài 209 cm\n
Trọng lượng: 85 g\n
Thương hiệu của: Thụy Sĩ\n
Sản xuất tại: Trung Quốc')
INSERT [dbo].[ProductDetail] ([Product_ID], [Product_Detail]) VALUES (14, N'Tương thích: AndroidMacOS (MacBook, iMac)\n
Độ phân giải: 18000 DPI\n
Đèn LED: RGB 16.8 triệu màu\n
Cách kết nối: Dây cắm USB\n
Độ dài dây / Khoảng cách kết nối: Dây dài 187 cm\n
Trọng lượng: 105 g\n
Thương hiệu của: Mỹ\n
Sản xuất tại: Trung Quốc')
INSERT [dbo].[ProductDetail] ([Product_ID], [Product_Detail]) VALUES (15, N'Tương thích: MacOS (MacBook, iMac)Windows\n
Độ phân giải: 1600 DPI\n
Cách kết nối: BluetoothĐầu thu USB Receiver\n
Độ dài dây / Khoảng cách kết nối: 10 m\n
Loại pin: 1 viên pin AA\n
Trọng lượng: 150 g\n
Thương hiệu của: Trung Quốc\n
Sản xuất tại: Trung Quốc')
INSERT [dbo].[ProductDetail] ([Product_ID], [Product_Detail]) VALUES (16, N'Loại loa: Loa bluetooth\n
Tương thích: Android Windows iOS (iPhone)\n
Tổng công suất: 30 W\n
Thời gian sử dụng: Sạc khoảng 4 tiếng. Dùng khoảng 20 tiếng\n
Công nghệ âm thanh: JBL Connect+\n
Kết nối không dây: Bluetooth 4.2\n
Kết nối khác: Jack 3.5mm\n
Tiện ích: Chống nước IPX7Sạc được cho thiết bị khác (cổng USB)\n
Phím điều khiển:Bật/tắt bluetooth Nút nguồnTăng/giảm âm lượngPhát/dừng chơi nhạc\n
Kích thước: Dài 22 cm - Đường kính 10 cm - Nặng 965 g\n
Hãng: JBL')
INSERT [dbo].[ProductDetail] ([Product_ID], [Product_Detail]) VALUES (17, N'Loại loa: Loa bluetooth\n
Tổng công suất: 4.2 W
Thời gian sử dụng: Dùng khoảng 5 tiếng. Sạc khoảng 2.5 tiếng\n
Kết nối không dây: Bluetooth 5.1\n
Kích thước: Cao 8.5 cm - Ngang 7.5 cm - Dày 4.1 cm\n
Thương hiệu của: Mỹ\n
Hãng: JBL.')
INSERT [dbo].[ProductDetail] ([Product_ID], [Product_Detail]) VALUES (18, N'Loại loa: Loa vi tính\n
Tổng công suất: 8 W\n
Phím điều khiển: Tăng/giảm âm lượng\n
Thương hiệu của: Trung Quốc')
INSERT [dbo].[ProductDetail] ([Product_ID], [Product_Detail]) VALUES (19, N'Loại loa: Loa bluetooth\n
Tương thích:Android Mac OS (iMac) WindowsiOS (iPhone)\n
Thời gian sử dụng: Dùng khoảng 24 tiếng. Sạc khoảng 5 tiếng\n
Công nghệ âm thanh: Extra BassLIVE SOUNDParty Connect\n
Kết nối không dây: Bluetooth 5.0NFC\n
Kết nối khác: NFCUSB\n
Tiện ích: Chống nước, chống bụi IP67Sạc được cho thiết bị khác (cổng USB)\n
Phím điều khiển: Bật/tắt bluetoothNút nguồnTăng/giảm âm lượngPhát/dừng chơi nhạc\n
Điều khiển bằng điện thoại: Bằng ứng dụng Sony | Music Center\n
Kích thước: Dài 24.5 cm - Cao 10 cm - Dày 9.5 cm - Nặng 1.1 kg')
INSERT [dbo].[ProductDetail] ([Product_ID], [Product_Detail]) VALUES (20, N'Chuẩn kết nối: USB Type C 3.2\n
Dung lượng: 500 GB\n
Loại ổ cứng: Ổ cứng SSD\n
Tốc độ đọc: 1050 MB/s\n
Tốc độ ghi: 1000 MB/s\n
Thương hiệu của: Mỹ\n
Sản xuất tại: Trung Quốc/ Malaysia')
INSERT [dbo].[ProductDetail] ([Product_ID], [Product_Detail]) VALUES (21, N'Chuẩn kết nối: Micro USB 3.0\n
Dung lượng: 1 TB\n
Loại ổ cứng: Ổ cứng HDD\n
Tốc độ đọc: 120 MB/s\n
Tốc độ ghi: 115 MB/s\n
Kích thước: Cao 11 cm - Ngang 8.15 cm - Dày 1.63 cm\n
Trọng lượng: 200g\n
Thương hiệu của: Mỹ\n
Sản xuất tại: Thái Lan / Malaysia')
INSERT [dbo].[ProductDetail] ([Product_ID], [Product_Detail]) VALUES (22, N'Chuẩn kết nối: Micro USB 3.0\n
Dung lượng: 1 TB\n
Loại ổ cứng: Ổ cứng HDD\n
Tốc độ đọc: 114 MB/s\n
Tốc độ ghi: 115 MB/s\n
Kích thước: Dài 11.35 cm - Ngang 7.60 cm - Dày 1.21 cm\n
Trọng lượng: 159g\n
Thương hiệu của: Mỹ\n
Sản xuất tại: Trung Quốc/ Thái Lan')
INSERT [dbo].[ProductDetail] ([Product_ID], [Product_Detail]) VALUES (23, N'Chuẩn kết nối: USB Type-C\n
Dung lượng: 2 TB\n
Loại ổ cứng: Ổ cứng HDD\n
Tốc độ đọc: 120 MB/s\n
Tốc độ ghi: 115 MB/s\n
Kích thước: Cao 11 cm - Ngang 8.15 cm - Dày 1.35 cm\n
Trọng lượng: ~ 150g\n
Thương hiệu của: Mỹ\n
Sản xuất tại: Malaysia')
GO
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (6, N'https://drive.google.com/file/d/1-bjjCn2dDKl7i_aUvR3oWuqOAakY1r12/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (6, N'https://drive.google.com/file/d/1D_7XrnkkmBBJWnEgfJA3RLYPJYOXQrWu/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (6, N'https://drive.google.com/file/d/1HSXmet3INnxvCXZr6LED2wgrR3m0_yl5/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (6, N'https://drive.google.com/file/d/1JDzvgnNSHECU6yzLnP54Sl1lpQ52n48n/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (6, N'https://drive.google.com/file/d/1NAqlr0bG82MlDep9TB-wyhxb60BWknWs/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (6, N'https://drive.google.com/file/d/1RBqWa1kq_2L5dHgdrzIAssxLnH87vig_/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (6, N'https://drive.google.com/file/d/1u35RkIsQDB9ZLi8IPoWgHgY8MlEM9dAg/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (6, N'https://drive.google.com/file/d/1uD_dgw742MteMd60DNuPCc5rWRCAmY_3/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (7, N'https://drive.google.com/file/d/18YYHRAGhbMoEQiMBVWxN55IKD3eCttiF/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (7, N'https://drive.google.com/file/d/1esKmkAeWiGsT6gmWkkxu2cyfiFmyutFM/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (7, N'https://drive.google.com/file/d/1IgAjAMfkVEg5AwiUya6ZWquWfwm_u8M1/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (7, N'https://drive.google.com/file/d/1iUpbe9EaRWQrKA3KB7UPO6snb_wooIcv/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (7, N'https://drive.google.com/file/d/1lKXhyCLxTokX10qfhcvsqvrQz76rOxFG/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (7, N'https://drive.google.com/file/d/1O3a4WEsPPv2FUeQJ-xT5WHWbp31t4Sg0/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (7, N'https://drive.google.com/file/d/1RuFNNNZoOUzg3y_SVgptuZg8OVuAwfnk/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (7, N'https://drive.google.com/file/d/1u27zm7NvOHH79QqapmqwVcoNF047ELYj/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (8, N'https://drive.google.com/file/d/11kRQJu3UHTGUCalkClnuiaVTUJWVJiuz/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (8, N'https://drive.google.com/file/d/19rti3rincEwrf1H4ZJ6_QRhOaVP6A2PH/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (8, N'https://drive.google.com/file/d/1BWiTjnlOW5xZMfggrrv5k5DYr1XIrtmf/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (8, N'https://drive.google.com/file/d/1FYA7Hi2GvxQsSPgcFfxDAypfqBEzQ2Nq/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (8, N'https://drive.google.com/file/d/1J3dpe8CdvwkdKSItA0QWZqpqM3ToqUIM/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (8, N'https://drive.google.com/file/d/1PDhKnZ73-IxlOV0QrzoX49PfnPPb4qIZ/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (8, N'https://drive.google.com/file/d/1tmBIR5RoteqsCrZdy_GLmVwW_QcRMv4b/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (8, N'https://drive.google.com/file/d/1UsYh42Gu_BRdNs2QtRcJKbRgcgTo9SVn/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (8, N'https://drive.google.com/file/d/1Y8FGKww-OxyKcZYwIBeOkngqPMtcvHh2/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (8, N'https://drive.google.com/file/d/1YjH-o2RFJlHaiGE9OvExeXnxP4eERZoS/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (9, N'https://drive.google.com/file/d/15Bs-ZjAv1a_eCRVgg5spQZkJ0PaKjLuL/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (9, N'https://drive.google.com/file/d/15lk9A6Uan1IONSu_5kE-FHMay-px2k1M/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (9, N'https://drive.google.com/file/d/1d3EjiM1DgVM5gPK6xkpksZEJoXghvbpN/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (9, N'https://drive.google.com/file/d/1eirw2P4aNNEEw7xtVVieuK0UbiISTrJH/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (9, N'https://drive.google.com/file/d/1fiaFrUgBjfoy-ZDEFglOyjQROyuKzZvB/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (9, N'https://drive.google.com/file/d/1fz8Tgsq9MjNLQysWjPRFTwuWsQ0r52ey/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (9, N'https://drive.google.com/file/d/1kaV936YDGpSmeul_8hzjZ401V0osWO2q/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (9, N'https://drive.google.com/file/d/1RIJjPWrzjhPmHdaSx56E2ndSG5yQyc-H/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (9, N'https://drive.google.com/file/d/1z4p8ga39bTQ0VZJjZYijx_rAESsqVLIf/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (9, N'https://drive.google.com/file/d/1Zz7TdvouaWn9mqKSjq1eMLc6hzpJJKVw/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (10, N'https://drive.google.com/file/d/137YO0p9R24JFFgCh8SjrZE1fORnwjhTu/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (10, N'https://drive.google.com/file/d/1Ad4WaJODhJG6ER08L_OL39wmKLTVzUuv/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (10, N'https://drive.google.com/file/d/1CZ2AX6pvR9jyZ_28n-BMkCdT96nfJ8h2/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (10, N'https://drive.google.com/file/d/1Fro1wDNpNhcsRj3_xMCp8H5WmEvYtkug/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (10, N'https://drive.google.com/file/d/1ggs1oajmrodf3v8e14tImNjITu9NuMDh/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (10, N'https://drive.google.com/file/d/1pxDfiQXF205ZP66b7npi3vGZFspmBKPo/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (10, N'https://drive.google.com/file/d/1qI5797HgI23djR-jGsOl7H8BMmQhZJO1/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (10, N'https://drive.google.com/file/d/1sV200vNP4m-dcjbjXz9n_XRSyHNef_z6/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (10, N'https://drive.google.com/file/d/1TCRhrZa_Cva-wu82AeaY6Ao9sgjRMgjL/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (10, N'https://drive.google.com/file/d/1xYNNr2VMrAUMiOwWB6tnD6HcBKkGjhL5/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (11, N'https://drive.google.com/file/d/11lZaWDPsHEyal-pQJvPdlB7_3rEdwKKB/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (11, N'https://drive.google.com/file/d/1dqJk19ovpl28mmnIUjMmf2hRyVgE7BZ0/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (11, N'https://drive.google.com/file/d/1elX0NiXudNWQV5OU_uuYHnV7Lrka-hOH/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (11, N'https://drive.google.com/file/d/1fpR5UG17HQCnjvsQ-t0BbTf8uy3SompO/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (11, N'https://drive.google.com/file/d/1G0CqbeH9PbFfII79Jo5EI624Z9fmPk3A/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (11, N'https://drive.google.com/file/d/1JAWwU7Eii-ecfHnmuimckzTZ3-HINslT/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (11, N'https://drive.google.com/file/d/1JK5o-VwOtUPHSx5ruHdzVOTm226Og79I/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (11, N'https://drive.google.com/file/d/1oj6I0tvPXNwE5fOqlNkJVAVKSfaj5a37/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (11, N'https://drive.google.com/file/d/1rLt61fbVImnAncvTQtZSGZUsOS0V92N-/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (11, N'https://drive.google.com/file/d/1TziF0DVdyKesL_3XfxZg_VgVB7en-I9O/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (11, N'https://drive.google.com/file/d/1uVFdFCeN6i5-18tllre3VcWTK1XI6-bp/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (11, N'https://drive.google.com/file/d/1ZjKbQLMvNMYkCtxy8DciyPvaBmekP8h7/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (12, N'https://drive.google.com/file/d/10y_yD0_sk2FdyeAdFdGWhKr2Y_umWNoP/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (12, N'https://drive.google.com/file/d/1auHSMonEKr7U0xDAyNTNIaKfOyabJJOI/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (12, N'https://drive.google.com/file/d/1dQqk5HqSSsit25CuGt3_X84h52oBW0EY/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (12, N'https://drive.google.com/file/d/1RikZ4wd4eajv1zoGXs3wJnyDzcJXB3xq/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (12, N'https://drive.google.com/file/d/1YCCLGx-IDBu6E0Qxeiws1kQfL21W_dcJ/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (13, N'https://drive.google.com/file/d/13e1VmqIQZ2bylFIkuxHkE28E76CdHjFy/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (13, N'https://drive.google.com/file/d/1ByCuPfFpe0luia3--j8ucO22m23irixh/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (13, N'https://drive.google.com/file/d/1JIORnIzQf_ltS-0OTHK1mOmz3HHLVsGs/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (13, N'https://drive.google.com/file/d/1LZoD2nrvhYSaERxn0G07fyDLqXcafFqO/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (13, N'https://drive.google.com/file/d/1mYcaUj2J70LhY_-IVmCbTDbic4sBFqyU/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (13, N'https://drive.google.com/file/d/1QkDlA67jzBAsjFL7U7_gFBX8Rosql5rl/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (14, N'https://drive.google.com/file/d/1B4E11ywADG9ovZCPW571b7UO9FLP4qKP/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (14, N'https://drive.google.com/file/d/1BWPVdRE7CZlaeFbe-C0ff0ChkEVPDVVO/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (14, N'https://drive.google.com/file/d/1nI9mGqH1AnojSrtacuHo5LyJgZV2Jaoe/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (14, N'https://drive.google.com/file/d/1Vog_dHy6v32Utb7LA4bVqnUlX_onSWUz/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (14, N'https://drive.google.com/file/d/1WRZbHkHQ-WAZ8st1a-vqZOmijD6nj50K/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (15, N'https://drive.google.com/file/d/18jgSNIr_n5sCjPY3-j_p6ue2V-PtFFdU/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (15, N'https://drive.google.com/file/d/1bi7O0ygINj_bZ9B9idYJE4W4ISw6O-35/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (15, N'https://drive.google.com/file/d/1SQgA2pICMRf3iQ4lMjm7a8T9turS4lCM/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (15, N'https://drive.google.com/file/d/1uUUJNVCg12-PRAgYWdhMcN9Y_YPfbgd2/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (16, N'https://drive.google.com/file/d/142HAK5b2226MFma55P80lCx-j5WOYeaz/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (16, N'https://drive.google.com/file/d/15M792Hg8QedYtJ8hiJ69xckdfpz2F2Bk/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (16, N'https://drive.google.com/file/d/19aprbWcliQRR4vtUh04Wd6yHo0JMQNNU/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (16, N'https://drive.google.com/file/d/1EBF3TlAfyiQGuwZAz5QJFx8YkJCqfg-8/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (16, N'https://drive.google.com/file/d/1HOMcJNBW3rV0CI6TGaE5kV09-Nkey9ub/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (16, N'https://drive.google.com/file/d/1HT1h3E4it44l7Dhm8ZTNKCN2ndRFsUy3/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (17, N'https://drive.google.com/file/d/12AKI8eAGGXE8MgE3jA9T-uCo7gOM9b09/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (17, N'https://drive.google.com/file/d/1-9aO1mMqg8GBXfFnmWHaBu4cJbcbXUDi/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (17, N'https://drive.google.com/file/d/1tdNGO-NiJYBjrp7eg_6PJ8RUlOlYTjCe/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (17, N'https://drive.google.com/file/d/1UMwYUKWJ85IsMwpT19o3bYXOMOFqITsq/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (17, N'https://drive.google.com/file/d/1Xm1YV3Z2mURkQ699Cbt-WcwmCcVkjfgw/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (18, N'https://drive.google.com/file/d/1A5CAgUk0K98y_Uw-XiPbAI8o7cxheIZo/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (18, N'https://drive.google.com/file/d/1ivrDn8i_tC46QW5yxwwh1-YOb42QFcUI/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (18, N'https://drive.google.com/file/d/1xLkYluT456sfR0FIeytuaYQGaAcUcB9Y/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (18, N'https://drive.google.com/file/d/1YGq9_OK9A2K0CzJZR_XzkKXG7Z5CEv4W/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (18, N'https://drive.google.com/file/d/1zhqwSsqaDCY0kYPuKg0vjEw_68gCKBuh/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (19, N'https://drive.google.com/file/d/1_W7wRp5gtdC4nJQe1Rvrr5MeXmHvkOQo/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (19, N'https://drive.google.com/file/d/14o-Zx43CsFwPLadB3_-jyVRNoGK-L67p/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (19, N'https://drive.google.com/file/d/1KN5uu_eyYycQnW5rIY1Icr2Ksderjj5J/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (19, N'https://drive.google.com/file/d/1mvtwWcTC74bAtmVK0PNF7mjCFh0BHLQu/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (19, N'https://drive.google.com/file/d/1vXBGCMRyRrrixEygkXVrrGTIe5JjlQqs/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (20, N'https://drive.google.com/file/d/1cB5k7cn11NGu2HrWbGHrSDdzw19fFG5y/view?usp=sharing', NULL)
GO
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (20, N'https://drive.google.com/file/d/1DXsv21Yc8vK70JIovb0aawvBlE7urxX6/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (20, N'https://drive.google.com/file/d/1sh4xK3VEQ_glqb0iw409N-IiXfwBJA5s/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (20, N'https://drive.google.com/file/d/1ZhC-LM0pVSEHGTwWl8Pw_F09gJRIgIPN/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (20, N'https://drive.google.com/file/d/1zIEmrxGURIZWVH-xBxR3f5ywlZ4SG-cm/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (21, N'https://drive.google.com/file/d/1maXQIYQr3BmN85lkAQbpJS77P6o2nTTS/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (21, N'https://drive.google.com/file/d/1MmhB6lEU_d2F2wYBZYNUZOC_xeiCN1I3/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (21, N'https://drive.google.com/file/d/1R2L9vfascjM1TpOcHS22jbTUYxSRW_GL/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (21, N'https://drive.google.com/file/d/1WfGvB8SF1sD6oaYBQRdsfOIfzpgtVcEd/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (22, N'https://drive.google.com/file/d/144yBRsVt_Pnzadj71if3odookopYg1Jn/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (22, N'https://drive.google.com/file/d/15BiYwKQMo_72SJksUy-zBjrW0W6D9x6q/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (22, N'https://drive.google.com/file/d/1qlf49HqcgmO6FUaYJ4uesQI7TiEiLtC5/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (22, N'https://drive.google.com/file/d/1SVA05SouzT_etiyHPafBAakC44HLW7K2/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (22, N'https://drive.google.com/file/d/1tz74SHbhTsSFRjoadPp5bd6b-G7W-O7_/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (23, N'https://drive.google.com/file/d/13g6KtfudRjc98TcS9i3GVGFDRqWHMbZC/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (23, N'https://drive.google.com/file/d/13Wol4Oh8KDwh3GOMFGDXZvW6Dxap_n8V/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (23, N'https://drive.google.com/file/d/17fhayWxCTiPAwlMCCbeGYGVUFfc182T1/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (23, N'https://drive.google.com/file/d/1aFOvcRRCWecdX0cr1WcwAlztoRG8hRnM/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (23, N'https://drive.google.com/file/d/1eR44e-R5Thk92DbYsrXmhoiRk2xqaFE4/view?usp=sharing', NULL)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (4, N'https://drive.google.com/file/d/1_aPegKlpxqAPDSwdgQDxsysQD5yNnALB/view?usp=sharing', 4)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (4, N'https://drive.google.com/file/d/18zn-WebxxQ_g1RC3RArbwCSY0lLdlZu5/view?usp=sharing', 4)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (4, N'https://drive.google.com/file/d/1an4JJ9pBCZsELdkiohjB3o0CEK2iKcz2/view?usp=sharing', 4)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (4, N'https://drive.google.com/file/d/1ELcCQaObZnsRrMdK8V9a5ivuFZ6xT3dc/view?usp=sharing', 4)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (4, N'https://drive.google.com/file/d/1FVDkS8aLoD9iEt4-IeVm5HjnBMQ8mOzz/view?usp=sharing', 4)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (4, N'https://drive.google.com/file/d/1Lu_IDNF4x9bzCMfpM6ixm3SEfNBrxPFn/view?usp=sharing', 4)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (4, N'https://drive.google.com/file/d/1vhbeINXQGdjAeI_MwoXv5ddg2fTDNu02/view?usp=sharing', 4)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (4, N'https://drive.google.com/file/d/1W8U7qLA86Ud22VbuVHcURPP2JVQXLc1C/view?usp=sharing', 4)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (5, N'https://drive.google.com/file/d/1_DpBl7-7XOqJ1qCdJzekz5zVvVc42CHv/view?usp=sharing', 5)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (5, N'https://drive.google.com/file/d/14JgX4-NCq4LH9ka0dWO8IwyzOoiHCgAw/view?usp=sharing', 5)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (5, N'https://drive.google.com/file/d/14Oz1MZjyy6aUgnjZ-opAzfTfunKR2Ggo/view?usp=sharing', 5)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (5, N'https://drive.google.com/file/d/1asNJcheJ3YnmoDfKtX-VRZS-lCQfBbHZ/view?usp=sharing', 5)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (5, N'https://drive.google.com/file/d/1l2OkOg_6aVo6Ksd-3f3xoW90U4OXQXyX/view?usp=sharing', 5)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (5, N'https://drive.google.com/file/d/1N5WzsfIXVAgiHQ2MbUY1KTeLIStm1Qvg/view?usp=sharing', 5)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (5, N'https://drive.google.com/file/d/1NFPEjtMzuV7HzPXZ3kWMegB4Pltee-Qm/view?usp=sharing', 5)
INSERT [dbo].[ProductImage] ([Product_ID], [Image], [ProductID]) VALUES (5, N'https://drive.google.com/file/d/1Ysoxeua_mgnQLNFa3szh2gpjTNH9ShGC/view?usp=sharing', 5)
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([ID], [Role_Name]) VALUES (2, N'manager')
INSERT [dbo].[Role] ([ID], [Role_Name]) VALUES (3, N'shipper')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Role_RoleID] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Role_RoleID]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Customer_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Customer_CustomerID]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Employee_ShipperID] FOREIGN KEY([ShipperID])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Employee_ShipperID]
GO
ALTER TABLE [dbo].[InvoiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceDetail_Combo_ComboID] FOREIGN KEY([ComboID])
REFERENCES [dbo].[Combo] ([ID])
GO
ALTER TABLE [dbo].[InvoiceDetail] CHECK CONSTRAINT [FK_InvoiceDetail_Combo_ComboID]
GO
ALTER TABLE [dbo].[InvoiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceDetail_Invoice_InvoiceID] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoice] ([ID])
GO
ALTER TABLE [dbo].[InvoiceDetail] CHECK CONSTRAINT [FK_InvoiceDetail_Invoice_InvoiceID]
GO
ALTER TABLE [dbo].[InvoiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceDetail_Product_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[InvoiceDetail] CHECK CONSTRAINT [FK_InvoiceDetail_Product_ProductID]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Catolog_CatologID] FOREIGN KEY([CatologID])
REFERENCES [dbo].[Catolog] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Catolog_CatologID]
GO
ALTER TABLE [dbo].[ProductImage]  WITH CHECK ADD  CONSTRAINT [FK_ProductImage_Product_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductImage] CHECK CONSTRAINT [FK_ProductImage_Product_ProductID]
GO
