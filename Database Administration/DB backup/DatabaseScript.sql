USE [master]
GO
/****** Object:  Database [tanmoy]    Script Date: 2/19/2017 8:38:16 PM ******/
CREATE DATABASE [tanmoy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tanmoy', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\tanmoy.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'tanmoy_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\tanmoy_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [tanmoy] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tanmoy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tanmoy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tanmoy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tanmoy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tanmoy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tanmoy] SET ARITHABORT OFF 
GO
ALTER DATABASE [tanmoy] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tanmoy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tanmoy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tanmoy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tanmoy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tanmoy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tanmoy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tanmoy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tanmoy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tanmoy] SET  DISABLE_BROKER 
GO
ALTER DATABASE [tanmoy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tanmoy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tanmoy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tanmoy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tanmoy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tanmoy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tanmoy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tanmoy] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [tanmoy] SET  MULTI_USER 
GO
ALTER DATABASE [tanmoy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tanmoy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tanmoy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tanmoy] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [tanmoy] SET DELAYED_DURABILITY = DISABLED 
GO
USE [tanmoy]
GO
/****** Object:  User [Tanmoy]    Script Date: 2/19/2017 8:38:16 PM ******/
CREATE USER [Tanmoy] FOR LOGIN [tintin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[contact]    Script Date: 2/19/2017 8:38:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contact](
	[contact_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[telephone] [nvarchar](50) NULL,
	[userid] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_contact] PRIMARY KEY CLUSTERED 
(
	[contact_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user_roles]    Script Date: 2/19/2017 8:38:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_roles](
	[user_role_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](max) NOT NULL,
	[role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_user_roles] PRIMARY KEY CLUSTERED 
(
	[user_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users]    Script Date: 2/19/2017 8:38:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[enabled] [tinyint] NOT NULL CONSTRAINT [DF_users_enabled]  DEFAULT ((1)),
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[contact] ON 

INSERT [dbo].[contact] ([contact_id], [name], [email], [address], [telephone], [userid]) VALUES (1, N'sddssdsd', N'dss', N'dsd', N'tanmoy', N'sdsd')
INSERT [dbo].[contact] ([contact_id], [name], [email], [address], [telephone], [userid]) VALUES (2, N'TanmoyS', N'tanmoy281@gmail.com', N'Liluah', N'8902771773', N'tanmoy')
INSERT [dbo].[contact] ([contact_id], [name], [email], [address], [telephone], [userid]) VALUES (4, N'Jhum Didi', N'a@a.com', N'DGP', N'8902771773', N'tanmoy')
INSERT [dbo].[contact] ([contact_id], [name], [email], [address], [telephone], [userid]) VALUES (9, N'gg', N'gggg', N'gg', N'ggg', N'tata')
INSERT [dbo].[contact] ([contact_id], [name], [email], [address], [telephone], [userid]) VALUES (11, N'aa', N'bb', N'cc', N'dd', N'aa')
INSERT [dbo].[contact] ([contact_id], [name], [email], [address], [telephone], [userid]) VALUES (14, N'aaa', N'bbb', N'ccc', N'ddd', N'sumanbanerjee')
SET IDENTITY_INSERT [dbo].[contact] OFF
SET IDENTITY_INSERT [dbo].[user_roles] ON 

INSERT [dbo].[user_roles] ([user_role_id], [username], [role]) VALUES (1, N'tanmoy', N'ROLE_ADMIN')
INSERT [dbo].[user_roles] ([user_role_id], [username], [role]) VALUES (2, N'AAA', N'ROLE_ADMIN')
INSERT [dbo].[user_roles] ([user_role_id], [username], [role]) VALUES (3, N'tan', N'ROLE_ADMIN')
INSERT [dbo].[user_roles] ([user_role_id], [username], [role]) VALUES (4, N'', N'ROLE_ADMIN')
INSERT [dbo].[user_roles] ([user_role_id], [username], [role]) VALUES (5, N'Hello', N'ROLE_ADMIN')
INSERT [dbo].[user_roles] ([user_role_id], [username], [role]) VALUES (1002, N'Gambat', N'ROLE_ADMIN')
INSERT [dbo].[user_roles] ([user_role_id], [username], [role]) VALUES (1003, N'qqqqq', N'ROLE_ADMIN')
INSERT [dbo].[user_roles] ([user_role_id], [username], [role]) VALUES (1004, N'sumanbanerjee', N'ROLE_ADMIN')
INSERT [dbo].[user_roles] ([user_role_id], [username], [role]) VALUES (1005, N'tata', N'ROLE_ADMIN')
INSERT [dbo].[user_roles] ([user_role_id], [username], [role]) VALUES (1006, N'aa', N'ROLE_ADMIN')
INSERT [dbo].[user_roles] ([user_role_id], [username], [role]) VALUES (2002, N'Sweta', N'ROLE_ADMIN')
INSERT [dbo].[user_roles] ([user_role_id], [username], [role]) VALUES (2003, N'bbbb', N'ROLE_ADMIN')
INSERT [dbo].[user_roles] ([user_role_id], [username], [role]) VALUES (2004, N'123', N'ROLE_ADMIN')
SET IDENTITY_INSERT [dbo].[user_roles] OFF
INSERT [dbo].[users] ([username], [password], [enabled]) VALUES (N'', N'', 1)
INSERT [dbo].[users] ([username], [password], [enabled]) VALUES (N'123', N'123', 1)
INSERT [dbo].[users] ([username], [password], [enabled]) VALUES (N'aa', N'aa', 1)
INSERT [dbo].[users] ([username], [password], [enabled]) VALUES (N'AAA', N'456', 1)
INSERT [dbo].[users] ([username], [password], [enabled]) VALUES (N'bbbb', N'bbbb', 1)
INSERT [dbo].[users] ([username], [password], [enabled]) VALUES (N'dd', N'fdf', 1)
INSERT [dbo].[users] ([username], [password], [enabled]) VALUES (N'dfg', N'fdgdf', 1)
INSERT [dbo].[users] ([username], [password], [enabled]) VALUES (N'Gambat', N'ggg', 1)
INSERT [dbo].[users] ([username], [password], [enabled]) VALUES (N'Hello', N'1234', 1)
INSERT [dbo].[users] ([username], [password], [enabled]) VALUES (N'qqqqq', N'qqqqq', 1)
INSERT [dbo].[users] ([username], [password], [enabled]) VALUES (N'suman', N'4444', 1)
INSERT [dbo].[users] ([username], [password], [enabled]) VALUES (N'sumanbanerjee', N'suman@93', 1)
INSERT [dbo].[users] ([username], [password], [enabled]) VALUES (N'Sweta', N'1234', 1)
INSERT [dbo].[users] ([username], [password], [enabled]) VALUES (N'tan', N'1111', 1)
INSERT [dbo].[users] ([username], [password], [enabled]) VALUES (N'tanmoy', N'1234', 1)
INSERT [dbo].[users] ([username], [password], [enabled]) VALUES (N'tata', N'tata', 1)
USE [master]
GO
ALTER DATABASE [tanmoy] SET  READ_WRITE 
GO
