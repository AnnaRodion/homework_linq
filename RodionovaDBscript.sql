USE [master]
GO
/****** Object:  Database [Students]    Script Date: 13.11.2023 17:22:27 ******/
CREATE DATABASE [Students]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Students', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Students.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Students_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Students_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Students] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Students].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Students] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Students] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Students] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Students] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Students] SET ARITHABORT OFF 
GO
ALTER DATABASE [Students] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Students] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Students] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Students] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Students] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Students] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Students] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Students] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Students] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Students] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Students] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Students] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Students] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Students] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Students] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Students] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Students] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Students] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Students] SET  MULTI_USER 
GO
ALTER DATABASE [Students] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Students] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Students] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Students] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Students] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Students] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Students] SET QUERY_STORE = ON
GO
ALTER DATABASE [Students] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Students]
GO
/****** Object:  Table [dbo].[StudentList]    Script Date: 13.11.2023 17:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentList](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](20) NOT NULL,
	[Surname] [nchar](20) NOT NULL,
	[PhoneNumber] [int] NOT NULL,
	[Address] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 13.11.2023 17:22:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Subj_name] [nchar](20) NOT NULL,
	[Teacher] [nchar](15) NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[StudentList] ON 

INSERT [dbo].[StudentList] ([id], [Name], [Surname], [PhoneNumber], [Address]) VALUES (1, N'Юлия                ', N'Кошкина             ', 12345, N'Ул. Пушкина д. Колотушкина                        ')
INSERT [dbo].[StudentList] ([id], [Name], [Surname], [PhoneNumber], [Address]) VALUES (2, N'Петя                ', N'Сидоров             ', 122233, N'Бездомный                                         ')
INSERT [dbo].[StudentList] ([id], [Name], [Surname], [PhoneNumber], [Address]) VALUES (4, N'Маша                ', N'Лохова              ', 6666, N'г Неудачников                                     ')
INSERT [dbo].[StudentList] ([id], [Name], [Surname], [PhoneNumber], [Address]) VALUES (6, N'Коля                ', N'Умный               ', 10000, N'г Петушки                                         ')
INSERT [dbo].[StudentList] ([id], [Name], [Surname], [PhoneNumber], [Address]) VALUES (7, N'Иван                ', N'Минаев              ', 2345, N'Кабаново                                          ')
SET IDENTITY_INSERT [dbo].[StudentList] OFF
GO
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([id], [Subj_name], [Teacher]) VALUES (5, N'Приколоведенье      ', N'Мемов          ')
INSERT [dbo].[Subject] ([id], [Subj_name], [Teacher]) VALUES (6, N'Кошькология         ', N'Мяукина        ')
INSERT [dbo].[Subject] ([id], [Subj_name], [Teacher]) VALUES (7, N'Чизбарговое         ', N'ММММММ         ')
INSERT [dbo].[Subject] ([id], [Subj_name], [Teacher]) VALUES (8, N'Реинжиниринг        ', N'Неградусов     ')
SET IDENTITY_INSERT [dbo].[Subject] OFF
GO
/****** Object:  StoredProcedure [dbo].[RodionovaGetStudentById]    Script Date: 13.11.2023 17:22:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RodionovaGetStudentById]
(@stId int = 5)
AS
select * from StudentList where id = @stId
GO
/****** Object:  StoredProcedure [dbo].[RodionovaGetStudentBySurname]    Script Date: 13.11.2023 17:22:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RodionovaGetStudentBySurname]
(@Surname nvarchar(20))
AS
SELECT * FROM StudentList WHERE Surname = @Surname;
GO
/****** Object:  StoredProcedure [dbo].[RodionovaGetSubjByName]    Script Date: 13.11.2023 17:22:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RodionovaGetSubjByName]
(@Subj_name nvarchar(20))
AS
SELECT * FROM Subject WHERE Subj_name = @Subj_name;
GO
USE [master]
GO
ALTER DATABASE [Students] SET  READ_WRITE 
GO
