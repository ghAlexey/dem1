USE [master]
GO
/****** Object:  Database [TestEkz]    Script Date: 25.05.2025 21:13:48 ******/
CREATE DATABASE [TestEkz]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestEkz', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TestEkz.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestEkz_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TestEkz_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TestEkz] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestEkz].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestEkz] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestEkz] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestEkz] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestEkz] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestEkz] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestEkz] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestEkz] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestEkz] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestEkz] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestEkz] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestEkz] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestEkz] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestEkz] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestEkz] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestEkz] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TestEkz] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestEkz] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestEkz] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestEkz] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestEkz] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestEkz] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestEkz] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestEkz] SET RECOVERY FULL 
GO
ALTER DATABASE [TestEkz] SET  MULTI_USER 
GO
ALTER DATABASE [TestEkz] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestEkz] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestEkz] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestEkz] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestEkz] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TestEkz] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TestEkz', N'ON'
GO
ALTER DATABASE [TestEkz] SET QUERY_STORE = ON
GO
ALTER DATABASE [TestEkz] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TestEkz]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 25.05.2025 21:13:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[BirthDate] [date] NULL,
	[PassportData] [nvarchar](100) NULL,
	[BankDetails] [nvarchar](100) NULL,
	[MaritalStatus] [nvarchar](50) NULL,
	[HealthStatus] [nvarchar](100) NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[LastLogin] [datetime] NULL,
	[AccountStatus] [bit] NULL,
	[RoleID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materials]    Script Date: 25.05.2025 21:13:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials](
	[MaterialID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialType] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Cost] [decimal](15, 2) NULL,
	[UnitOfMeasure] [nvarchar](20) NOT NULL,
	[CurrentStock] [decimal](12, 3) NULL,
	[MinStockLevel] [decimal](12, 3) NULL,
	[SupplierID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 25.05.2025 21:13:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[OrderItemID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [decimal](15, 2) NULL,
	[Quantity] [int] NULL,
	[Status] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 25.05.2025 21:13:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[PartnerID] [int] NOT NULL,
	[ManagerID] [int] NOT NULL,
	[OrderDate] [datetime] NULL,
	[TotalAmount] [decimal](15, 2) NULL,
	[PrepaymentAmount] [decimal](15, 2) NULL,
	[DiscountAmount] [decimal](15, 2) NULL,
	[Status] [nvarchar](20) NOT NULL,
	[DeliveryMethod] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partners]    Script Date: 25.05.2025 21:13:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners](
	[PartnerID] [int] IDENTITY(1,1) NOT NULL,
	[PartnerTypeID] [int] NOT NULL,
	[CompanyName] [nvarchar](100) NOT NULL,
	[LegalAddress] [nvarchar](255) NOT NULL,
	[TaxID] [nvarchar](20) NOT NULL,
	[DirectorName] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Rating] [decimal](3, 2) NULL,
	[CurrentDiscount] [decimal](5, 2) NULL,
	[TotalSalesVolume] [decimal](15, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[PartnerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerSalesHistory]    Script Date: 25.05.2025 21:13:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerSalesHistory](
	[HistoryID] [int] IDENTITY(1,1) NOT NULL,
	[PartnerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SaleAmount] [decimal](15, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[HistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerTypes]    Script Date: 25.05.2025 21:13:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerTypes](
	[PartnerTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PartnerTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMaterials]    Script Date: 25.05.2025 21:13:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaterials](
	[ProductID] [int] NOT NULL,
	[MaterialID] [int] NOT NULL,
	[Quantity] [decimal](12, 3) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 25.05.2025 21:13:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeID] [int] NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[SKU] [nvarchar](50) NOT NULL,
	[MinPartnerPrice] [decimal](15, 2) NULL,
	[PackageLength] [decimal](8, 2) NULL,
	[PackageWidth] [decimal](8, 2) NULL,
	[PackageHeight] [decimal](8, 2) NULL,
	[ProductionCost] [decimal](15, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 25.05.2025 21:13:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[ProductTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 25.05.2025 21:13:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesPoints]    Script Date: 25.05.2025 21:13:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesPoints](
	[SalesPointID] [int] IDENTITY(1,1) NOT NULL,
	[PartnerID] [int] NOT NULL,
	[PointType] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](255) NULL,
	[ContactPhone] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[SalesPointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 25.05.2025 21:13:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierType] [nvarchar](50) NOT NULL,
	[CompanyName] [nvarchar](100) NOT NULL,
	[LegalAddress] [nvarchar](255) NULL,
	[ContactDetails] [nvarchar](100) NULL,
	[TaxID] [nvarchar](20) NOT NULL,
	[Rating] [decimal](3, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WarehouseTransactions]    Script Date: 25.05.2025 21:13:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WarehouseTransactions](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[ProductID] [int] NULL,
	[TransactionType] [nvarchar](20) NOT NULL,
	[Quantity] [decimal](12, 3) NULL,
	[TransactionDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeID], [FullName], [BirthDate], [PassportData], [BankDetails], [MaritalStatus], [HealthStatus], [Username], [Password], [LastLogin], [AccountStatus], [RoleID]) VALUES (1, N'Иванов Иван Иванович', CAST(N'1990-01-15' AS Date), N'1234 567890', N'40817810099910000001', N'Женат', N'Здоров', N'ivanov', N'P@ssw0rd1', NULL, 1, 1)
