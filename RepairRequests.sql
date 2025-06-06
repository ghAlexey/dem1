USE [master]
GO
/****** Object:  Database [RepairRequestsDB]    Script Date: 25.05.2025 21:15:24 ******/
CREATE DATABASE [RepairRequestsDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RepairRequestsDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\RepairRequestsDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RepairRequestsDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\RepairRequestsDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [RepairRequestsDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RepairRequestsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RepairRequestsDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RepairRequestsDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RepairRequestsDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RepairRequestsDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RepairRequestsDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [RepairRequestsDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RepairRequestsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RepairRequestsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RepairRequestsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RepairRequestsDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RepairRequestsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RepairRequestsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RepairRequestsDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RepairRequestsDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RepairRequestsDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RepairRequestsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RepairRequestsDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RepairRequestsDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RepairRequestsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RepairRequestsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RepairRequestsDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RepairRequestsDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RepairRequestsDB] SET RECOVERY FULL 
GO
ALTER DATABASE [RepairRequestsDB] SET  MULTI_USER 
GO
ALTER DATABASE [RepairRequestsDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RepairRequestsDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RepairRequestsDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RepairRequestsDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RepairRequestsDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RepairRequestsDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'RepairRequestsDB', N'ON'
GO
ALTER DATABASE [RepairRequestsDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [RepairRequestsDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [RepairRequestsDB]
GO
/****** Object:  User [user_user]    Script Date: 25.05.2025 21:15:24 ******/
CREATE USER [user_user] FOR LOGIN [login_user] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [user_manager]    Script Date: 25.05.2025 21:15:24 ******/
CREATE USER [user_manager] FOR LOGIN [login_manager] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [user_admin]    Script Date: 25.05.2025 21:15:24 ******/
CREATE USER [user_admin] FOR LOGIN [login_admin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [Role_User]    Script Date: 25.05.2025 21:15:24 ******/
CREATE ROLE [Role_User]
GO
/****** Object:  DatabaseRole [Role_Manager]    Script Date: 25.05.2025 21:15:24 ******/
CREATE ROLE [Role_Manager]
GO
/****** Object:  DatabaseRole [Role_Admin]    Script Date: 25.05.2025 21:15:24 ******/
CREATE ROLE [Role_Admin]
GO
ALTER ROLE [Role_User] ADD MEMBER [user_user]
GO
ALTER ROLE [Role_Manager] ADD MEMBER [user_manager]
GO
ALTER ROLE [Role_Admin] ADD MEMBER [user_admin]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 25.05.2025 21:15:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[EquipmentID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Model] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[EquipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Executors]    Script Date: 25.05.2025 21:15:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Executors](
	[ExecutorID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Specialization] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ExecutorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Requests]    Script Date: 25.05.2025 21:15:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requests](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[RequestDate] [datetime] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CompletionDate] [datetime] NULL,
	[UserID] [int] NOT NULL,
	[ExecutorID] [int] NOT NULL,
	[EquipmentID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 25.05.2025 21:15:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statuses](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 25.05.2025 21:15:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Equipment] ON 

INSERT [dbo].[Equipment] ([EquipmentID], [Type], [Model]) VALUES (1, N'Принтер', N'HP LaserJet 1020')
INSERT [dbo].[Equipment] ([EquipmentID], [Type], [Model]) VALUES (2, N'Сканер', N'Canon LIDE 300')
INSERT [dbo].[Equipment] ([EquipmentID], [Type], [Model]) VALUES (3, N'Сервер', N'Dell R640')
SET IDENTITY_INSERT [dbo].[Equipment] OFF
GO
SET IDENTITY_INSERT [dbo].[Executors] ON 

INSERT [dbo].[Executors] ([ExecutorID], [FullName], [Specialization]) VALUES (1, N'Сидоров С.С.', N'Электронщик')
INSERT [dbo].[Executors] ([ExecutorID], [FullName], [Specialization]) VALUES (2, N'Кузнецов А.А.', N'Механик')
SET IDENTITY_INSERT [dbo].[Executors] OFF
GO
SET IDENTITY_INSERT [dbo].[Requests] ON 

INSERT [dbo].[Requests] ([RequestID], [RequestDate], [Description], [CompletionDate], [UserID], [ExecutorID], [EquipmentID], [StatusID]) VALUES (1, CAST(N'2025-05-19T07:44:51.000' AS DateTime), N'описания', NULL, 1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Requests] OFF
GO
SET IDENTITY_INSERT [dbo].[Statuses] ON 

INSERT [dbo].[Statuses] ([StatusID], [Name]) VALUES (1, N'Принята')
INSERT [dbo].[Statuses] ([StatusID], [Name]) VALUES (2, N'В работе')
INSERT [dbo].[Statuses] ([StatusID], [Name]) VALUES (3, N'Завершена')
SET IDENTITY_INSERT [dbo].[Statuses] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [FullName], [Role]) VALUES (1, N'Иванов И.И.', N'Пользователь')
INSERT [dbo].[Users] ([UserID], [FullName], [Role]) VALUES (2, N'Петров П.П.', N'Админ')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Equipment] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[Equipment] ([EquipmentID])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Equipment]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Executors] FOREIGN KEY([ExecutorID])
REFERENCES [dbo].[Executors] ([ExecutorID])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Executors]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Statuses] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Statuses] ([StatusID])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Statuses]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Users]
GO
USE [master]
GO
ALTER DATABASE [RepairRequestsDB] SET  READ_WRITE 
GO
