USE [master]
GO
/****** Object:  Database [Lab_21]    Script Date: 26.05.2022 13:35:52 ******/
CREATE DATABASE [Lab_21]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Lab_21', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.HOMESERV\MSSQL\DATA\Lab_21.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Lab_21_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.HOMESERV\MSSQL\DATA\Lab_21_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Lab_21] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Lab_21].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Lab_21] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Lab_21] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Lab_21] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Lab_21] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Lab_21] SET ARITHABORT OFF 
GO
ALTER DATABASE [Lab_21] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Lab_21] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Lab_21] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Lab_21] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Lab_21] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Lab_21] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Lab_21] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Lab_21] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Lab_21] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Lab_21] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Lab_21] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Lab_21] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Lab_21] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Lab_21] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Lab_21] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Lab_21] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Lab_21] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Lab_21] SET RECOVERY FULL 
GO
ALTER DATABASE [Lab_21] SET  MULTI_USER 
GO
ALTER DATABASE [Lab_21] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Lab_21] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Lab_21] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Lab_21] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Lab_21] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Lab_21] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Lab_21', N'ON'
GO
ALTER DATABASE [Lab_21] SET QUERY_STORE = OFF
GO
USE [Lab_21]
GO
/****** Object:  Table [dbo].[Parts_reference.]    Script Date: 26.05.2022 13:35:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parts_reference.](
	[Parts_Id] [int] NOT NULL,
	[Product_Name] [nvarchar](50) NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_Parts_reference.] PRIMARY KEY CLUSTERED 
(
	[Parts_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_composition]    Script Date: 26.05.2022 13:35:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_composition](
	[Product_Id] [int] NOT NULL,
	[Parts_Id] [int] NOT NULL,
	[Number_of_parts] [int] NULL,
 CONSTRAINT [PK_Product_composition] PRIMARY KEY CLUSTERED 
(
	[Product_Id] ASC,
	[Parts_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Reference]    Script Date: 26.05.2022 13:35:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Reference](
	[Product_Id] [int] NOT NULL,
	[Product_Name] [nvarchar](50) NULL,
	[Cost_of_assembly] [int] NULL,
 CONSTRAINT [PK_Product_Reference] PRIMARY KEY CLUSTERED 
(
	[Product_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Release_plan]    Script Date: 26.05.2022 13:35:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Release_plan](
	[Product_Id] [int] NOT NULL,
	[Number_of_products] [int] NULL,
	[Workshops_Id] [int] NOT NULL,
 CONSTRAINT [PK_Release_plan] PRIMARY KEY CLUSTERED 
(
	[Product_Id] ASC,
	[Workshops_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workshops]    Script Date: 26.05.2022 13:35:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workshops](
	[Workshops_Id] [int] NOT NULL,
	[Workshops_Name] [nvarchar](50) NULL,
	[Chief] [nvarchar](50) NULL,
 CONSTRAINT [PK_Workshops] PRIMARY KEY CLUSTERED 
(
	[Workshops_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Parts_reference.] ([Parts_Id], [Product_Name], [Price]) VALUES (1, N'Ручка', 100)
INSERT [dbo].[Parts_reference.] ([Parts_Id], [Product_Name], [Price]) VALUES (2, N'Спицы', 50)
INSERT [dbo].[Parts_reference.] ([Parts_Id], [Product_Name], [Price]) VALUES (3, N'Полотно', 100)
INSERT [dbo].[Parts_reference.] ([Parts_Id], [Product_Name], [Price]) VALUES (4, N'Плата', 300)
INSERT [dbo].[Parts_reference.] ([Parts_Id], [Product_Name], [Price]) VALUES (5, N'Корпус', 200)
INSERT [dbo].[Parts_reference.] ([Parts_Id], [Product_Name], [Price]) VALUES (6, N'Клавиши', 10)
INSERT [dbo].[Parts_reference.] ([Parts_Id], [Product_Name], [Price]) VALUES (7, N'Плата', 100)
INSERT [dbo].[Parts_reference.] ([Parts_Id], [Product_Name], [Price]) VALUES (8, N'Корпус', 100)
GO
INSERT [dbo].[Product_composition] ([Product_Id], [Parts_Id], [Number_of_parts]) VALUES (1, 1, 1)
INSERT [dbo].[Product_composition] ([Product_Id], [Parts_Id], [Number_of_parts]) VALUES (1, 2, 6)
INSERT [dbo].[Product_composition] ([Product_Id], [Parts_Id], [Number_of_parts]) VALUES (1, 3, 1)
INSERT [dbo].[Product_composition] ([Product_Id], [Parts_Id], [Number_of_parts]) VALUES (2, 4, 2)
INSERT [dbo].[Product_composition] ([Product_Id], [Parts_Id], [Number_of_parts]) VALUES (2, 5, 1)
INSERT [dbo].[Product_composition] ([Product_Id], [Parts_Id], [Number_of_parts]) VALUES (2, 6, 10)
INSERT [dbo].[Product_composition] ([Product_Id], [Parts_Id], [Number_of_parts]) VALUES (3, 7, 1)
INSERT [dbo].[Product_composition] ([Product_Id], [Parts_Id], [Number_of_parts]) VALUES (3, 8, 1)
GO
INSERT [dbo].[Product_Reference] ([Product_Id], [Product_Name], [Cost_of_assembly]) VALUES (1, N'Зонтик', 500)
INSERT [dbo].[Product_Reference] ([Product_Id], [Product_Name], [Cost_of_assembly]) VALUES (2, N'Клавиатура', 900)
INSERT [dbo].[Product_Reference] ([Product_Id], [Product_Name], [Cost_of_assembly]) VALUES (3, N'Мышка', 200)
GO
INSERT [dbo].[Release_plan] ([Product_Id], [Number_of_products], [Workshops_Id]) VALUES (1, 5, 1)
INSERT [dbo].[Release_plan] ([Product_Id], [Number_of_products], [Workshops_Id]) VALUES (2, 2, 2)
INSERT [dbo].[Release_plan] ([Product_Id], [Number_of_products], [Workshops_Id]) VALUES (3, 9, 3)
GO
INSERT [dbo].[Workshops] ([Workshops_Id], [Workshops_Name], [Chief]) VALUES (1, N'Сборка_зонтов', N'Иванов')
INSERT [dbo].[Workshops] ([Workshops_Id], [Workshops_Name], [Chief]) VALUES (2, N'Сборка_клавиатур', N'Петров')
INSERT [dbo].[Workshops] ([Workshops_Id], [Workshops_Name], [Chief]) VALUES (3, N'Сборка_мышек', N'Сидоров')
GO
ALTER TABLE [dbo].[Product_composition]  WITH CHECK ADD  CONSTRAINT [FK_Product_composition_Parts_reference.] FOREIGN KEY([Parts_Id])
REFERENCES [dbo].[Parts_reference.] ([Parts_Id])
GO
ALTER TABLE [dbo].[Product_composition] CHECK CONSTRAINT [FK_Product_composition_Parts_reference.]
GO
ALTER TABLE [dbo].[Product_composition]  WITH CHECK ADD  CONSTRAINT [FK_Product_composition_Product_Reference] FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Product_Reference] ([Product_Id])
GO
ALTER TABLE [dbo].[Product_composition] CHECK CONSTRAINT [FK_Product_composition_Product_Reference]
GO
ALTER TABLE [dbo].[Release_plan]  WITH CHECK ADD  CONSTRAINT [FK_Release_plan_Product_Reference] FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Product_Reference] ([Product_Id])
GO
ALTER TABLE [dbo].[Release_plan] CHECK CONSTRAINT [FK_Release_plan_Product_Reference]
GO
ALTER TABLE [dbo].[Release_plan]  WITH CHECK ADD  CONSTRAINT [FK_Release_plan_Workshops] FOREIGN KEY([Workshops_Id])
REFERENCES [dbo].[Workshops] ([Workshops_Id])
GO
ALTER TABLE [dbo].[Release_plan] CHECK CONSTRAINT [FK_Release_plan_Workshops]
GO
USE [master]
GO
ALTER DATABASE [Lab_21] SET  READ_WRITE 
GO