INSERT [dbo].[Employees] ([EmployeeID], [FullName], [BirthDate], [PassportData], [BankDetails], [MaritalStatus], [HealthStatus], [Username], [Password], [LastLogin], [AccountStatus], [RoleID]) VALUES (2, N'Петров Петр Петрович', CAST(N'1985-06-24' AS Date), N'2234 667890', N'40817810099910000002', N'Женат', N'Здоров', N'petrov', N'P@ssw0rd2', NULL, 1, 2)
INSERT [dbo].[Employees] ([EmployeeID], [FullName], [BirthDate], [PassportData], [BankDetails], [MaritalStatus], [HealthStatus], [Username], [Password], [LastLogin], [AccountStatus], [RoleID]) VALUES (3, N'Сидоров Сергей Сергеевич', CAST(N'1992-03-10' AS Date), N'3234 767890', N'40817810099910000003', N'Холост', N'Здоров', N'sidorov', N'P@ssw0rd3', NULL, 1, 3)
INSERT [dbo].[Employees] ([EmployeeID], [FullName], [BirthDate], [PassportData], [BankDetails], [MaritalStatus], [HealthStatus], [Username], [Password], [LastLogin], [AccountStatus], [RoleID]) VALUES (4, N'Кузнецова Анна Викторовна', CAST(N'1995-08-12' AS Date), N'4234 867890', N'40817810099910000004', N'Замужем', N'Хронический гастрит', N'kuznetsova', N'P@ssw0rd4', NULL, 1, 4)
INSERT [dbo].[Employees] ([EmployeeID], [FullName], [BirthDate], [PassportData], [BankDetails], [MaritalStatus], [HealthStatus], [Username], [Password], [LastLogin], [AccountStatus], [RoleID]) VALUES (5, N'Волкова Мария Александровна', CAST(N'1988-11-05' AS Date), N'5234 967890', N'40817810099910000005', N'Холост', N'Здорова', N'volkova', N'P@ssw0rd5', NULL, 1, 5)
INSERT [dbo].[Employees] ([EmployeeID], [FullName], [BirthDate], [PassportData], [BankDetails], [MaritalStatus], [HealthStatus], [Username], [Password], [LastLogin], [AccountStatus], [RoleID]) VALUES (6, N'12', CAST(N'2025-05-22' AS Date), NULL, NULL, NULL, NULL, N'123', N'1234', NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Materials] ON 

