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
/****** Object:  Table [dbo].[Ticket]    Script Date: 11/10/2019 08:46:50 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ticket]') AND type in (N'U'))
DROP TABLE [dbo].[Ticket]
GO
/****** Object:  Table [dbo].[Restaurante]    Script Date: 11/10/2019 08:46:50 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Restaurante]') AND type in (N'U'))
DROP TABLE [dbo].[Restaurante]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 11/10/2019 08:46:50 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pedido]') AND type in (N'U'))
DROP TABLE [dbo].[Pedido]
GO
/****** Object:  Table [dbo].[Mesero]    Script Date: 11/10/2019 08:46:50 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mesero]') AND type in (N'U'))
DROP TABLE [dbo].[Mesero]
GO
/****** Object:  Table [dbo].[Mesa]    Script Date: 11/10/2019 08:46:50 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mesa]') AND type in (N'U'))
DROP TABLE [dbo].[Mesa]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 11/10/2019 08:46:50 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Menu]') AND type in (N'U'))
DROP TABLE [dbo].[Menu]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 11/10/2019 08:46:50 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente]') AND type in (N'U'))
DROP TABLE [dbo].[Cliente]
GO
USE [master]
GO
/****** Object:  Database [RestauranteJMG]    Script Date: 11/10/2019 08:46:50 p. m. ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'RestauranteJMG')
DROP DATABASE [RestauranteJMG]
GO
/****** Object:  Database [RestauranteJMG]    Script Date: 11/10/2019 08:46:50 p. m. ******/
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
/****** Object:  Table [dbo].[Cliente]    Script Date: 11/10/2019 08:46:50 p. m. ******/
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
/****** Object:  Table [dbo].[Menu]    Script Date: 11/10/2019 08:46:51 p. m. ******/
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
	[iPrecio] [int] NOT NULL,
	[NombrePlatillo]  AS (((([vNombrePlatillo]+' ')+[vDescripcion])+' ')+[iPrecio]),
PRIMARY KEY CLUSTERED 
(
	[iIdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mesa]    Script Date: 11/10/2019 08:46:51 p. m. ******/
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
/****** Object:  Table [dbo].[Mesero]    Script Date: 11/10/2019 08:46:51 p. m. ******/
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
/****** Object:  Table [dbo].[Pedido]    Script Date: 11/10/2019 08:46:51 p. m. ******/
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
/****** Object:  Table [dbo].[Restaurante]    Script Date: 11/10/2019 08:46:51 p. m. ******/
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
/****** Object:  Table [dbo].[Ticket]    Script Date: 11/10/2019 08:46:51 p. m. ******/
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
