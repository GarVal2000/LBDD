USE [RestauranteJMG]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_iIdMesa]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ticket]'))
ALTER TABLE [dbo].[Ticket] DROP CONSTRAINT [FK_iIdMesa]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_iIdMenu]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ticket]'))
ALTER TABLE [dbo].[Ticket] DROP CONSTRAINT [FK_iIdMenu]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_iIdProducto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Pedido]'))
ALTER TABLE [dbo].[Pedido] DROP CONSTRAINT [FK_iIdProducto]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_iIdCliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Pedido]'))
ALTER TABLE [dbo].[Pedido] DROP CONSTRAINT [FK_iIdCliente]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_iIdMesaM]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mesero]'))
ALTER TABLE [dbo].[Mesero] DROP CONSTRAINT [FK_iIdMesaM]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_iIdMesaC]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cliente]'))
ALTER TABLE [dbo].[Cliente] DROP CONSTRAINT [FK_iIdMesaC]
GO
/****** Object:  View [dbo].[vw_Restaurante]    Script Date: 01/11/2019 09:47:46 p. m. ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Restaurante]'))
DROP VIEW [dbo].[vw_Restaurante]
GO
/****** Object:  View [dbo].[vw_Mesero]    Script Date: 01/11/2019 09:47:46 p. m. ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Mesero]'))
DROP VIEW [dbo].[vw_Mesero]
GO
/****** Object:  View [dbo].[vw_Mesa]    Script Date: 01/11/2019 09:47:46 p. m. ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Mesa]'))
DROP VIEW [dbo].[vw_Mesa]
GO
/****** Object:  View [dbo].[vw_Menu]    Script Date: 01/11/2019 09:47:46 p. m. ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Menu]'))
DROP VIEW [dbo].[vw_Menu]
GO
/****** Object:  View [dbo].[vw_Cliente]    Script Date: 01/11/2019 09:47:46 p. m. ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Cliente]'))
DROP VIEW [dbo].[vw_Cliente]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 01/11/2019 09:47:46 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ticket]') AND type in (N'U'))
DROP TABLE [dbo].[Ticket]
GO
/****** Object:  Table [dbo].[Restaurante]    Script Date: 01/11/2019 09:47:46 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Restaurante]') AND type in (N'U'))
DROP TABLE [dbo].[Restaurante]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 01/11/2019 09:47:46 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pedido]') AND type in (N'U'))
DROP TABLE [dbo].[Pedido]
GO
/****** Object:  Table [dbo].[Mesero]    Script Date: 01/11/2019 09:47:46 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mesero]') AND type in (N'U'))
DROP TABLE [dbo].[Mesero]
GO
/****** Object:  Table [dbo].[Mesa]    Script Date: 01/11/2019 09:47:46 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mesa]') AND type in (N'U'))
DROP TABLE [dbo].[Mesa]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 01/11/2019 09:47:46 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Menu]') AND type in (N'U'))
DROP TABLE [dbo].[Menu]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 01/11/2019 09:47:46 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente]') AND type in (N'U'))
DROP TABLE [dbo].[Cliente]
GO
USE [master]
GO
/****** Object:  Database [RestauranteJMG]    Script Date: 01/11/2019 09:47:46 p. m. ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'RestauranteJMG')
DROP DATABASE [RestauranteJMG]
GO
/****** Object:  Database [RestauranteJMG]    Script Date: 01/11/2019 09:47:46 p. m. ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'RestauranteJMG')
BEGIN
CREATE DATABASE [RestauranteJMG]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RestauranteJMG', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\RestauranteJMG.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RestauranteJMG_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\RestauranteJMG_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [RestauranteJMG] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RestauranteJMG].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RestauranteJMG] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RestauranteJMG] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RestauranteJMG] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RestauranteJMG] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RestauranteJMG] SET ARITHABORT OFF 
GO
ALTER DATABASE [RestauranteJMG] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [RestauranteJMG] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RestauranteJMG] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RestauranteJMG] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RestauranteJMG] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RestauranteJMG] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RestauranteJMG] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RestauranteJMG] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RestauranteJMG] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RestauranteJMG] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RestauranteJMG] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RestauranteJMG] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RestauranteJMG] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RestauranteJMG] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RestauranteJMG] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RestauranteJMG] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RestauranteJMG] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RestauranteJMG] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RestauranteJMG] SET  MULTI_USER 
GO
ALTER DATABASE [RestauranteJMG] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RestauranteJMG] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RestauranteJMG] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RestauranteJMG] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [RestauranteJMG] SET DELAYED_DURABILITY = DISABLED 
GO
USE [RestauranteJMG]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 01/11/2019 09:47:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Cliente](
	[iIdCliente] [int] NOT NULL,
	[iIdMesa] [int] NOT NULL,
	[vNombreC] [varchar](30) NULL,
	[vApellidoP] [varchar](30) NOT NULL,
	[vApellidoM] [varchar](30) NOT NULL,
	[NombreCompleto]  AS (((([vNombreC]+' ')+[vApellidoP])+' ')+[vApellidoM]),
PRIMARY KEY CLUSTERED 
(
	[iIdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 01/11/2019 09:47:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Menu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Menu](
	[iIdProducto] [int] NOT NULL,
	[vNombrePlatillo] [varchar](50) NULL,
	[vDescripcion] [varchar](200) NULL,
	[vPrecio] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[iIdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mesa]    Script Date: 01/11/2019 09:47:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mesa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mesa](
	[iIdMesa] [int] NOT NULL,
	[iRestauranteID] [int] NULL,
	[iNumPer] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iIdMesa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Mesero]    Script Date: 01/11/2019 09:47:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mesero]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mesero](
	[iIdMesero] [int] NOT NULL,
	[vNombreM] [varchar](30) NOT NULL,
	[vApellidoPM] [varchar](30) NOT NULL,
	[vApellidoMM] [varchar](30) NOT NULL,
	[iIdMesa] [int] NOT NULL,
	[NombreCompleto]  AS (((([vNombreM]+' ')+[vApellidoPM])+' ')+[vApellidoMM]),
PRIMARY KEY CLUSTERED 
(
	[iIdMesero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 01/11/2019 09:47:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pedido]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Pedido](
	[iIdPedido] [int] NOT NULL,
	[iIdClienteP] [int] NOT NULL,
	[iIdProducto] [int] NOT NULL,
	[iIdCliente] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iIdPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Restaurante]    Script Date: 01/11/2019 09:47:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Restaurante]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Restaurante](
	[iRestauranteID] [int] NOT NULL,
	[Ubicacion] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iRestauranteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 01/11/2019 09:47:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ticket]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ticket](
	[iIdTicket] [int] NOT NULL,
	[iIdMesa] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[iIdMenu] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iIdTicket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[vw_Cliente]    Script Date: 01/11/2019 09:47:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Cliente]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[vw_Cliente] as
select iIdCliente,vNombreC from Cliente' 
GO
/****** Object:  View [dbo].[vw_Menu]    Script Date: 01/11/2019 09:47:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Menu]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[vw_Menu] as
select vNombrePlatillo,vDescripcion,vPrecio from Menu' 
GO
/****** Object:  View [dbo].[vw_Mesa]    Script Date: 01/11/2019 09:47:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Mesa]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[vw_Mesa] as
select iIdMesa,iRestauranteID,iNumPer from Mesa' 
GO
/****** Object:  View [dbo].[vw_Mesero]    Script Date: 01/11/2019 09:47:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Mesero]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[vw_Mesero] as
select iIdMesero,NombreCompleto,iIdMesa from Mesero' 
GO
/****** Object:  View [dbo].[vw_Restaurante]    Script Date: 01/11/2019 09:47:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Restaurante]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[vw_Restaurante] as
select iRestauranteID,Ubicacion from Restaurante' 
GO
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (1, 10, N'Juan', N'Garcia', N'Garcia')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (2, 2, N'Gloria Elena', N'Valdez', N'Quiroz')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (3, 3, N'Alex', N'Garcia', N'Valdez')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (4, 4, N'Luis', N'Garcia', N'Valdez')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (5, 5, N'Mauricio', N'Garcia', N'Valdez')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (6, 6, N'Esteban', N'Garza', N'Esquivel')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (7, 7, N'Axel', N'Garcia', N'Valdez')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (8, 8, N'Ximena', N'Valdez', N'Quiroz')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (9, 9, N'Angela', N'Navarro', N'Valdez')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (10, 10, N'Hector', N'Garcia', N'Romero')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (11, 11, N'Cesar', N'Hernandez', N'Niño')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (12, 12, N'Sergio', N'Lobos', N'Garza')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (13, 13, N'Jean', N'Lugo', N'de la Rosa')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (14, 14, N'Adrian', N'de Leon', N'Marroquin')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (15, 15, N'Mariana', N'Navarro', N'Garcia')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (16, 2, N'Melina', N'Cantu', N'Valdez')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (17, 3, N'Mauricio', N'Camacho', N'Hernandez')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (18, 5, N'Denisse', N'Montemayor', N'Aguilar')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (19, 6, N'Jon', N'de Leon', N'Montes')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (20, 1, N'Juan', N'Tostado', N'Valdez')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (21, 8, N'Paco', N'Tosatdo', N'Maldonado')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (22, 11, N'Astrid', N'Camacho', N'Limon')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (23, 12, N'Adriana', N'Valdez', N'Aguiar')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (24, 9, N'Oscar', N'Valdez', N'Aguiar')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (25, 6, N'Jorge', N'Hernandez', N'Garcia')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (26, 7, N'Jose', N'Garcia', N'Gonzales')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (27, 10, N'David', N'Martinez', N'Lopez')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (28, 15, N'Diego', N'Ramires', N'Flores')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (29, 4, N'Leonardo', N'Soto', N'Flores')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (30, 12, N'Daniel', N'Sanchez', N'Rodriguez')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (31, 3, N'Margarita', N'Gomez', N'Velazco')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (32, 4, N'Yolanda', N'Sotelo', N'Aguiar')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (33, 5, N'Araceli', N'Ruelas', N'Gomez')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (34, 7, N'Gabriela', N'Aguirre', N'Salazar')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (35, 10, N'Elizabeth', N'Cervantes', N'Davila')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (36, 15, N'Natalia', N'Garcia', N'Vega')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (37, 12, N'Veronica', N'Gonzales', N'Martinez')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (38, 1, N'Alexa', N'Lopez', N'Coronado')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (39, 6, N'Sebastian', N'Betancurt', N'Flores')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (40, 8, N'Fernanda', N'Garcia', N'Vega')
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [vPrecio]) VALUES (1, N'Mojarra (550-620grs)', N'Mojarra a la diabla o al mojo de ajo acompañada con papas en gajo, ensalada y arroz de la casa', NULL)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [vPrecio]) VALUES (2, N'Mojarra (670-720grs)', N'Mojarra a la diabla o al mojo de ajo acompañada con papas en gajo, ensalada y arroz de la casa', NULL)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [vPrecio]) VALUES (3, N'La Rosita(220grs)', N'Pasta acompañada con salmon a la plancha y verduras.', NULL)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [vPrecio]) VALUES (4, N'Chamalitas(240grs)', N'Alitas bañadas con salsa de la casa espolvpreadas con cebollin y cacahuate .', NULL)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [vPrecio]) VALUES (5, N'Los Esquineros', N'Orden de tacos (3) de carne asada gratinaos con queso manchego y acompañados con papitas galeana.', NULL)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [vPrecio]) VALUES (6, N'Las fajas(250grs)', N'Fajitas de Sirloin.', NULL)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [vPrecio]) VALUES (7, N'Las fajas(250grs)', N'Fajitas de Pollo.', NULL)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [vPrecio]) VALUES (8, N'Chamakidz)(80grs)', N'Fajitas de pescado o nuggets de pollo scompañadas con papas en gajos sazonadas con lemon-papper.', NULL)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [vPrecio]) VALUES (9, N'Cocolizos', N'Camarones empanizados con coco, servidos con salsa de tomate, acompañados con arroz y verduras al vapor.', NULL)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [vPrecio]) VALUES (10, N'Chamaburger', N'Hamburguesa de camaron con guacamole, tocino, queso manchego, cebolla y pimiento cocido.', NULL)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [vPrecio]) VALUES (11, N'Mojarra Chamalera (550-620grs)', N'Mojarra preparada al estilo Chamalero con papas, ensalada y arroz.', NULL)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [vPrecio]) VALUES (12, N'Mojarra Chamalera (670-720grs)', N'Mojarra preparada al estilo Chamalero con papas, ensalada y arroz.', NULL)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [vPrecio]) VALUES (13, N'Isabela (135grs)', N'Receta original de coctel de camaron con un toquesito picante especial.', NULL)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [vPrecio]) VALUES (14, N'Isabelita (80grs)', N'Como la Isabela pero version individual ideal pa`empezar.', NULL)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [vPrecio]) VALUES (15, N'Camarones QK (200grs)', N'Camarones sateneados en nuestra salsa de ajillo acompañados con arroz.', NULL)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [vPrecio]) VALUES (16, N'Estoyokei (120grs)', N'Lajas de sirloin curtidas en la receta secreta especial de la casa acompañadas con cubitos de aguacate y champiñones', NULL)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [vPrecio]) VALUES (17, N'Water Chile green(150grs)', N'Camarones frescos curtidos en limon con 2 aguachiles verde.', NULL)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [vPrecio]) VALUES (18, N'Water Chile black(150grs)', N'Camarones frescos curtidos en limon con 2 aguachiles negro.', NULL)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [vPrecio]) VALUES (19, N'El pozolon (230grs)', N'Pozole calientito de mariscos(camaron, pulpo, pescado y almeja) acompañado de lechuga, rabano, tostadas y salsa de la casa.', NULL)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [vPrecio]) VALUES (20, N'Caldo de Chamama (220grs)', N'Delicioso caldo de pescado, camaron, verduras y arroz.', NULL)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [vPrecio]) VALUES (21, N'La ligerita', N'Mezcla de lechuga con camarones bufalo, tomate, pepino y varitas de apio con aderezo blue cheese.', NULL)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [vPrecio]) VALUES (22, N'La rogelia (220grs)', N'Pasta fettuccinie con una crema fradevil y camarones salteados .', NULL)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [vPrecio]) VALUES (23, N'Lais', N'Filete de pescado a la plancha, acompañado con arroz y verduras al vapor con un toque de mantequilla.', NULL)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [vPrecio]) VALUES (24, N'Panchitos', N'Camarones rellenos de queso envueltos en tocino, acompañados con arroz y verduras al vapor.', NULL)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [vPrecio]) VALUES (25, N'Los cuates', N'Filete de pescado capeado y camarones al ajillo, acompañado de arroz y verduras al vapor.', NULL)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [vPrecio]) VALUES (26, N'La pinky (Tostada)', N'Finas laminas de atun fresco, aguacate, cebolla frita, cilantro y aderezo de chipotle.', NULL)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [vPrecio]) VALUES (27, N'La robles (Tostada)', N'Finas laminas de salmon natural fresco sobre una cama de aguacate, tomate y aderezo de chipotle.', NULL)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [vPrecio]) VALUES (28, N'La descuidada (Tostada)', N'Tostada de carne, champiñones y cebolla cocida sobre una cama de delicioso queso manchego gratinado.', NULL)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [vPrecio]) VALUES (29, N'La tipica (Tostada)', N'Tradicional tostada de ceviche de camaron tomate, cebolla, aguacate y cilantro sobre un aderezo de ajo.', NULL)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [vPrecio]) VALUES (30, N'La Don Octavio (Tostada)', N'Tostada de ceviche de pulpo cocido acompañado de jitomate, pepino y aguacate sobre un aderezo de cilantro.', NULL)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [vPrecio]) VALUES (31, N'Doña Blanca (Tostada)', N'Tostada de ceviche de pescado sazonada en clamato, tomate, cebolla, aguacate sobre un aderezo de la casa.', NULL)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [vPrecio]) VALUES (32, N'Coqueta (Tostada)', N'Tostada de ceviche de pescado, pepino trocitos de mango y un aderezo de la casa.', NULL)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [vPrecio]) VALUES (33, N'Gober Precioso (Tacos)', N'Taco de guiso de camaron con queso fundido y chile poblano.', NULL)
INSERT [dbo].[Mesa] ([iIdMesa], [iRestauranteID], [iNumPer]) VALUES (1, 1, 2)
INSERT [dbo].[Mesa] ([iIdMesa], [iRestauranteID], [iNumPer]) VALUES (2, 2, 6)
INSERT [dbo].[Mesa] ([iIdMesa], [iRestauranteID], [iNumPer]) VALUES (3, 2, 4)
INSERT [dbo].[Mesa] ([iIdMesa], [iRestauranteID], [iNumPer]) VALUES (4, 4, 8)
INSERT [dbo].[Mesa] ([iIdMesa], [iRestauranteID], [iNumPer]) VALUES (5, 5, 16)
INSERT [dbo].[Mesa] ([iIdMesa], [iRestauranteID], [iNumPer]) VALUES (6, 6, 1)
INSERT [dbo].[Mesa] ([iIdMesa], [iRestauranteID], [iNumPer]) VALUES (7, 7, 10)
INSERT [dbo].[Mesa] ([iIdMesa], [iRestauranteID], [iNumPer]) VALUES (8, 8, 2)
INSERT [dbo].[Mesa] ([iIdMesa], [iRestauranteID], [iNumPer]) VALUES (9, 9, 3)
INSERT [dbo].[Mesa] ([iIdMesa], [iRestauranteID], [iNumPer]) VALUES (10, 10, 4)
INSERT [dbo].[Mesa] ([iIdMesa], [iRestauranteID], [iNumPer]) VALUES (11, 5, 1)
INSERT [dbo].[Mesa] ([iIdMesa], [iRestauranteID], [iNumPer]) VALUES (12, 3, 10)
INSERT [dbo].[Mesa] ([iIdMesa], [iRestauranteID], [iNumPer]) VALUES (13, 4, 4)
INSERT [dbo].[Mesa] ([iIdMesa], [iRestauranteID], [iNumPer]) VALUES (14, 9, 2)
INSERT [dbo].[Mesa] ([iIdMesa], [iRestauranteID], [iNumPer]) VALUES (15, 6, 2)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (1, N'Roberto', N'Garza', N'Garcia', 1)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (2, N'Victoria', N'Sanchez', N'Saenz', 2)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (3, N'Elena', N'Granados', N'Valdes', 3)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (6, N'Erick', N'Jimenez', N'Villanueva', 6)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (7, N'Jhon', N'Milton', N'Carreon', 7)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (8, N'Rodolfo', N'Aguirre', N'Garcia', 8)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (10, N'Tadeo', N'Salazar', N'Davila', 10)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (12, N'Adrian', N'Venega', N'Sotelo', 12)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (13, N'Alejandra', N'Lopez', N'Ramirez', 13)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (15, N'Alexis', N'Aguirre', N'Garcia', 15)
INSERT [dbo].[Restaurante] ([iRestauranteID], [Ubicacion]) VALUES (1, N'Monterrey')
INSERT [dbo].[Restaurante] ([iRestauranteID], [Ubicacion]) VALUES (2, N'Apodaca')
INSERT [dbo].[Restaurante] ([iRestauranteID], [Ubicacion]) VALUES (3, N'Escobedo')
INSERT [dbo].[Restaurante] ([iRestauranteID], [Ubicacion]) VALUES (4, N'Santa Catarina')
INSERT [dbo].[Restaurante] ([iRestauranteID], [Ubicacion]) VALUES (5, N'Garcia')
INSERT [dbo].[Restaurante] ([iRestauranteID], [Ubicacion]) VALUES (6, N'San Pedro')
INSERT [dbo].[Restaurante] ([iRestauranteID], [Ubicacion]) VALUES (7, N'Guadalupe')
INSERT [dbo].[Restaurante] ([iRestauranteID], [Ubicacion]) VALUES (8, N'Jaurez')
INSERT [dbo].[Restaurante] ([iRestauranteID], [Ubicacion]) VALUES (9, N'Montemorelos')
INSERT [dbo].[Restaurante] ([iRestauranteID], [Ubicacion]) VALUES (10, N'Sabinas Hidalgo')
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_iIdMesaC]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cliente]'))
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_iIdMesaC] FOREIGN KEY([iIdMesa])
REFERENCES [dbo].[Mesa] ([iIdMesa])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_iIdMesaC]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cliente]'))
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_iIdMesaC]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_iIdMesaM]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mesero]'))
ALTER TABLE [dbo].[Mesero]  WITH CHECK ADD  CONSTRAINT [FK_iIdMesaM] FOREIGN KEY([iIdMesa])
REFERENCES [dbo].[Mesa] ([iIdMesa])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_iIdMesaM]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mesero]'))
ALTER TABLE [dbo].[Mesero] CHECK CONSTRAINT [FK_iIdMesaM]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_iIdCliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Pedido]'))
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_iIdCliente] FOREIGN KEY([iIdCliente])
REFERENCES [dbo].[Cliente] ([iIdCliente])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_iIdCliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Pedido]'))
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_iIdCliente]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_iIdProducto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Pedido]'))
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_iIdProducto] FOREIGN KEY([iIdProducto])
REFERENCES [dbo].[Menu] ([iIdProducto])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_iIdProducto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Pedido]'))
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_iIdProducto]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_iIdMenu]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ticket]'))
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_iIdMenu] FOREIGN KEY([iIdMenu])
REFERENCES [dbo].[Menu] ([iIdProducto])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_iIdMenu]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ticket]'))
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_iIdMenu]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_iIdMesa]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ticket]'))
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_iIdMesa] FOREIGN KEY([iIdMesa])
REFERENCES [dbo].[Mesa] ([iIdMesa])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_iIdMesa]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ticket]'))
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_iIdMesa]
GO
USE [master]
GO
ALTER DATABASE [RestauranteJMG] SET  READ_WRITE 
GO
