USE [master]
GO
/****** Object:  Database [StockManagement_Masud]    Script Date: 12/3/2018 10:32:25 AM ******/
CREATE DATABASE [StockManagement_Masud]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StockManagement_Masud', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\StockManagement_Masud.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StockManagement_Masud_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\StockManagement_Masud_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StockManagement_Masud] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StockManagement_Masud].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StockManagement_Masud] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StockManagement_Masud] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StockManagement_Masud] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StockManagement_Masud] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StockManagement_Masud] SET ARITHABORT OFF 
GO
ALTER DATABASE [StockManagement_Masud] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StockManagement_Masud] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [StockManagement_Masud] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StockManagement_Masud] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StockManagement_Masud] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StockManagement_Masud] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StockManagement_Masud] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StockManagement_Masud] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StockManagement_Masud] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StockManagement_Masud] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StockManagement_Masud] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StockManagement_Masud] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StockManagement_Masud] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StockManagement_Masud] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StockManagement_Masud] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StockManagement_Masud] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StockManagement_Masud] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StockManagement_Masud] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StockManagement_Masud] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StockManagement_Masud] SET  MULTI_USER 
GO
ALTER DATABASE [StockManagement_Masud] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StockManagement_Masud] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StockManagement_Masud] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StockManagement_Masud] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [StockManagement_Masud]
GO
/****** Object:  Table [dbo].[CategorySetup]    Script Date: 12/3/2018 10:32:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[CategorySetup](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CategorySetup] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CompanySetup]    Script Date: 12/3/2018 10:32:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CompanySetup](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CompanySetup] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItemSetup]    Script Date: 12/3/2018 10:32:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemSetup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ReorderLevel] [int] NOT NULL,
	[Available] [int] NOT NULL,
 CONSTRAINT [PK_ItemSetup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockIn]    Script Date: 12/3/2018 10:32:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockIn](
	[StockId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
	[ReorderLevel] [int] NOT NULL,
	[Available] [int] NOT NULL,
	[StockInQuantity] [int] NOT NULL,
	[Date] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StockSetup] PRIMARY KEY CLUSTERED 
(
	[StockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockOut]    Script Date: 12/3/2018 10:32:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockOut](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
	[ReorderLevel] [int] NOT NULL,
	[Available] [int] NOT NULL,
	[ActionType] [varchar](50) NOT NULL,
	[StockOutQuantity] [int] NOT NULL,
	[Date] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StockOut] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[SalesView]    Script Date: 12/3/2018 10:32:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SalesView] as
SELECT itm.Name as ItemName ,cm.CompanyName,ct.CategoryName, sto.StockOutQuantity as Quantity, sto.Date FROM StockOut as sto left join ItemSetup as itm on sto.ItemId=itm.Id
left join CompanySetup as cm on sto.CompanyId=cm.CompanyId
left join CategorySetup as ct on itm.CategoryId = ct.CategoryId
WHERE sto.ActionType='sell'
GO
SET IDENTITY_INSERT [dbo].[CategorySetup] ON 

INSERT [dbo].[CategorySetup] ([CategoryId], [CategoryName]) VALUES (1, N'Cosmetics')
INSERT [dbo].[CategorySetup] ([CategoryId], [CategoryName]) VALUES (2, N'Dress')
INSERT [dbo].[CategorySetup] ([CategoryId], [CategoryName]) VALUES (3, N'Ornaments')
INSERT [dbo].[CategorySetup] ([CategoryId], [CategoryName]) VALUES (4, N'Kitchen Items')
INSERT [dbo].[CategorySetup] ([CategoryId], [CategoryName]) VALUES (5, N'Haka')
INSERT [dbo].[CategorySetup] ([CategoryId], [CategoryName]) VALUES (6, N'Zahran')
INSERT [dbo].[CategorySetup] ([CategoryId], [CategoryName]) VALUES (7, N'Hakaz')
INSERT [dbo].[CategorySetup] ([CategoryId], [CategoryName]) VALUES (8, N'Hakaz1')
INSERT [dbo].[CategorySetup] ([CategoryId], [CategoryName]) VALUES (9, N'Food')
SET IDENTITY_INSERT [dbo].[CategorySetup] OFF
SET IDENTITY_INSERT [dbo].[CompanySetup] ON 

INSERT [dbo].[CompanySetup] ([CompanyId], [CompanyName]) VALUES (1, N'Walton')
INSERT [dbo].[CompanySetup] ([CompanyId], [CompanyName]) VALUES (2, N'RFL')
INSERT [dbo].[CompanySetup] ([CompanyId], [CompanyName]) VALUES (3, N'BBrothers')
INSERT [dbo].[CompanySetup] ([CompanyId], [CompanyName]) VALUES (4, N'kkk')
INSERT [dbo].[CompanySetup] ([CompanyId], [CompanyName]) VALUES (5, N'3 Star')
INSERT [dbo].[CompanySetup] ([CompanyId], [CompanyName]) VALUES (6, N'Akij BD')
SET IDENTITY_INSERT [dbo].[CompanySetup] OFF
SET IDENTITY_INSERT [dbo].[ItemSetup] ON 

INSERT [dbo].[ItemSetup] ([Id], [CategoryId], [CompanyId], [Name], [ReorderLevel], [Available]) VALUES (1, 2, 2, N'T-Shirt', 1, 2)
INSERT [dbo].[ItemSetup] ([Id], [CategoryId], [CompanyId], [Name], [ReorderLevel], [Available]) VALUES (2, 1, 1, N'Shampoo', 1, 5)
INSERT [dbo].[ItemSetup] ([Id], [CategoryId], [CompanyId], [Name], [ReorderLevel], [Available]) VALUES (3, 4, 2, N'Glass', 1, 7)
INSERT [dbo].[ItemSetup] ([Id], [CategoryId], [CompanyId], [Name], [ReorderLevel], [Available]) VALUES (5, 4, 3, N'Glass', 1, 9)
INSERT [dbo].[ItemSetup] ([Id], [CategoryId], [CompanyId], [Name], [ReorderLevel], [Available]) VALUES (6, 4, 1, N'Glass', 1, 5)
INSERT [dbo].[ItemSetup] ([Id], [CategoryId], [CompanyId], [Name], [ReorderLevel], [Available]) VALUES (7, 4, 2, N'fochka', 1, 9)
INSERT [dbo].[ItemSetup] ([Id], [CategoryId], [CompanyId], [Name], [ReorderLevel], [Available]) VALUES (8, 9, 6, N'Mojo', 1, 13)
SET IDENTITY_INSERT [dbo].[ItemSetup] OFF
SET IDENTITY_INSERT [dbo].[StockIn] ON 

INSERT [dbo].[StockIn] ([StockId], [CompanyId], [ItemId], [ReorderLevel], [Available], [StockInQuantity], [Date]) VALUES (36, 6, 8, 0, 20, 20, N'2018-11-28')
SET IDENTITY_INSERT [dbo].[StockIn] OFF
SET IDENTITY_INSERT [dbo].[StockOut] ON 

INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [ReorderLevel], [Available], [ActionType], [StockOutQuantity], [Date]) VALUES (1, 6, 8, 1, 19, N'sell', 1, N'2018-11-28')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [ReorderLevel], [Available], [ActionType], [StockOutQuantity], [Date]) VALUES (2, 3, 5, 1, 12, N'sell', 1, N'2018-11-28')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [ReorderLevel], [Available], [ActionType], [StockOutQuantity], [Date]) VALUES (3, 6, 8, 1, 18, N'sell', 1, N'2018-11-28')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [ReorderLevel], [Available], [ActionType], [StockOutQuantity], [Date]) VALUES (4, 1, 6, 1, 5, N'sell', 1, N'2018-11-28')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [ReorderLevel], [Available], [ActionType], [StockOutQuantity], [Date]) VALUES (5, 6, 8, 1, 17, N'sell', 1, N'2018-11-28')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [ReorderLevel], [Available], [ActionType], [StockOutQuantity], [Date]) VALUES (6, 2, 7, 1, 11, N'sell', 1, N'2018-11-28')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [ReorderLevel], [Available], [ActionType], [StockOutQuantity], [Date]) VALUES (7, 3, 5, 1, 9, N'sell', 3, N'2018-11-29')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [ReorderLevel], [Available], [ActionType], [StockOutQuantity], [Date]) VALUES (8, 2, 1, 1, 2, N'sell', 1, N'2018-11-29')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [ReorderLevel], [Available], [ActionType], [StockOutQuantity], [Date]) VALUES (9, 2, 7, 1, 9, N'lost', 2, N'2018-12-03')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [ReorderLevel], [Available], [ActionType], [StockOutQuantity], [Date]) VALUES (10, 6, 8, 1, 13, N'damage', 4, N'2018-12-03')
SET IDENTITY_INSERT [dbo].[StockOut] OFF
ALTER TABLE [dbo].[ItemSetup] ADD  CONSTRAINT [DF_ItemSetup_ReorderLevel]  DEFAULT ((0)) FOR [ReorderLevel]
GO
ALTER TABLE [dbo].[ItemSetup]  WITH CHECK ADD  CONSTRAINT [FK_ItemSetup_CategorySetup] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[CategorySetup] ([CategoryId])
GO
ALTER TABLE [dbo].[ItemSetup] CHECK CONSTRAINT [FK_ItemSetup_CategorySetup]
GO
ALTER TABLE [dbo].[ItemSetup]  WITH CHECK ADD  CONSTRAINT [FK_ItemSetup_CompanySetup] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanySetup] ([CompanyId])
GO
ALTER TABLE [dbo].[ItemSetup] CHECK CONSTRAINT [FK_ItemSetup_CompanySetup]
GO
USE [master]
GO
ALTER DATABASE [StockManagement_Masud] SET  READ_WRITE 
GO
