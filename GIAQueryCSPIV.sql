USE [master]
GO
/****** Object:  Database [GIAssignment]    Script Date: 8/06/2021 8:07:19 PM ******/
CREATE DATABASE [GIAssignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GIAssignment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\GIAssignment.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GIAssignment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\GIAssignment_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [GIAssignment] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GIAssignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GIAssignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GIAssignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GIAssignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GIAssignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GIAssignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [GIAssignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GIAssignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GIAssignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GIAssignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GIAssignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GIAssignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GIAssignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GIAssignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GIAssignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GIAssignment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GIAssignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GIAssignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GIAssignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GIAssignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GIAssignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GIAssignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GIAssignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GIAssignment] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GIAssignment] SET  MULTI_USER 
GO
ALTER DATABASE [GIAssignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GIAssignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GIAssignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GIAssignment] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [GIAssignment] SET DELAYED_DURABILITY = DISABLED 
GO
USE [GIAssignment]
GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 8/06/2021 8:07:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserLogin](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [char](50) NOT NULL,
	[MobileNo] [char](20) NOT NULL,
	[EmailId] [char](50) NOT NULL,
 CONSTRAINT [PK_UserLogin] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[UserLogin] ON 

INSERT [dbo].[UserLogin] ([UserId], [Name], [MobileNo], [EmailId]) VALUES (1, N'Tejas Patil                                       ', N'+918097600569       ', N'171192tejaspatil@gmail.com                        ')
SET IDENTITY_INSERT [dbo].[UserLogin] OFF
/****** Object:  StoredProcedure [dbo].[CheckUser]    Script Date: 8/06/2021 8:07:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckUser] 
	(
		@MobileNo char(20)
		/*@EmailID char(20)*/
	)
AS
SELECT * FROM UserLogin 
WHERE MobileNo = @MobileNo

GO
/****** Object:  StoredProcedure [dbo].[SPInsert]    Script Date: 8/06/2021 8:07:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPInsert]
	(
		@Name varchar(50),
		@MobileNo char(20),
		@EmailID char(50)
	)
AS
INSERT INTO UserLogin([Name],[MobileNo],[EmailId])
     VALUES (@Name,@MobileNo,@EmailID)

GO
USE [master]
GO
ALTER DATABASE [GIAssignment] SET  READ_WRITE 
GO
