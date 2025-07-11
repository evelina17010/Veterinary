USE [master]
GO
/****** Object:  Database [VeterinaryClinic]    Script Date: 15.04.2025 19:22:13 ******/
CREATE DATABASE [VeterinaryClinic]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VeterinaryClinic', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\VeterinaryClinic.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VeterinaryClinic_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\VeterinaryClinic_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [VeterinaryClinic] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VeterinaryClinic].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VeterinaryClinic] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VeterinaryClinic] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VeterinaryClinic] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VeterinaryClinic] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VeterinaryClinic] SET ARITHABORT OFF 
GO
ALTER DATABASE [VeterinaryClinic] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VeterinaryClinic] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VeterinaryClinic] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VeterinaryClinic] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VeterinaryClinic] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VeterinaryClinic] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VeterinaryClinic] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VeterinaryClinic] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VeterinaryClinic] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VeterinaryClinic] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VeterinaryClinic] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VeterinaryClinic] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VeterinaryClinic] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VeterinaryClinic] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VeterinaryClinic] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VeterinaryClinic] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VeterinaryClinic] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VeterinaryClinic] SET RECOVERY FULL 
GO
ALTER DATABASE [VeterinaryClinic] SET  MULTI_USER 
GO
ALTER DATABASE [VeterinaryClinic] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VeterinaryClinic] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VeterinaryClinic] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VeterinaryClinic] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VeterinaryClinic] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VeterinaryClinic] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'VeterinaryClinic', N'ON'
GO
ALTER DATABASE [VeterinaryClinic] SET QUERY_STORE = ON
GO
ALTER DATABASE [VeterinaryClinic] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [VeterinaryClinic]
GO
/****** Object:  Table [dbo].[Animals]    Script Date: 15.04.2025 19:22:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animals](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[id_gender] [int] NULL,
	[id_type] [int] NULL,
	[weight] [decimal](5, 2) NULL,
	[height] [decimal](5, 2) NULL,
 CONSTRAINT [PK__Animals__3213E83FFC169B5A] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnimalType]    Script Date: 15.04.2025 19:22:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnimalType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK__AnimalTy__3213E83F9AD93053] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 15.04.2025 19:22:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[appointment_id] [int] IDENTITY(1,1) NOT NULL,
	[animal_id] [int] NULL,
	[doctor_id] [int] NULL,
	[appointment_date] [date] NOT NULL,
	[comment] [text] NULL,
	[is_deleted] [bit] NULL,
 CONSTRAINT [PK__Appointm__A50828FC7103C9D1] PRIMARY KEY CLUSTERED 
(
	[appointment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 15.04.2025 19:22:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[patronymic] [varchar](50) NULL,
	[id_type] [int] NULL,
 CONSTRAINT [PK__Doctors__3213E83F2C08B0AD] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 15.04.2025 19:22:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NOT NULL,
 CONSTRAINT [PK__Gender__3213E83F0CDA4ACD] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeDoctor]    Script Date: 15.04.2025 19:22:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeDoctor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK__TypeDoct__3213E83F957308DA] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 15.04.2025 19:22:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[id_doctors] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Animals] ON 

INSERT [dbo].[Animals] ([id], [name], [id_gender], [id_type], [weight], [height]) VALUES (1, N'Барсик', 1, 2, CAST(4.50 AS Decimal(5, 2)), CAST(30.00 AS Decimal(5, 2)))
INSERT [dbo].[Animals] ([id], [name], [id_gender], [id_type], [weight], [height]) VALUES (2, N'Шарик', 1, 1, CAST(8.00 AS Decimal(5, 2)), CAST(45.00 AS Decimal(5, 2)))
INSERT [dbo].[Animals] ([id], [name], [id_gender], [id_type], [weight], [height]) VALUES (3, N'Кеша', 1, 3, CAST(0.30 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[Animals] OFF
GO
SET IDENTITY_INSERT [dbo].[AnimalType] ON 

INSERT [dbo].[AnimalType] ([id], [name]) VALUES (1, N'Собака')
INSERT [dbo].[AnimalType] ([id], [name]) VALUES (2, N'Кошка')
INSERT [dbo].[AnimalType] ([id], [name]) VALUES (3, N'Попугай')
SET IDENTITY_INSERT [dbo].[AnimalType] OFF
GO
SET IDENTITY_INSERT [dbo].[Appointments] ON 

INSERT [dbo].[Appointments] ([appointment_id], [animal_id], [doctor_id], [appointment_date], [comment], [is_deleted]) VALUES (1, 1, 1, CAST(N'2023-10-10' AS Date), N'Плановый осмотр', NULL)
INSERT [dbo].[Appointments] ([appointment_id], [animal_id], [doctor_id], [appointment_date], [comment], [is_deleted]) VALUES (2, 2, 2, CAST(N'2023-10-11' AS Date), N'Вакцинация', NULL)
SET IDENTITY_INSERT [dbo].[Appointments] OFF
GO
SET IDENTITY_INSERT [dbo].[Doctors] ON 

INSERT [dbo].[Doctors] ([id], [last_name], [first_name], [patronymic], [id_type]) VALUES (1, N'Иванов', N'Иван', N'Иванович', 1)
INSERT [dbo].[Doctors] ([id], [last_name], [first_name], [patronymic], [id_type]) VALUES (2, N'Петров', N'Петр', N'Петрович', 2)
INSERT [dbo].[Doctors] ([id], [last_name], [first_name], [patronymic], [id_type]) VALUES (3, N'Сидорова', N'Мария', N'Сергеевна', 3)
SET IDENTITY_INSERT [dbo].[Doctors] OFF
GO
SET IDENTITY_INSERT [dbo].[Gender] ON 

INSERT [dbo].[Gender] ([id], [name]) VALUES (1, N'Мужской')
INSERT [dbo].[Gender] ([id], [name]) VALUES (2, N'Женский')
SET IDENTITY_INSERT [dbo].[Gender] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeDoctor] ON 

INSERT [dbo].[TypeDoctor] ([id], [name]) VALUES (1, N'Хирург')
INSERT [dbo].[TypeDoctor] ([id], [name]) VALUES (2, N'Терапевт')
INSERT [dbo].[TypeDoctor] ([id], [name]) VALUES (3, N'Дерматолог')
SET IDENTITY_INSERT [dbo].[TypeDoctor] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [login], [password], [id_doctors]) VALUES (11, N'123', N'123', 1)
INSERT [dbo].[User] ([id], [login], [password], [id_doctors]) VALUES (12, N'234', N'234', 2)
INSERT [dbo].[User] ([id], [login], [password], [id_doctors]) VALUES (13, N'345', N'345', 3)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Animals]  WITH CHECK ADD  CONSTRAINT [FK__Animals__id_gend__403A8C7D] FOREIGN KEY([id_gender])
REFERENCES [dbo].[Gender] ([id])
GO
ALTER TABLE [dbo].[Animals] CHECK CONSTRAINT [FK__Animals__id_gend__403A8C7D]
GO
ALTER TABLE [dbo].[Animals]  WITH CHECK ADD  CONSTRAINT [FK__Animals__id_type__412EB0B6] FOREIGN KEY([id_type])
REFERENCES [dbo].[AnimalType] ([id])
GO
ALTER TABLE [dbo].[Animals] CHECK CONSTRAINT [FK__Animals__id_type__412EB0B6]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK__Appointme__anima__440B1D61] FOREIGN KEY([animal_id])
REFERENCES [dbo].[Animals] ([id])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK__Appointme__anima__440B1D61]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK__Appointme__docto__44FF419A] FOREIGN KEY([doctor_id])
REFERENCES [dbo].[Doctors] ([id])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK__Appointme__docto__44FF419A]
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK__Doctors__id_type__398D8EEE] FOREIGN KEY([id_type])
REFERENCES [dbo].[TypeDoctor] ([id])
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK__Doctors__id_type__398D8EEE]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Doctors] FOREIGN KEY([id_doctors])
REFERENCES [dbo].[Doctors] ([id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Doctors]
GO
USE [master]
GO
ALTER DATABASE [VeterinaryClinic] SET  READ_WRITE 
GO
