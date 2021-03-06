USE [master]
GO
/****** Object:  Database [IncVirtual]    Script Date: 13/06/2022 03:08:21 JC ******/
CREATE DATABASE [IncVirtual]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IncVirtual', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\IncVirtual.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IncVirtual_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\IncVirtual_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [IncVirtual] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IncVirtual].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IncVirtual] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IncVirtual] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IncVirtual] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IncVirtual] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IncVirtual] SET ARITHABORT OFF 
GO
ALTER DATABASE [IncVirtual] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IncVirtual] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IncVirtual] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IncVirtual] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IncVirtual] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IncVirtual] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IncVirtual] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IncVirtual] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IncVirtual] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IncVirtual] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IncVirtual] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IncVirtual] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IncVirtual] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IncVirtual] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IncVirtual] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IncVirtual] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IncVirtual] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IncVirtual] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [IncVirtual] SET  MULTI_USER 
GO
ALTER DATABASE [IncVirtual] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IncVirtual] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IncVirtual] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IncVirtual] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IncVirtual] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IncVirtual] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [IncVirtual] SET QUERY_STORE = OFF
GO
USE [IncVirtual]
GO
/****** Object:  Table [dbo].[Aprendizaje]    Script Date: 13/06/2022 03:08:21 JC ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aprendizaje](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCurso] [int] NULL,
	[Descripcion] [nvarchar](200) NULL,
 CONSTRAINT [PK_Aprendizaje] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 13/06/2022 03:08:21 JC ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cesta]    Script Date: 13/06/2022 03:08:21 JC ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cesta](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUser] [int] NULL,
	[IdCurso] [int] NULL,
	[Pagado] [bit] NULL,
 CONSTRAINT [PK_CursoUsuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clases]    Script Date: 13/06/2022 03:08:21 JC ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdModulo] [int] NULL,
	[Nombre] [nvarchar](200) NULL,
	[Video] [nvarchar](500) NULL,
	[Descripcion] [nvarchar](2500) NULL,
 CONSTRAINT [PK_Clases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComentarioCurso]    Script Date: 13/06/2022 03:08:21 JC ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComentarioCurso](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCurso] [int] NULL,
	[IdUsuario] [int] NULL,
	[Comentario] [nvarchar](1000) NULL,
 CONSTRAINT [PK_ComentarioCurso] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curso]    Script Date: 13/06/2022 03:08:21 JC ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Imagen] [nvarchar](100) NULL,
	[Nombre] [nvarchar](50) NULL,
	[Detalle] [nvarchar](2500) NULL,
	[Descripcion] [nvarchar](2500) NULL,
	[Precio] [decimal](18, 2) NULL,
	[IdDocente] [int] NULL,
	[IdCategoria] [int] NULL,
	[Video] [nvarchar](250) NULL,
 CONSTRAINT [PK_Curso] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CursoUsuario]    Script Date: 13/06/2022 03:08:21 JC ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CursoUsuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUser] [int] NULL,
	[IdCurso] [int] NULL,
	[Estado] [bit] NULL,
	[Pagado] [bit] NULL,
 CONSTRAINT [PK_CursoUsuario_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modulo]    Script Date: 13/06/2022 03:08:21 JC ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modulo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCurso] [int] NULL,
	[Nombre] [nvarchar](200) NULL,
 CONSTRAINT [PK_Seccion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Progreso]    Script Date: 13/06/2022 03:08:21 JC ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Progreso](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUser] [int] NULL,
	[progress] [bit] NULL,
	[IdClase] [int] NULL,
	[IdCurso] [int] NULL,
 CONSTRAINT [PK_Progreso] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recursos]    Script Date: 13/06/2022 03:08:21 JC ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recursos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdClase] [int] NULL,
	[Archivo] [nvarchar](100) NULL,
 CONSTRAINT [PK_Recursos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Requisitos]    Script Date: 13/06/2022 03:08:21 JC ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requisitos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCurso] [int] NULL,
	[Requisito] [nvarchar](500) NULL,
 CONSTRAINT [PK_Requisitos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 13/06/2022 03:08:21 JC ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] NOT NULL,
	[Nombre] [nvarchar](50) NULL,
 CONSTRAINT [PK_DetalleCurso] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 13/06/2022 03:08:21 JC ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Imagen] [nvarchar](100) NULL,
	[Nombres] [nvarchar](50) NULL,
	[Apellidos] [nvarchar](50) NULL,
	[Celular] [nvarchar](12) NULL,
	[Correo] [nvarchar](50) NULL,
	[Username] [nvarchar](15) NULL,
	[Password] [nvarchar](100) NULL,
	[Recovery] [nvarchar](100) NULL,
	[IdRol] [int] NULL,
	[Twitter] [nvarchar](500) NULL,
	[Facebook] [nvarchar](500) NULL,
	[LinkedIn] [nvarchar](500) NULL,
	[YouTube] [nvarchar](500) NULL,
	[Instagram] [nvarchar](500) NULL,
	[Titulo] [nvarchar](75) NULL,
	[Biografia] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Aprendizaje] ON 

INSERT [dbo].[Aprendizaje] ([Id], [IdCurso], [Descripcion]) VALUES (1, 6, N'Angular CLI')
INSERT [dbo].[Aprendizaje] ([Id], [IdCurso], [Descripcion]) VALUES (2, 6, N'Firebase   ')
INSERT [dbo].[Aprendizaje] ([Id], [IdCurso], [Descripcion]) VALUES (3, 6, N'Firebase RESTful services')
INSERT [dbo].[Aprendizaje] ([Id], [IdCurso], [Descripcion]) VALUES (4, 6, N'CRUD')
INSERT [dbo].[Aprendizaje] ([Id], [IdCurso], [Descripcion]) VALUES (5, 6, N'Firebase Cloud Functions')
INSERT [dbo].[Aprendizaje] ([Id], [IdCurso], [Descripcion]) VALUES (6, 6, N'TypeScript   ')
INSERT [dbo].[Aprendizaje] ([Id], [IdCurso], [Descripcion]) VALUES (7, 7, N'Publica tus aplicaciones en Google Play')
INSERT [dbo].[Aprendizaje] ([Id], [IdCurso], [Descripcion]) VALUES (8, 5, N'Crear variables de tipo cadena, numérico y booleanos.')
INSERT [dbo].[Aprendizaje] ([Id], [IdCurso], [Descripcion]) VALUES (9, 5, N'Crear estructuras condicionales y ciclos como for, while o do... while')
INSERT [dbo].[Aprendizaje] ([Id], [IdCurso], [Descripcion]) VALUES (10, 5, N'Modificarar las cadenas y subcadenas, así como leerá los caracteres de una subcadena, así como crear funciones propias.')
INSERT [dbo].[Aprendizaje] ([Id], [IdCurso], [Descripcion]) VALUES (11, 5, N'Crear, poblar y recorrer objetos y arreglos, así como el manejo de fechas.')
INSERT [dbo].[Aprendizaje] ([Id], [IdCurso], [Descripcion]) VALUES (12, 5, N'Uso del HTML5 para crear páginas, crear formularios y utilizar los APIS con JavaScript.')
INSERT [dbo].[Aprendizaje] ([Id], [IdCurso], [Descripcion]) VALUES (13, 5, N'Manejo del CANVAS, desde dibujar hasta hacer una sencilla aplicación.')
INSERT [dbo].[Aprendizaje] ([Id], [IdCurso], [Descripcion]) VALUES (14, 5, N'Crear páginas web dinámicas con JavaScript, HTML5 y CSS3.')
INSERT [dbo].[Aprendizaje] ([Id], [IdCurso], [Descripcion]) VALUES (15, 11, N'Crear variables de tipo cadena, numérico y booleanos.')
INSERT [dbo].[Aprendizaje] ([Id], [IdCurso], [Descripcion]) VALUES (16, 5, N'APIs Rest, conecta tus aplicaciones con el servidor')
INSERT [dbo].[Aprendizaje] ([Id], [IdCurso], [Descripcion]) VALUES (17, 14, N'Conocimientos básicos en computación')
INSERT [dbo].[Aprendizaje] ([Id], [IdCurso], [Descripcion]) VALUES (18, 14, N'Estructura completa de HTML ')
INSERT [dbo].[Aprendizaje] ([Id], [IdCurso], [Descripcion]) VALUES (19, 27, N'ddawdwadaw')
SET IDENTITY_INSERT [dbo].[Aprendizaje] OFF
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([Id], [Nombre]) VALUES (1, N'Desarrollo Web')
INSERT [dbo].[Categoria] ([Id], [Nombre]) VALUES (4, N'Desarrollo Movil')
INSERT [dbo].[Categoria] ([Id], [Nombre]) VALUES (7, N'Desarrollo de Videojuegos')
INSERT [dbo].[Categoria] ([Id], [Nombre]) VALUES (8, N'Lenguajes de Programación')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Cesta] ON 

INSERT [dbo].[Cesta] ([Id], [IdUser], [IdCurso], [Pagado]) VALUES (73, 4, 5, 1)
INSERT [dbo].[Cesta] ([Id], [IdUser], [IdCurso], [Pagado]) VALUES (74, 1, 5, 1)
INSERT [dbo].[Cesta] ([Id], [IdUser], [IdCurso], [Pagado]) VALUES (75, 1017, 5, 1)
INSERT [dbo].[Cesta] ([Id], [IdUser], [IdCurso], [Pagado]) VALUES (76, 4, 14, 1)
INSERT [dbo].[Cesta] ([Id], [IdUser], [IdCurso], [Pagado]) VALUES (77, 1, 8, 1)
INSERT [dbo].[Cesta] ([Id], [IdUser], [IdCurso], [Pagado]) VALUES (78, 3, 7, 1)
INSERT [dbo].[Cesta] ([Id], [IdUser], [IdCurso], [Pagado]) VALUES (80, 1011, 5, 1)
INSERT [dbo].[Cesta] ([Id], [IdUser], [IdCurso], [Pagado]) VALUES (81, 1011, 7, 1)
INSERT [dbo].[Cesta] ([Id], [IdUser], [IdCurso], [Pagado]) VALUES (82, 1011, 8, 1)
INSERT [dbo].[Cesta] ([Id], [IdUser], [IdCurso], [Pagado]) VALUES (83, 1011, 14, 1)
INSERT [dbo].[Cesta] ([Id], [IdUser], [IdCurso], [Pagado]) VALUES (84, 1011, 13, 1)
INSERT [dbo].[Cesta] ([Id], [IdUser], [IdCurso], [Pagado]) VALUES (86, 1010, 5, 1)
INSERT [dbo].[Cesta] ([Id], [IdUser], [IdCurso], [Pagado]) VALUES (87, 1010, 7, 1)
INSERT [dbo].[Cesta] ([Id], [IdUser], [IdCurso], [Pagado]) VALUES (88, 1010, 11, 1)
INSERT [dbo].[Cesta] ([Id], [IdUser], [IdCurso], [Pagado]) VALUES (89, 4, 18, 1)
INSERT [dbo].[Cesta] ([Id], [IdUser], [IdCurso], [Pagado]) VALUES (90, 4, 19, 1)
INSERT [dbo].[Cesta] ([Id], [IdUser], [IdCurso], [Pagado]) VALUES (91, 4, 20, 1)
INSERT [dbo].[Cesta] ([Id], [IdUser], [IdCurso], [Pagado]) VALUES (92, 4, 21, 1)
INSERT [dbo].[Cesta] ([Id], [IdUser], [IdCurso], [Pagado]) VALUES (93, 3, 5, 1)
INSERT [dbo].[Cesta] ([Id], [IdUser], [IdCurso], [Pagado]) VALUES (94, 4, 22, 1)
INSERT [dbo].[Cesta] ([Id], [IdUser], [IdCurso], [Pagado]) VALUES (95, 4, 23, 1)
INSERT [dbo].[Cesta] ([Id], [IdUser], [IdCurso], [Pagado]) VALUES (96, 2, 24, 1)
INSERT [dbo].[Cesta] ([Id], [IdUser], [IdCurso], [Pagado]) VALUES (97, 2, 25, 1)
INSERT [dbo].[Cesta] ([Id], [IdUser], [IdCurso], [Pagado]) VALUES (98, 2, 26, 1)
INSERT [dbo].[Cesta] ([Id], [IdUser], [IdCurso], [Pagado]) VALUES (99, 4, 27, 1)
INSERT [dbo].[Cesta] ([Id], [IdUser], [IdCurso], [Pagado]) VALUES (100, 4, 28, 1)
INSERT [dbo].[Cesta] ([Id], [IdUser], [IdCurso], [Pagado]) VALUES (101, 4, 29, 1)
INSERT [dbo].[Cesta] ([Id], [IdUser], [IdCurso], [Pagado]) VALUES (102, 1011, 11, 1)
SET IDENTITY_INSERT [dbo].[Cesta] OFF
GO
SET IDENTITY_INSERT [dbo].[Clases] ON 

INSERT [dbo].[Clases] ([Id], [IdModulo], [Nombre], [Video], [Descripcion]) VALUES (1, 1, N'Ejemplo2', N'/video/1.mp4', N'La clase trata de estop')
INSERT [dbo].[Clases] ([Id], [IdModulo], [Nombre], [Video], [Descripcion]) VALUES (2, 2, N'Temas previos', N'/video/1.mp4', N'Veremos los temas que se tratarán a lo largo del curso')
INSERT [dbo].[Clases] ([Id], [IdModulo], [Nombre], [Video], [Descripcion]) VALUES (3, 3, N'Comentarios', N'https://www.youtube.com/embed/1B1U6zQXJTM', N'Veremos los temas que se tratarán a lo largo del curso, comentarios')
INSERT [dbo].[Clases] ([Id], [IdModulo], [Nombre], [Video], [Descripcion]) VALUES (1002, 1002, N'Historia de Internet', N'https://www.youtube.com/embed/ivdTnPl1ND0', N'El código de programa de JavaScript, llamado script, se introduce directamente en el documento HTML y no necesita ser compilado. El navegador se encarga de traducir dicho código. JavaScript fue creado por Brendan Eich en 1995 para Netscape bajo el nombre de “Mocha”.')
INSERT [dbo].[Clases] ([Id], [IdModulo], [Nombre], [Video], [Descripcion]) VALUES (1003, 1002, N'JavaScript en un archivo js', N'https://www.youtube.com/embed/C5FXZ2ki13k', N'Las páginas de internet modernas deben estar divididas por archivo: el archivo html guardará los contenidos, el archivo CSS los estilos y formato, y toda la lógica de programación deberá estar almacenada en archivos con extensión js. Así, si desea modificar la lógica, no afectará a las otras dos, y visceversa.')
INSERT [dbo].[Clases] ([Id], [IdModulo], [Nombre], [Video], [Descripcion]) VALUES (1004, 1004, N'Introducción a las variables en JavaScript', N'https://www.youtube.com/embed/tmRa0_EvMoc', N'JavaScript admite prácticamente cualquier tipo de nombre para definir una variable, no obstante, hay una serie de consideraciones que se deben tener presentes:  El primer      carácter debe ser siempr una letra o el guión de subrayado ( _ ).  Los restantes caracteres pueden ser      letras, números o el guión de subrayado, teniendo como precaución no dejar      espacios entre ellos.  El nombre de la variable no debe coincidir las palabras reservadas de JavaScript.  JavaScript diferencia entre mayúsculas y minúsculas.')
INSERT [dbo].[Clases] ([Id], [IdModulo], [Nombre], [Video], [Descripcion]) VALUES (1005, 1004, N'Tipos de datos en JavaScript', N'https://www.youtube.com/embed/RqQ1d1qEWlE', N'JavaScript puede manejar tres tipos de datos distintos decidiendo por nosotros el tipo de variable que deberá emplear durante la ejecución del script.')
INSERT [dbo].[Clases] ([Id], [IdModulo], [Nombre], [Video], [Descripcion]) VALUES (1006, 1005, N'Sentencias Condicionales', N'https://www.youtube.com/embed/54Oi-HaMZ7E', N'En determinados momentos es necesario controlar el desarrollo del programa para que éste tome decisiones por nosotros.  JavaScript dispone de los siguientes comandos:  if, for, while, do while')
INSERT [dbo].[Clases] ([Id], [IdModulo], [Nombre], [Video], [Descripcion]) VALUES (1007, 1006, N'El ciclo while', N'https://www.youtube.com/embed/54Oi-HaMZ7E', N'La instrucción while ejecuta de manera constante una determinada secuencia de código siempre que se cumpla una condición.  Este tipo de bucles puede generar secuencias infinitas, por lo que se debe tener cuidado cuando se definen los bucles.')
INSERT [dbo].[Clases] ([Id], [IdModulo], [Nombre], [Video], [Descripcion]) VALUES (1008, 1007, N'Funciones de JavaScript', N'https://www.youtube.com/embed/tmRa0_EvMoc', N'Las funciones son uno de los pilares en los que se basa JavaScript.  Una función es un conjunto de sentencias JavaScript que realizan alguna tarea específica.  Las partes que definen una función son:  El nombre de la función.  La lista de argumentos de la función, encerrados entre paréntesis y separados por      comas(“,”)  Las sentencias en JavaScript que definen la función, encerradas entre llaves({,});')
INSERT [dbo].[Clases] ([Id], [IdModulo], [Nombre], [Video], [Descripcion]) VALUES (1009, 1008, N'Concatenación de cadenas y conversión de datos', N'https://www.youtube.com/embed/RqQ1d1qEWlE', N'El proceso de “juntar” cadenas la conoceremos como “concatenación”. En JavaScript, para juntar subcadenas en una cadena la realizaremos con el operado más (+). En HTML todos los campos son una cadena.  Realmente no hay valores numéricos, ni fechas, solo cadenas.')
INSERT [dbo].[Clases] ([Id], [IdModulo], [Nombre], [Video], [Descripcion]) VALUES (1010, 1009, N'Introducción a la sesión', N'https://www.youtube.com/embed/1B1U6zQXJTM', NULL)
INSERT [dbo].[Clases] ([Id], [IdModulo], [Nombre], [Video], [Descripcion]) VALUES (1011, 1009, N'Demostración de TypeScript', N'https://www.youtube.com/embed/1B1U6zQXJTM', N'Un código ilustrativo de las bondades del TypeScript')
INSERT [dbo].[Clases] ([Id], [IdModulo], [Nombre], [Video], [Descripcion]) VALUES (1012, 1009, N'Configuración de TypeScript', N'https://www.youtube.com/embed/1B1U6zQXJTM', N'Inicializando el proyecto de TypeScript')
INSERT [dbo].[Clases] ([Id], [IdModulo], [Nombre], [Video], [Descripcion]) VALUES (1013, 1010, N'Introducción a la sesión', N'https://www.youtube.com/embed/1B1U6zQXJTM', NULL)
INSERT [dbo].[Clases] ([Id], [IdModulo], [Nombre], [Video], [Descripcion]) VALUES (1014, 1011, N'Introducción a la sesión', N'https://www.youtube.com/embed/1B1U6zQXJTM', NULL)
INSERT [dbo].[Clases] ([Id], [IdModulo], [Nombre], [Video], [Descripcion]) VALUES (1015, 1012, N'Pipe: Slice', N'https://www.youtube.com/embed/1B1U6zQXJTM', N'Un pipe que sirve para cortar elementos, arreglos o strings.')
INSERT [dbo].[Clases] ([Id], [IdModulo], [Nombre], [Video], [Descripcion]) VALUES (1016, 1013, N'Introducción a la sesión', N'https://www.youtube.com/embed/RqQ1d1qEWlE', N'JavaScript admite prácticamente cualquier tipo de nombre para definir una variable, no obstante, hay una serie de consideraciones que se deben tener presentes:  El primer      carácter debe ser siempr una letra o el guión de subrayado ( _ ).  Los restantes caracteres pueden ser      letras, números o el guión de subrayado, teniendo como precaución no dejar      espacios entre ellos.  El nombre de la variable no debe coincidir las palabras reservadas de JavaScript.  JavaScript diferencia entre mayúsculas y minúsculas.')
INSERT [dbo].[Clases] ([Id], [IdModulo], [Nombre], [Video], [Descripcion]) VALUES (1017, 1014, N'Tipos de datos en c#', N'/video/1.mp4', N'Veremos los temas que se tratarán a lo largo del curso, comentarios')
INSERT [dbo].[Clases] ([Id], [IdModulo], [Nombre], [Video], [Descripcion]) VALUES (1018, 1014, N'Temas previos', N'https://youtu.be/vdX4U6A1RZ8', N'El código de programa de JavaScript, llamado script, se introduce directamente en el documento HTML y no necesita ser compilado. El navegador se encarga de traducir dicho código. JavaScript fue creado por Brendan Eich en 1995 para Netscape bajo el nombre de “Mocha”.')
INSERT [dbo].[Clases] ([Id], [IdModulo], [Nombre], [Video], [Descripcion]) VALUES (1019, 1015, N'Tipos de datos en JavaScript', N'https://youtu.be/6W2wYwHQNT4', NULL)
INSERT [dbo].[Clases] ([Id], [IdModulo], [Nombre], [Video], [Descripcion]) VALUES (1020, 1016, N'Curso HTML 5. Presentación. Vídeo 1', N'https://www.youtube.com/embed/QC9_8nRNNHA', N'Comenzamos un nuevo curso de HTML5. En este vídeo de presentación vemos los contenidos que se impartirán durante el curso.')
INSERT [dbo].[Clases] ([Id], [IdModulo], [Nombre], [Video], [Descripcion]) VALUES (1021, 1016, N'Curso HTML 5. Conceptos básicos. Vídeo 2', N'https://www.youtube.com/embed/CdfMG_Qy00E', N'Comenzamos a ver algunos de los conceptos básicos de HTML 5. En qué consiste exactamente esta tecnología o estándar. Creamos ya nuestra primera página web en HTML 5.')
INSERT [dbo].[Clases] ([Id], [IdModulo], [Nombre], [Video], [Descripcion]) VALUES (1022, 1017, N'Curso Django. Creación primer proyecto', N'https://www.youtube.com/embed/2DbWqyBR4Oo', N'Vemos cómo crear un proyecto con Django. Se menciona en el vídeo también los diferentes tipos de instalación que podemos hacer con Django (local y virtualización).')
INSERT [dbo].[Clases] ([Id], [IdModulo], [Nombre], [Video], [Descripcion]) VALUES (1023, 1018, N'Fundamentos en el manejo de arreglos', N'https://www.youtube.com/embed/eidffYi0kUk', N'Una técnica importante de programación es el uso de los “arrays”, arreglos o vectores. Un arreglo es un conjunto de datos de un mismo tipo identificados por un índice.')
INSERT [dbo].[Clases] ([Id], [IdModulo], [Nombre], [Video], [Descripcion]) VALUES (1024, 1019, N'Esqueleto HTML: Etiquetas', N'https://www.youtube.com/embed/2DbWqyBR4Oo', N'Vemos cómo crear la estructura de HTML. ')
INSERT [dbo].[Clases] ([Id], [IdModulo], [Nombre], [Video], [Descripcion]) VALUES (1025, 1019, N'Esqueleto HTML: Etiquetas complejas', N'https://www.youtube.com/embed/2DbWqyBR4Oo', N'Vemos cómo crear la estructura de HTML compleja y de manera fácil.')
INSERT [dbo].[Clases] ([Id], [IdModulo], [Nombre], [Video], [Descripcion]) VALUES (1026, 1020, N'JavaScript. Conceptos. Vídeo 6', N'https://www.youtube.com/embed/2DbWqyBR4Oo', N'Vemos cómo crear la estructura de Java compleja y de manera fácil.')
INSERT [dbo].[Clases] ([Id], [IdModulo], [Nombre], [Video], [Descripcion]) VALUES (1027, 1020, N'JavaScript. Conceptos complejos. Vídeo 7', N'https://www.youtube.com/embed/eidffYi0kUk', N'Vemos cómo crear la estructura de Java compleja y de manera fácil.')
INSERT [dbo].[Clases] ([Id], [IdModulo], [Nombre], [Video], [Descripcion]) VALUES (1028, 1018, N'Fundamentos complejos en el manejo de arreglos', N'https://www.youtube.com/embed/QC9_8nRNNHA', N'Comenzamos a ver algunos de los conceptos básicos de HTML 5. En qué consiste exactamente esta tecnología o estándar. Creamos ya nuestra primera página web en HTML 5.')
INSERT [dbo].[Clases] ([Id], [IdModulo], [Nombre], [Video], [Descripcion]) VALUES (1029, 1021, N'Hoy sabes que nada sabes', N'https://www.youtube.com/embed/QC9_8nRNNHA', N'Vemos cómo explicar la manera de Java, y los usos que se puede hacer de este.')
INSERT [dbo].[Clases] ([Id], [IdModulo], [Nombre], [Video], [Descripcion]) VALUES (1030, 1021, N'Porque usar Java', N'https://www.youtube.com/embed/QC9_8nRNNHA', N'El uso de Java es algo muy importante para ahorra tiempo')
INSERT [dbo].[Clases] ([Id], [IdModulo], [Nombre], [Video], [Descripcion]) VALUES (1031, 1002, N'Porque usar JavaScript forever', N'https://www.youtube.com/embed/2DbWqyBR4Oo', N'Una técnica importante de programación es el uso de los “arrays”, arreglos o vectores. Un arreglo es un conjunto de datos de un mismo tipo identificados por un índice.')
SET IDENTITY_INSERT [dbo].[Clases] OFF
GO
SET IDENTITY_INSERT [dbo].[ComentarioCurso] ON 

INSERT [dbo].[ComentarioCurso] ([Id], [IdCurso], [IdUsuario], [Comentario]) VALUES (1, 1, 3, N'El mejor curso de programación web que he llevado. ¡Les recomiendo!')
INSERT [dbo].[ComentarioCurso] ([Id], [IdCurso], [IdUsuario], [Comentario]) VALUES (5, 6, 3, N'Todo muy bien explicado. Estaría bien meterle más caña a C# y actualizar el capitulo de iluminación.')
INSERT [dbo].[ComentarioCurso] ([Id], [IdCurso], [IdUsuario], [Comentario]) VALUES (7, 7, 5, N'Las clases son interactivas, el docente explica bien el curso y el material de apoyo es excelente. ¡Recomendado!')
INSERT [dbo].[ComentarioCurso] ([Id], [IdCurso], [IdUsuario], [Comentario]) VALUES (1005, 6, 1006, N'En general muy buen curso, cubre la base de las herramientas.')
INSERT [dbo].[ComentarioCurso] ([Id], [IdCurso], [IdUsuario], [Comentario]) VALUES (1006, 8, 1006, N'Las clases son interactivas, el docente explica bien el curso y el material de apoyo es excelente. ¡Recomendado!')
INSERT [dbo].[ComentarioCurso] ([Id], [IdCurso], [IdUsuario], [Comentario]) VALUES (1007, 6, 1008, N'Un curso muy completo, falta actualizar las ultimas lecciones a la version mas reciente, pero un muy buen curso.')
INSERT [dbo].[ComentarioCurso] ([Id], [IdCurso], [IdUsuario], [Comentario]) VALUES (1009, 7, 1011, N'Las Mejores que he podido llevar de un curso en la modalidad Virual. ¡Excelente!')
INSERT [dbo].[ComentarioCurso] ([Id], [IdCurso], [IdUsuario], [Comentario]) VALUES (1011, 7, 1010, N'Muy bueno, completo y bien explicado. También el tiempo de respuesta del instructor es muy rápido y ayuda a seguir el curso con facilidad cuando uno se traba.')
INSERT [dbo].[ComentarioCurso] ([Id], [IdCurso], [IdUsuario], [Comentario]) VALUES (1012, 11, 1010, N'Las clases únicas, lo que he podido llevar de un curso en la modalidad Virual. ¡Excelente! Buena metodología de enseñanza.')
SET IDENTITY_INSERT [dbo].[ComentarioCurso] OFF
GO
SET IDENTITY_INSERT [dbo].[Curso] ON 

INSERT [dbo].[Curso] ([Id], [Imagen], [Nombre], [Detalle], [Descripcion], [Precio], [IdDocente], [IdCategoria], [Video]) VALUES (5, N'/FilesBD/js2.jpg', N'JavaScript', N'Las principales empresas ofrecen este curso a sus empleados.Este curso fue seleccionado para nuestra colección de cursos mejor calificados en los que confían empresas de todo el mundo.', N'Aprende el lenguaje más popular! JavaScript!

El curso incluye la Sintaxis de ECMAScript ES6, ES7, ES8, ES9, ES10, ES11 y ES12

También el curso incluye Node.js, Express, Mongodb, React  y mucho más!

En este curso aprenderás JavaScript desde los fundamentos hasta temas más avanzados como Prototypes, Delegation, Classes, Ajax, Promises, Generadores, Orientado a Objetos, Fetch API, Async Await, Async JS, Objetos, así como consumir REST APIs, API''s de JavaScript nátivas como Notification API, Speech API y mucho más!', CAST(0.00 AS Decimal(18, 2)), 4, 1, N'/video/1.mp4')
INSERT [dbo].[Curso] ([Id], [Imagen], [Nombre], [Detalle], [Descripcion], [Precio], [IdDocente], [IdCategoria], [Video]) VALUES (7, N'/FilesBD/course-1.jpg', N'Desarrollo en Android', N'Las principales empresas ofrecen este curso a sus empleados.
Este curso fue seleccionado para nuestra colección de cursos mejor calificados en los que confían empresas de todo el mundo.', N'Crearás desde las aplicaciones más básicas hasta las más sofisticadas multipantalla, con utilización de sensores, gestión de datos y conexión a Internet...y ahora también enseñamos cómo funciona el Internet de las Cosas y conectamos con la tarjeta Arduino/Genuino 101 haciendo uso de la última tecnología Bluetooth Low Energy.', CAST(0.00 AS Decimal(18, 2)), 7, 4, N'/video/1.mp4')
INSERT [dbo].[Curso] ([Id], [Imagen], [Nombre], [Detalle], [Descripcion], [Precio], [IdDocente], [IdCategoria], [Video]) VALUES (8, N'/FilesBD/course-3.jpg', N'Unity', N'Edición de vídeos', N'Edición de vídeos y material didáctico', CAST(75.00 AS Decimal(18, 2)), 7, 7, N'/video/1.mp4')
INSERT [dbo].[Curso] ([Id], [Imagen], [Nombre], [Detalle], [Descripcion], [Precio], [IdDocente], [IdCategoria], [Video]) VALUES (11, N'/FilesBD/course-1.jpg', N'C#', N'Las principales empresas ofrecen este curso a sus empleados. Este curso fue seleccionado para nuestra colección de cursos mejor calificados en los que confían empresas de todo el mundo.', N'Las principales empresas ofrecen este curso a sus empleados. Este curso fue seleccionado para nuestra colección de cursos mejor calificados en los que confían empresas de todo el mundo.Las principales empresas ofrecen este curso a sus empleados. Este curso fue seleccionado para nuestra colección de cursos mejor calificados en los que confían empresas de todo el mundo.Las principales empresas ofrecen este curso a sus empleados. Este curso fue seleccionado para nuestra colección de cursos mejor calificados en los que confían empresas de todo el mundo.Las principales empresas ofrecen este curso a sus empleados. Este curso fue seleccionado para nuestra colección de cursos mejor calificados en los que confían empresas de todo el mundo.Las principales empresas ofrecen este curso a sus empleados. Este curso fue seleccionado para nuestra colección de cursos mejor calificados en los que confían empresas de todo el mundo.Las principales empresas ofrecen este curso a sus empleados. Este curso fue seleccionado para nuestra colección de cursos mejor calificados en los que confían empresas de todo el mundo.Las principales empresas ofrecen este curso a sus empleados. Este curso fue seleccionado para nuestra colección de cursos mejor calificados en los que confían empresas de todo el mundo.Las principales empresas ofrecen este curso a sus empleados. Este curso fue seleccionado para nuestra colección de cursos mejor calificados en los que confían empresas de todo el mundo.Las principales empresas ofrecen este curso a sus empleados. Este curso fue seleccionado para nuestra colección de cursos mejor calificados en los que confían empresas de todo el mundo.', CAST(0.00 AS Decimal(18, 2)), 4, 1, N'https://youtu.be/c79C_S0E4IQ')
INSERT [dbo].[Curso] ([Id], [Imagen], [Nombre], [Detalle], [Descripcion], [Precio], [IdDocente], [IdCategoria], [Video]) VALUES (13, N'/FilesBD/cat-3.jpg', N'Git', N'Git es un sistema de control de versiones distribuido , mediante el cual podemos trabajar a nivel local sin tener que comprometer el repositorio principal a cada cambio que realicemos', N'Este curso te llevará de la mano partiendo desde cero hasta tener más de lo que necesitas para trabajar con Git, adicionalmente aprenderás a utilizar GitHub como un repositorio remoto, incluyendo formas de trabajar en equipo, flujos de trabajo, tokens, Pull Request y otros temas avanzados que serán de mucha utilidad en tu vida profesional.

En los inicios del curso empezaremos desde lo más básico haciendo ejercicios prácticos. Durante el transcurso del curso, trabajaras de forma colectiva, real y aplicando los conocimientos con más de 14 ejercicios y ejemplos.', CAST(0.00 AS Decimal(18, 2)), 2, 1, N'https://www.youtube.com/embed/ANF1X42_ae4')
INSERT [dbo].[Curso] ([Id], [Imagen], [Nombre], [Detalle], [Descripcion], [Precio], [IdDocente], [IdCategoria], [Video]) VALUES (14, N'/FilesBD/lenguaje-html5.jpg', N'HTML 5', N'Bienvenido al Curso de HTML5 completo y desde cero, en el que aprenderemos todo lo necesario para dominar HTML5, crear tus primeras páginas web e iniciarte en el maravilloso mundo del desarrollo web.', N'Bienvenido al Curso de HTML5 completo y desde cero, en el que aprenderemos todo lo necesario para dominar HTML5, crear tus primeras páginas web e iniciarte en el maravilloso mundo del desarrollo web.Bienvenido al Curso de HTML5 completo y desde cero, en el que aprenderemos todo lo necesario para dominar HTML5, crear tus primeras páginas web e iniciarte en el maravilloso mundo del desarrollo ', CAST(80.00 AS Decimal(18, 2)), 4, 1, N'https://www.youtube.com/embed/QC9_8nRNNHA')
INSERT [dbo].[Curso] ([Id], [Imagen], [Nombre], [Detalle], [Descripcion], [Precio], [IdDocente], [IdCategoria], [Video]) VALUES (16, N'/FilesBD/Django-1024x576 (1).jpg', N'Django', N'El curso parte desde un nivel muy básico, sin duda si eres programador te será muy sencillo comprender los conceptos, pero también si no lo eres; ya que en cada clase intentó explicar los conceptos siempre pensando en que el curso no solo lo cursarán programadores. ', N'A medida que avances cada sección del curso ni siquiera te darás cuenta en qué momento es que pasas a un nivel avanzado, ya que se diseñó el curso de una forma sencilla y práctica, para cuando hayas completado el curso o tan solo la primera mitad del curso verás que ya puedes desarrollar aplicaciones web de buen nivel por tu cuenta.

Otra tema que deseo recalcar en esta presentación es que, cada nuevo tema no está vinculadas al desarrollo de un proyecto, es decir no será necesario que hayas completado todo un proyecto para poder probar un nuevo concepto, ya que trato de explicar cada nuevo concepto de forma independiente, si ya tenías una bases en django, puedes ir directamente a un nuevo tema y comprenderlo con facilidad, ya que no está sujeta a como se haya estado desarrollado un proyecto; esto no quiere decir que no se hará proyectos en el curso.', CAST(0.00 AS Decimal(18, 2)), 6, 1, N'https://www.youtube.com/embed/7XO1AzwkPPE')
INSERT [dbo].[Curso] ([Id], [Imagen], [Nombre], [Detalle], [Descripcion], [Precio], [IdDocente], [IdCategoria], [Video]) VALUES (17, N'/FilesBD/Django-1024x576 (1).jpg', N'a', N'c', N'c', CAST(1.00 AS Decimal(18, 2)), 2, 1, N'https://www.youtube.com/embed/7XO1AzwkPPE')
INSERT [dbo].[Curso] ([Id], [Imagen], [Nombre], [Detalle], [Descripcion], [Precio], [IdDocente], [IdCategoria], [Video]) VALUES (18, N'/FilesBD/about.jpg', N'Date:   Thu May 5 ', N'hola munod', N'Date:   Thu May 5 12:16:29 2022 -0500

    Agregar .gitignore y .gitattributes.
 ESCOC
8adc369
l.com>




e46dea5
l.com>




46ab8d0
l.com>




88c0a39
l.com>



 ESCOC


	', CAST(0.00 AS Decimal(18, 2)), 4, 7, N'https://www.youtube.com/embed/7XO1AzwkPPE')
INSERT [dbo].[Curso] ([Id], [Imagen], [Nombre], [Detalle], [Descripcion], [Precio], [IdDocente], [IdCategoria], [Video]) VALUES (19, N'/FilesBD/about4.jpg', N'prueba 111', N'prueba 111', N'prueba 111prueba 111prueba 111prueba 111', CAST(0.00 AS Decimal(18, 2)), 4, 1, N'https://www.youtube.com/embed/6EBNIgkrU74')
INSERT [dbo].[Curso] ([Id], [Imagen], [Nombre], [Detalle], [Descripcion], [Precio], [IdDocente], [IdCategoria], [Video]) VALUES (20, N'/FilesBD/about5.jpg', N'jajaja', N'jajajaj', N'	jajajaja', CAST(0.00 AS Decimal(18, 2)), 4, 1, N'https://www.youtube.com/embed/7XO1AzwkPPE')
INSERT [dbo].[Curso] ([Id], [Imagen], [Nombre], [Detalle], [Descripcion], [Precio], [IdDocente], [IdCategoria], [Video]) VALUES (21, N'/FilesBD/car4.jpg', N'prueba 2222', N'prueba 2222', N'prueba 2222prueba 2222prueba 2222prueba 2222prueba 2222', CAST(0.00 AS Decimal(18, 2)), 4, 4, N'https://www.youtube.com/embed/7XO1AzwkPPE')
INSERT [dbo].[Curso] ([Id], [Imagen], [Nombre], [Detalle], [Descripcion], [Precio], [IdDocente], [IdCategoria], [Video]) VALUES (22, N'/FilesBD/about2.jpg', N'prueba 333333', N'prueba 333333', N'prueba 333333prueba 333333prueba 333333prueba 333333prueba 333333prueba 333333prueba 333333', CAST(444.00 AS Decimal(18, 2)), 4, 7, N'https://www.youtube.com/embed/6EBNIgkrU74')
INSERT [dbo].[Curso] ([Id], [Imagen], [Nombre], [Detalle], [Descripcion], [Precio], [IdDocente], [IdCategoria], [Video]) VALUES (23, N'/FilesBD/car1-min.jpg', N'prueba 4', N'prueba 4', N'prueba 4prueba 4prueba 4prueba 4prueba 4', CAST(4.00 AS Decimal(18, 2)), 4, 7, N'https://www.youtube.com/embed/7XO1AzwkPPE')
INSERT [dbo].[Curso] ([Id], [Imagen], [Nombre], [Detalle], [Descripcion], [Precio], [IdDocente], [IdCategoria], [Video]) VALUES (24, N'/FilesBD/IncVirtual.png', N'prueba 555555', N'prueba 555555', N'prueba 555555prueba 555555prueba 555555prueba 555555prueba 555555prueba 555555prueba 555555', CAST(0.00 AS Decimal(18, 2)), 2, 1, N'https://www.youtube.com/embed/6EBNIgkrU74')
INSERT [dbo].[Curso] ([Id], [Imagen], [Nombre], [Detalle], [Descripcion], [Precio], [IdDocente], [IdCategoria], [Video]) VALUES (25, N'/FilesBD/about.jpg', N'prueba 666', N'prueba 666', N'prueba 666prueba 666prueba 666prueba 666prueba 666prueba 666prueba 666prueba 666', CAST(0.00 AS Decimal(18, 2)), 2, 8, N'https://www.youtube.com/embed/7XO1AzwkPPE')
INSERT [dbo].[Curso] ([Id], [Imagen], [Nombre], [Detalle], [Descripcion], [Precio], [IdDocente], [IdCategoria], [Video]) VALUES (26, N'/FilesBD/about2.jpg', N'prueba 777', N'prueba 777', N'prueba 777prueba 777prueba 777prueba 777prueba 777', CAST(0.00 AS Decimal(18, 2)), 2, 8, N'https://www.youtube.com/embed/7XO1AzwkPPE')
INSERT [dbo].[Curso] ([Id], [Imagen], [Nombre], [Detalle], [Descripcion], [Precio], [IdDocente], [IdCategoria], [Video]) VALUES (27, N'/FilesBD/cat-4.jpg', N'prueba 8888', N'prueba 8888', N'prueba 8888prueba 8888prueba 8888prueba 8888prueba 8888prueba 8888', CAST(0.00 AS Decimal(18, 2)), 4, 8, N'https://www.youtube.com/embed/7XO1AzwkPPE')
INSERT [dbo].[Curso] ([Id], [Imagen], [Nombre], [Detalle], [Descripcion], [Precio], [IdDocente], [IdCategoria], [Video]) VALUES (28, N'/FilesBD/course-2.jpg', N'prueba 99999999999999', N'prueba 99999999999999', N'prueba 99999999999999prueba 99999999999999prueba 99999999999999prueba 99999999999999prueba 99999999999999', CAST(5.00 AS Decimal(18, 2)), 4, 8, N'https://www.youtube.com/embed/6EBNIgkrU74')
INSERT [dbo].[Curso] ([Id], [Imagen], [Nombre], [Detalle], [Descripcion], [Precio], [IdDocente], [IdCategoria], [Video]) VALUES (29, N'/FilesBD/IncVirtual.png', N'agregar curso', N'agregar curso', N'agregar cursoagregar cursoagregar cursoagregar cursoagregar cursoagregar cursoagregar cursoagregar cursoagregar cursoagregar cursoagregar cursoagregar cursoagregar cursoagregar cursoagregar curso', CAST(0.00 AS Decimal(18, 2)), 4, 4, N'https://www.youtube.com/embed/7XO1AzwkPPE')
SET IDENTITY_INSERT [dbo].[Curso] OFF
GO
SET IDENTITY_INSERT [dbo].[Modulo] ON 

INSERT [dbo].[Modulo] ([Id], [IdCurso], [Nombre]) VALUES (1, 7, N'Ejemplo')
INSERT [dbo].[Modulo] ([Id], [IdCurso], [Nombre]) VALUES (2, 6, N'Introducción')
INSERT [dbo].[Modulo] ([Id], [IdCurso], [Nombre]) VALUES (3, 6, N'Elementos básicos')
INSERT [dbo].[Modulo] ([Id], [IdCurso], [Nombre]) VALUES (1002, 5, N'JavaScript: Sintaxis del lenguaje')
INSERT [dbo].[Modulo] ([Id], [IdCurso], [Nombre]) VALUES (1004, 5, N'JavaScript: Variables y tipos de datos')
INSERT [dbo].[Modulo] ([Id], [IdCurso], [Nombre]) VALUES (1005, 5, N'JavaScript: Sentencias condicionales')
INSERT [dbo].[Modulo] ([Id], [IdCurso], [Nombre]) VALUES (1006, 5, N'JavaScript: Ciclos')
INSERT [dbo].[Modulo] ([Id], [IdCurso], [Nombre]) VALUES (1007, 5, N'JavaScript: Funciones')
INSERT [dbo].[Modulo] ([Id], [IdCurso], [Nombre]) VALUES (1008, 5, N'JavaScript: Manejo de cadenas')
INSERT [dbo].[Modulo] ([Id], [IdCurso], [Nombre]) VALUES (1009, 6, N'Gentil introducción a TypeScript y ES6')
INSERT [dbo].[Modulo] ([Id], [IdCurso], [Nombre]) VALUES (1010, 6, N'Aplicación #1: Hola Mundo')
INSERT [dbo].[Modulo] ([Id], [IdCurso], [Nombre]) VALUES (1011, 6, N'Aplicación #1: Aplicación de una sola página (SPA)')
INSERT [dbo].[Modulo] ([Id], [IdCurso], [Nombre]) VALUES (1012, 6, N'Pipes - Transforman los valores mostrados en pantalla')
INSERT [dbo].[Modulo] ([Id], [IdCurso], [Nombre]) VALUES (1013, 11, N'Introducción')
INSERT [dbo].[Modulo] ([Id], [IdCurso], [Nombre]) VALUES (1014, 11, N'Elementos básicos')
INSERT [dbo].[Modulo] ([Id], [IdCurso], [Nombre]) VALUES (1015, 11, N'JavaScript: Sintaxis del lenguaje')
INSERT [dbo].[Modulo] ([Id], [IdCurso], [Nombre]) VALUES (1016, 14, N'Conceptos y Estructuras')
INSERT [dbo].[Modulo] ([Id], [IdCurso], [Nombre]) VALUES (1017, 16, N'Creación')
INSERT [dbo].[Modulo] ([Id], [IdCurso], [Nombre]) VALUES (1018, 5, N'JavaScript: Colecciones: arreglos y objetos')
INSERT [dbo].[Modulo] ([Id], [IdCurso], [Nombre]) VALUES (1019, 14, N'Esqueleto HTML')
INSERT [dbo].[Modulo] ([Id], [IdCurso], [Nombre]) VALUES (1020, 5, N'JavaScript: Colecciones: frontend')
INSERT [dbo].[Modulo] ([Id], [IdCurso], [Nombre]) VALUES (1021, 5, N'Inicio de un fin')
SET IDENTITY_INSERT [dbo].[Modulo] OFF
GO
SET IDENTITY_INSERT [dbo].[Progreso] ON 

INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (43, 1, 1, 1016, 11)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (44, 1, 1, 1017, 11)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (45, 1, 1, 1018, 11)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (46, 1, 1, 1019, 11)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (55, 3, 1, 1002, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (56, 3, 1, 1003, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (57, 3, 1, 1004, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (58, 3, 1, 1005, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (59, 3, 1, 1006, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (60, 3, 1, 1007, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (61, 3, 1, 1008, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (62, 3, 1, 1009, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (63, 6, 1, 1016, 11)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (64, 6, 1, 1017, 11)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (65, 6, 1, 1018, 11)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (66, 6, 1, 1019, 11)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (67, 3, 1, 1020, 14)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (68, 1013, 1, 1020, 14)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (69, 1013, 0, 1016, 11)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (70, 1013, 0, 1017, 11)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (71, 1013, 0, 1018, 11)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (72, 1013, 0, 1019, 11)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (73, 1013, 0, 1, 7)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (74, 1013, 1, 1022, 16)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (75, 1013, 0, 1020, 14)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (76, 1013, 0, 1021, 14)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (77, 1013, 0, 1020, 14)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (78, 1013, 0, 1021, 14)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (79, 1013, 0, 1020, 14)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (80, 1013, 0, 1021, 14)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (81, 1013, 0, 1022, 16)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (82, 1011, 1, 1, 7)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (83, 1, 1, 1002, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (84, 1, 1, 1003, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (85, 1, 1, 1004, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (86, 1, 1, 1005, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (87, 1, 1, 1006, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (88, 1, 0, 1007, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (89, 1, 0, 1008, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (90, 1, 0, 1009, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (99, 1, 0, 1016, 11)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (100, 1, 0, 1017, 11)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (101, 1, 0, 1018, 11)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (102, 1, 0, 1019, 11)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (112, 4, 1, 1002, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (113, 4, 1, 1003, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (114, 4, 1, 1004, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (115, 4, 0, 1005, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (116, 4, 0, 1006, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (117, 4, 0, 1007, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (118, 4, 1, 1008, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (119, 4, 0, 1009, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (120, 4, 0, 1023, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (139, 1017, 1, 1002, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (140, 1017, 0, 1003, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (141, 1017, 0, 1004, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (142, 1017, 0, 1005, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (143, 1017, 0, 1006, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (144, 1017, 0, 1007, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (145, 1017, 0, 1008, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (146, 1017, 0, 1009, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (147, 1017, 0, 1023, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (148, 4, 1, 1020, 14)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (149, 4, 1, 1021, 14)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (150, 4, 0, 1024, 14)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (151, 4, 1, 1025, 14)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (152, 3, 1, 1, 7)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (153, 1011, 1, 1002, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (154, 1011, 0, 1003, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (155, 1011, 0, 1004, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (156, 1011, 0, 1005, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (157, 1011, 0, 1006, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (158, 1011, 0, 1007, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (159, 1011, 0, 1008, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (160, 1011, 0, 1009, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (161, 1011, 0, 1023, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (171, 1011, 0, 1, 7)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (172, 1011, 0, 1020, 14)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (173, 1011, 0, 1021, 14)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (174, 1011, 0, 1024, 14)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (175, 1011, 0, 1025, 14)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (176, 1010, 0, 1002, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (177, 1010, 0, 1003, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (178, 1010, 0, 1004, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (179, 1010, 0, 1005, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (180, 1010, 0, 1006, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (181, 1010, 0, 1007, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (182, 1010, 0, 1008, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (183, 1010, 0, 1009, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (184, 1010, 0, 1023, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (185, 1010, 0, 1, 7)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (186, 1010, 0, 1016, 11)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (187, 1010, 0, 1017, 11)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (188, 1010, 0, 1018, 11)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (189, 1010, 0, 1019, 11)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (190, 1011, 0, 1016, 11)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (191, 1011, 0, 1017, 11)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (192, 1011, 0, 1018, 11)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (193, 1011, 1, 1019, 11)
GO
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (194, 3, 1, 1026, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (195, 3, 1, 1027, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (196, 3, 1, 1028, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (197, 4, 0, 1029, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (198, 1, 0, 1029, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (199, 1017, 0, 1029, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (200, 1011, 0, 1029, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (201, 1010, 0, 1029, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (202, 3, 0, 1029, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (203, 4, 0, 1030, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (204, 1, 0, 1030, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (205, 1017, 0, 1030, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (206, 1011, 0, 1030, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (207, 1010, 0, 1030, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (208, 3, 0, 1030, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (209, 4, 0, 1031, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (210, 1, 0, 1031, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (211, 1017, 0, 1031, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (212, 1011, 1, 1031, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (213, 1010, 0, 1031, 5)
INSERT [dbo].[Progreso] ([Id], [IdUser], [progress], [IdClase], [IdCurso]) VALUES (214, 3, 1, 1031, 5)
SET IDENTITY_INSERT [dbo].[Progreso] OFF
GO
SET IDENTITY_INSERT [dbo].[Recursos] ON 

INSERT [dbo].[Recursos] ([Id], [IdClase], [Archivo]) VALUES (1, 1, N'/Recursos/EDT - CASO RIESGO IMPL.pdf')
INSERT [dbo].[Recursos] ([Id], [IdClase], [Archivo]) VALUES (2, 1, N'/Recursos/Matriz de Adquisiciones - CASO RIESGO.pdf')
INSERT [dbo].[Recursos] ([Id], [IdClase], [Archivo]) VALUES (3, 1, N'/Recursos/Matriz de Costos  - CASO RIESGO IMPL.pdf')
INSERT [dbo].[Recursos] ([Id], [IdClase], [Archivo]) VALUES (4, 2, N'/Recursos/Registro de Riesgos  - CASO RIESGO.pdf')
INSERT [dbo].[Recursos] ([Id], [IdClase], [Archivo]) VALUES (5, 3, N'/Recursos/EDT - CASO RIESGO IMPL.pdf')
INSERT [dbo].[Recursos] ([Id], [IdClase], [Archivo]) VALUES (1002, 1002, N'/Recursos/manual-javascript.pdf')
INSERT [dbo].[Recursos] ([Id], [IdClase], [Archivo]) VALUES (1003, 1003, N'/Recursos/manual-javascript.pdf')
INSERT [dbo].[Recursos] ([Id], [IdClase], [Archivo]) VALUES (1004, 1005, N'/Recursos/manual-javascript.pdf')
INSERT [dbo].[Recursos] ([Id], [IdClase], [Archivo]) VALUES (1005, 1008, N'/Recursos/manual-javascript.pdf')
INSERT [dbo].[Recursos] ([Id], [IdClase], [Archivo]) VALUES (1006, 1009, N'/Recursos/manual-javascript.pdf')
INSERT [dbo].[Recursos] ([Id], [IdClase], [Archivo]) VALUES (1007, 1010, N'/Recursos/angularjs-es.18.pdf')
INSERT [dbo].[Recursos] ([Id], [IdClase], [Archivo]) VALUES (1008, 1012, N'/Recursos/angularjs-es.18.pdf')
INSERT [dbo].[Recursos] ([Id], [IdClase], [Archivo]) VALUES (1009, 1014, N'/Recursos/angularjs-es.18.pdf')
INSERT [dbo].[Recursos] ([Id], [IdClase], [Archivo]) VALUES (1010, 1016, N'/Recursos/angularjs-es.18.pdf')
INSERT [dbo].[Recursos] ([Id], [IdClase], [Archivo]) VALUES (1011, 1017, N'/Recursos/Proceso de llevar un curso.png')
INSERT [dbo].[Recursos] ([Id], [IdClase], [Archivo]) VALUES (1012, 1019, N'/Recursos/manual-javascript.pdf')
INSERT [dbo].[Recursos] ([Id], [IdClase], [Archivo]) VALUES (1013, 1024, N'/Recursos/car4-min2.jpg')
INSERT [dbo].[Recursos] ([Id], [IdClase], [Archivo]) VALUES (1014, 1031, N'/Recursos/about2.jpg')
SET IDENTITY_INSERT [dbo].[Recursos] OFF
GO
SET IDENTITY_INSERT [dbo].[Requisitos] ON 

INSERT [dbo].[Requisitos] ([Id], [IdCurso], [Requisito]) VALUES (1, 6, N'Conocimiento de JavaScript básico es necesario')
INSERT [dbo].[Requisitos] ([Id], [IdCurso], [Requisito]) VALUES (2, 6, N'Conocimiento básico de la estructura de páginas HTML')
INSERT [dbo].[Requisitos] ([Id], [IdCurso], [Requisito]) VALUES (3, 6, N'NO es necesario conocimiento de Angular 1')
INSERT [dbo].[Requisitos] ([Id], [IdCurso], [Requisito]) VALUES (4, 6, N'NO es necesario conocimiento de TypeScript')
INSERT [dbo].[Requisitos] ([Id], [IdCurso], [Requisito]) VALUES (5, 6, N'NO es necesario conocimiento alguno sobre Angular o Ionic')
INSERT [dbo].[Requisitos] ([Id], [IdCurso], [Requisito]) VALUES (6, 6, N'NO es necesario conocimiento de ES6, ECMAScript 6 o ES2015')
INSERT [dbo].[Requisitos] ([Id], [IdCurso], [Requisito]) VALUES (7, 7, N'Ordenador con navegador y conexión a Internet')
INSERT [dbo].[Requisitos] ([Id], [IdCurso], [Requisito]) VALUES (8, 5, N'Conocimientos generales de páginas web y computación')
INSERT [dbo].[Requisitos] ([Id], [IdCurso], [Requisito]) VALUES (9, 5, N'Conocimientos generales de páginas web y computación')
INSERT [dbo].[Requisitos] ([Id], [IdCurso], [Requisito]) VALUES (10, 11, N'Conocimientos generales de computación')
INSERT [dbo].[Requisitos] ([Id], [IdCurso], [Requisito]) VALUES (11, 5, N'Ser capaz de descargar programas e instalarlos')
INSERT [dbo].[Requisitos] ([Id], [IdCurso], [Requisito]) VALUES (12, 5, N'Un computador con internet')
INSERT [dbo].[Requisitos] ([Id], [IdCurso], [Requisito]) VALUES (13, 5, N'Manejar versiones de IDE')
INSERT [dbo].[Requisitos] ([Id], [IdCurso], [Requisito]) VALUES (14, 5, N'Tener conocimientos de un IDE o editor de texto')
INSERT [dbo].[Requisitos] ([Id], [IdCurso], [Requisito]) VALUES (15, 14, N'Saber el manejo de un IDE o editor de texto')
INSERT [dbo].[Requisitos] ([Id], [IdCurso], [Requisito]) VALUES (16, 14, N'Un computador con internet')
INSERT [dbo].[Requisitos] ([Id], [IdCurso], [Requisito]) VALUES (17, 23, N'Hoy se hablara del sexo, si no sabe no opine')
INSERT [dbo].[Requisitos] ([Id], [IdCurso], [Requisito]) VALUES (18, 23, N'Hoy se hablara del sexo, si no sabe no opine')
INSERT [dbo].[Requisitos] ([Id], [IdCurso], [Requisito]) VALUES (19, 27, N'dwdwadawd')
SET IDENTITY_INSERT [dbo].[Requisitos] OFF
GO
INSERT [dbo].[Roles] ([Id], [Nombre]) VALUES (1, N'Administrador')
INSERT [dbo].[Roles] ([Id], [Nombre]) VALUES (2, N'Docente')
INSERT [dbo].[Roles] ([Id], [Nombre]) VALUES (3, N'Estudiante')
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([Id], [Imagen], [Nombres], [Apellidos], [Celular], [Correo], [Username], [Password], [Recovery], [IdRol], [Twitter], [Facebook], [LinkedIn], [YouTube], [Instagram], [Titulo], [Biografia]) VALUES (1, N'/img/Jhan.jpeg', N'Jhan Carlos', N'Velásquez Ignacio', N'926930807', N'juliaRAF2020@gmail.com', N'JhanAdmin', N'F+gLTtJi4gxG8d9vbgprZ5MyV5nssE5YhCtiR54gWI3OPZ2BR0LMMHe8IeW0h4jEiyruv35Sloeqc96JfW1rNA==', NULL, 1, N'https://twitter.com/home?lang=es', N'https://www.facebook.com/Nacho.jciv24/', N'https://www.linkedin.com/in/jhan-ignacio-a53090197/', N'https://www.youtube.com/channel/UCAQWvdUPqJRoHxy7cx60K-g', N'https://www.instagram.com/jhan_ignacio/?hl=es-la', N'Ing. Sistemas Computacionales', N'Admin del Sistema Web one')
INSERT [dbo].[Usuario] ([Id], [Imagen], [Nombres], [Apellidos], [Celular], [Correo], [Username], [Password], [Recovery], [IdRol], [Twitter], [Facebook], [LinkedIn], [YouTube], [Instagram], [Titulo], [Biografia]) VALUES (2, N'/img/team-4.jpg', N'Katty', N'Valiente Saldaña', N'910789456', N'katherine@gmail.com', N'katty31', N'F+gLTtJi4gxG8d9vbgprZ5MyV5nssE5YhCtiR54gWI3OPZ2BR0LMMHe8IeW0h4jEiyruv35Sloeqc96JfW1rNA==', NULL, 2, NULL, N'https://www.facebook.com/kattySalda', NULL, N'Null', NULL, N'Lic. Computación', N'Katty es de la ciudad hermosa de Cajamarca, el 16 de octubre de 1890. Se recibió como profesor de Enseñanza Elemental en 1909 en el Instituto de Ciencias de su Estado natal. De 1909 - 1913 fue profesor de grupo en escuelas primarias de Zacatecas donde llegó a ser inspector. En 1914 fue profesor de la Escuela Primaria "Horacio Mann" en la Ciudad de México, prestando posteriormente sus servicios como profesor en la Escuela Primaria Anexa a la Normal de varones. En 1925 se le distinguió como maestro al ser enviado a estudiar a Nueva York, estudios que le merecieron ser designado profesor de Técnica de la Enseñanza en la Escuela Nacional de Maestros. Su actuación de maestro se extendió a otras instituciones educativas; fue Secretario de la Escuela Normal Nocturna; también fue maestro de Matemáticas en la entonces Escuela Práctica de Mecánicos Eléctricos y llegó a ocupar el cargo de Subdirector de la Institución.')
INSERT [dbo].[Usuario] ([Id], [Imagen], [Nombres], [Apellidos], [Celular], [Correo], [Username], [Password], [Recovery], [IdRol], [Twitter], [Facebook], [LinkedIn], [YouTube], [Instagram], [Titulo], [Biografia]) VALUES (3, N'/FilesBD/testimonial-1.jpg', N'Carla Luna', N'Moreno Calzado', NULL, N'carla24@hotmail.com', N'Carla', N'F+gLTtJi4gxG8d9vbgprZ5MyV5nssE5YhCtiR54gWI3OPZ2BR0LMMHe8IeW0h4jEiyruv35Sloeqc96JfW1rNA==', N'T1fCR5BC42KR2v4PZ8sDriQ5uxo1U9j01DFPACR4B6l8TREsOOKjx57rIn8OyYExCOQhDDX7F00GwmnsSe6yRg==', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([Id], [Imagen], [Nombres], [Apellidos], [Celular], [Correo], [Username], [Password], [Recovery], [IdRol], [Twitter], [Facebook], [LinkedIn], [YouTube], [Instagram], [Titulo], [Biografia]) VALUES (4, N'/img/team-1.jpg', N'Hugo ', N'Bellena Salcedo', N'910123400', N'bs.hugo@hotmail.com', N'hugo2022', N'F+gLTtJi4gxG8d9vbgprZ5MyV5nssE5YhCtiR54gWI3OPZ2BR0LMMHe8IeW0h4jEiyruv35Sloeqc96JfW1rNA==', NULL, 2, NULL, NULL, NULL, NULL, NULL, N'Desarrollador de Software ', N'Graduado en la Universidad Nacional de Ingeniería, realizo una maestría en Ingeniería de Software en La Universidad de los Andes de Colombia, certificado en desarrollo de software, uso de y uso de tendencias tecnológicas. Trabajo de docente en la Universidad Mayor de San Marcos en la Carrera de ingeniería de Sistemas desde el año 2010 hasta 2016, dirigió múltiples proyectos de software e investigación para la optimización de procesos de las elecciones presidenciales 2016 y evitar el fraude. Impulso un proyecto “programando como jugando” para que los niños de nivel primario se les enseñe a programar mediante juegos y mucho más.')
INSERT [dbo].[Usuario] ([Id], [Imagen], [Nombres], [Apellidos], [Celular], [Correo], [Username], [Password], [Recovery], [IdRol], [Twitter], [Facebook], [LinkedIn], [YouTube], [Instagram], [Titulo], [Biografia]) VALUES (5, N'/img/testimonial-2.jpg', N'Luis', N'Alcantara', NULL, N'luis2022@hotmail.com', N'luis2022', N'F+gLTtJi4gxG8d9vbgprZ5MyV5nssE5YhCtiR54gWI3OPZ2BR0LMMHe8IeW0h4jEiyruv35Sloeqc96JfW1rNA==', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([Id], [Imagen], [Nombres], [Apellidos], [Celular], [Correo], [Username], [Password], [Recovery], [IdRol], [Twitter], [Facebook], [LinkedIn], [YouTube], [Instagram], [Titulo], [Biografia]) VALUES (6, N'/proyecto/userperfil4.png', N'Jorge ', N'Malca Salazar', N'976123456', N'jorge@gmail.com', N'JorgeDoc', N'F+gLTtJi4gxG8d9vbgprZ5MyV5nssE5YhCtiR54gWI3OPZ2BR0LMMHe8IeW0h4jEiyruv35Sloeqc96JfW1rNA==', NULL, 2, NULL, NULL, NULL, NULL, NULL, N'Desarrollador Web', N'El profesor Jorge Fernando nació en la ciudad de Zacatecas, el 16 de octubre de 1890. Se recibió como profesor de Enseñanza Elemental en 1909 en el Instituto de Ciencias de su Estado natal.
De 1909 - 1913 fue profesor de grupo en escuelas primarias de Zacatecas donde llegó a ser inspector.
En 1914 fue profesor de la Escuela Primaria "Horacio Mann" en la Ciudad de México, prestando posteriormente sus servicios como profesor en la Escuela Primaria Anexa a la Normal de varones.
En 1925 se le distinguió como maestro al ser enviado a estudiar a Nueva York, estudios que le merecieron ser designado profesor de Técnica de la Enseñanza en la Escuela Nacional de Maestros.
Su actuación de maestro se extendió a otras instituciones educativas; fue Secretario de la Escuela Normal Nocturna; también fue maestro de Matemáticas en la entonces Escuela Práctica de Mecánicos Eléctricos y llegó a ocupar el cargo de Subdirector de la Institución.')
INSERT [dbo].[Usuario] ([Id], [Imagen], [Nombres], [Apellidos], [Celular], [Correo], [Username], [Password], [Recovery], [IdRol], [Twitter], [Facebook], [LinkedIn], [YouTube], [Instagram], [Titulo], [Biografia]) VALUES (7, N'/img/team-2.jpg', N'Julia ', N'Quiroz Salazar', N'976789453', N'juliaraf2020@gmail.com', N'JuliaDoc', N'F+gLTtJi4gxG8d9vbgprZ5MyV5nssE5YhCtiR54gWI3OPZ2BR0LMMHe8IeW0h4jEiyruv35Sloeqc96JfW1rNA==', NULL, 2, NULL, NULL, NULL, NULL, NULL, N'Desarrollo de Videojuegos 2D-3D', N'La Profesora Julia Mayra Quiroz Salazar nació en la ciudad de Zacatecas, el 16 de octubre de 1890. Se recibió como profesor de Enseñanza Elemental en 1909 en el Instituto de Ciencias de su Estado natal.
De 1909 - 1913 fue profesor de grupo en escuelas primarias de Zacatecas donde llegó a ser inspector.
En 1914 fue profesor de la Escuela Primaria "Horacio Mann" en la Ciudad de México, prestando posteriormente sus servicios como profesor en la Escuela Primaria Anexa a la Normal de varones.
En 1925 se le distinguió como maestro al ser enviado a estudiar a Nueva York, estudios que le merecieron ser designado profesor de Técnica de la Enseñanza en la Escuela Nacional de Maestros.
Su actuación de maestro se extendió a otras instituciones educativas; fue Secretario de la Escuela Normal Nocturna; también fue maestro de Matemáticas en la entonces Escuela Práctica de Mecánicos Eléctricos y llegó a ocupar el cargo de Subdirector de la Institución.')
INSERT [dbo].[Usuario] ([Id], [Imagen], [Nombres], [Apellidos], [Celular], [Correo], [Username], [Password], [Recovery], [IdRol], [Twitter], [Facebook], [LinkedIn], [YouTube], [Instagram], [Titulo], [Biografia]) VALUES (8, N'/FilesBD/testimonial-3.jpg', N'Jorge', N'Salazar Abanto', NULL, N'jor@gmail.com', N'Jorge2022', N'F+gLTtJi4gxG8d9vbgprZ5MyV5nssE5YhCtiR54gWI3OPZ2BR0LMMHe8IeW0h4jEiyruv35Sloeqc96JfW1rNA==', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([Id], [Imagen], [Nombres], [Apellidos], [Celular], [Correo], [Username], [Password], [Recovery], [IdRol], [Twitter], [Facebook], [LinkedIn], [YouTube], [Instagram], [Titulo], [Biografia]) VALUES (1006, N'/img/team-3.jpg', N'Kevin', N'Quispe', NULL, N'kevin@gmail.com', N'kevinQ', N'F+gLTtJi4gxG8d9vbgprZ5MyV5nssE5YhCtiR54gWI3OPZ2BR0LMMHe8IeW0h4jEiyruv35Sloeqc96JfW1rNA==', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([Id], [Imagen], [Nombres], [Apellidos], [Celular], [Correo], [Username], [Password], [Recovery], [IdRol], [Twitter], [Facebook], [LinkedIn], [YouTube], [Instagram], [Titulo], [Biografia]) VALUES (1007, N'/img/testimonial-4.jpg', N'Kellyn', N'Carmona', NULL, N'k@gmail.com', N'kellyn', N'F+gLTtJi4gxG8d9vbgprZ5MyV5nssE5YhCtiR54gWI3OPZ2BR0LMMHe8IeW0h4jEiyruv35Sloeqc96JfW1rNA==', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([Id], [Imagen], [Nombres], [Apellidos], [Celular], [Correo], [Username], [Password], [Recovery], [IdRol], [Twitter], [Facebook], [LinkedIn], [YouTube], [Instagram], [Titulo], [Biografia]) VALUES (1009, N'/FilesBD/Inclusion.png', N'Pedro', N'Valiente', NULL, N'pedro@hotmail.com', N'Pedro2022', N'F+gLTtJi4gxG8d9vbgprZ5MyV5nssE5YhCtiR54gWI3OPZ2BR0LMMHe8IeW0h4jEiyruv35Sloeqc96JfW1rNA==', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([Id], [Imagen], [Nombres], [Apellidos], [Celular], [Correo], [Username], [Password], [Recovery], [IdRol], [Twitter], [Facebook], [LinkedIn], [YouTube], [Instagram], [Titulo], [Biografia]) VALUES (1010, N'/FilesBD/react-js.png', N'Juan', N'Perez', NULL, N'juan@hotmail.com', N'juan22', N'F+gLTtJi4gxG8d9vbgprZ5MyV5nssE5YhCtiR54gWI3OPZ2BR0LMMHe8IeW0h4jEiyruv35Sloeqc96JfW1rNA==', N'YzFuyNxgRnH2cOluiKuIaTEcWwFFPnDMGl64B+ZwyRhBNfXaDFtXlWPcX0ekmbomgnj5jHfYGzeXmLhK+PpKEA==', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([Id], [Imagen], [Nombres], [Apellidos], [Celular], [Correo], [Username], [Password], [Recovery], [IdRol], [Twitter], [Facebook], [LinkedIn], [YouTube], [Instagram], [Titulo], [Biografia]) VALUES (1011, N'/FilesBD/testimonial-3.jpg', N'Matias Valentino', N'Alcantara Mantilla', NULL, N'jhanignacio26@gmail.com', N'Matias', N'F+gLTtJi4gxG8d9vbgprZ5MyV5nssE5YhCtiR54gWI3OPZ2BR0LMMHe8IeW0h4jEiyruv35Sloeqc96JfW1rNA==', N'ldc8WC64b4reE1X29u/iC8D1VWzJQWh4YjTNcR7IwT7gxgLMRocyT8KgGV20Ljkc835/Me/uMwcrywZRZxkFdQ==', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([Id], [Imagen], [Nombres], [Apellidos], [Celular], [Correo], [Username], [Password], [Recovery], [IdRol], [Twitter], [Facebook], [LinkedIn], [YouTube], [Instagram], [Titulo], [Biografia]) VALUES (1013, N'/proyecto/userperfil4.png', N'Nixon', N'Salazar Montes', N'978456123', N'nix@gmail.com', N'Nixon', N'F+gLTtJi4gxG8d9vbgprZ5MyV5nssE5YhCtiR54gWI3OPZ2BR0LMMHe8IeW0h4jEiyruv35Sloeqc96JfW1rNA==', NULL, 2, NULL, NULL, NULL, NULL, NULL, N'Ing. Sistemas Computacionales', N'Nixon Salazar Montes se graduó como Ingeniero Electrónico en la Universidad Nacional de Rosario (UNR) en 1983, y en 1998 obtuvo el título de PhD in Electrical and Computer Engineering de la University of Newcastle, Australia, por su tesis titulada Asymptotic Analysis of Dynamic System Identification using Rational Orthonormal Bases. Desde 1980 ha ejercido diversos cargos docentes en la Facultad de Ciencias Exactas, Ingeniería y Agrimensura (FCEIA), UNR y en la Universidad Tecnológica Nacional. En el año académico 1987/1988 realizó una estancia de investigación en el Dipartimento di Automatica e Informatica, Politecnico di Torino, Italia, con una beca del gobierno italiano. Entre 1989 y 1994 fue becario de CONICET trabajando en Control No Lineal, y Profesor Adjunto en la FCEIA, UNR. Entre Sept. 2002 y Sept. 2003 realizó una estancia de investigación postdoctoral en la University of Western Ontario, London, Canadá, trabajando en Identificación y Control con Modelo Predictivo No lineal. En la actualidad es Prof. Titular de la FCEIA, UNR. Ha dirigido 7 Tesis de Doctorado ya defendidas y actualmente dirige un becario doctoral y dos becarios posdoctorales con beca de CONICET. Entre las áreas de investigación de su interés pueden mencionarse la Identificación de Sistemas y el Procesamiento de Señales e Imágenes')
INSERT [dbo].[Usuario] ([Id], [Imagen], [Nombres], [Apellidos], [Celular], [Correo], [Username], [Password], [Recovery], [IdRol], [Twitter], [Facebook], [LinkedIn], [YouTube], [Instagram], [Titulo], [Biografia]) VALUES (1018, N'/proyecto/userperfil4.png', N'Hola Mundo', N'Tierra planet', N'123456789', N'tierra@gmail.com', N'HolaMundo', N'F+gLTtJi4gxG8d9vbgprZ5MyV5nssE5YhCtiR54gWI3OPZ2BR0LMMHe8IeW0h4jEiyruv35Sloeqc96JfW1rNA==', NULL, 3, NULL, NULL, NULL, NULL, NULL, N'Tierra planet xde', N'Tierra planet Tierra planet Tierra planet Tierra planet Tierra planet Tierra planet')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Roles] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Roles]
GO
USE [master]
GO
ALTER DATABASE [IncVirtual] SET  READ_WRITE 
GO
