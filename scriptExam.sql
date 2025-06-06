USE [master]
GO
/****** Object:  Database [ExamDB]    Script Date: 25.05.2025 18:25:25 ******/
CREATE DATABASE [ExamDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExamDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ExamDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ExamDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ExamDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ExamDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExamDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExamDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExamDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExamDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExamDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExamDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExamDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ExamDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExamDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExamDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExamDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExamDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExamDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExamDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExamDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExamDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ExamDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExamDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExamDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExamDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExamDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExamDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ExamDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExamDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ExamDB] SET  MULTI_USER 
GO
ALTER DATABASE [ExamDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExamDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExamDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExamDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ExamDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ExamDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ExamDB', N'ON'
GO
ALTER DATABASE [ExamDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [ExamDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ExamDB]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 25.05.2025 18:25:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[MaterialID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [int] NULL,
	[Name] [nvarchar](255) NOT NULL,
	[UnitPrice] [decimal](18, 2) NULL,
	[UnitOfMeasure] [nvarchar](50) NULL,
	[PackageQuantity] [int] NULL,
	[StockQuantity] [int] NULL,
	[MinStockQuantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 25.05.2025 18:25:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](100) NOT NULL,
	[LossPercentage] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialUsage]    Script Date: 25.05.2025 18:25:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialUsage](
	[ProductID] [int] NOT NULL,
	[MaterialID] [int] NOT NULL,
	[RequiredAmount] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 25.05.2025 18:25:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[ProductCoefficient] [decimal](18, 2) NULL,
	[ProductCode] [nvarchar](50) NULL,
	[MinPartnerPrice] [decimal](18, 2) NULL,
	[TypeID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 25.05.2025 18:25:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
	[ProductCoefficient] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([MaterialID], [TypeID], [Name], [UnitPrice], [UnitOfMeasure], [PackageQuantity], [StockQuantity], [MinStockQuantity]) VALUES (1, 1, N'Цельный массив дерева Дуб 1000х600 мм', CAST(7450.00 AS Decimal(18, 2)), N'м²', 7, 1500, 500)
INSERT [dbo].[Material] ([MaterialID], [TypeID], [Name], [UnitPrice], [UnitOfMeasure], [PackageQuantity], [StockQuantity], [MinStockQuantity]) VALUES (2, 1, N'Клееный массив дерева Дуб 1000х600 мм', CAST(4520.00 AS Decimal(18, 2)), N'м²', 7, 300, 500)
INSERT [dbo].[Material] ([MaterialID], [TypeID], [Name], [UnitPrice], [UnitOfMeasure], [PackageQuantity], [StockQuantity], [MinStockQuantity]) VALUES (3, 1, N'Шпон облицовочный Дуб натуральный 2750х480 мм', CAST(2500.00 AS Decimal(18, 2)), N'м²', 19, 2000, 1500)
INSERT [dbo].[Material] ([MaterialID], [TypeID], [Name], [UnitPrice], [UnitOfMeasure], [PackageQuantity], [StockQuantity], [MinStockQuantity]) VALUES (4, 2, N'Фанера 2200х1000 мм', CAST(2245.00 AS Decimal(18, 2)), N'м²', 52, 450, 1000)
INSERT [dbo].[Material] ([MaterialID], [TypeID], [Name], [UnitPrice], [UnitOfMeasure], [PackageQuantity], [StockQuantity], [MinStockQuantity]) VALUES (5, 2, N'ДСП 2750х1830 мм', CAST(529.60 AS Decimal(18, 2)), N'м²', 181, 1010, 1200)
INSERT [dbo].[Material] ([MaterialID], [TypeID], [Name], [UnitPrice], [UnitOfMeasure], [PackageQuantity], [StockQuantity], [MinStockQuantity]) VALUES (6, 3, N'Велюр 140 см', CAST(1295.00 AS Decimal(18, 2)), N'пог. м', 40, 530, 400)
INSERT [dbo].[Material] ([MaterialID], [TypeID], [Name], [UnitPrice], [UnitOfMeasure], [PackageQuantity], [StockQuantity], [MinStockQuantity]) VALUES (7, 3, N'Шенилл 140 см', CAST(1340.00 AS Decimal(18, 2)), N'пог. м', 40, 475, 300)
INSERT [dbo].[Material] ([MaterialID], [TypeID], [Name], [UnitPrice], [UnitOfMeasure], [PackageQuantity], [StockQuantity], [MinStockQuantity]) VALUES (8, 3, N'Рогожка 140 см', CAST(1040.00 AS Decimal(18, 2)), N'пог. м', 30, 700, 350)
INSERT [dbo].[Material] ([MaterialID], [TypeID], [Name], [UnitPrice], [UnitOfMeasure], [PackageQuantity], [StockQuantity], [MinStockQuantity]) VALUES (9, 3, N'Фетр 150 см', CAST(880.00 AS Decimal(18, 2)), N'пог. м', 30, 215, 180)
INSERT [dbo].[Material] ([MaterialID], [TypeID], [Name], [UnitPrice], [UnitOfMeasure], [PackageQuantity], [StockQuantity], [MinStockQuantity]) VALUES (10, 4, N'Стекло закаленное 4 мм', CAST(2100.00 AS Decimal(18, 2)), N'м²', 10, 19, 5)
INSERT [dbo].[Material] ([MaterialID], [TypeID], [Name], [UnitPrice], [UnitOfMeasure], [PackageQuantity], [StockQuantity], [MinStockQuantity]) VALUES (11, 5, N'Металлокаркас для стула', CAST(2850.00 AS Decimal(18, 2)), N'шт', 5, 18, 6)
INSERT [dbo].[Material] ([MaterialID], [TypeID], [Name], [UnitPrice], [UnitOfMeasure], [PackageQuantity], [StockQuantity], [MinStockQuantity]) VALUES (12, 5, N'Кронштейн для полки', CAST(120.00 AS Decimal(18, 2)), N'шт', 20, 58, 20)
INSERT [dbo].[Material] ([MaterialID], [TypeID], [Name], [UnitPrice], [UnitOfMeasure], [PackageQuantity], [StockQuantity], [MinStockQuantity]) VALUES (13, 1, N'Цельный массив дерева Дуб 1000х600 мм', CAST(7450.00 AS Decimal(18, 2)), N'м²', 7, 1500, 500)
INSERT [dbo].[Material] ([MaterialID], [TypeID], [Name], [UnitPrice], [UnitOfMeasure], [PackageQuantity], [StockQuantity], [MinStockQuantity]) VALUES (14, 1, N'Клееный массив дерева Дуб 1000х600 мм', CAST(4520.00 AS Decimal(18, 2)), N'м²', 7, 300, 500)
INSERT [dbo].[Material] ([MaterialID], [TypeID], [Name], [UnitPrice], [UnitOfMeasure], [PackageQuantity], [StockQuantity], [MinStockQuantity]) VALUES (15, 1, N'Шпон облицовочный Дуб натуральный 2750х480 мм', CAST(2500.00 AS Decimal(18, 2)), N'м²', 19, 2000, 1500)
INSERT [dbo].[Material] ([MaterialID], [TypeID], [Name], [UnitPrice], [UnitOfMeasure], [PackageQuantity], [StockQuantity], [MinStockQuantity]) VALUES (16, 2, N'Фанера 2200х1000 мм', CAST(2245.00 AS Decimal(18, 2)), N'м²', 52, 450, 1000)
INSERT [dbo].[Material] ([MaterialID], [TypeID], [Name], [UnitPrice], [UnitOfMeasure], [PackageQuantity], [StockQuantity], [MinStockQuantity]) VALUES (17, 2, N'ДСП 2750х1830 мм', CAST(529.60 AS Decimal(18, 2)), N'м²', 181, 1010, 1200)
INSERT [dbo].[Material] ([MaterialID], [TypeID], [Name], [UnitPrice], [UnitOfMeasure], [PackageQuantity], [StockQuantity], [MinStockQuantity]) VALUES (18, 2, N'МДФ 2070х1400 мм', CAST(417.24 AS Decimal(18, 2)), N'м²', 87, 1550, 1000)
INSERT [dbo].[Material] ([MaterialID], [TypeID], [Name], [UnitPrice], [UnitOfMeasure], [PackageQuantity], [StockQuantity], [MinStockQuantity]) VALUES (19, 2, N'ДВП 2440х2050 мм', CAST(187.00 AS Decimal(18, 2)), N'м²', 190, 1310, 1000)
INSERT [dbo].[Material] ([MaterialID], [TypeID], [Name], [UnitPrice], [UnitOfMeasure], [PackageQuantity], [StockQuantity], [MinStockQuantity]) VALUES (20, 2, N'ХДФ 2800x2070 мм', CAST(370.96 AS Decimal(18, 2)), N'м²', 90, 1400, 1200)
INSERT [dbo].[Material] ([MaterialID], [TypeID], [Name], [UnitPrice], [UnitOfMeasure], [PackageQuantity], [StockQuantity], [MinStockQuantity]) VALUES (21, 3, N'Экокожа 140 см', CAST(1600.00 AS Decimal(18, 2)), N'пог.м', 100, 1200, 1500)
INSERT [dbo].[Material] ([MaterialID], [TypeID], [Name], [UnitPrice], [UnitOfMeasure], [PackageQuantity], [StockQuantity], [MinStockQuantity]) VALUES (22, 3, N'Велюр 140 см', CAST(1300.00 AS Decimal(18, 2)), N'пог.м', 100, 1300, 1500)
INSERT [dbo].[Material] ([MaterialID], [TypeID], [Name], [UnitPrice], [UnitOfMeasure], [PackageQuantity], [StockQuantity], [MinStockQuantity]) VALUES (23, 3, N'Шенилл 140 см', CAST(620.00 AS Decimal(18, 2)), N'пог.м', 100, 950, 1500)
INSERT [dbo].[Material] ([MaterialID], [TypeID], [Name], [UnitPrice], [UnitOfMeasure], [PackageQuantity], [StockQuantity], [MinStockQuantity]) VALUES (24, 3, N'Рогожка 140 см', CAST(720.00 AS Decimal(18, 2)), N'пог.м', 100, 960, 1500)
INSERT [dbo].[Material] ([MaterialID], [TypeID], [Name], [UnitPrice], [UnitOfMeasure], [PackageQuantity], [StockQuantity], [MinStockQuantity]) VALUES (25, 4, N'Закаленное стекло 2600х1800 мм', CAST(1148.00 AS Decimal(18, 2)), N'м²', 196, 1000, 500)
INSERT [dbo].[Material] ([MaterialID], [TypeID], [Name], [UnitPrice], [UnitOfMeasure], [PackageQuantity], [StockQuantity], [MinStockQuantity]) VALUES (26, 5, N'Металлокаркас для стула', CAST(1100.00 AS Decimal(18, 2)), N'шт', 5, 300, 250)
INSERT [dbo].[Material] ([MaterialID], [TypeID], [Name], [UnitPrice], [UnitOfMeasure], [PackageQuantity], [StockQuantity], [MinStockQuantity]) VALUES (27, 5, N'Металлокаркас каркас из профиля с траверсами для стола', CAST(6700.00 AS Decimal(18, 2)), N'шт', 1, 100, 100)
INSERT [dbo].[Material] ([MaterialID], [TypeID], [Name], [UnitPrice], [UnitOfMeasure], [PackageQuantity], [StockQuantity], [MinStockQuantity]) VALUES (28, 6, N'Колесо для мебели поворотное', CAST(10.59 AS Decimal(18, 2)), N'шт', 500, 1500, 1000)
INSERT [dbo].[Material] ([MaterialID], [TypeID], [Name], [UnitPrice], [UnitOfMeasure], [PackageQuantity], [StockQuantity], [MinStockQuantity]) VALUES (29, 5, N'Газ-лифт', CAST(730.00 AS Decimal(18, 2)), N'шт', 5, 500, 250)
INSERT [dbo].[Material] ([MaterialID], [TypeID], [Name], [UnitPrice], [UnitOfMeasure], [PackageQuantity], [StockQuantity], [MinStockQuantity]) VALUES (30, 5, N'Металлическая крестовина для офисных кресел', CAST(2700.00 AS Decimal(18, 2)), N'шт', 5, 500, 250)
INSERT [dbo].[Material] ([MaterialID], [TypeID], [Name], [UnitPrice], [UnitOfMeasure], [PackageQuantity], [StockQuantity], [MinStockQuantity]) VALUES (31, 6, N'Пластиковый комплект для стула', CAST(900.00 AS Decimal(18, 2)), N'шт', 100, 300, 250)
INSERT [dbo].[Material] ([MaterialID], [TypeID], [Name], [UnitPrice], [UnitOfMeasure], [PackageQuantity], [StockQuantity], [MinStockQuantity]) VALUES (32, 6, N'Кромка ПВХ', CAST(35.80 AS Decimal(18, 2)), N'м', 100, 1500, 1000)
SET IDENTITY_INSERT [dbo].[Material] OFF
GO
SET IDENTITY_INSERT [dbo].[MaterialType] ON 

INSERT [dbo].[MaterialType] ([TypeID], [TypeName], [LossPercentage]) VALUES (1, N'Дерево', CAST(0.55 AS Decimal(5, 2)))
INSERT [dbo].[MaterialType] ([TypeID], [TypeName], [LossPercentage]) VALUES (2, N'Древесная плита', CAST(0.30 AS Decimal(5, 2)))
INSERT [dbo].[MaterialType] ([TypeID], [TypeName], [LossPercentage]) VALUES (3, N'Текстиль', CAST(0.15 AS Decimal(5, 2)))
INSERT [dbo].[MaterialType] ([TypeID], [TypeName], [LossPercentage]) VALUES (4, N'Стекло', CAST(0.45 AS Decimal(5, 2)))
INSERT [dbo].[MaterialType] ([TypeID], [TypeName], [LossPercentage]) VALUES (5, N'Металл', CAST(0.10 AS Decimal(5, 2)))
INSERT [dbo].[MaterialType] ([TypeID], [TypeName], [LossPercentage]) VALUES (6, N'Пластик', CAST(0.05 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[MaterialType] OFF
GO
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (1, 4, CAST(0.85 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (1, 7, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (1, 10, CAST(1.50 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (1, 11, CAST(1.50 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (1, 12, CAST(1.50 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (1, 14, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (1, 15, CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (1, 16, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (1, 17, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (1, 18, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (2, 4, CAST(1.25 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (2, 7, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (2, 9, CAST(3.04 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (2, 11, CAST(1.50 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (2, 12, CAST(2.50 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (2, 14, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (2, 15, CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (2, 16, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (2, 17, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (2, 18, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (3, 4, CAST(1.85 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (3, 7, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (3, 9, CAST(4.22 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (3, 10, CAST(1.50 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (3, 14, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (3, 15, CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (3, 16, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (3, 17, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (3, 18, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (4, 5, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (4, 7, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (4, 14, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (4, 15, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (4, 16, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (5, 3, CAST(1.50 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (5, 5, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (5, 7, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (5, 14, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (5, 15, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[MaterialUsage] ([ProductID], [MaterialID], [RequiredAmount]) VALUES (5, 16, CAST(2.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [Name], [ProductCoefficient], [ProductCode], [MinPartnerPrice], [TypeID]) VALUES (1, N'Кресло детское цвет Белый и Розовый', CAST(1.95 AS Decimal(18, 2)), N'3028272', CAST(15324.99 AS Decimal(18, 2)), 1)
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCoefficient], [ProductCode], [MinPartnerPrice], [TypeID]) VALUES (2, N'Кресло офисное цвет Черный', CAST(1.95 AS Decimal(18, 2)), N'3018556', CAST(21443.99 AS Decimal(18, 2)), 1)
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCoefficient], [ProductCode], [MinPartnerPrice], [TypeID]) VALUES (3, N'Кресло эргономичное цвет Темно-коричневый', CAST(1.95 AS Decimal(18, 2)), N'3549922', CAST(24760.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCoefficient], [ProductCode], [MinPartnerPrice], [TypeID]) VALUES (4, N'Полка настольная', CAST(2.50 AS Decimal(18, 2)), N'7028048', CAST(2670.89 AS Decimal(18, 2)), 2)
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCoefficient], [ProductCode], [MinPartnerPrice], [TypeID]) VALUES (5, N'Стеллаж для документов цвет Дуб светлый 854х444х1800 мм', CAST(4.35 AS Decimal(18, 2)), N'5759324', CAST(24899.00 AS Decimal(18, 2)), 3)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([TypeID], [TypeName], [ProductCoefficient]) VALUES (1, N'Кресла', CAST(1.95 AS Decimal(18, 2)))
INSERT [dbo].[ProductType] ([TypeID], [TypeName], [ProductCoefficient]) VALUES (2, N'Полки', CAST(2.50 AS Decimal(18, 2)))
INSERT [dbo].[ProductType] ([TypeID], [TypeName], [ProductCoefficient]) VALUES (3, N'Стеллажи', CAST(4.35 AS Decimal(18, 2)))
INSERT [dbo].[ProductType] ([TypeID], [TypeName], [ProductCoefficient]) VALUES (4, N'Столы', CAST(5.50 AS Decimal(18, 2)))
INSERT [dbo].[ProductType] ([TypeID], [TypeName], [ProductCoefficient]) VALUES (5, N'Тумбы', CAST(7.60 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((1)) FOR [TypeID]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD FOREIGN KEY([TypeID])
REFERENCES [dbo].[MaterialType] ([TypeID])
GO
ALTER TABLE [dbo].[MaterialUsage]  WITH CHECK ADD FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([MaterialID])
GO
ALTER TABLE [dbo].[MaterialUsage]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([TypeID])
REFERENCES [dbo].[ProductType] ([TypeID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD CHECK  (([UnitPrice]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [ExamDB] SET  READ_WRITE 
GO
