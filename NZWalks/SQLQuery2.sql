USE [NZWalksDb]
GO

/****** Object:  Table [dbo].[Regions]    Script Date: 14-08-2023 09:45:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Regions](
	[Id] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Area] [float] NOT NULL,
	[Lat] [float] NOT NULL,
	[Long] [float] NOT NULL,
	[Population] [bigint] NOT NULL,
 CONSTRAINT [PK_Regions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

USE [NZWalksDb]
GO

/****** Object:  Table [dbo].[Walks]    Script Date: 14-08-2023 09:46:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Walks](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Length] [float] NOT NULL,
	[RegionId] [uniqueidentifier] NOT NULL,
	[WalkDifficultyId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Walks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Walks]  WITH CHECK ADD  CONSTRAINT [FK_Walks_Regions_RegionId] FOREIGN KEY([RegionId])
REFERENCES [dbo].[Regions] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Walks] CHECK CONSTRAINT [FK_Walks_Regions_RegionId]
GO

ALTER TABLE [dbo].[Walks]  WITH CHECK ADD  CONSTRAINT [FK_Walks_WalkDifficulty_WalkDifficultyId] FOREIGN KEY([WalkDifficultyId])
REFERENCES [dbo].[WalkDifficulty] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Walks] CHECK CONSTRAINT [FK_Walks_WalkDifficulty_WalkDifficultyId]
GO


USE [NZWalksDb]
GO

/****** Object:  Table [dbo].[WalkDifficulty]    Script Date: 14-08-2023 09:46:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[WalkDifficulty](
	[Id] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_WalkDifficulty] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO



