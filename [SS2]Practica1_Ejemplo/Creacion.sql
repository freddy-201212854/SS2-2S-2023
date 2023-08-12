USE [Practica]
GO

-- CRAECION DE TABLA TEMPORAL

CREATE TABLE TEMPORAL (
	years varchar(25),
	months	varchar(25),
	days varchar(25),
	hours varchar(25),
	minutes varchar(25),
	seconds varchar(25),

	event_validity varchar(25),
	cause_code varchar(25),
	magnitude_earthquake varchar(25),
	deposits varchar(25),
	latitude varchar(25),
	longitude varchar(25),
	height_water varchar(25),
	runups varchar(25),
	magnitude_lida varchar(25),
	intensity varchar(25),
	total_deaths varchar(25),
	total_missing varchar(25),
	total_missing_desc varchar(25),
	total_injuries varchar(25),
	total_damage varchar(25),
	total_damage_desc varchar(25),
	total_house_destroyed varchar(25),
	total_house_damaged varchar(25),
	country varchar(150),
	location_name varchar(150),
)

/* Creacion de tablas */
/* Country */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[idCountry] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[idCountry] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/* Dates */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dates](
	[idDates] [int] IDENTITY(1,1) NOT NULL,
	[years] [decimal](18, 0) NULL,
	[months] [decimal](18, 0) NULL,
	[days] [decimal](18, 0) NULL,
	[hours] [decimal](18, 0) NULL,
	[minutes] [decimal](18, 0) NULL,
	[seconds] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Dates] PRIMARY KEY CLUSTERED 
(
	[idDates] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/* History*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[idHistory] [int] IDENTITY(1,1) NOT NULL,
	[idTsunami] [int] NOT NULL,
	[idCountry] [int] NOT NULL,
	[idLocation] [int] NOT NULL,
	[idDates] [int] NOT NULL,
	[total_deaths] [decimal](18, 0) NULL,
	[total_missing] [decimal](18, 0) NULL,
	[total_missing_desc] [decimal](18, 0) NULL,
	[total_injuries] [decimal](18, 0) NULL,
	[total_damage] [decimal](18, 0) NULL,
	[total_damage_desc] [decimal](18, 0) NULL,
	[total_house_destroy] [decimal](18, 0) NULL,
	[total_house_damage] [decimal](18, 0) NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[idHistory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/* Location_Name */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location_Name](
	[idLocation_name] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NULL,
 CONSTRAINT [PK_Location_Name] PRIMARY KEY CLUSTERED 
(
	[idLocation_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/* Tsunami */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tsunami](
	[idTsunami] [int] IDENTITY(1,1) NOT NULL,
	[event_validity] [int] NULL,
	[cause_code] [int] NULL,
	[magnitude_earthquake] [decimal](18, 0) NULL,
	[deposits] [int] NULL,
	[latitud] [decimal](18, 0) NULL,
	[longtitude] [decimal](18, 0) NULL,
	[height_water] [decimal](18, 0) NULL,
	[runups] [int] NULL,
	[magnitude_lida] [decimal](18, 0) NULL,
	[intensity] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Tsunami] PRIMARY KEY CLUSTERED 
(
	[idTsunami] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_Country] FOREIGN KEY([idCountry])
REFERENCES [dbo].[Country] ([idCountry])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_Country]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_Dates] FOREIGN KEY([idDates])
REFERENCES [dbo].[Dates] ([idDates])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_Dates]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_Location_Name] FOREIGN KEY([idLocation])
REFERENCES [dbo].[Location_Name] ([idLocation_name])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_Location_Name]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_Tsunami] FOREIGN KEY([idTsunami])
REFERENCES [dbo].[Tsunami] ([idTsunami])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_Tsunami]
GO