INSERT [dbo].[Materials] ([MaterialID], [MaterialType], [Name], [Cost], [UnitOfMeasure], [CurrentStock], [MinStockLevel], [SupplierID]) VALUES (1, N'ДСП', N'ДСП 16мм', CAST(1200.00 AS Decimal(15, 2)), N'лист', CAST(500.000 AS Decimal(12, 3)), CAST(100.000 AS Decimal(12, 3)), 1)
INSERT [dbo].[Materials] ([MaterialID], [MaterialType], [Name], [Cost], [UnitOfMeasure], [CurrentStock], [MinStockLevel], [SupplierID]) VALUES (2, N'ЛДСП', N'ЛДСП 18мм', CAST(1500.00 AS Decimal(15, 2)), N'лист', CAST(400.000 AS Decimal(12, 3)), CAST(100.000 AS Decimal(12, 3)), 2)
INSERT [dbo].[Materials] ([MaterialID], [MaterialType], [Name], [Cost], [UnitOfMeasure], [CurrentStock], [MinStockLevel], [SupplierID]) VALUES (3, N'Фанера', N'Фанера 10мм', CAST(900.00 AS Decimal(15, 2)), N'лист', CAST(300.000 AS Decimal(12, 3)), CAST(50.000 AS Decimal(12, 3)), 3)
INSERT [dbo].[Materials] ([MaterialID], [MaterialType], [Name], [Cost], [UnitOfMeasure], [CurrentStock], [MinStockLevel], [SupplierID]) VALUES (4, N'Стекло', N'Стекло закаленное', CAST(800.00 AS Decimal(15, 2)), N'м2', CAST(100.000 AS Decimal(12, 3)), CAST(20.000 AS Decimal(12, 3)), 4)
INSERT [dbo].[Materials] ([MaterialID], [MaterialType], [Name], [Cost], [UnitOfMeasure], [CurrentStock], [MinStockLevel], [SupplierID]) VALUES (5, N'Кромка ПВХ', N'Кромка ПВХ 2мм', CAST(40.00 AS Decimal(15, 2)), N'м', CAST(2000.000 AS Decimal(12, 3)), CAST(500.000 AS Decimal(12, 3)), 5)
SET IDENTITY_INSERT [dbo].[Materials] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 

INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Status]) VALUES (1, 1, 1, CAST(5000.00 AS Decimal(15, 2)), 2, N'Ожидание')
INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Status]) VALUES (2, 2, 2, CAST(8500.00 AS Decimal(15, 2)), 1, N'Ожидание')
INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Status]) VALUES (3, 3, 3, CAST(2000.00 AS Decimal(15, 2)), 3, N'Выполнено')
INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Status]) VALUES (4, 4, 4, CAST(3000.00 AS Decimal(15, 2)), 2, N'Ожидание')
INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Status]) VALUES (5, 5, 5, CAST(6200.00 AS Decimal(15, 2)), 2, N'Выполнено')
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [PartnerID], [ManagerID], [OrderDate], [TotalAmount], [PrepaymentAmount], [DiscountAmount], [Status], [DeliveryMethod]) VALUES (1, 1, 1, CAST(N'2024-01-05T00:00:00.000' AS DateTime), CAST(20000.00 AS Decimal(15, 2)), CAST(10000.00 AS Decimal(15, 2)), CAST(0.00 AS Decimal(15, 2)), N'Новый', N'Курьер')
INSERT [dbo].[Orders] ([OrderID], [PartnerID], [ManagerID], [OrderDate], [TotalAmount], [PrepaymentAmount], [DiscountAmount], [Status], [DeliveryMethod]) VALUES (2, 2, 2, CAST(N'2024-02-05T00:00:00.000' AS DateTime), CAST(18000.00 AS Decimal(15, 2)), CAST(8000.00 AS Decimal(15, 2)), CAST(200.00 AS Decimal(15, 2)), N'Выполнен', N'Самовывоз')
INSERT [dbo].[Orders] ([OrderID], [PartnerID], [ManagerID], [OrderDate], [TotalAmount], [PrepaymentAmount], [DiscountAmount], [Status], [DeliveryMethod]) VALUES (3, 3, 3, CAST(N'2024-03-05T00:00:00.000' AS DateTime), CAST(15000.00 AS Decimal(15, 2)), CAST(5000.00 AS Decimal(15, 2)), CAST(0.00 AS Decimal(15, 2)), N'Отгружен', N'Транспортная')
INSERT [dbo].[Orders] ([OrderID], [PartnerID], [ManagerID], [OrderDate], [TotalAmount], [PrepaymentAmount], [DiscountAmount], [Status], [DeliveryMethod]) VALUES (4, 4, 4, CAST(N'2024-04-05T00:00:00.000' AS DateTime), CAST(9000.00 AS Decimal(15, 2)), CAST(4000.00 AS Decimal(15, 2)), CAST(0.00 AS Decimal(15, 2)), N'В обработке', N'Курьер')
INSERT [dbo].[Orders] ([OrderID], [PartnerID], [ManagerID], [OrderDate], [TotalAmount], [PrepaymentAmount], [DiscountAmount], [Status], [DeliveryMethod]) VALUES (5, 5, 5, CAST(N'2024-05-05T00:00:00.000' AS DateTime), CAST(12000.00 AS Decimal(15, 2)), CAST(6000.00 AS Decimal(15, 2)), CAST(150.00 AS Decimal(15, 2)), N'Новый', N'Самовывоз')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Partners] ON 

