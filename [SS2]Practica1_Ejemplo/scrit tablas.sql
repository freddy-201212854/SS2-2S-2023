USE [Practica]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 9/02/2023 23:34:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[idCountry] [int] NOT NULL,
	[name] [nvarchar](150) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[idCountry] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dates]    Script Date: 9/02/2023 23:34:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dates](
	[idDates] [int] NOT NULL,
	[years] [int] NULL,
	[months] [int] NULL,
	[days] [int] NULL,
	[hours] [int] NULL,
	[minutes] [int] NULL,
	[seconds] [int] NULL,
 CONSTRAINT [PK_Dates] PRIMARY KEY CLUSTERED 
(
	[idDates] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[History]    Script Date: 9/02/2023 23:34:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[idHistory] [int] NOT NULL,
	[idTsunami] [int] NOT NULL,
	[idCountry] [int] NOT NULL,
	[idLocation] [int] NOT NULL,
	[idDates] [int] NOT NULL,
	[total_deaths] [int] NULL,
	[total_missing] [int] NULL,
	[total_missing_desc] [int] NULL,
	[total_injuries] [int] NULL,
	[total_damage] [int] NULL,
	[total_damage_desc] [int] NULL,
	[total_house_destroy] [int] NULL,
	[total_house_damage] [int] NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[idHistory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location_Name]    Script Date: 9/02/2023 23:34:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location_Name](
	[idLocation_name] [int] NOT NULL,
	[name] [nvarchar](150) NULL,
 CONSTRAINT [PK_Location_Name] PRIMARY KEY CLUSTERED 
(
	[idLocation_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tsunami]    Script Date: 9/02/2023 23:34:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tsunami](
	[idTsunami] [int] NOT NULL,
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
