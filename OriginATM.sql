USE [master]
GO
/****** Object:  Database [Banco]    Script Date: 22/8/2020 18:17:22 ******/
CREATE DATABASE [Banco]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Banco', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Banco.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Banco_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Banco_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Banco] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Banco].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Banco] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Banco] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Banco] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Banco] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Banco] SET ARITHABORT OFF 
GO
ALTER DATABASE [Banco] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Banco] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Banco] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Banco] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Banco] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Banco] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Banco] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Banco] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Banco] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Banco] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Banco] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Banco] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Banco] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Banco] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Banco] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Banco] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Banco] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Banco] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Banco] SET RECOVERY FULL 
GO
ALTER DATABASE [Banco] SET  MULTI_USER 
GO
ALTER DATABASE [Banco] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Banco] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Banco] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Banco] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Banco', N'ON'
GO
USE [Banco]
GO
/****** Object:  Table [dbo].[Cajero]    Script Date: 22/8/2020 18:17:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cajero](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[modelo] [varchar](20) NULL,
	[fabricante] [varchar](20) NOT NULL,
	[so] [varchar](15) NOT NULL,
	[idSucursal] [smallint] NOT NULL,
	[activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 22/8/2020 18:17:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[dni] [varchar](10) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[apellido] [varchar](20) NOT NULL,
	[direccion] [varchar](80) NOT NULL,
	[idLocalidad] [smallint] NOT NULL,
	[telFijo] [varchar](10) NOT NULL,
	[telMovil] [varchar](10) NULL,
	[fechaAlta] [smalldatetime] NOT NULL,
	[activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cuenta]    Script Date: 22/8/2020 18:17:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cuenta](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[numero] [varchar](20) NOT NULL,
	[idCliente] [bigint] NOT NULL,
	[idTarjeta] [bigint] NULL,
	[idTipo] [smallint] NOT NULL,
	[estado] [tinyint] NOT NULL,
	[saldo] [decimal](18, 2) NOT NULL,
	[activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Emisor_Tarjeta]    Script Date: 22/8/2020 18:17:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Emisor_Tarjeta](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Localidad]    Script Date: 22/8/2020 18:17:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Localidad](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[idProvincia] [smallint] NOT NULL,
	[activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Operacion]    Script Date: 22/8/2020 18:17:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operacion](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[idTipoOperacion] [smallint] NOT NULL,
	[idTarjeta] [bigint] NOT NULL,
	[idAtm] [smallint] NOT NULL,
	[fechaOperacion] [smalldatetime] NOT NULL,
	[monto] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 22/8/2020 18:17:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Provincia](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 22/8/2020 18:17:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sucursal](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[direccion] [varchar](80) NOT NULL,
	[idLocalidad] [smallint] NOT NULL,
	[activa] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tarjeta]    Script Date: 22/8/2020 18:17:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tarjeta](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nro] [varchar](max) NOT NULL,
	[clave] [varchar](max) NOT NULL,
	[fechaAlta] [smalldatetime] NOT NULL,
	[fechaVencimiento] [smalldatetime] NOT NULL,
	[estado] [tinyint] NOT NULL,
	[intentosClave] [tinyint] NOT NULL,
	[saldo] [decimal](18, 2) NOT NULL,
	[idTipo] [smallint] NOT NULL,
	[idCliente] [bigint] NOT NULL,
	[activo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tipo_Cuenta]    Script Date: 22/8/2020 18:17:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tipo_Cuenta](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tipo_Operacion]    Script Date: 22/8/2020 18:17:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tipo_Operacion](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](45) NOT NULL,
	[activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tipo_Tarjeta]    Script Date: 22/8/2020 18:17:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tipo_Tarjeta](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](20) NOT NULL,
	[activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Cajero] ON 

INSERT [dbo].[Cajero] ([id], [modelo], [fabricante], [so], [idSucursal], [activo]) VALUES (1, N'XYZ', N'Wincor', N'QNX', 1, 0)
SET IDENTITY_INSERT [dbo].[Cajero] OFF
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([id], [dni], [nombre], [apellido], [direccion], [idLocalidad], [telFijo], [telMovil], [fechaAlta], [activo]) VALUES (1, N'12345678', N'Lorenzo', N'Lorenzo', N'Pringles 393', 4, N'11111111', N'111111', CAST(0xAC1E0585 AS SmallDateTime), 1)
SET IDENTITY_INSERT [dbo].[Cliente] OFF
SET IDENTITY_INSERT [dbo].[Cuenta] ON 

INSERT [dbo].[Cuenta] ([id], [numero], [idCliente], [idTarjeta], [idTipo], [estado], [saldo], [activo]) VALUES (5, N'11111111111111111111', 1, NULL, 1, 0, CAST(0.00 AS Decimal(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[Cuenta] OFF
SET IDENTITY_INSERT [dbo].[Emisor_Tarjeta] ON 

INSERT [dbo].[Emisor_Tarjeta] ([id], [nombre]) VALUES (1, N'Visa')
INSERT [dbo].[Emisor_Tarjeta] ([id], [nombre]) VALUES (2, N'MasterCard')
SET IDENTITY_INSERT [dbo].[Emisor_Tarjeta] OFF
SET IDENTITY_INSERT [dbo].[Localidad] ON 

INSERT [dbo].[Localidad] ([id], [nombre], [idProvincia], [activo]) VALUES (1, N'Carilo', 1, 1)
INSERT [dbo].[Localidad] ([id], [nombre], [idProvincia], [activo]) VALUES (2, N'Mar del Plata', 1, 1)
INSERT [dbo].[Localidad] ([id], [nombre], [idProvincia], [activo]) VALUES (3, N'Agronomia', 2, 1)
INSERT [dbo].[Localidad] ([id], [nombre], [idProvincia], [activo]) VALUES (4, N'Almagro', 2, 1)
INSERT [dbo].[Localidad] ([id], [nombre], [idProvincia], [activo]) VALUES (5, N'Colegiales', 2, 1)
INSERT [dbo].[Localidad] ([id], [nombre], [idProvincia], [activo]) VALUES (6, N'Villa Crespo', 2, 1)
SET IDENTITY_INSERT [dbo].[Localidad] OFF
SET IDENTITY_INSERT [dbo].[Provincia] ON 

INSERT [dbo].[Provincia] ([id], [nombre], [activo]) VALUES (1, N'Buenos Aires', 1)
INSERT [dbo].[Provincia] ([id], [nombre], [activo]) VALUES (2, N'Ciudad Autonoma de Buenos Aires', 1)
INSERT [dbo].[Provincia] ([id], [nombre], [activo]) VALUES (3, N'Cordoba', 1)
INSERT [dbo].[Provincia] ([id], [nombre], [activo]) VALUES (4, N'Entre Rios', 1)
INSERT [dbo].[Provincia] ([id], [nombre], [activo]) VALUES (5, N'Mendoza', 1)
SET IDENTITY_INSERT [dbo].[Provincia] OFF
SET IDENTITY_INSERT [dbo].[Sucursal] ON 

INSERT [dbo].[Sucursal] ([id], [nombre], [direccion], [idLocalidad], [activa]) VALUES (1, N'SUC001', N'Av Medrano 137', 4, 1)
SET IDENTITY_INSERT [dbo].[Sucursal] OFF
SET IDENTITY_INSERT [dbo].[Tarjeta] ON 

INSERT [dbo].[Tarjeta] ([id], [nro], [clave], [fechaAlta], [fechaVencimiento], [estado], [intentosClave], [saldo], [idTipo], [idCliente], [activo]) VALUES (1, N'$2a$10$.noJx5Ap1CKwIxt3ze/0uuEMYT1e4V5OgZluBepN8b3DqoTrhJ5Qi', N'$2a$10$Vz6RUEngH5LKNXf7mR65bePVYeSQuX9gFIrs9hOXzrtKGca3loaN2', CAST(0xAC1E052D AS SmallDateTime), CAST(0xB340052D AS SmallDateTime), 0, 0, CAST(0.00 AS Decimal(18, 2)), 1, 1, 0)
SET IDENTITY_INSERT [dbo].[Tarjeta] OFF
SET IDENTITY_INSERT [dbo].[Tipo_Cuenta] ON 

INSERT [dbo].[Tipo_Cuenta] ([id], [descripcion], [activo]) VALUES (1, N'Ahorro', 1)
INSERT [dbo].[Tipo_Cuenta] ([id], [descripcion], [activo]) VALUES (2, N'Corriente', 1)
SET IDENTITY_INSERT [dbo].[Tipo_Cuenta] OFF
SET IDENTITY_INSERT [dbo].[Tipo_Operacion] ON 

INSERT [dbo].[Tipo_Operacion] ([id], [descripcion], [activo]) VALUES (1, N'Consulta', 1)
INSERT [dbo].[Tipo_Operacion] ([id], [descripcion], [activo]) VALUES (2, N'Retiro', 1)
SET IDENTITY_INSERT [dbo].[Tipo_Operacion] OFF
SET IDENTITY_INSERT [dbo].[Tipo_Tarjeta] ON 

INSERT [dbo].[Tipo_Tarjeta] ([id], [descripcion], [activo]) VALUES (1, N'Debito', 1)
INSERT [dbo].[Tipo_Tarjeta] ([id], [descripcion], [activo]) VALUES (2, N'Credito', 1)
SET IDENTITY_INSERT [dbo].[Tipo_Tarjeta] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Cuenta__E44F67B0857BA5B1]    Script Date: 22/8/2020 18:17:23 ******/
ALTER TABLE [dbo].[Cuenta] ADD UNIQUE NONCLUSTERED 
(
	[numero] ASC,
	[idCliente] ASC,
	[idTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Localida__E7EA192D815DC3E2]    Script Date: 22/8/2020 18:17:23 ******/
ALTER TABLE [dbo].[Localidad] ADD UNIQUE NONCLUSTERED 
(
	[id] ASC,
	[idProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Operacio__5A41D5B0567B718E]    Script Date: 22/8/2020 18:17:23 ******/
ALTER TABLE [dbo].[Operacion] ADD UNIQUE NONCLUSTERED 
(
	[idTipoOperacion] ASC,
	[idTarjeta] ASC,
	[fechaOperacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Provinci__72AFBCC6F4EF3C44]    Script Date: 22/8/2020 18:17:23 ******/
ALTER TABLE [dbo].[Provincia] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Tarjeta__45559A9E848F5C27]    Script Date: 22/8/2020 18:17:23 ******/
ALTER TABLE [dbo].[Tarjeta] ADD UNIQUE NONCLUSTERED 
(
	[idTipo] ASC,
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Tipo_Cue__298336B615BCB738]    Script Date: 22/8/2020 18:17:23 ******/
ALTER TABLE [dbo].[Tipo_Cuenta] ADD UNIQUE NONCLUSTERED 
(
	[descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Tipo_Tar__298336B6E3689E4F]    Script Date: 22/8/2020 18:17:23 ******/
ALTER TABLE [dbo].[Tipo_Tarjeta] ADD UNIQUE NONCLUSTERED 
(
	[descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cajero] ADD  DEFAULT ((0)) FOR [activo]
GO
ALTER TABLE [dbo].[Cliente] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[Cuenta] ADD  DEFAULT ((0)) FOR [estado]
GO
ALTER TABLE [dbo].[Cuenta] ADD  DEFAULT ((0)) FOR [saldo]
GO
ALTER TABLE [dbo].[Cuenta] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[Localidad] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[Provincia] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[Sucursal] ADD  DEFAULT ((1)) FOR [activa]
GO
ALTER TABLE [dbo].[Tarjeta] ADD  DEFAULT ((0)) FOR [estado]
GO
ALTER TABLE [dbo].[Tarjeta] ADD  DEFAULT ((0)) FOR [intentosClave]
GO
ALTER TABLE [dbo].[Tarjeta] ADD  DEFAULT ((0)) FOR [saldo]
GO
ALTER TABLE [dbo].[Tarjeta] ADD  DEFAULT ((0)) FOR [activo]
GO
ALTER TABLE [dbo].[Tipo_Cuenta] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[Tipo_Operacion] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[Tipo_Tarjeta] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[Cajero]  WITH CHECK ADD FOREIGN KEY([idSucursal])
REFERENCES [dbo].[Sucursal] ([id])
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD FOREIGN KEY([idLocalidad])
REFERENCES [dbo].[Localidad] ([id])
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([id])
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD FOREIGN KEY([idTarjeta])
REFERENCES [dbo].[Tarjeta] ([id])
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD FOREIGN KEY([idTipo])
REFERENCES [dbo].[Tipo_Cuenta] ([id])
GO
ALTER TABLE [dbo].[Localidad]  WITH CHECK ADD FOREIGN KEY([idProvincia])
REFERENCES [dbo].[Provincia] ([id])
GO
ALTER TABLE [dbo].[Operacion]  WITH CHECK ADD FOREIGN KEY([idAtm])
REFERENCES [dbo].[Cajero] ([id])
GO
ALTER TABLE [dbo].[Operacion]  WITH CHECK ADD FOREIGN KEY([idTarjeta])
REFERENCES [dbo].[Tarjeta] ([id])
GO
ALTER TABLE [dbo].[Operacion]  WITH CHECK ADD FOREIGN KEY([idTipoOperacion])
REFERENCES [dbo].[Tipo_Operacion] ([id])
GO
ALTER TABLE [dbo].[Sucursal]  WITH CHECK ADD FOREIGN KEY([idLocalidad])
REFERENCES [dbo].[Localidad] ([id])
GO
ALTER TABLE [dbo].[Tarjeta]  WITH CHECK ADD FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([id])
GO
ALTER TABLE [dbo].[Tarjeta]  WITH CHECK ADD FOREIGN KEY([idTipo])
REFERENCES [dbo].[Tipo_Tarjeta] ([id])
GO
USE [master]
GO
ALTER DATABASE [Banco] SET  READ_WRITE 
GO