INSERT [dbo].[Partners] ([PartnerID], [PartnerTypeID], [CompanyName], [LegalAddress], [TaxID], [DirectorName], [Phone], [Email], [Rating], [CurrentDiscount], [TotalSalesVolume]) VALUES (1, 1, N'ООО МебельМаркет', N'Москва, ул. Ленина, 20', N'7706000066', N'Васильев В. В.', N'+74950001122', N'market@mebel.ru', CAST(5.00 AS Decimal(3, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(20000.00 AS Decimal(15, 2)))
INSERT [dbo].[Partners] ([PartnerID], [PartnerTypeID], [CompanyName], [LegalAddress], [TaxID], [DirectorName], [Phone], [Email], [Rating], [CurrentDiscount], [TotalSalesVolume]) VALUES (2, 2, N'ЗАО ИнтерМебель', N'СПб, ул. Финляндская, 8', N'7807000077', N'Кузнецов А. Д.', N'+78120002233', N'inter@mebel.ru', CAST(4.80 AS Decimal(3, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(18000.00 AS Decimal(15, 2)))
INSERT [dbo].[Partners] ([PartnerID], [PartnerTypeID], [CompanyName], [LegalAddress], [TaxID], [DirectorName], [Phone], [Email], [Rating], [CurrentDiscount], [TotalSalesVolume]) VALUES (3, 3, N'ООО ОфисСтиль', N'Казань, ул. Баумана, 5', N'1608000088', N'Смирнова Е. И.', N'+78430003344', N'ofis@style.ru', CAST(4.95 AS Decimal(3, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(15000.00 AS Decimal(15, 2)))
INSERT [dbo].[Partners] ([PartnerID], [PartnerTypeID], [CompanyName], [LegalAddress], [TaxID], [DirectorName], [Phone], [Email], [Rating], [CurrentDiscount], [TotalSalesVolume]) VALUES (4, 4, N'ИП МебельДом', N'Воронеж, ул. Плеханова, 10', N'3609000099', N'Борисов Г. П.', N'+74730004455', N'dom@mebel.ru', CAST(4.60 AS Decimal(3, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(9000.00 AS Decimal(15, 2)))
INSERT [dbo].[Partners] ([PartnerID], [PartnerTypeID], [CompanyName], [LegalAddress], [TaxID], [DirectorName], [Phone], [Email], [Rating], [CurrentDiscount], [TotalSalesVolume]) VALUES (5, 5, N'ООО СтройСнаб', N'Ростов, ул. Кировская, 3', N'6101000100', N'Зуев Н. Л.', N'+78630005566', N'snab@stroy.ru', CAST(4.50 AS Decimal(3, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(12000.00 AS Decimal(15, 2)))
INSERT [dbo].[Partners] ([PartnerID], [PartnerTypeID], [CompanyName], [LegalAddress], [TaxID], [DirectorName], [Phone], [Email], [Rating], [CurrentDiscount], [TotalSalesVolume]) VALUES (6, 3, N'ООО Ромашка', N'Не указан', N'123456789', N'Неизвестно', N'+7322223322', N'12@321', CAST(5.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(15, 2)))
SET IDENTITY_INSERT [dbo].[Partners] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnerSalesHistory] ON 

INSERT [dbo].[PartnerSalesHistory] ([HistoryID], [PartnerID], [ProductID], [SaleAmount]) VALUES (1, 1, 1, CAST(2.00 AS Decimal(15, 2)))
INSERT [dbo].[PartnerSalesHistory] ([HistoryID], [PartnerID], [ProductID], [SaleAmount]) VALUES (2, 2, 2, CAST(1.00 AS Decimal(15, 2)))
INSERT [dbo].[PartnerSalesHistory] ([HistoryID], [PartnerID], [ProductID], [SaleAmount]) VALUES (3, 3, 3, CAST(3.00 AS Decimal(15, 2)))
INSERT [dbo].[PartnerSalesHistory] ([HistoryID], [PartnerID], [ProductID], [SaleAmount]) VALUES (4, 4, 4, CAST(2.00 AS Decimal(15, 2)))
INSERT [dbo].[PartnerSalesHistory] ([HistoryID], [PartnerID], [ProductID], [SaleAmount]) VALUES (5, 5, 5, CAST(4.00 AS Decimal(15, 2)))
SET IDENTITY_INSERT [dbo].[PartnerSalesHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnerTypes] ON 

INSERT [dbo].[PartnerTypes] ([PartnerTypeID], [TypeName]) VALUES (1, N'Розничный')
INSERT [dbo].[PartnerTypes] ([PartnerTypeID], [TypeName]) VALUES (2, N'Оптовый')
INSERT [dbo].[PartnerTypes] ([PartnerTypeID], [TypeName]) VALUES (3, N'Интернет-магазин')
INSERT [dbo].[PartnerTypes] ([PartnerTypeID], [TypeName]) VALUES (4, N'Корпоративный')
INSERT [dbo].[PartnerTypes] ([PartnerTypeID], [TypeName]) VALUES (5, N'Дилер')
SET IDENTITY_INSERT [dbo].[PartnerTypes] OFF
GO
INSERT [dbo].[ProductMaterials] ([ProductID], [MaterialID], [Quantity]) VALUES (1, 1, CAST(2.500 AS Decimal(12, 3)))
INSERT [dbo].[ProductMaterials] ([ProductID], [MaterialID], [Quantity]) VALUES (1, 5, CAST(4.000 AS Decimal(12, 3)))
INSERT [dbo].[ProductMaterials] ([ProductID], [MaterialID], [Quantity]) VALUES (2, 2, CAST(5.000 AS Decimal(12, 3)))
INSERT [dbo].[ProductMaterials] ([ProductID], [MaterialID], [Quantity]) VALUES (2, 3, CAST(3.000 AS Decimal(12, 3)))
INSERT [dbo].[ProductMaterials] ([ProductID], [MaterialID], [Quantity]) VALUES (3, 4, CAST(1.500 AS Decimal(12, 3)))
INSERT [dbo].[ProductMaterials] ([ProductID], [MaterialID], [Quantity]) VALUES (4, 1, CAST(0.700 AS Decimal(12, 3)))
INSERT [dbo].[ProductMaterials] ([ProductID], [MaterialID], [Quantity]) VALUES (4, 5, CAST(1.200 AS Decimal(12, 3)))
INSERT [dbo].[ProductMaterials] ([ProductID], [MaterialID], [Quantity]) VALUES (5, 2, CAST(2.000 AS Decimal(12, 3)))
INSERT [dbo].[ProductMaterials] ([ProductID], [MaterialID], [Quantity]) VALUES (5, 3, CAST(1.000 AS Decimal(12, 3)))
INSERT [dbo].[ProductMaterials] ([ProductID], [MaterialID], [Quantity]) VALUES (5, 4, CAST(0.800 AS Decimal(12, 3)))
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [SKU], [MinPartnerPrice], [PackageLength], [PackageWidth], [PackageHeight], [ProductionCost]) VALUES (1, 1, N'Стол офисный', N'ST-001', CAST(5000.00 AS Decimal(15, 2)), CAST(120.00 AS Decimal(8, 2)), CAST(60.00 AS Decimal(8, 2)), CAST(10.00 AS Decimal(8, 2)), CAST(3800.00 AS Decimal(15, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [SKU], [MinPartnerPrice], [PackageLength], [PackageWidth], [PackageHeight], [ProductionCost]) VALUES (2, 2, N'Шкаф для документов', N'SH-002', CAST(8500.00 AS Decimal(15, 2)), CAST(80.00 AS Decimal(8, 2)), CAST(40.00 AS Decimal(8, 2)), CAST(200.00 AS Decimal(8, 2)), CAST(7000.00 AS Decimal(15, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [SKU], [MinPartnerPrice], [PackageLength], [PackageWidth], [PackageHeight], [ProductionCost]) VALUES (3, 3, N'Полка настенная', N'PL-003', CAST(2000.00 AS Decimal(15, 2)), CAST(60.00 AS Decimal(8, 2)), CAST(25.00 AS Decimal(8, 2)), CAST(5.00 AS Decimal(8, 2)), CAST(1200.00 AS Decimal(15, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [SKU], [MinPartnerPrice], [PackageLength], [PackageWidth], [PackageHeight], [ProductionCost]) VALUES (4, 4, N'Тумба прикроватная', N'TB-004', CAST(3000.00 AS Decimal(15, 2)), CAST(45.00 AS Decimal(8, 2)), CAST(35.00 AS Decimal(8, 2)), CAST(40.00 AS Decimal(8, 2)), CAST(1800.00 AS Decimal(15, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [SKU], [MinPartnerPrice], [PackageLength], [PackageWidth], [PackageHeight], [ProductionCost]) VALUES (5, 5, N'Комод 4 ящика', N'KM-005', CAST(6200.00 AS Decimal(15, 2)), CAST(90.00 AS Decimal(8, 2)), CAST(45.00 AS Decimal(8, 2)), CAST(90.00 AS Decimal(8, 2)), CAST(4100.00 AS Decimal(15, 2)))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductTypes] ON 

INSERT [dbo].[ProductTypes] ([ProductTypeID], [TypeName]) VALUES (1, N'Стол')
INSERT [dbo].[ProductTypes] ([ProductTypeID], [TypeName]) VALUES (2, N'Шкаф')
INSERT [dbo].[ProductTypes] ([ProductTypeID], [TypeName]) VALUES (3, N'Полка')
INSERT [dbo].[ProductTypes] ([ProductTypeID], [TypeName]) VALUES (4, N'Тумба')
INSERT [dbo].[ProductTypes] ([ProductTypeID], [TypeName]) VALUES (5, N'Комод')
SET IDENTITY_INSERT [dbo].[ProductTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (1, N'Администратор', N'Полный доступ')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (2, N'Менеджер', N'Управление заказами и клиентами')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (3, N'Складской работник', N'Работа с материалами на складе')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (4, N'Бухгалтер', N'Работа с финансами')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (5, N'Пользователь', N'Ограниченный доступ')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[SalesPoints] ON 

INSERT [dbo].[SalesPoints] ([SalesPointID], [PartnerID], [PointType], [Address], [ContactPhone]) VALUES (1, 1, N'Магазин', N'Москва, ул. Ленина, 20', N'+74950001122')
INSERT [dbo].[SalesPoints] ([SalesPointID], [PartnerID], [PointType], [Address], [ContactPhone]) VALUES (2, 2, N'Салон', N'СПб, ул. Финляндская, 8', N'+78120002233')
INSERT [dbo].[SalesPoints] ([SalesPointID], [PartnerID], [PointType], [Address], [ContactPhone]) VALUES (3, 3, N'Торговая точка', N'Казань, ул. Баумана, 5', N'+78430003344')
INSERT [dbo].[SalesPoints] ([SalesPointID], [PartnerID], [PointType], [Address], [ContactPhone]) VALUES (4, 4, N'Магазин', N'Воронеж, ул. Плеханова, 10', N'+74730004455')
INSERT [dbo].[SalesPoints] ([SalesPointID], [PartnerID], [PointType], [Address], [ContactPhone]) VALUES (5, 5, N'Оптовый склад', N'Ростов, ул. Кировская, 3', N'+78630005566')
SET IDENTITY_INSERT [dbo].[SalesPoints] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SupplierID], [SupplierType], [CompanyName], [LegalAddress], [ContactDetails], [TaxID], [Rating]) VALUES (1, N'Производитель', N'ООО МетПром', N'Москва, ул. Заводская, 1', N'info@metprom.ru', N'7701000011', CAST(5.00 AS Decimal(3, 2)))
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierType], [CompanyName], [LegalAddress], [ContactDetails], [TaxID], [Rating]) VALUES (2, N'Дистрибьютор', N'ЗАО СтройМир', N'СПб, ул. Кирочная, 12', N'zakaz@stroymir.ru', N'7802000022', CAST(4.85 AS Decimal(3, 2)))
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierType], [CompanyName], [LegalAddress], [ContactDetails], [TaxID], [Rating]) VALUES (3, N'Производитель', N'ООО ЛесТорг', N'Воронеж, ул. Лесная, 5', N'les@lestorg.ru', N'3603000033', CAST(5.00 AS Decimal(3, 2)))
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierType], [CompanyName], [LegalAddress], [ContactDetails], [TaxID], [Rating]) VALUES (4, N'Оптовик', N'ООО ХимТрейд', N'Казань, ул. Индустриальная, 15', N'chem@chemtrade.ru', N'1604000044', CAST(4.70 AS Decimal(3, 2)))
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierType], [CompanyName], [LegalAddress], [ContactDetails], [TaxID], [Rating]) VALUES (5, N'Дилер', N'ИП МирМебели', N'Ростов-на-Дону, пр. Космонавтов, 77', N'mebel@mirmeb.ru', N'6105000055', CAST(4.50 AS Decimal(3, 2)))
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
SET IDENTITY_INSERT [dbo].[WarehouseTransactions] ON 

INSERT [dbo].[WarehouseTransactions] ([TransactionID], [MaterialID], [EmployeeID], [ProductID], [TransactionType], [Quantity], [TransactionDate]) VALUES (1, 1, 1, 1, N'Списание', CAST(2.500 AS Decimal(12, 3)), CAST(N'2024-01-05T00:00:00.000' AS DateTime))
INSERT [dbo].[WarehouseTransactions] ([TransactionID], [MaterialID], [EmployeeID], [ProductID], [TransactionType], [Quantity], [TransactionDate]) VALUES (2, 2, 2, 2, N'Приход', CAST(5.000 AS Decimal(12, 3)), CAST(N'2024-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[WarehouseTransactions] ([TransactionID], [MaterialID], [EmployeeID], [ProductID], [TransactionType], [Quantity], [TransactionDate]) VALUES (3, 3, 3, 3, N'Списание', CAST(3.000 AS Decimal(12, 3)), CAST(N'2024-03-05T00:00:00.000' AS DateTime))
INSERT [dbo].[WarehouseTransactions] ([TransactionID], [MaterialID], [EmployeeID], [ProductID], [TransactionType], [Quantity], [TransactionDate]) VALUES (4, 4, 4, 4, N'Списание', CAST(1.500 AS Decimal(12, 3)), CAST(N'2024-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[WarehouseTransactions] ([TransactionID], [MaterialID], [EmployeeID], [ProductID], [TransactionType], [Quantity], [TransactionDate]) VALUES (5, 5, 5, 5, N'Приход', CAST(4.000 AS Decimal(12, 3)), CAST(N'2024-05-05T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[WarehouseTransactions] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Employee__536C85E47E6BF1EF]    Script Date: 25.05.2025 21:13:49 ******/
ALTER TABLE [dbo].[Employees] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Partners__711BE08D6618D2D3]    Script Date: 25.05.2025 21:13:49 ******/
ALTER TABLE [dbo].[Partners] ADD UNIQUE NONCLUSTERED 
(
	[TaxID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Products__CA1ECF0D56AD70FC]    Script Date: 25.05.2025 21:13:49 ******/
ALTER TABLE [dbo].[Products] ADD UNIQUE NONCLUSTERED 
(
	[SKU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Supplier__711BE08D3ED5748B]    Script Date: 25.05.2025 21:13:49 ******/
ALTER TABLE [dbo].[Suppliers] ADD UNIQUE NONCLUSTERED 
(
	[TaxID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employees] ADD  CONSTRAINT [DF_Employee_AccountStatus]  DEFAULT ((1)) FOR [AccountStatus]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_OrderDate]  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_Discount]  DEFAULT ((0.00)) FOR [DiscountAmount]
GO
ALTER TABLE [dbo].[Partners] ADD  CONSTRAINT [DF_Partner_Rating]  DEFAULT ((5.00)) FOR [Rating]
GO
ALTER TABLE [dbo].[Partners] ADD  CONSTRAINT [DF_Partner_Discount]  DEFAULT ((0.00)) FOR [CurrentDiscount]
GO
ALTER TABLE [dbo].[Partners] ADD  CONSTRAINT [DF_Partner_Sales]  DEFAULT ((0.00)) FOR [TotalSalesVolume]
GO
ALTER TABLE [dbo].[Suppliers] ADD  CONSTRAINT [DF_Supplier_Rating]  DEFAULT ((5.00)) FOR [Rating]
GO
ALTER TABLE [dbo].[WarehouseTransactions] ADD  CONSTRAINT [DF_WT_Date]  DEFAULT (getdate()) FOR [TransactionDate]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([PartnerID])
REFERENCES [dbo].[Partners] ([PartnerID])
GO
ALTER TABLE [dbo].[Partners]  WITH CHECK ADD FOREIGN KEY([PartnerTypeID])
REFERENCES [dbo].[PartnerTypes] ([PartnerTypeID])
GO
ALTER TABLE [dbo].[PartnerSalesHistory]  WITH CHECK ADD FOREIGN KEY([PartnerID])
REFERENCES [dbo].[Partners] ([PartnerID])
GO
ALTER TABLE [dbo].[PartnerSalesHistory]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ProductMaterials]  WITH CHECK ADD FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Materials] ([MaterialID])
GO
ALTER TABLE [dbo].[ProductMaterials]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductTypes] ([ProductTypeID])
GO
ALTER TABLE [dbo].[SalesPoints]  WITH CHECK ADD FOREIGN KEY([PartnerID])
REFERENCES [dbo].[Partners] ([PartnerID])
GO
ALTER TABLE [dbo].[WarehouseTransactions]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[WarehouseTransactions]  WITH CHECK ADD FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Materials] ([MaterialID])
GO
ALTER TABLE [dbo].[WarehouseTransactions]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
USE [master]
GO
ALTER DATABASE [TestEkz] SET  READ_WRITE 
GO
