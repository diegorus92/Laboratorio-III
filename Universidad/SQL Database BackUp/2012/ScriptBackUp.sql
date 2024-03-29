USE [master]
GO
/****** Object:  Database [Universidad]    Script Date: 17/06/2019 02:42:06 p. m. ******/
CREATE DATABASE [Universidad]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Universidad', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Universidad.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Universidad_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Universidad_log.ldf' , SIZE = 1600KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Universidad] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Universidad].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Universidad] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Universidad] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Universidad] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Universidad] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Universidad] SET ARITHABORT OFF 
GO
ALTER DATABASE [Universidad] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Universidad] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Universidad] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Universidad] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Universidad] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Universidad] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Universidad] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Universidad] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Universidad] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Universidad] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Universidad] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Universidad] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Universidad] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Universidad] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Universidad] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Universidad] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Universidad] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Universidad] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Universidad] SET  MULTI_USER 
GO
ALTER DATABASE [Universidad] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Universidad] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Universidad] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Universidad] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Universidad', N'ON'
GO
USE [Universidad]
GO
/****** Object:  UserDefinedFunction [dbo].[autogenerar_pkCalificaciones]    Script Date: 17/06/2019 02:42:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[autogenerar_pkCalificaciones] ()
	returns int
	as
	begin 
		declare @proximoId int
		set @proximoId = (select max(idCalif) from Calificaciones) + 1
		if(@proximoId is null) 
		begin
			return 1
		end
		return @proximoId
	end
GO
/****** Object:  UserDefinedFunction [dbo].[comprobar_CursoDivision]    Script Date: 17/06/2019 02:42:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[comprobar_CursoDivision] (@cursoId int, @divisionId int)
	returns int 
	as
	begin
		if @cursoId in (4, 5)--El curso cuya division a modificar es 4to o 5to?
		begin
			return 1 --Referiencia a Division A porque 4to y 5to no tiene Division B
		end
		if @cursoId in (1, 2, 3) and @divisionId in (1, 2)
		begin
			return @divisionId
		end
		return 1
	end
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 17/06/2019 02:42:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumno](
	[matricula] [int] NOT NULL,
	[apellido] [varchar](15) NULL,
	[nombre] [varchar](15) NULL,
	[direccion] [varchar](40) NULL,
	[telefono] [numeric](14, 0) NULL,
	[cursoId4] [int] NULL,
	[divisionId3] [int] NULL,
	[existe] [varchar](5) NOT NULL,
 CONSTRAINT [pk_matricula] PRIMARY KEY CLUSTERED 
(
	[matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Asignatura]    Script Date: 17/06/2019 02:42:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignatura](
	[asignaturaId] [int] NOT NULL,
	[nombre] [varchar](25) NULL,
	[dni1] [int] NOT NULL,
 CONSTRAINT [pk_asignaturaId] PRIMARY KEY CLUSTERED 
(
	[asignaturaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aula]    Script Date: 17/06/2019 02:42:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aula](
	[aulaId] [int] NOT NULL,
	[capacidadMax] [tinyint] NOT NULL,
	[tieneProyeccion] [char](5) NOT NULL,
	[tieneConexion] [char](5) NOT NULL,
	[cursoId1] [int] NOT NULL,
 CONSTRAINT [pk_aulaId] PRIMARY KEY CLUSTERED 
(
	[aulaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Calificaciones]    Script Date: 17/06/2019 02:42:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calificaciones](
	[parcial1] [real] NOT NULL,
	[parcial2] [real] NOT NULL,
	[parcial3] [real] NOT NULL,
	[recuperatorio1] [real] NOT NULL,
	[recuperatorio2] [real] NOT NULL,
	[matricula1] [int] NOT NULL,
	[asignaturaId2] [int] NOT NULL,
	[idCalif] [int] NOT NULL,
	[aprobado] [varchar](5) NOT NULL,
 CONSTRAINT [pk_idCalif] PRIMARY KEY CLUSTERED 
(
	[idCalif] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Correlativas]    Script Date: 17/06/2019 02:42:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Correlativas](
	[asignaturaId3] [int] NOT NULL,
	[asignaturaCorrelatId4] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curso]    Script Date: 17/06/2019 02:42:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso](
	[cursoId] [int] NOT NULL,
 CONSTRAINT [pk_cursoId] PRIMARY KEY CLUSTERED 
(
	[cursoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curso_Asignatura]    Script Date: 17/06/2019 02:42:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso_Asignatura](
	[cursoId2] [int] NOT NULL,
	[asignaturaId1] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curso_Division]    Script Date: 17/06/2019 02:42:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso_Division](
	[cursoId3] [int] NOT NULL,
	[divisionId1] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Division]    Script Date: 17/06/2019 02:42:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Division](
	[divisionId] [int] NOT NULL,
	[nombre] [varchar](5) NULL,
 CONSTRAINT [pk_divisionId] PRIMARY KEY CLUSTERED 
(
	[divisionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Division_Profesor]    Script Date: 17/06/2019 02:42:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Division_Profesor](
	[divisionId2] [int] NULL,
	[dni2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profesor]    Script Date: 17/06/2019 02:42:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesor](
	[dni] [int] NOT NULL,
	[apellido] [varchar](15) NULL,
	[nombre] [varchar](15) NULL,
	[direccion] [varchar](40) NULL,
	[telefono] [numeric](14, 0) NULL,
 CONSTRAINT [pk_dni] PRIMARY KEY CLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[obtener_asignaturaDeCurso]    Script Date: 17/06/2019 02:42:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[obtener_asignaturaDeCurso](@curso int, @asignaturaId int)
	returns table
	as

		return (select curso.cursoId2, curso.asignaturaId1, asignatura.nombre 
				from Curso_Asignatura curso, Asignatura asignatura 
				where curso.cursoId2 = @curso and 
				 @asignaturaId = curso.asignaturaId1 and 
				 curso.asignaturaId1 = asignatura.asignaturaId)
GO
/****** Object:  UserDefinedFunction [dbo].[obtener_asignaturas_Curso]    Script Date: 17/06/2019 02:42:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[obtener_asignaturas_Curso](@curso int)
	returns table
	as
		return (select cur.cursoId2, cur.asignaturaId1, asig.nombre 
				from Curso_Asignatura cur, Asignatura asig 
				where cur.cursoId2 = @curso and asig.asignaturaId = cur.asignaturaId1)
GO
/****** Object:  UserDefinedFunction [dbo].[obtener_aula]    Script Date: 17/06/2019 02:42:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[obtener_aula](@aulaId int)
	returns table
	as
	return(select * from Aula where aulaId = @aulaId)
GO
/****** Object:  UserDefinedFunction [dbo].[obtener_correlatividades]    Script Date: 17/06/2019 02:42:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[obtener_correlatividades] (@asignaturaId int)
	returns table
	as
		return (select * from Correlativas where asignaturaId3 = @asignaturaId)
GO
/****** Object:  UserDefinedFunction [dbo].[ver_alumnos_en_aula]    Script Date: 17/06/2019 02:42:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[ver_alumnos_en_aula](@aulaId int)
	returns table
	as
		return (select alu.matricula [Matricula], alu.apellido [Apellido], alu.nombre [Nombre], alu.cursoId4 [Curso/Año], div.nombre [Division] 
				from Alumno alu inner join Division div on 
				cursoId4 = @aulaId and alu.divisionId3 = div.divisionId)
GO
INSERT [dbo].[Alumno] ([matricula], [apellido], [nombre], [direccion], [telefono], [cursoId4], [divisionId3], [existe]) VALUES (1, N'Gonzalez', N'Maira', N'Los Alamos 323(Rcia.)', CAST(362154878542 AS Numeric(14, 0)), 3, 1, N'true')
INSERT [dbo].[Alumno] ([matricula], [apellido], [nombre], [direccion], [telefono], [cursoId4], [divisionId3], [existe]) VALUES (2, N'Navarro', N'Juan', N'Tulipanes 1223(Ctes.)', CAST(379154898555 AS Numeric(14, 0)), 1, 2, N'true')
INSERT [dbo].[Alumno] ([matricula], [apellido], [nombre], [direccion], [telefono], [cursoId4], [divisionId3], [existe]) VALUES (3, N'Lucero', N'Antonio', N'Madariaga 989(R.S.Peña)', CAST(362154878542 AS Numeric(14, 0)), 3, 1, N'true')
INSERT [dbo].[Alumno] ([matricula], [apellido], [nombre], [direccion], [telefono], [cursoId4], [divisionId3], [existe]) VALUES (4, N'Navarro', N'Mariano', N'Altiplano 1423(Ctes.)', CAST(379154789652 AS Numeric(14, 0)), 5, 1, N'true')
INSERT [dbo].[Alumno] ([matricula], [apellido], [nombre], [direccion], [telefono], [cursoId4], [divisionId3], [existe]) VALUES (5, N'Ramirez', N'Lautaro', N'Concepcion 1125(Rcia.)', CAST(362154452233 AS Numeric(14, 0)), 1, 2, N'true')
INSERT [dbo].[Alumno] ([matricula], [apellido], [nombre], [direccion], [telefono], [cursoId4], [divisionId3], [existe]) VALUES (6, N'Navarro', N'Juan', N'Tulipanes 1223(Ctes.)', CAST(379154898555 AS Numeric(14, 0)), 1, 2, N'true')
INSERT [dbo].[Alumno] ([matricula], [apellido], [nombre], [direccion], [telefono], [cursoId4], [divisionId3], [existe]) VALUES (7, N'Castillo', N'Celeste', N'Av. Libertad 123(Ctes.)', CAST(3794456985 AS Numeric(14, 0)), 1, 2, N'true')
INSERT [dbo].[Alumno] ([matricula], [apellido], [nombre], [direccion], [telefono], [cursoId4], [divisionId3], [existe]) VALUES (8, N'Acevedo', N'Juan', N'Los Pepinos(Ctes.)', CAST(37944894575 AS Numeric(14, 0)), 2, 1, N'true')
INSERT [dbo].[Alumno] ([matricula], [apellido], [nombre], [direccion], [telefono], [cursoId4], [divisionId3], [existe]) VALUES (9, N'Lorenzetti', N'Agustina', N'Fray Rossi 145(Rcia.)', CAST(362154452145 AS Numeric(14, 0)), 5, 1, N'true')
INSERT [dbo].[Alumno] ([matricula], [apellido], [nombre], [direccion], [telefono], [cursoId4], [divisionId3], [existe]) VALUES (10, N'Gutierrez', N'Natalia', N'San Martin 221(Ctes.)', CAST(37944858965 AS Numeric(14, 0)), 4, 1, N'true')
INSERT [dbo].[Alumno] ([matricula], [apellido], [nombre], [direccion], [telefono], [cursoId4], [divisionId3], [existe]) VALUES (11, N'Acevedo', N'Manuel', N'Tulipanes 323(Ctes.)', CAST(379154895452 AS Numeric(14, 0)), 3, 1, N'true')
INSERT [dbo].[Alumno] ([matricula], [apellido], [nombre], [direccion], [telefono], [cursoId4], [divisionId3], [existe]) VALUES (12, N'Blanco', N'Silvia', N'Av 9 de Julio 1555(Fontana)', CAST(362154892211 AS Numeric(14, 0)), 4, 1, N'true')
INSERT [dbo].[Alumno] ([matricula], [apellido], [nombre], [direccion], [telefono], [cursoId4], [divisionId3], [existe]) VALUES (13, N'Estevanez', N'Diego', N'Misionero Klein 1400(Rcia.)', CAST(36244568952 AS Numeric(14, 0)), 1, 2, N'true')
INSERT [dbo].[Alumno] ([matricula], [apellido], [nombre], [direccion], [telefono], [cursoId4], [divisionId3], [existe]) VALUES (14, N'Navarro', N'Lorenzo', N'Av Libertad 13550(Ctes.)', CAST(379154458822 AS Numeric(14, 0)), 1, 2, N'true')
INSERT [dbo].[Alumno] ([matricula], [apellido], [nombre], [direccion], [telefono], [cursoId4], [divisionId3], [existe]) VALUES (15, N'Lopez', N'Ramiro', N'San Martin 350(Ctes.)', CAST(379154878821 AS Numeric(14, 0)), 2, 2, N'true')
INSERT [dbo].[Alumno] ([matricula], [apellido], [nombre], [direccion], [telefono], [cursoId4], [divisionId3], [existe]) VALUES (16, N'Paredes', N'Agustina', N'Jujuy 1223(Ctes.)', CAST(379154112299 AS Numeric(14, 0)), 2, 2, N'true')
INSERT [dbo].[Alumno] ([matricula], [apellido], [nombre], [direccion], [telefono], [cursoId4], [divisionId3], [existe]) VALUES (17, N'Gonzalez', N'Nahuel', N'Los Alamos 1050(Rcia.)', CAST(36244545211 AS Numeric(14, 0)), 3, 1, N'true')
INSERT [dbo].[Alumno] ([matricula], [apellido], [nombre], [direccion], [telefono], [cursoId4], [divisionId3], [existe]) VALUES (18, N'Romanoopkpkp', N'Ivankkk', N'Barranco 1', CAST(379154158791 AS Numeric(14, 0)), 2, 1, N'true')
INSERT [dbo].[Alumno] ([matricula], [apellido], [nombre], [direccion], [telefono], [cursoId4], [divisionId3], [existe]) VALUES (222, N'gjghghhgk', N'Ivankkk', N'Barranco 1', CAST(379154158791 AS Numeric(14, 0)), 1, 2, N'true')
INSERT [dbo].[Alumno] ([matricula], [apellido], [nombre], [direccion], [telefono], [cursoId4], [divisionId3], [existe]) VALUES (578, N'Rus', N'Dario', N'B° Pujol Mz7 C20', CAST(379154896523 AS Numeric(14, 0)), 1, 1, N'true')
INSERT [dbo].[Asignatura] ([asignaturaId], [nombre], [dni1]) VALUES (1, N'Matemática', 35898547)
INSERT [dbo].[Asignatura] ([asignaturaId], [nombre], [dni1]) VALUES (2, N'Fisica', 35898547)
INSERT [dbo].[Asignatura] ([asignaturaId], [nombre], [dni1]) VALUES (3, N'Redes', 36897896)
INSERT [dbo].[Asignatura] ([asignaturaId], [nombre], [dni1]) VALUES (4, N'Algoritmos', 36897896)
INSERT [dbo].[Asignatura] ([asignaturaId], [nombre], [dni1]) VALUES (5, N'Programacion', 36755212)
INSERT [dbo].[Asignatura] ([asignaturaId], [nombre], [dni1]) VALUES (6, N'Paradigmas', 36897896)
INSERT [dbo].[Asignatura] ([asignaturaId], [nombre], [dni1]) VALUES (7, N'Laboratorio I', 36223658)
INSERT [dbo].[Asignatura] ([asignaturaId], [nombre], [dni1]) VALUES (8, N'Laboratorio II', 36223658)
INSERT [dbo].[Asignatura] ([asignaturaId], [nombre], [dni1]) VALUES (9, N'Matemática II', 35898547)
INSERT [dbo].[Asignatura] ([asignaturaId], [nombre], [dni1]) VALUES (10, N'Fisica II', 35898547)
INSERT [dbo].[Asignatura] ([asignaturaId], [nombre], [dni1]) VALUES (11, N'Programacion II', 36755212)
INSERT [dbo].[Asignatura] ([asignaturaId], [nombre], [dni1]) VALUES (12, N'Programacion III', 36755212)
INSERT [dbo].[Asignatura] ([asignaturaId], [nombre], [dni1]) VALUES (13, N'Programacion IV', 36755212)
INSERT [dbo].[Aula] ([aulaId], [capacidadMax], [tieneProyeccion], [tieneConexion], [cursoId1]) VALUES (1, 50, N'true ', N'false', 1)
INSERT [dbo].[Aula] ([aulaId], [capacidadMax], [tieneProyeccion], [tieneConexion], [cursoId1]) VALUES (2, 100, N'true ', N'false', 2)
INSERT [dbo].[Aula] ([aulaId], [capacidadMax], [tieneProyeccion], [tieneConexion], [cursoId1]) VALUES (3, 200, N'true ', N'true ', 3)
INSERT [dbo].[Aula] ([aulaId], [capacidadMax], [tieneProyeccion], [tieneConexion], [cursoId1]) VALUES (4, 150, N'true ', N'true ', 4)
INSERT [dbo].[Aula] ([aulaId], [capacidadMax], [tieneProyeccion], [tieneConexion], [cursoId1]) VALUES (5, 150, N'false', N'false', 5)
INSERT [dbo].[Calificaciones] ([parcial1], [parcial2], [parcial3], [recuperatorio1], [recuperatorio2], [matricula1], [asignaturaId2], [idCalif], [aprobado]) VALUES (0, 0, 0, 0, 0, 1, 3, 1, N'false')
INSERT [dbo].[Calificaciones] ([parcial1], [parcial2], [parcial3], [recuperatorio1], [recuperatorio2], [matricula1], [asignaturaId2], [idCalif], [aprobado]) VALUES (0, 0, 0, 0, 0, 1, 4, 2, N'false')
INSERT [dbo].[Calificaciones] ([parcial1], [parcial2], [parcial3], [recuperatorio1], [recuperatorio2], [matricula1], [asignaturaId2], [idCalif], [aprobado]) VALUES (0, 0, 0, 0, 0, 4, 2, 3, N'false')
INSERT [dbo].[Calificaciones] ([parcial1], [parcial2], [parcial3], [recuperatorio1], [recuperatorio2], [matricula1], [asignaturaId2], [idCalif], [aprobado]) VALUES (0, 0, 0, 0, 0, 4, 5, 4, N'true')
INSERT [dbo].[Calificaciones] ([parcial1], [parcial2], [parcial3], [recuperatorio1], [recuperatorio2], [matricula1], [asignaturaId2], [idCalif], [aprobado]) VALUES (0, 0, 0, 0, 0, 4, 12, 5, N'true')
INSERT [dbo].[Calificaciones] ([parcial1], [parcial2], [parcial3], [recuperatorio1], [recuperatorio2], [matricula1], [asignaturaId2], [idCalif], [aprobado]) VALUES (0, 0, 0, 0, 0, 4, 11, 6, N'true')
INSERT [dbo].[Calificaciones] ([parcial1], [parcial2], [parcial3], [recuperatorio1], [recuperatorio2], [matricula1], [asignaturaId2], [idCalif], [aprobado]) VALUES (0, 0, 0, 0, 0, 4, 13, 7, N'false')
INSERT [dbo].[Calificaciones] ([parcial1], [parcial2], [parcial3], [recuperatorio1], [recuperatorio2], [matricula1], [asignaturaId2], [idCalif], [aprobado]) VALUES (0, 0, 0, 0, 0, 3, 3, 8, N'false')
INSERT [dbo].[Calificaciones] ([parcial1], [parcial2], [parcial3], [recuperatorio1], [recuperatorio2], [matricula1], [asignaturaId2], [idCalif], [aprobado]) VALUES (0, 0, 0, 0, 0, 3, 4, 9, N'false')
INSERT [dbo].[Calificaciones] ([parcial1], [parcial2], [parcial3], [recuperatorio1], [recuperatorio2], [matricula1], [asignaturaId2], [idCalif], [aprobado]) VALUES (0, 0, 0, 0, 0, 3, 5, 10, N'false')
INSERT [dbo].[Calificaciones] ([parcial1], [parcial2], [parcial3], [recuperatorio1], [recuperatorio2], [matricula1], [asignaturaId2], [idCalif], [aprobado]) VALUES (0, 0, 0, 0, 0, 10, 7, 11, N'false')
INSERT [dbo].[Calificaciones] ([parcial1], [parcial2], [parcial3], [recuperatorio1], [recuperatorio2], [matricula1], [asignaturaId2], [idCalif], [aprobado]) VALUES (7.55, 9.5, 3, 5, 7, 8, 1, 12, N'true')
INSERT [dbo].[Calificaciones] ([parcial1], [parcial2], [parcial3], [recuperatorio1], [recuperatorio2], [matricula1], [asignaturaId2], [idCalif], [aprobado]) VALUES (0, 0, 0, 0, 0, 10, 5, 13, N'false')
INSERT [dbo].[Calificaciones] ([parcial1], [parcial2], [parcial3], [recuperatorio1], [recuperatorio2], [matricula1], [asignaturaId2], [idCalif], [aprobado]) VALUES (5, 4, 9, 6.75, 8, 8, 9, 14, N'true')
INSERT [dbo].[Calificaciones] ([parcial1], [parcial2], [parcial3], [recuperatorio1], [recuperatorio2], [matricula1], [asignaturaId2], [idCalif], [aprobado]) VALUES (2, 8, 6, 7, 0, 578, 2, 15, N'true')
INSERT [dbo].[Correlativas] ([asignaturaId3], [asignaturaCorrelatId4]) VALUES (1, NULL)
INSERT [dbo].[Correlativas] ([asignaturaId3], [asignaturaCorrelatId4]) VALUES (12, 11)
INSERT [dbo].[Correlativas] ([asignaturaId3], [asignaturaCorrelatId4]) VALUES (2, NULL)
INSERT [dbo].[Correlativas] ([asignaturaId3], [asignaturaCorrelatId4]) VALUES (3, NULL)
INSERT [dbo].[Correlativas] ([asignaturaId3], [asignaturaCorrelatId4]) VALUES (4, NULL)
INSERT [dbo].[Correlativas] ([asignaturaId3], [asignaturaCorrelatId4]) VALUES (5, NULL)
INSERT [dbo].[Correlativas] ([asignaturaId3], [asignaturaCorrelatId4]) VALUES (6, NULL)
INSERT [dbo].[Correlativas] ([asignaturaId3], [asignaturaCorrelatId4]) VALUES (7, NULL)
INSERT [dbo].[Correlativas] ([asignaturaId3], [asignaturaCorrelatId4]) VALUES (8, 7)
INSERT [dbo].[Correlativas] ([asignaturaId3], [asignaturaCorrelatId4]) VALUES (9, 1)
INSERT [dbo].[Correlativas] ([asignaturaId3], [asignaturaCorrelatId4]) VALUES (10, 2)
INSERT [dbo].[Correlativas] ([asignaturaId3], [asignaturaCorrelatId4]) VALUES (11, 5)
INSERT [dbo].[Correlativas] ([asignaturaId3], [asignaturaCorrelatId4]) VALUES (13, 5)
INSERT [dbo].[Correlativas] ([asignaturaId3], [asignaturaCorrelatId4]) VALUES (13, 11)
INSERT [dbo].[Correlativas] ([asignaturaId3], [asignaturaCorrelatId4]) VALUES (13, 12)
INSERT [dbo].[Curso] ([cursoId]) VALUES (1)
INSERT [dbo].[Curso] ([cursoId]) VALUES (2)
INSERT [dbo].[Curso] ([cursoId]) VALUES (3)
INSERT [dbo].[Curso] ([cursoId]) VALUES (4)
INSERT [dbo].[Curso] ([cursoId]) VALUES (5)
INSERT [dbo].[Curso_Asignatura] ([cursoId2], [asignaturaId1]) VALUES (1, 1)
INSERT [dbo].[Curso_Asignatura] ([cursoId2], [asignaturaId1]) VALUES (1, 2)
INSERT [dbo].[Curso_Asignatura] ([cursoId2], [asignaturaId1]) VALUES (2, 9)
INSERT [dbo].[Curso_Asignatura] ([cursoId2], [asignaturaId1]) VALUES (2, 10)
INSERT [dbo].[Curso_Asignatura] ([cursoId2], [asignaturaId1]) VALUES (3, 3)
INSERT [dbo].[Curso_Asignatura] ([cursoId2], [asignaturaId1]) VALUES (3, 4)
INSERT [dbo].[Curso_Asignatura] ([cursoId2], [asignaturaId1]) VALUES (3, 6)
INSERT [dbo].[Curso_Asignatura] ([cursoId2], [asignaturaId1]) VALUES (4, 5)
INSERT [dbo].[Curso_Asignatura] ([cursoId2], [asignaturaId1]) VALUES (4, 7)
INSERT [dbo].[Curso_Asignatura] ([cursoId2], [asignaturaId1]) VALUES (4, 8)
INSERT [dbo].[Curso_Asignatura] ([cursoId2], [asignaturaId1]) VALUES (5, 11)
INSERT [dbo].[Curso_Asignatura] ([cursoId2], [asignaturaId1]) VALUES (5, 12)
INSERT [dbo].[Curso_Asignatura] ([cursoId2], [asignaturaId1]) VALUES (5, 13)
INSERT [dbo].[Curso_Division] ([cursoId3], [divisionId1]) VALUES (1, 1)
INSERT [dbo].[Curso_Division] ([cursoId3], [divisionId1]) VALUES (1, 2)
INSERT [dbo].[Curso_Division] ([cursoId3], [divisionId1]) VALUES (2, 1)
INSERT [dbo].[Curso_Division] ([cursoId3], [divisionId1]) VALUES (2, 2)
INSERT [dbo].[Curso_Division] ([cursoId3], [divisionId1]) VALUES (3, 1)
INSERT [dbo].[Curso_Division] ([cursoId3], [divisionId1]) VALUES (3, 2)
INSERT [dbo].[Curso_Division] ([cursoId3], [divisionId1]) VALUES (4, 1)
INSERT [dbo].[Curso_Division] ([cursoId3], [divisionId1]) VALUES (5, 1)
INSERT [dbo].[Division] ([divisionId], [nombre]) VALUES (1, N'A')
INSERT [dbo].[Division] ([divisionId], [nombre]) VALUES (2, N'B')
INSERT [dbo].[Profesor] ([dni], [apellido], [nombre], [direccion], [telefono]) VALUES (35898547, N'Castillo', N'Martin', N'Julio A. Roca 123(Rcia.)', CAST(362154897854 AS Numeric(14, 0)))
INSERT [dbo].[Profesor] ([dni], [apellido], [nombre], [direccion], [telefono]) VALUES (36223658, N'Paredes', N'Graciela', N'Brazil 234(Ctes.)', CAST(379154158965 AS Numeric(14, 0)))
INSERT [dbo].[Profesor] ([dni], [apellido], [nombre], [direccion], [telefono]) VALUES (36755212, N'Brizuela', N'Jorge', N'Av. Sarmiento 1570(Rcia.)', CAST(3624485214 AS Numeric(14, 0)))
INSERT [dbo].[Profesor] ([dni], [apellido], [nombre], [direccion], [telefono]) VALUES (36897896, N'Martinez', N'Mariela', N'9 de Julio 1345(Ctes.)', CAST(379154879652 AS Numeric(14, 0)))
ALTER TABLE [dbo].[Alumno] ADD  CONSTRAINT [df_existe]  DEFAULT ('true') FOR [existe]
GO
ALTER TABLE [dbo].[Calificaciones] ADD  CONSTRAINT [df_parcial1]  DEFAULT ((0)) FOR [parcial1]
GO
ALTER TABLE [dbo].[Calificaciones] ADD  CONSTRAINT [df_parcial2]  DEFAULT ((0)) FOR [parcial2]
GO
ALTER TABLE [dbo].[Calificaciones] ADD  CONSTRAINT [df_parcial3]  DEFAULT ((0)) FOR [parcial3]
GO
ALTER TABLE [dbo].[Calificaciones] ADD  CONSTRAINT [df_recuperatorio1]  DEFAULT ((0)) FOR [recuperatorio1]
GO
ALTER TABLE [dbo].[Calificaciones] ADD  CONSTRAINT [df_recuperatorio2]  DEFAULT ((0)) FOR [recuperatorio2]
GO
ALTER TABLE [dbo].[Calificaciones] ADD  CONSTRAINT [df_aprobado]  DEFAULT ('false') FOR [aprobado]
GO
ALTER TABLE [dbo].[Correlativas] ADD  CONSTRAINT [df_asignCorrelatId4]  DEFAULT (NULL) FOR [asignaturaCorrelatId4]
GO
ALTER TABLE [dbo].[Alumno]  WITH CHECK ADD  CONSTRAINT [fk_cursoId4] FOREIGN KEY([cursoId4])
REFERENCES [dbo].[Curso] ([cursoId])
GO
ALTER TABLE [dbo].[Alumno] CHECK CONSTRAINT [fk_cursoId4]
GO
ALTER TABLE [dbo].[Alumno]  WITH CHECK ADD  CONSTRAINT [fk_divisionId3] FOREIGN KEY([divisionId3])
REFERENCES [dbo].[Division] ([divisionId])
GO
ALTER TABLE [dbo].[Alumno] CHECK CONSTRAINT [fk_divisionId3]
GO
ALTER TABLE [dbo].[Asignatura]  WITH CHECK ADD  CONSTRAINT [fk_dni1] FOREIGN KEY([dni1])
REFERENCES [dbo].[Profesor] ([dni])
GO
ALTER TABLE [dbo].[Asignatura] CHECK CONSTRAINT [fk_dni1]
GO
ALTER TABLE [dbo].[Aula]  WITH CHECK ADD  CONSTRAINT [fk_cursoId1] FOREIGN KEY([cursoId1])
REFERENCES [dbo].[Curso] ([cursoId])
GO
ALTER TABLE [dbo].[Aula] CHECK CONSTRAINT [fk_cursoId1]
GO
ALTER TABLE [dbo].[Calificaciones]  WITH CHECK ADD  CONSTRAINT [fk_asignaturaId2] FOREIGN KEY([asignaturaId2])
REFERENCES [dbo].[Asignatura] ([asignaturaId])
GO
ALTER TABLE [dbo].[Calificaciones] CHECK CONSTRAINT [fk_asignaturaId2]
GO
ALTER TABLE [dbo].[Calificaciones]  WITH CHECK ADD  CONSTRAINT [fk_matricula1] FOREIGN KEY([matricula1])
REFERENCES [dbo].[Alumno] ([matricula])
GO
ALTER TABLE [dbo].[Calificaciones] CHECK CONSTRAINT [fk_matricula1]
GO
ALTER TABLE [dbo].[Correlativas]  WITH CHECK ADD  CONSTRAINT [fk_asignaturaCorrelatId4] FOREIGN KEY([asignaturaCorrelatId4])
REFERENCES [dbo].[Asignatura] ([asignaturaId])
GO
ALTER TABLE [dbo].[Correlativas] CHECK CONSTRAINT [fk_asignaturaCorrelatId4]
GO
ALTER TABLE [dbo].[Correlativas]  WITH CHECK ADD  CONSTRAINT [fk_asignaturaId3] FOREIGN KEY([asignaturaId3])
REFERENCES [dbo].[Asignatura] ([asignaturaId])
GO
ALTER TABLE [dbo].[Correlativas] CHECK CONSTRAINT [fk_asignaturaId3]
GO
ALTER TABLE [dbo].[Curso_Asignatura]  WITH CHECK ADD  CONSTRAINT [fk_asignaturaId1] FOREIGN KEY([asignaturaId1])
REFERENCES [dbo].[Asignatura] ([asignaturaId])
GO
ALTER TABLE [dbo].[Curso_Asignatura] CHECK CONSTRAINT [fk_asignaturaId1]
GO
ALTER TABLE [dbo].[Curso_Asignatura]  WITH CHECK ADD  CONSTRAINT [fk_cursoId2] FOREIGN KEY([cursoId2])
REFERENCES [dbo].[Curso] ([cursoId])
GO
ALTER TABLE [dbo].[Curso_Asignatura] CHECK CONSTRAINT [fk_cursoId2]
GO
ALTER TABLE [dbo].[Curso_Division]  WITH CHECK ADD  CONSTRAINT [fk_cursoId3] FOREIGN KEY([cursoId3])
REFERENCES [dbo].[Curso] ([cursoId])
GO
ALTER TABLE [dbo].[Curso_Division] CHECK CONSTRAINT [fk_cursoId3]
GO
ALTER TABLE [dbo].[Curso_Division]  WITH CHECK ADD  CONSTRAINT [fk_divisionId1] FOREIGN KEY([divisionId1])
REFERENCES [dbo].[Division] ([divisionId])
GO
ALTER TABLE [dbo].[Curso_Division] CHECK CONSTRAINT [fk_divisionId1]
GO
ALTER TABLE [dbo].[Division_Profesor]  WITH CHECK ADD  CONSTRAINT [fk_divisionId2] FOREIGN KEY([divisionId2])
REFERENCES [dbo].[Division] ([divisionId])
GO
ALTER TABLE [dbo].[Division_Profesor] CHECK CONSTRAINT [fk_divisionId2]
GO
ALTER TABLE [dbo].[Division_Profesor]  WITH CHECK ADD  CONSTRAINT [fk_dni2] FOREIGN KEY([dni2])
REFERENCES [dbo].[Profesor] ([dni])
GO
ALTER TABLE [dbo].[Division_Profesor] CHECK CONSTRAINT [fk_dni2]
GO
ALTER TABLE [dbo].[Alumno]  WITH CHECK ADD  CONSTRAINT [ch_existe] CHECK  (([existe]='false' OR [existe]='true'))
GO
ALTER TABLE [dbo].[Alumno] CHECK CONSTRAINT [ch_existe]
GO
ALTER TABLE [dbo].[Aula]  WITH CHECK ADD  CONSTRAINT [chk_cursoId1] CHECK  (([cursoId1]=(5) OR [cursoId1]=(4) OR [cursoId1]=(3) OR [cursoId1]=(2) OR [cursoId1]=(1)))
GO
ALTER TABLE [dbo].[Aula] CHECK CONSTRAINT [chk_cursoId1]
GO
ALTER TABLE [dbo].[Aula]  WITH CHECK ADD  CONSTRAINT [chk_tieneConexion] CHECK  (([tieneConexion]='false' OR [tieneConexion]='true'))
GO
ALTER TABLE [dbo].[Aula] CHECK CONSTRAINT [chk_tieneConexion]
GO
ALTER TABLE [dbo].[Aula]  WITH CHECK ADD  CONSTRAINT [chk_tieneProyeccion] CHECK  (([tieneProyeccion]='false' OR [tieneProyeccion]='true'))
GO
ALTER TABLE [dbo].[Aula] CHECK CONSTRAINT [chk_tieneProyeccion]
GO
ALTER TABLE [dbo].[Calificaciones]  WITH CHECK ADD  CONSTRAINT [ch_aprobado] CHECK  (([aprobado]='false' OR [aprobado]='true'))
GO
ALTER TABLE [dbo].[Calificaciones] CHECK CONSTRAINT [ch_aprobado]
GO
ALTER TABLE [dbo].[Curso]  WITH CHECK ADD  CONSTRAINT [ch_cursoId] CHECK  (([cursoId]=(5) OR [cursoId]=(4) OR [cursoId]=(3) OR [cursoId]=(2) OR [cursoId]=(1)))
GO
ALTER TABLE [dbo].[Curso] CHECK CONSTRAINT [ch_cursoId]
GO
ALTER TABLE [dbo].[Curso_Division]  WITH CHECK ADD  CONSTRAINT [chk_curso] CHECK  (([cursoId3]=(5) OR [cursoId3]=(4) OR [cursoId3]=(3) OR [cursoId3]=(2) OR [cursoId3]=(1)))
GO
ALTER TABLE [dbo].[Curso_Division] CHECK CONSTRAINT [chk_curso]
GO
ALTER TABLE [dbo].[Curso_Division]  WITH CHECK ADD  CONSTRAINT [chk_division] CHECK  (([divisionId1]=(2) OR [divisionId1]=(1)))
GO
ALTER TABLE [dbo].[Curso_Division] CHECK CONSTRAINT [chk_division]
GO
ALTER TABLE [dbo].[Division]  WITH CHECK ADD  CONSTRAINT [ch_divisionId] CHECK  (([divisionId]=(2) OR [divisionId]=(1)))
GO
ALTER TABLE [dbo].[Division] CHECK CONSTRAINT [ch_divisionId]
GO
/****** Object:  StoredProcedure [dbo].[buscar_alumno]    Script Date: 17/06/2019 02:42:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[buscar_alumno]
	@buscaPor varchar(15),
	@dato varchar(15)
	as
	begin
		if(@buscaPor = 'Matricula')
		begin
			select a.matricula, a.apellido, a.nombre, a.direccion, a.telefono, a.cursoId4, d.nombre from Alumno a inner join Division d
			on a.divisionId3 = d.divisionId and a.matricula = TRY_PARSE(@dato as int);
		end
		if(@buscaPor = 'Apellido')
		begin
			select a.matricula, a.apellido, a.nombre, a.direccion, a.telefono, a.cursoId4, d.nombre from Alumno a inner join Division d
			on a.divisionId3 = d.divisionId and a.apellido = @dato;
		end
		if(@buscaPor = 'Nombre')
		begin
			select a.matricula, a.apellido, a.nombre, a.direccion, a.telefono, a.cursoId4, d.nombre from Alumno a inner join Division d
			on a.divisionId3 = d.divisionId and a.nombre = @dato;
		end
		if(@buscaPor = 'Curso')
		begin
			select a.matricula, a.apellido, a.nombre, a.direccion, a.telefono, a.cursoId4, d.nombre from Alumno a inner join Division d
			on a.divisionId3 = d.divisionId and a.cursoId4 = TRY_PARSE(@dato as int);
		end
		if(@buscaPor = 'Division')
		begin
			if(@dato = 'A') set @dato = '1'
			else if(@dato = 'B') set @dato = '2'

			select a.matricula, a.apellido, a.nombre, a.direccion, a.telefono, a.cursoId4, d.nombre from Alumno a inner join Division d
			on a.divisionId3 = d.divisionId and a.divisionId3 = TRY_PARSE(@dato as int);
		end
	end

GO
/****** Object:  StoredProcedure [dbo].[eliminar_alumno]    Script Date: 17/06/2019 02:42:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[eliminar_alumno]
	@matricula int
	as
	delete from Calificaciones where matricula1 = @matricula;
	delete from Alumno where matricula = @matricula
GO
/****** Object:  StoredProcedure [dbo].[establecer_aprobacion_asignatura]    Script Date: 17/06/2019 02:42:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Modificacion de procedimiento establecer_aprobacion_asignatura
CREATE procedure [dbo].[establecer_aprobacion_asignatura]
	@matricula int, @asignatura int
	as
	begin
		declare @p1 float, @p2 float , @p3 float, @r1 float, @r2 float
		set @p1 = (select parcial1 from Calificaciones where matricula1 = @matricula and asignaturaId2 = @asignatura);
		set @p2 = (select parcial2 from Calificaciones where matricula1 = @matricula and asignaturaId2 = @asignatura);
		set @p3 = (select parcial3 from Calificaciones where matricula1 = @matricula and asignaturaId2 = @asignatura);
		set @r1 = (select recuperatorio1 from Calificaciones where matricula1 = @matricula and asignaturaId2 = @asignatura);
		set @r2 = (select recuperatorio2 from Calificaciones where matricula1 = @matricula and asignaturaId2 = @asignatura);

		if (@p1 >= 6 and @p2 >= 6 and @p3 >= 6) 
		begin
			update Calificaciones set aprobado = 'true' where matricula1 = @matricula and asignaturaId2 = @asignatura;
			print 'aprobado'
		end
		else if ( (@p1 >= 6 or @p2 >= 6 or @p3 >= 6) and (@r1 >= 6 and @r2 >= 6) )
		begin
			update Calificaciones set aprobado = 'true' where matricula1 = @matricula and asignaturaId2 = @asignatura;
			print 'aprobado'
		end
		else if ( ((@p1 >= 6 and @p2 >= 6) or (@p2 >= 6 and @p3 >= 6) or (@p1 >= 6 and @p3 >= 6)) and (@r1 >= 6 or @r2 >= 6))
		begin
			update Calificaciones set aprobado = 'true' where matricula1 = @matricula and asignaturaId2 = @asignatura;
			print 'aprobado'
		end
		else
		begin
			update Calificaciones set aprobado = 'false' where matricula1 = @matricula and asignaturaId2 = @asignatura;
			print 'desaprobado'
		end
	end
GO
/****** Object:  StoredProcedure [dbo].[inscribir_alumno]    Script Date: 17/06/2019 02:42:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[inscribir_alumno]
	@matricula int, @idAsignatura int
	as
	begin

	declare @correlatividades int = (select count(asignaturaCorrelatId4) from obtener_correlatividades(@idAsignatura));
	declare @inscripcionesACorrelativas int = (select count(corr.asignaturaId3) from Calificaciones calif, obtener_correlatividades(@idAsignatura) corr where calif.matricula1 = @matricula and calif.asignaturaId2 = corr.asignaturaCorrelatId4);
		
		if @idAsignatura in (select asignaturaId2 from Calificaciones where matricula1 = @matricula)
		begin
			select 'El alumno ya se encontraba inscrito a esta asignatura'
			return
		end
		if (select top 1 corr.asignaturaCorrelatId4 from obtener_correlatividades(@idAsignatura) corr) is null
		begin
			print 'puede inscribirse, la asignatura no tiene correlativas'
			insert into Calificaciones(idCalif, matricula1, asignaturaId2) values((dbo.autogenerar_pkCalificaciones()), @matricula, @idAsignatura);
		end
		else if(@correlatividades = @inscripcionesACorrelativas)
		begin
			print 'está inscrito a todas las correlativas necesarias'
			--comprobar que las tenga aprobadas
			declare @aprobadas int = (select count(calif.aprobado) from 
				Calificaciones calif, obtener_correlatividades(@idAsignatura) corr where
				matricula1 = @matricula and corr.asignaturaCorrelatId4 = calif.asignaturaId2 and calif.aprobado = 'true')
			print concat('aprobadas = ', @aprobadas)
			print concat('Correlatividades = ', @correlatividades)
			print concat('inscripcion a correlatividades = ', @inscripcionesACorrelativas)
			
			if(@inscripcionesACorrelativas = @aprobadas) --Tiene aporbadas las correlativas???
			begin
				print 'tiene las correlativas aprobadas, se puede inscribir'
				insert into Calificaciones(idCalif, matricula1, asignaturaId2) values((dbo.autogenerar_pkCalificaciones()), @matricula, @idAsignatura);
			end
			else
			begin
				select 'no tiene todas las correlativas necesarias aprobadas aun'
			end
		end
		else
		begin 
			select 'no está inscrito a las correlativas necesarias, no se puede inscribir'
		end
	end 
GO
/****** Object:  StoredProcedure [dbo].[insertar_alumno]    Script Date: 17/06/2019 02:42:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[insertar_alumno]
	@matricula int,
	@apellido varchar(15),
	@nombre varchar(15),
	@direccion varchar(40),
	@telefono numeric(14,0),
	@cursoId int,
	@divisionId int
	as
	begin
		if @divisionId >= 1 and @divisionId <= 2 and @cursoId >= 1 and @cursoId <= 5 
		begin
			if (@cursoId = 4 or @cursoId = 5) set @divisionId = 1; --Evita colocar Division B al curso 4to y 5to
			insert into Alumno(matricula, apellido, nombre, direccion, telefono, cursoId4, divisionId3) values(@matricula, @apellido, @nombre, @direccion, @telefono, @cursoId, @divisionId)
			print 'Alumno registrado correctamente'
			return
		end
			print 'Codigo de division o curso inexistente'
	end
GO
/****** Object:  StoredProcedure [dbo].[insertar_aula]    Script Date: 17/06/2019 02:42:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertar_aula]
	@aulaId int,
	@capacidadmaxima tinyint,
	@tieneProyeccion char(5),
	@tieneConexion char(5),
	@cursoId int 
	as
	begin
		insert into Aula(aulaId, capacidadmax, tieneProyeccion, tieneConexion, cursoId1) values(@aulaId, @capacidadmaxima, @tieneProyeccion, @tieneConexion, @cursoId)
	end
GO
/****** Object:  StoredProcedure [dbo].[insertar_curso_division]    Script Date: 17/06/2019 02:42:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[insertar_curso_division]
	@curso int, 
	@division int
	as
	begin
		if( ((@curso >= 1 and @curso <= 3) and (@division = 1 or @division = 2)) or ((@curso = 4 or @curso = 5) and (@division != 2)) )
		begin
			insert into Curso_Division(cursoId3, divisionId1) values(@curso, @division)
			print 'Curso_Division Registrado!'
			return
		end
		print 'ERROR: Division incompatible con el curso'
	end
GO
/****** Object:  StoredProcedure [dbo].[modificar_alumno]    Script Date: 17/06/2019 02:42:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[modificar_alumno]
	@matriculaVieja int,
	@matriculaNueva int,
	@apellido varchar(15),
	@nombre varchar(15),
	@direccion varchar(40),
	@telefono numeric(14,0),
	@cursoId int,
	@divisionId int
	as
	begin 
		--if( (exists (select matricula from Alumno where matricula = @matriculaVieja)) and (@matriculaNueva != @matriculaVieja) and (not exists (select matricula from Alumno where matricula = @matriculaNueva)))
		if exists (select matricula from Alumno where matricula = @matriculaVieja)--el alumno a modificar existe?
		begin
			print 'el alumno existe'
			if (@matriculaNueva != @matriculaVieja) and (not exists (select matricula from Alumno where matricula = @matriculaNueva))--matricula nueva es distinta a la vieja (se modificará) y la matricula nueva no existe para otro registro...
			begin
				print 'se puede modificar'
				update Alumno
				set matricula = @matriculaNueva, apellido = @apellido, nombre = @nombre, direccion = @direccion, telefono = @telefono, cursoId4 = @cursoId, divisionId3 = dbo.comprobar_CursoDivision(@cursoId, @divisionId)
				where matricula = @matriculaVieja 
				print 'Alumno modificado'
			end
			else
			begin 
				print 'la matricula no se pretende modificar o ya existe registrada'
				update Alumno
				set apellido = @apellido, nombre = @nombre, direccion = @direccion, telefono = @telefono, cursoId4 = @cursoId, divisionId3 = dbo.comprobar_CursoDivision(@cursoId, @divisionId)
				where matricula = @matriculaVieja 
				print 'Alumno modificado'
			end
		end
		else print 'el alumno a modificar no existe'
	end
GO
/****** Object:  StoredProcedure [dbo].[modificar_aula]    Script Date: 17/06/2019 02:42:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[modificar_aula] 
	@aulaIdVieja int, @aulaIdNueva int,
	@capacidadMaxima tinyint,
	@tieneProyeccion varchar(5), @tieneConexion varchar(5)
	as
	begin
		update Aula 
		set aulaId = @aulaIdNueva, capacidadMax = @capacidadMaxima, tieneProyeccion = @tieneProyeccion, tieneConexion = @tieneConexion
		where aulaId = @aulaIdVieja
	end
GO
/****** Object:  StoredProcedure [dbo].[modificar_calificaciones]    Script Date: 17/06/2019 02:42:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[modificar_calificaciones] 
	@matricula int, @asignatura int,
	@parcial1 float(3), @parcial2 float(3), @parcial3 float(3),
	@recup1 float(3), @recup2 float(3)
	as
	begin
		if ( (@parcial1 >= 0 and @parcial1 <= 10) and
			(@parcial2 >= 0 and @parcial2 <= 10) and
			(@parcial3 >= 0 and @parcial3 <= 10) and
			(@recup1 >= 0 and @recup1 <= 10) and
			(@recup2 >= 0 and @recup2 <= 10) )
		begin
			update Calificaciones set parcial1 = @parcial1, parcial2 = @parcial2, parcial3 = @parcial3, recuperatorio1 = @recup1, recuperatorio2 = @recup2
			where matricula1 = @matricula and asignaturaId2 = @asignatura;
		end
		else
		begin
			select 'calificacion/es ingresada/s fuera de rango [0-10]'
		end
	end
GO
/****** Object:  StoredProcedure [dbo].[ver_asignaturas_profesor]    Script Date: 17/06/2019 02:42:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ver_asignaturas_profesor]
	@dni int
	as
	begin
		select asign.nombre [Asignatura] from Asignatura asign 
		where asign.dni1 = @dni;
	end
GO
/****** Object:  StoredProcedure [dbo].[ver_calificaciones]    Script Date: 17/06/2019 02:42:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ver_calificaciones]
	@matricula int
	as
	select profesor.apellido [Apellido Prof.], profesor.nombre[Nombre Prof.], asignatura.nombre [Asignatura], calif.parcial1 [1er Parcial], calif.parcial2 [2do Parcial], calif.parcial3 [3er Parcial], calif.recuperatorio1[1er Recuperatorio], calif.recuperatorio2 [2do Recuperatorio], calif.aprobado [Aprobado?]
	from Asignatura asignatura 
	inner join Calificaciones calif on asignatura.asignaturaId = calif.asignaturaId2
	inner join Alumno alu on alu.matricula = calif.matricula1 and alu.matricula = @matricula
	inner join Profesor profesor on asignatura.dni1 = profesor.dni;
GO
/****** Object:  StoredProcedure [dbo].[ver_correlatividades]    Script Date: 17/06/2019 02:42:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Modificación de procedimiento ver_correlatividades
CREATE procedure [dbo].[ver_correlatividades] 
	@asignaturaId int
	as
	begin
			--select top 1, limita el retorno a un solo registro 
		if( (select top 1 asignaturaCorrelatId4 from Correlativas where  asignaturaId3 = @asignaturaId) is null)
		begin
			print 'null'
			select 
				asignaturaId3, nombre 
			from 
				Correlativas, Asignatura 
			where 
				asignaturaId3 = @asignaturaId and asignaturaId3 = asignaturaId
			return
		end

		else
		begin
			select 
				correlat.asignaturaId3, 
				nombreAsign.nombre, 
				correlat.asignaturaCorrelatId4, 
				nombreAsignCorrelat.nombre 
			from 
				Correlativas correlat, 
				Asignatura nombreAsign, 
				Asignatura nombreAsignCorrelat
			where 
				correlat.asignaturaId3 = @asignaturaId and 
				nombreAsign.asignaturaId = correlat.asignaturaId3 and 
				nombreAsignCorrelat.asignaturaId = correlat.asignaturaCorrelatId4 
		end

	end
GO
/****** Object:  StoredProcedure [dbo].[ver_registro]    Script Date: 17/06/2019 02:42:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ver_registro] 
@tabla varchar(25) 
as
begin
	if @tabla = 'Alumno'
	begin
		select a.matricula, a.apellido, a.nombre, a.direccion, a.telefono, a.cursoId4, d.nombre from Alumno a inner join Division d
		on a.divisionId3 = d.divisionId and a.existe = 'true';
	end

	if @tabla = 'Asignatura'
	begin
	select * from Asignatura
	end

	if @tabla = 'Aula'
	begin
	select * from Aula
	end

	if @tabla = 'Calificaciones'
	begin
	select * from Calificaciones
	end

	if @tabla = 'Correlativas'
	begin
	select * from Correlativas order by asignaturaId3
	end

	if @tabla = 'Curso_Asignatura'
	begin
	select * from Curso_Asignatura order by cursoId2
	end

	if @tabla = 'Curso_Division'
	begin
	select * from Curso_Division
	end

	if @tabla = 'Division_Profesor'
	begin
	select * from Division_Profesor
	end

	if @tabla = 'Profesor'
	begin 
		select prof.dni [DNI], prof.apellido [Apellido], prof.nombre [Nombre], prof.direccion [Dirección], prof.telefono [TEL/CEL] from Profesor prof
	end

	if @tabla = 'Curso'
	begin
		select * from Curso
	end
	
	if @tabla = 'Division'
	begin
		select * from Division
	end
end

GO
USE [master]
GO
ALTER DATABASE [Universidad] SET  READ_WRITE 
GO
