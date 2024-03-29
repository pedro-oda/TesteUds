USE [master]
GO
/****** Object:  Database [PizzariaUds]    Script Date: 12/07/2019 10:22:34 ******/
CREATE DATABASE [PizzariaUds]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PizzariaUds', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PizzariaUds.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PizzariaUds_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PizzariaUds_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PizzariaUds] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PizzariaUds].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PizzariaUds] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PizzariaUds] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PizzariaUds] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PizzariaUds] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PizzariaUds] SET ARITHABORT OFF 
GO
ALTER DATABASE [PizzariaUds] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PizzariaUds] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PizzariaUds] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PizzariaUds] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PizzariaUds] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PizzariaUds] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PizzariaUds] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PizzariaUds] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PizzariaUds] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PizzariaUds] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PizzariaUds] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PizzariaUds] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PizzariaUds] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PizzariaUds] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PizzariaUds] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PizzariaUds] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PizzariaUds] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PizzariaUds] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PizzariaUds] SET  MULTI_USER 
GO
ALTER DATABASE [PizzariaUds] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PizzariaUds] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PizzariaUds] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PizzariaUds] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PizzariaUds] SET DELAYED_DURABILITY = DISABLED 
GO
USE [PizzariaUds]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 12/07/2019 10:22:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SaborId] [int] NOT NULL,
	[TamanhoId] [int] NOT NULL,
 CONSTRAINT [PK_Pedido] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PedidoPersonalizacao]    Script Date: 12/07/2019 10:22:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedidoPersonalizacao](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PedidoId] [int] NOT NULL,
	[PersonalizacaoId] [int] NOT NULL,
 CONSTRAINT [PK_PedidoPersonalizacao] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Personalizacao]    Script Date: 12/07/2019 10:22:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personalizacao](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Personalizacao] [nvarchar](50) NOT NULL,
	[Tempo] [int] NULL,
	[Valor] [money] NOT NULL,
 CONSTRAINT [PK_Personalizacao] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sabor]    Script Date: 12/07/2019 10:22:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sabor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Sabor] [nvarchar](50) NOT NULL,
	[Tempo] [int] NULL,
 CONSTRAINT [PK_Sabor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tamanho]    Script Date: 12/07/2019 10:22:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tamanho](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tamanho] [nvarchar](50) NOT NULL,
	[Tempo] [int] NULL,
	[Valor] [money] NOT NULL,
 CONSTRAINT [PK_Tamanho] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  UserDefinedFunction [dbo].[Fn_Pedido]    Script Date: 12/07/2019 10:22:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[Fn_Pedido] (@pedidoId INT)
RETURNS TABLE
AS
RETURN SELECT tamanho, sabor, pt.valor,(select sum(valor) from [PedidoPersonalizacao] ppz join personalizacao pz 
   on pz.id = ppz.personalizacaoId WHERE pedidoid=@pedidoId) + pt.Valor as valorTotal, 
   Coalesce((select sum(tempo) from [PedidoPersonalizacao] ppz join personalizacao pz 
   on pz.id = ppz.personalizacaoId WHERE pedidoid=@pedidoId),0) + pt.tempo +  Coalesce(ps.tempo,0) as tempoTotal
   from pedido p
   join Sabor ps on ps.Id = p.SaborId
      join Tamanho pt on pt.Id = p.TamanhoId  where p.id = @pedidoId

GO
SET IDENTITY_INSERT [dbo].[Pedido] ON 

INSERT [dbo].[Pedido] ([Id], [SaborId], [TamanhoId]) VALUES (1, 1, 2)
INSERT [dbo].[Pedido] ([Id], [SaborId], [TamanhoId]) VALUES (2, 3, 1)
SET IDENTITY_INSERT [dbo].[Pedido] OFF
SET IDENTITY_INSERT [dbo].[PedidoPersonalizacao] ON 

INSERT [dbo].[PedidoPersonalizacao] ([Id], [PedidoId], [PersonalizacaoId]) VALUES (2, 1, 1)
INSERT [dbo].[PedidoPersonalizacao] ([Id], [PedidoId], [PersonalizacaoId]) VALUES (3, 1, 4)
INSERT [dbo].[PedidoPersonalizacao] ([Id], [PedidoId], [PersonalizacaoId]) VALUES (4, 1, 5)
SET IDENTITY_INSERT [dbo].[PedidoPersonalizacao] OFF
SET IDENTITY_INSERT [dbo].[Personalizacao] ON 

INSERT [dbo].[Personalizacao] ([Id], [Personalizacao], [Tempo], [Valor]) VALUES (1, N'Extra bacon', NULL, 3.0000)
INSERT [dbo].[Personalizacao] ([Id], [Personalizacao], [Tempo], [Valor]) VALUES (4, N'Sem cebola', NULL, 0.0000)
INSERT [dbo].[Personalizacao] ([Id], [Personalizacao], [Tempo], [Valor]) VALUES (5, N'Borda recheada', 5, 5.0000)
SET IDENTITY_INSERT [dbo].[Personalizacao] OFF
SET IDENTITY_INSERT [dbo].[Sabor] ON 

INSERT [dbo].[Sabor] ([Id], [Sabor], [Tempo]) VALUES (1, N'Calabresa', NULL)
INSERT [dbo].[Sabor] ([Id], [Sabor], [Tempo]) VALUES (2, N'Marguerita', NULL)
INSERT [dbo].[Sabor] ([Id], [Sabor], [Tempo]) VALUES (3, N'Portuguesa', 5)
SET IDENTITY_INSERT [dbo].[Sabor] OFF
SET IDENTITY_INSERT [dbo].[Tamanho] ON 

INSERT [dbo].[Tamanho] ([Id], [Tamanho], [Tempo], [Valor]) VALUES (1, N'Pequena', 15, 20.0000)
INSERT [dbo].[Tamanho] ([Id], [Tamanho], [Tempo], [Valor]) VALUES (2, N'Media', 20, 30.0000)
INSERT [dbo].[Tamanho] ([Id], [Tamanho], [Tempo], [Valor]) VALUES (3, N'Grande', 25, 40.0000)
SET IDENTITY_INSERT [dbo].[Tamanho] OFF
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Sabor] FOREIGN KEY([SaborId])
REFERENCES [dbo].[Sabor] ([Id])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Sabor]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Tamanho] FOREIGN KEY([TamanhoId])
REFERENCES [dbo].[Tamanho] ([Id])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Tamanho]
GO
ALTER TABLE [dbo].[PedidoPersonalizacao]  WITH CHECK ADD  CONSTRAINT [FK_PedidoPersonalizacao_Pedido] FOREIGN KEY([PedidoId])
REFERENCES [dbo].[Pedido] ([Id])
GO
ALTER TABLE [dbo].[PedidoPersonalizacao] CHECK CONSTRAINT [FK_PedidoPersonalizacao_Pedido]
GO
ALTER TABLE [dbo].[PedidoPersonalizacao]  WITH CHECK ADD  CONSTRAINT [FK_PedidoPersonalizacao_Personalizacao] FOREIGN KEY([PersonalizacaoId])
REFERENCES [dbo].[Personalizacao] ([Id])
GO
ALTER TABLE [dbo].[PedidoPersonalizacao] CHECK CONSTRAINT [FK_PedidoPersonalizacao_Personalizacao]
GO
USE [master]
GO
ALTER DATABASE [PizzariaUds] SET  READ_WRITE 
GO
