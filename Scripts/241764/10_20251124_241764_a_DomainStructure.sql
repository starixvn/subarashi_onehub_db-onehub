/*<info serverAlias="DBOH-ONEHub"></info>*/
/*
    Created: 20252419@Sophia
    DB: DBOH-ONEHub
    Task: Structure domain table  - UAT [RedmineId : #236797]
         
*/
USE [ONEHub]
GO

/****** Object:  Table [dbo].[Domain]    Script Date: 11/24/2025 1:28:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS [dbo].[Domain]
GO

CREATE TABLE [dbo].[Domain](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DomainName] [varchar](200) NOT NULL,
	[DomainType] [tinyint] NULL,
	[Note] [nvarchar](200) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[SiteId] [smallint] NULL,
 CONSTRAINT [PK_Domain] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Setting_Data]
) ON [Setting_Data]
GO

 

/****** Object:  Index [IX_Domain_DomainName]    Script Date: 11/24/2025 1:35:04 PM ******/
CREATE CLUSTERED INDEX [IX_Domain_DomainName] ON [dbo].[Domain]
(
	[DomainName] ASC,
	[DomainType] ASC,
	[SiteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Setting_Data]
GO

------------------------------------------------------ 

/****** Object:  Table [dbo].[DomainDetail]    Script Date: 11/24/2025 1:41:29 PM ******/
DROP TABLE IF EXISTS [dbo].[DomainDetail]
GO

CREATE TABLE [dbo].[DomainDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DomainName] [varchar](200) NOT NULL,
	[CountryCode] [varchar](20) NOT NULL,
	[Score] [smallint] NULL,
	[DomainType] [tinyint] NULL,
	[SiteId] [smallint] NULL,
 CONSTRAINT [PK_DomainDetail] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Setting_Data]
) ON [Setting_Data]
GO

  

/****** Object:  Index [IX_DomainDetail_DomainName]    Script Date: 11/24/2025 1:41:49 PM ******/
CREATE CLUSTERED INDEX [IX_DomainDetail_DomainName] ON [dbo].[DomainDetail]
(
	[DomainName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Setting_Data]
GO


 
SET ANSI_PADDING ON
GO

/****** Object:  Index [IX_DomainDetail_Country]    Script Date: 11/24/2025 1:42:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_DomainDetail_Country] ON [dbo].[DomainDetail]
(
	[CountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Setting_Data]
GO


