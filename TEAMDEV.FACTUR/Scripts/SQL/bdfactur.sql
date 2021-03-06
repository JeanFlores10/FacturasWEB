USE [master]
GO
/****** Object:  Database [BDFACTUR_TD]    Script Date: 08/10/2021 15:26:21 ******/
CREATE DATABASE [BDFACTUR_TD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDFACTUR_TD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BDFACTUR_TD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BDFACTUR_TD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BDFACTUR_TD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BDFACTUR_TD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDFACTUR_TD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDFACTUR_TD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDFACTUR_TD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDFACTUR_TD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDFACTUR_TD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDFACTUR_TD] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDFACTUR_TD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDFACTUR_TD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDFACTUR_TD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDFACTUR_TD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDFACTUR_TD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDFACTUR_TD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDFACTUR_TD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDFACTUR_TD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDFACTUR_TD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDFACTUR_TD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BDFACTUR_TD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDFACTUR_TD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDFACTUR_TD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDFACTUR_TD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDFACTUR_TD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDFACTUR_TD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDFACTUR_TD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDFACTUR_TD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BDFACTUR_TD] SET  MULTI_USER 
GO
ALTER DATABASE [BDFACTUR_TD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDFACTUR_TD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDFACTUR_TD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDFACTUR_TD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BDFACTUR_TD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BDFACTUR_TD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BDFACTUR_TD] SET QUERY_STORE = OFF
GO
USE [BDFACTUR_TD]
GO
/****** Object:  User [IBLAPELIMC00010\jean.bustamante]    Script Date: 08/10/2021 15:26:21 ******/
CREATE USER [IBLAPELIMC00010\jean.bustamante] FOR LOGIN [IBLAPELIMC00010\jean.bustamante] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 08/10/2021 15:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresa](
	[idempresa] [int] IDENTITY(1,1) NOT NULL,
	[RazonSocial] [varchar](100) NULL,
	[ruc] [varchar](20) NULL,
	[email] [varchar](100) NULL,
	[idpais] [int] NULL,
	[idmoneda] [int] NULL,
	[VendeconImpuestos] [int] NULL,
	[TImpuestos] [int] NULL,
	[idPorcentaje] [int] NULL,
	[direccion] [varchar](max) NULL,
	[imagen] [varchar](max) NULL,
	[status] [int] NULL,
	[fecharegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idempresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Moneda]    Script Date: 08/10/2021 15:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Moneda](
	[idMoneda] [int] IDENTITY(1,1) NOT NULL,
	[moneda] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idMoneda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 08/10/2021 15:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[idPais] [int] NOT NULL,
	[pais] [varchar](50) NULL,
 CONSTRAINT [PK__Pais__BD2285E35A807C24] PRIMARY KEY CLUSTERED 
(
	[idPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Porcentaje]    Script Date: 08/10/2021 15:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Porcentaje](
	[idPorcentaje] [int] IDENTITY(1,1) NOT NULL,
	[Porcentaje] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idPorcentaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tienda]    Script Date: 08/10/2021 15:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tienda](
	[idTienda] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[direccion] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[idTienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoImpuesto]    Script Date: 08/10/2021 15:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoImpuesto](
	[idTipoImpuesto] [int] IDENTITY(1,1) NOT NULL,
	[TipoImpuesto] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoImpuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SP_ListarMoneda]    Script Date: 08/10/2021 15:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_ListarMoneda]
as
begin
select idmoneda, moneda from Moneda
end
GO
/****** Object:  StoredProcedure [dbo].[SP_listarPaises]    Script Date: 08/10/2021 15:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_listarPaises]
as
begin
select idpais, pais from Pais

end
GO
/****** Object:  StoredProcedure [dbo].[SP_ListarPorcentaje]    Script Date: 08/10/2021 15:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_ListarPorcentaje]
as
begin
select idPorcentaje, Porcentaje from Porcentaje
end
GO
/****** Object:  StoredProcedure [dbo].[SP_ListarTipoImpuesto]    Script Date: 08/10/2021 15:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_ListarTipoImpuesto]
as
begin
select idTipoImpuesto, TipoImpuesto from TipoImpuesto
end
GO
/****** Object:  StoredProcedure [dbo].[SP_validarRegistroEmpresa]    Script Date: 08/10/2021 15:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SP_validarRegistroEmpresa](@razonsocial varchar(100),@ruc varchar(20),@email varchar(100))
as
begin
if not exists (select * from Empresa where razonsocial = @razonsocial)
begin
if not exists (select * from Empresa where ruc = @ruc)
begin
if not exists (select * from Empresa where email = @email)
begin
select 'ok' response
end
else
begin

select 'El email ya se encuentra registrado' response

end
end
else
begin
select 'El ruc ya se encuentra registrada' response

end
end
else
begin
select 'La razon social ya se encuentra registrada' response
end
end
GO
USE [master]
GO
ALTER DATABASE [BDFACTUR_TD] SET  READ_WRITE 
GO
